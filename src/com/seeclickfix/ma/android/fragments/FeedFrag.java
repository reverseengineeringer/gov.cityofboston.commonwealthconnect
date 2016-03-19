package com.seeclickfix.ma.android.fragments;

import android.annotation.SuppressLint;
import android.content.res.Resources;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.android.volley.NoConnectionError;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.stmt.Where;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.SeeclickfixActivity;
import com.seeclickfix.ma.android.adapters.FeedAdapter;
import com.seeclickfix.ma.android.adapters.FeedAdapter.OnScrollListener;
import com.seeclickfix.ma.android.anim.Transitions;
import com.seeclickfix.ma.android.api.SCFService.IssueActionEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.auth.PermissionsManager;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.dialogs.ErrorDialog;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.events.LocationConnectedEvent;
import com.seeclickfix.ma.android.events.LocationTimeoutEvent;
import com.seeclickfix.ma.android.events.LocationUpdateEvent;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.fragments.interfaces.CommentBtnClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.CommentCardClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.HomeButtonsInterface;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;
import com.seeclickfix.ma.android.fragments.interfaces.IssueClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.IssueListFragInterface;
import com.seeclickfix.ma.android.fragments.interfaces.OnIssueStarClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnStatusChangeListener;
import com.seeclickfix.ma.android.fragments.interfaces.VoteClickListener;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.location.LocationValidator;
import com.seeclickfix.ma.android.location.LocationValidator.Stratigies.PrecisionStrategyEnum;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.issue.Comment;
import com.seeclickfix.ma.android.objects.issue.Follow;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.issue.RevokeVote;
import com.seeclickfix.ma.android.objects.issue.Transition;
import com.seeclickfix.ma.android.objects.issue.Vote;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.types.FeedItem;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import com.seeclickfix.ma.android.objects.zone.ZoneWrapper;
import com.seeclickfix.ma.android.style.StyleUtil;
import com.seeclickfix.ma.android.tasks.GetIssuesTask;
import com.seeclickfix.ma.android.tasks.GetMyCommentsTask;
import com.seeclickfix.ma.android.tasks.GetSingleZoneTask;
import com.seeclickfix.ma.android.tasks.GetZonesTask;
import com.seeclickfix.ma.android.tasks.ZoneTaskAbstract;
import com.squareup.otto.Subscribe;
import java.util.Arrays;
import java.util.List;
import javax.inject.Inject;
import org.json.JSONArray;
import org.json.JSONObject;

@SuppressLint({"HandlerLeak"})
public class FeedFrag
  extends BaseFrag
  implements OnStatusChangeListener, AbsListView.OnScrollListener, IssueCard
{
  private static final boolean D = false;
  private static final String LAST_SCROLL_POSITION = "FeedFrag.LAST_SCROLL_POSITION";
  private static final String LAST_SCROLL_TOP = "FeedFrag.LAST_SCROLL_TOP";
  private static final String TAG = "FeedFrag";
  private static List<String> mActions = Arrays.asList(new String[] { "com.seeclickfix.actions.VOTE", "com.seeclickfix.actions.CHANGE_STATUS", "com.seeclickfix.actions.ADD_WATCHER" });
  private FeedAdapter adapter;
  Runnable callShowListView = new Runnable()
  {
    public void run()
    {
      FeedFrag.this.showListView();
    }
  };
  private CommentBtnClickListener commentBtnClickListener;
  private CommentCardClickListener commentCardClickListener = new CommentCardClickListener()
  {
    public void onCommentCardClick(Comment paramAnonymousComment)
    {
      ((HomeButtonsInterface)getActivity()).onClickButton(4, Integer.valueOf(paramAnonymousComment.getIssueId()));
    }
  };
  Response.Listener<JSONArray> commentsListener = new Response.Listener()
  {
    public void onResponse(JSONArray paramAnonymousJSONArray)
    {
      paramAnonymousJSONArray = new DeserializeResponse().getJavaObject(paramAnonymousJSONArray.toString(), Comment.class);
      if (paramAnonymousJSONArray.isEmpty())
      {
        if (adapter.getCommentCount() == 0) {
          postNoCommentsItem();
        }
        FeedFrag.access$502(FeedFrag.this, true);
      }
      for (;;)
      {
        adapter.setIsCommentList(true);
        getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
        FeedFrag.access$102(FeedFrag.this, false);
        setFragState(BaseFrag.FragState.ACTIVE);
        FeedFrag.this.handleListLoaded();
        return;
        adapter.appendCommentsToList(paramAnonymousJSONArray);
      }
    }
  };
  private Issue currentIssue;
  private ErrorDialog errorDialog;
  Response.ErrorListener errorListener = new Response.ErrorListener()
  {
    public void onErrorResponse(VolleyError paramAnonymousVolleyError)
    {
      FeedFrag.access$102(FeedFrag.this, false);
      if ("NOT_LOGGED_IN_MY_REPORTS".equals(paramAnonymousVolleyError.getMessage())) {
        showMustLogInForMyReports();
      }
      for (;;)
      {
        getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
        return;
        if ("NOT_LOGGED_IN_MY_COMMENTS".equals(paramAnonymousVolleyError.getMessage()))
        {
          showMustLogInForMyComment();
        }
        else
        {
          setFragState(BaseFrag.FragState.ERROR);
          errorDialog.showErrorPanel(2131492980, 2131492967, 2130837778, 2131492978, new Runnable()
          {
            public void run()
            {
              setFragState(BaseFrag.FragState.BUSY);
              startLoading();
            }
          });
        }
      }
    }
  };
  private GetMyCommentsTask getCommentsTask;
  private GetIssuesTask getIssueTask;
  private GetIssuesTask getMoreIssueTask;
  private Handler handler;
  private int index = -1;
  private boolean isLoading = false;
  private IssueClickListener issueClickListener;
  Response.Listener<JSONArray> listener = new Response.Listener()
  {
    public void onResponse(JSONArray paramAnonymousJSONArray)
    {
      paramAnonymousJSONArray = new DeserializeResponse().getJavaObject(paramAnonymousJSONArray.toString(), Issue.class);
      addItemsToAdapter(paramAnonymousJSONArray);
      if (paramAnonymousJSONArray.isEmpty()) {
        postNoIssueItem();
      }
      FeedFrag.this.handleListLoaded();
      FeedFrag.access$102(FeedFrag.this, false);
      setFragState(BaseFrag.FragState.ACTIVE);
    }
  };
  Response.Listener<JSONArray> loadMoreListener = new Response.Listener()
  {
    public void onResponse(JSONArray paramAnonymousJSONArray)
    {
      paramAnonymousJSONArray = new DeserializeResponse().getJavaObject(paramAnonymousJSONArray.toString(), Issue.class);
      if (paramAnonymousJSONArray.isEmpty())
      {
        FeedFrag.access$002(FeedFrag.this, true);
        FeedFrag.access$102(FeedFrag.this, false);
        getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
        return;
      }
      adapter.setOnScrollListener(null);
      adapter.appendList(paramAnonymousJSONArray);
      adapter.notifyDataSetChanged();
      FeedFrag.access$102(FeedFrag.this, false);
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
      handler.postDelayed(resetScrollListener, 1000L);
    }
  };
  private boolean loadedAllComments = false;
  private boolean loadedAllIssues = false;
  @Inject
  LocationAdapter locationAdapter;
  private ListView mListView;
  @Inject
  PermissionsManager mPermissionsManager;
  FeedAdapter.OnScrollListener onScrollListener = new FeedAdapter.OnScrollListener()
  {
    public void onScrollToPosition(int paramAnonymousInt1, int paramAnonymousInt2)
    {
      if (paramAnonymousInt1 < 0) {}
      while ((paramAnonymousInt2 <= 0) || (paramAnonymousInt1 <= paramAnonymousInt2 - 7) || (isLoading)) {
        return;
      }
      FeedFrag.this.loadMore();
    }
  };
  private int page = 1;
  private PageParams pageParams;
  private Place place;
  Runnable resetScrollListener = new Runnable()
  {
    public void run()
    {
      adapter.setOnScrollListener(onScrollListener);
    }
  };
  Response.Listener<JSONObject> singleZoneListener = new Response.Listener()
  {
    public void onResponse(JSONObject paramAnonymousJSONObject)
    {
      if (getActivity() == null) {
        return;
      }
      setFragState(BaseFrag.FragState.ACTIVE);
      paramAnonymousJSONObject = new DeserializeResponse().getJavaObject(paramAnonymousJSONObject.toString(), EnhancedWatchAreas.class);
      adapter.addFeedItemAt(0, (FeedItem)paramAnonymousJSONObject.get(0));
      startLoading();
    }
  };
  private OnIssueStarClickListener starIssueListener;
  private transient int timesShowListViewCalled = 0;
  private int top = 0;
  private VoteClickListener voteClickListener;
  Response.ErrorListener zoneErrorListener = new Response.ErrorListener()
  {
    public void onErrorResponse(VolleyError paramAnonymousVolleyError)
    {
      if (getActivity() == null) {
        return;
      }
      int i;
      int j;
      if ((paramAnonymousVolleyError instanceof TimeoutError))
      {
        i = 2131492980;
        j = 2131492967;
      }
      for (;;)
      {
        setFragState(BaseFrag.FragState.ERROR);
        errorDialog.showErrorPanel(i, j, 2130837778, 2131492978, new Runnable()
        {
          public void run()
          {
            setFragState(BaseFrag.FragState.BUSY);
            FeedFrag.this.runZoneRequest();
          }
        });
        return;
        if ((paramAnonymousVolleyError instanceof NoConnectionError))
        {
          i = 2131492972;
          j = 2131492972;
        }
        else
        {
          i = 2131492933;
          j = 2131492932;
        }
      }
    }
  };
  Response.Listener<JSONObject> zoneListener = new Response.Listener()
  {
    public void onResponse(JSONObject paramAnonymousJSONObject)
    {
      if (getSherlockActivity() == null) {
        return;
      }
      setFragState(BaseFrag.FragState.ACTIVE);
      paramAnonymousJSONObject = new DeserializeResponse().getJavaObject(paramAnonymousJSONObject.toString(), ZoneWrapper.class);
      if (!paramAnonymousJSONObject.isEmpty())
      {
        paramAnonymousJSONObject = ((ZoneWrapper)paramAnonymousJSONObject.get(0)).getWatchAreas();
        if (!paramAnonymousJSONObject.isEmpty()) {
          adapter.addFeedItemAt(0, (FeedItem)paramAnonymousJSONObject.get(0));
        }
      }
      try
      {
        startLoading();
        return;
      }
      catch (Exception paramAnonymousJSONObject) {}
    }
  };
  private ZoneTaskAbstract zoneReqTask;
  
  private void authAndExecute(Comment paramComment)
  {
    if (AuthManager.isAuthenticated())
    {
      paramComment.executeAction();
      return;
    }
    launchLoginFrag(paramComment);
  }
  
  private void callAsyncShowListView()
  {
    if ((timesShowListViewCalled > 100) || (getActivity() == null))
    {
      timesShowListViewCalled = 0;
      if (handler != null) {
        killHandler();
      }
      return;
    }
    timesShowListViewCalled += 1;
    handler.postDelayed(callShowListView, 87L);
  }
  
  private boolean checkForCurrentPlace()
  {
    Object localObject2 = DaoUtil.getPlaceDao(getAppContext());
    localObject1 = null;
    try
    {
      localObject2 = (Place)((Dao)localObject2).queryForFirst(((Dao)localObject2).queryBuilder().where().eq("api_id", Integer.valueOf(-1)).prepare());
      localObject1 = localObject2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
      place = ((Place)localObject1);
    }
    return localObject1 != null;
  }
  
  private NoticeItem getNoIssueNoticeItem()
  {
    NoticeItem localNoticeItem = NoticeItem.NO_ISSUES();
    localNoticeItem.setListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ((SeeclickfixActivity)getSherlockActivity()).onClickButton(2, null);
      }
    });
    return localNoticeItem;
  }
  
  private void handleArgs()
  {
    try
    {
      pageParams = ((PageParams)getArguments().getParcelable("page_params"));
      getSherlockActivity().getSupportActionBar().setTitle(pageParams.getDisplayName());
      int i = Resources.getSystem().getIdentifier("action_bar_subtitle", "id", "android");
      Object localObject = (TextView)getSherlockActivity().findViewById(i);
      StyleUtil.setActionBarSubBasic(pageParams.getDisplayName(), (TextView)localObject, getSherlockActivity().getApplicationContext());
      localObject = (Place)pageParams.getParcel();
      if (localObject != null)
      {
        place = ((Place)localObject);
        if (adapter == null) {}
      }
      currentIssue = ((Issue)pageParams.getDataParcel());
      return;
    }
    catch (Exception localException) {}
  }
  
  private void handleListLoaded()
  {
    setAdapterAndListeners();
    showListView();
    showFooter();
    setHasOptionsMenu(true);
  }
  
  private boolean isPlaceFeed()
  {
    return (place != null) && (!place.isMyLocation());
  }
  
  private void killHandler()
  {
    try
    {
      if (handler != null) {
        handler.removeCallbacksAndMessages(null);
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  private void launchLoginFrag(Comment paramComment)
  {
    postEvent(new AuthRequiredEvent(paramComment.getIssueDetailsParams(currentIssue)));
  }
  
  private void loadMore()
  {
    if ((place.isMyComments()) && (!loadedAllComments))
    {
      isLoading = true;
      page += 1;
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
      loadComments();
    }
    while (loadedAllIssues) {
      return;
    }
    isLoading = true;
    page += 1;
    getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
    loadMoreIssues();
  }
  
  private void processLocation(Location paramLocation)
  {
    if (isPlaceFeed()) {}
    while ((paramLocation == null) || (getActivity() == null)) {
      return;
    }
    checkForCurrentPlace();
    locationAdapter.stopActiveLocationUpdates();
    if (place == null) {
      setupDefaultPlace(paramLocation);
    }
    place.setPlaceLat(paramLocation.getLatitude());
    place.setPlaceLng(paramLocation.getLongitude());
    place.setShouldReload(true);
    runZoneRequest();
  }
  
  private void pushIssueToAdapter(Issue paramIssue)
  {
    adapter.updateIssue(paramIssue);
  }
  
  private void runZoneRequest()
  {
    DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(getAppContext());
    if ((place.isMyLocation()) && (localDedicatedApp.getIsDedicatedApp()) && (localDedicatedApp.getNumZones() <= 1)) {}
    for (zoneReqTask = new GetSingleZoneTask(getActivity(), place, singleZoneListener, zoneErrorListener);; zoneReqTask = new GetZonesTask(getActivity(), place, zoneListener, zoneErrorListener))
    {
      setFragState(BaseFrag.FragState.BUSY);
      zoneReqTask.execute();
      return;
    }
  }
  
  private void setAdapterAndListeners()
  {
    adapter.setIssueClickListener(issueClickListener);
    adapter.setVoteClickListener(voteClickListener);
    adapter.setCommentClickListener(commentBtnClickListener);
    adapter.setCommentCardClickListener(commentCardClickListener);
    adapter.setOnIssueStarClickListener(starIssueListener);
    adapter.setOnStatusChangeListener(this);
    adapter.setOnScrollListener(onScrollListener);
    if (mListView.getAdapter() == null) {
      mListView.setAdapter(adapter);
    }
  }
  
  private void setReferences()
  {
    mListView = ((ListView)getRootFrag().findViewById(2131361911));
  }
  
  private void setScrollData()
  {
    int i = 0;
    View localView = mListView.getChildAt(0);
    if (localView == null) {}
    for (;;)
    {
      top = i;
      index = mListView.getFirstVisiblePosition();
      pageParams.setScrollPosition(index);
      pageParams.setScrollOffset(top);
      return;
      i = localView.getTop();
    }
  }
  
  private void setupAdapterAndListView()
  {
    if (adapter == null) {
      adapter = new FeedAdapter(getSherlockActivity());
    }
    adapter.setPermissionsManager(mPermissionsManager);
  }
  
  private void setupDefaultPlace(Location paramLocation)
  {
    place = new Place();
    place.setMyLocation(true);
    place.setPlaceLat(paramLocation.getLatitude());
    place.setPlaceLng(paramLocation.getLongitude());
    place.setApiId(-1);
  }
  
  private void setupListeners()
  {
    issueClickListener = new IssueClickListener()
    {
      public void onIssueClick(Issue paramAnonymousIssue)
      {
        FeedFrag.access$1202(FeedFrag.this, paramAnonymousIssue);
        FeedFrag.this.setScrollData();
        ((IssueListFragInterface)getActivity()).onSelectIssueListItem(paramAnonymousIssue, null);
      }
    };
    voteClickListener = new VoteClickListener()
    {
      public void onVoteClick(Issue paramAnonymousIssue)
      {
        FeedFrag.access$1202(FeedFrag.this, paramAnonymousIssue);
        FeedFrag.this.setScrollData();
        FeedFrag.this.authAndExecute(paramAnonymousIssue.suitableVoteAction());
      }
    };
    commentBtnClickListener = new CommentBtnClickListener()
    {
      public void onCommentClick(Issue paramAnonymousIssue)
      {
        ((IssueListFragInterface)getActivity()).onSelectIssueListItem(paramAnonymousIssue, "com.seeclickfix.actions.COMMENT");
      }
    };
    starIssueListener = new OnIssueStarClickListener()
    {
      public void onIssueStarClick(Issue paramAnonymousIssue)
      {
        FeedFrag.access$1202(FeedFrag.this, paramAnonymousIssue);
        FeedFrag.this.setScrollData();
        OneTimeWarnDialog.followWarning(FeedFrag.this, new Runnable()new Runnable
        {
          public void run()
          {
            FeedFrag.this.authAndExecute(new Follow(currentIssue));
          }
        }, new Runnable()
        {
          public void run()
          {
            FeedFrag.this.pushIssueToAdapter(currentIssue);
          }
        });
      }
    };
  }
  
  private void showActionResult(NoticeItem paramNoticeItem)
  {
    if (paramNoticeItem.isSuccess())
    {
      paramNoticeItem.showToast(this);
      return;
    }
    paramNoticeItem.showDialog(this);
  }
  
  private void showFooter() {}
  
  private void showListView()
  {
    if (getActivity() == null) {
      callAsyncShowListView();
    }
    for (;;)
    {
      if ((adapter != null) && (adapter.getCount() > 0)) {
        setFragState(BaseFrag.FragState.ACTIVE);
      }
      return;
      if ((mListView != null) && (mListView.getVisibility() == 4))
      {
        setFragState(BaseFrag.FragState.ACTIVE);
        try
        {
          mListView.startAnimation(Transitions.fadeIn(getAppContext()));
          mListView.setVisibility(0);
          if (index >= 0) {
            mListView.setSelectionFromTop(index, top);
          }
        }
        catch (Exception localException) {}
      }
    }
  }
  
  private void startWork()
  {
    handleArgs();
    setReferences();
    setupListeners();
    setupAdapterAndListView();
    subscribeToEventBus();
    if (isPlaceFeed())
    {
      if ((place.isMyReports()) || (place.isMyComments()))
      {
        isLoading = false;
        startLoading();
        return;
      }
      runZoneRequest();
      return;
    }
    locationAdapter.startHighAccuracyLocationUpdates();
  }
  
  private void stopVolleyTasks()
  {
    if (zoneReqTask != null) {
      zoneReqTask.cancel();
    }
    if (getCommentsTask != null) {
      getCommentsTask.cancel();
    }
    if (getIssueTask != null) {
      getIssueTask.cancel();
    }
    if (getMoreIssueTask != null) {
      getMoreIssueTask.cancel();
    }
  }
  
  protected void addItemsToAdapter(List<Issue> paramList)
  {
    adapter.appendList(paramList);
    adapter.notifyDataSetChanged();
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public void loadComments()
  {
    getCommentsTask = new GetMyCommentsTask(getAppContext(), place, commentsListener, errorListener, page);
    getCommentsTask.execute();
  }
  
  public void loadIssues()
  {
    getIssueTask = new GetIssuesTask(getAppContext(), place, listener, errorListener, page);
    getIssueTask.execute();
  }
  
  public void loadMoreIssues()
  {
    getMoreIssueTask = new GetIssuesTask(getAppContext(), place, loadMoreListener, errorListener, page);
    getMoreIssueTask.execute();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (paramBundle != null)
    {
      top = paramBundle.getInt("FeedFrag.LAST_SCROLL_TOP", 0);
      index = paramBundle.getInt("FeedFrag.LAST_SCROLL_POSITION", -1);
    }
  }
  
  public boolean onContextItemSelected(android.view.MenuItem paramMenuItem)
  {
    return true;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public void onCreateContextMenu(ContextMenu paramContextMenu, View paramView, ContextMenu.ContextMenuInfo paramContextMenuInfo)
  {
    super.onCreateContextMenu(paramContextMenu, paramView, paramContextMenuInfo);
    paramContextMenuInfo = getResources().getStringArray(2131099648);
    paramContextMenu.setHeaderTitle(getString(2131492989));
    int j = paramContextMenuInfo.length;
    int i = 0;
    while (i < j)
    {
      CharSequence localCharSequence = paramContextMenuInfo[i];
      paramContextMenu.add(0, paramView.getId(), 0, localCharSequence);
      paramContextMenu.setGroupCheckable(0, true, false);
      i += 1;
    }
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenu.clear();
    if (!place.isMyComments()) {
      paramMenuInflater.inflate(2131623939, paramMenu);
    }
    for (;;)
    {
      super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
      return;
      paramMenuInflater.inflate(2131623938, paramMenu);
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    setRootFrag((ViewGroup)paramLayoutInflater.inflate(2130903080, paramViewGroup, false));
    errorDialog = new ErrorDialog(getRootFrag().findViewById(2131361912));
    handler = new Handler() {};
    MyApplication.inject(this);
    return getRootFrag();
  }
  
  @Subscribe
  public void onIssueActionEvent(SCFService.IssueActionEvent paramIssueActionEvent)
  {
    if (paramIssueActionEvent.getIssueActionResult().isAccepted()) {
      showActionResult(paramIssueActionEvent.getIssueActionResult().getNotice());
    }
    for (;;)
    {
      if (currentIssue != null) {
        pushIssueToAdapter(currentIssue);
      }
      return;
      if (paramIssueActionEvent.getIssueActionResult().isSuccess())
      {
        if (paramIssueActionEvent.getComment().isAssociatedWith(currentIssue)) {
          paramIssueActionEvent.getComment().updateIssue(currentIssue, (SCFService.IssueActionReceipt)paramIssueActionEvent.getIssueActionResult().getReceipt());
        }
      }
      else {
        showActionResult(paramIssueActionEvent.getIssueActionResult().getNotice());
      }
    }
  }
  
  @Subscribe
  public void onLocationConnectedEvent(LocationConnectedEvent paramLocationConnectedEvent)
  {
    if ((LocationValidator.isPrecise(LocationValidator.Stratigies.PrecisionStrategyEnum.CLOSE_AND_RECENT, paramLocationConnectedEvent.getLastKnownLocation())) && (place == null))
    {
      processLocation(paramLocationConnectedEvent.getLastKnownLocation());
      runZoneRequest();
      return;
    }
    if (place == null)
    {
      locationAdapter.startHighAccuracyLocationUpdates();
      return;
    }
    runZoneRequest();
  }
  
  @Subscribe
  public void onLocationTimeoutEvent(LocationTimeoutEvent paramLocationTimeoutEvent)
  {
    processLocation(paramLocationTimeoutEvent.getLocation());
  }
  
  @Subscribe
  public void onLocationUpdate(LocationUpdateEvent paramLocationUpdateEvent)
  {
    processLocation(paramLocationUpdateEvent.getLocation());
  }
  
  @Subscribe
  public void onLoginEvent(LoginEvent paramLoginEvent)
  {
    currentIssue = ((Issue)paramLoginEvent.getOnAuthCompleteParams().getDataParcel());
    Comment.paramsToComment(paramLoginEvent.getOnAuthCompleteParams(), currentIssue).executeAction();
    LoginStateController.getInstance().clearAuthCompleteParams();
  }
  
  public boolean onOptionsItemSelected(com.actionbarsherlock.view.MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 2131362181)
    {
      setScrollData();
      ((HomeButtonsInterface)getActivity()).onClickButton(5, place);
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public void onResume()
  {
    super.onResume();
    startWork();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    int i = 0;
    super.onSaveInstanceState(paramBundle);
    try
    {
      pageParams.setParcel(place);
      paramBundle.putParcelable("page_params", pageParams);
      if (mListView != null) {}
      try
      {
        index = mListView.getFirstVisiblePosition();
        View localView = mListView.getChildAt(0);
        if (localView == null) {}
        for (;;)
        {
          top = i;
          paramBundle.putInt("FeedFrag.LAST_SCROLL_TOP", top);
          paramBundle.putInt("FeedFrag.LAST_SCROLL_POSITION", index);
          return;
          i = localView.getTop();
        }
        paramBundle.putInt("FeedFrag.LAST_SCROLL_TOP", top);
        paramBundle.putInt("FeedFrag.LAST_SCROLL_POSITION", index);
        return;
      }
      catch (Exception paramBundle) {}
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    if (paramInt == 2) {}
    try
    {
      VolleyRequestQueue.getInstance(getActivity()).getQueue().stop();
      return;
    }
    catch (Exception paramAbsListView) {}
    VolleyRequestQueue.getInstance(getActivity()).getQueue().start();
    return;
  }
  
  public void onStatusChange(Issue paramIssue, final String paramString)
  {
    currentIssue = paramIssue;
    OneTimeWarnDialog.statusChangeWarning(this, new Runnable()new Runnable
    {
      public void run()
      {
        FeedFrag.this.authAndExecute(Transition.fromStatus(currentIssue, paramString));
      }
    }, new Runnable()
    {
      public void run()
      {
        FeedFrag.this.pushIssueToAdapter(currentIssue);
      }
    });
  }
  
  public void onStop()
  {
    try
    {
      int i = mListView.getScrollY();
      pageParams.setScrollPosition(i);
      pageParams.setParcel(place);
      unSubscribeFromEventBus();
      stopVolleyTasks();
      killHandler();
      super.onStop();
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  protected void postNoCommentsItem()
  {
    NoticeItem localNoticeItem = NoticeItem.NO_COMMENTS();
    if (!adapter.containsItem(localNoticeItem)) {
      adapter.appendFeedItem(localNoticeItem);
    }
  }
  
  protected void postNoIssueItem()
  {
    NoticeItem localNoticeItem = getNoIssueNoticeItem();
    if (!adapter.containsItem(localNoticeItem)) {
      adapter.appendFeedItem(localNoticeItem);
    }
  }
  
  public void recordVote(Vote paramVote, SCFService.IssueActionReceipt paramIssueActionReceipt) {}
  
  public void revokeVote(RevokeVote paramRevokeVote, SCFService.IssueActionReceipt paramIssueActionReceipt) {}
  
  protected void showMustLogInForMyComment()
  {
    Object localObject = getErrorView();
    TextView localTextView = (TextView)((View)localObject).findViewById(2131362128);
    localObject = (Button)((View)localObject).findViewById(2131362129);
    localTextView.setText(2131492975);
    ((Button)localObject).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        FeedFrag.postEvent(new AuthRequiredEvent(pageParams));
      }
    });
    setFragState(BaseFrag.FragState.ERROR);
  }
  
  protected void showMustLogInForMyReports()
  {
    Object localObject = getErrorView();
    TextView localTextView = (TextView)((View)localObject).findViewById(2131362128);
    localObject = (Button)((View)localObject).findViewById(2131362129);
    localTextView.setText(2131492976);
    ((Button)localObject).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        FeedFrag.postEvent(new AuthRequiredEvent(pageParams));
      }
    });
    setFragState(BaseFrag.FragState.ERROR);
  }
  
  public void startLoading()
  {
    setFragState(BaseFrag.FragState.BUSY);
    int i;
    if (adapter != null) {
      if (adapter.getIssueCount() > 0)
      {
        handleListLoaded();
        i = 1;
        if (i == 0) {
          break label69;
        }
      }
    }
    label69:
    do
    {
      return;
      if ((adapter.getCommentCount() > 0) && (place.isMyComments()))
      {
        handleListLoaded();
        i = 1;
        break;
      }
      i = 0;
      break;
      if (place.isMyReports()) {
        page = 0;
      }
    } while (isLoading);
    isLoading = true;
    if ((place.isMyComments()) && (!loadedAllComments))
    {
      page = 1;
      loadComments();
      return;
    }
    loadIssues();
  }
  
  public void updateComment(Comment paramComment, SCFService.IssueActionReceipt paramIssueActionReceipt) {}
  
  public void updateFollow(Follow paramFollow, SCFService.IssueActionReceipt paramIssueActionReceipt) {}
  
  public void updateStatus(Transition paramTransition, SCFService.IssueActionReceipt paramIssueActionReceipt) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */