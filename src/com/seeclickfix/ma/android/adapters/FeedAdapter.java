package com.seeclickfix.ma.android.adapters;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.telephony.PhoneNumberUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.ListAdapter;
import android.widget.Spinner;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.SeeclickfixActivity;
import com.seeclickfix.ma.android.activities.WebviewActivity;
import com.seeclickfix.ma.android.auth.PermissionsManager;
import com.seeclickfix.ma.android.cache.CommentLruObjectCache;
import com.seeclickfix.ma.android.cache.IssueLruObjectCache;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.config.mappings.CommentStatusMapper;
import com.seeclickfix.ma.android.config.mappings.StatusMap;
import com.seeclickfix.ma.android.date.DateUtil;
import com.seeclickfix.ma.android.dialogs.StatusSpinnerFactory;
import com.seeclickfix.ma.android.events.ShowReportEvent;
import com.seeclickfix.ma.android.fragments.NoticeItem;
import com.seeclickfix.ma.android.fragments.interfaces.CommentBtnClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.CommentCardClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.IssueClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnIssueStarClickListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnStatusChangeListener;
import com.seeclickfix.ma.android.fragments.interfaces.VoteClickListener;
import com.seeclickfix.ma.android.media.icons.IconLoadUtil;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.Separator;
import com.seeclickfix.ma.android.objects.issue.Comment;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.types.FeedItem;
import com.seeclickfix.ma.android.objects.user.User;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults;
import com.seeclickfix.ma.android.style.color.StatusColor;
import com.seeclickfix.ma.android.views.ResizableGridView;
import com.squareup.otto.Bus;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang3.StringUtils;

public class FeedAdapter
  extends BaseAdapter
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final int MAX_VIEW_TYPES = 5;
  private static final String TAG = "FeedAdapter";
  private Activity activity;
  private Context applicationContext;
  View.OnClickListener commentBtnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      paramAnonymousView = (Issue)paramAnonymousView.getTag();
      if (commentListener != null) {
        commentListener.onCommentClick(paramAnonymousView);
      }
    }
  };
  private CommentLruObjectCache commentCache;
  private CommentCardClickListener commentCardClickListener;
  View.OnClickListener commentCardListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      paramAnonymousView = (Comment)paramAnonymousView.getTag();
      if (commentCardClickListener != null) {
        commentCardClickListener.onCommentCardClick(paramAnonymousView);
      }
    }
  };
  @SuppressLint({"UseSparseArrays"})
  private Map<Integer, Integer> commentIdsMap = new HashMap();
  private CommentBtnClickListener commentListener;
  @SuppressLint({"UseSparseArrays"})
  private Map<Integer, FeedItem> feedItemsMap = new HashMap();
  View.OnClickListener flagClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      paramAnonymousView = (Issue)paramAnonymousView.getTag();
      ((SeeclickfixActivity)activity).showFlagDialog("issue", paramAnonymousView.getId());
    }
  };
  private Handler handler;
  private boolean isCommentList = false;
  private IssueLruObjectCache issueCache;
  View.OnClickListener issueCardClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      paramAnonymousView = (Issue)paramAnonymousView.getTag();
      if (issueClickListener != null) {
        issueClickListener.onIssueClick(paramAnonymousView);
      }
    }
  };
  private IssueClickListener issueClickListener;
  @SuppressLint({"UseSparseArrays"})
  private Map<Integer, Integer> issueIdsMap = new HashMap();
  private OnIssueStarClickListener issueStarListener;
  private ImageLoader mImageLoader;
  private PermissionsManager mPermissionsManager;
  private OnScrollListener onScrollListener;
  private AdapterView.OnItemSelectedListener spinnerClickListener = new AdapterView.OnItemSelectedListener()
  {
    private String newStatusState;
    
    public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      newStatusState = ((String)((StatusSpinnerAdapter)paramAnonymousAdapterView.getAdapter()).getItemState(paramAnonymousInt));
      paramAnonymousView = (Issue)paramAnonymousAdapterView.getTag();
      if (newStatusState.equals(paramAnonymousView.getStatus())) {}
      while (statusListener == null) {
        return;
      }
      paramAnonymousAdapterView = (ViewGroup)paramAnonymousAdapterView.getParent();
      statusListener.onStatusChange(paramAnonymousView, newStatusState);
    }
    
    public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
  };
  View.OnClickListener starClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      Issue localIssue = (Issue)paramAnonymousView.getTag();
      paramAnonymousView = (CheckBox)paramAnonymousView;
      if (issueStarListener != null) {
        issueStarListener.onIssueStarClick(localIssue);
      }
    }
  };
  private OnStatusChangeListener statusListener;
  private final StatusSpinnerFactory statusSpinnerFactory = new StatusSpinnerFactory();
  View.OnClickListener voteClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      Issue localIssue = (Issue)paramAnonymousView.getTag();
      if (voteListener != null)
      {
        paramAnonymousView.setEnabled(false);
        voteListener.onVoteClick(localIssue);
      }
    }
  };
  private VoteClickListener voteListener;
  View.OnClickListener zoneBtnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      Object localObject = (MobileButtonsWithDefaults)paramAnonymousView.getTag();
      String str = ((MobileButtonsWithDefaults)localObject).getAction();
      localObject = ((MobileButtonsWithDefaults)localObject).getUri();
      Intent localIntent = new Intent();
      try
      {
        if (str.equalsIgnoreCase("Web View"))
        {
          localIntent.setAction("android.intent.action.VIEW");
          localIntent.putExtra("webview_uri", (String)localObject);
          localIntent.setClass(applicationContext, WebviewActivity.class);
          localIntent.setFlags(268435456);
          applicationContext.startActivity(localIntent);
          return;
        }
        if (str.equalsIgnoreCase("Content Handler"))
        {
          localIntent.setAction("android.intent.action.DIAL");
          localIntent.setData(Uri.parse((String)localObject));
          localIntent.setFlags(268435456);
          applicationContext.startActivity(localIntent);
          return;
        }
      }
      catch (ActivityNotFoundException paramAnonymousView)
      {
        paramAnonymousView = new AlertDialog.Builder(activity);
        paramAnonymousView.setPositiveButton(2131493071, new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
          {
            paramAnonymous2DialogInterface.dismiss();
          }
        });
        if (str.equalsIgnoreCase("Content Handler"))
        {
          str = PhoneNumberUtils.formatNumber(((String)localObject).replace("tel:", ""));
          paramAnonymousView.setMessage(applicationContext.getString(2131492937, new Object[] { str })).setTitle(applicationContext.getString(2131492938));
        }
        for (;;)
        {
          paramAnonymousView.create().show();
          return;
          if (str.equalsIgnoreCase("Browser"))
          {
            localIntent.setAction("android.intent.action.VIEW");
            localIntent.setData(Uri.parse((String)localObject));
            localIntent.setFlags(268435456);
            applicationContext.startActivity(localIntent);
            return;
          }
          if (str.equalsIgnoreCase("Local Window Login"))
          {
            FeedAdapter.this.dispatchReportUriEvent((String)localObject, paramAnonymousView);
            return;
          }
          if (!str.equalsIgnoreCase("Local Window")) {
            break;
          }
          FeedAdapter.this.dispatchReportUriEvent((String)localObject, paramAnonymousView);
          return;
          paramAnonymousView.setMessage(applicationContext.getString(2131492935)).setTitle(applicationContext.getString(2131492936));
        }
      }
    }
  };
  
  public FeedAdapter(Activity paramActivity)
  {
    activity = paramActivity;
    applicationContext = paramActivity.getApplicationContext();
    issueCache = IssueLruObjectCache.getInstance("ISSUES");
    commentCache = CommentLruObjectCache.getInstance();
    mImageLoader = VolleyRequestQueue.getInstance(applicationContext).getImageLoader();
  }
  
  private View bindViewByType(int paramInt1, View paramView, int paramInt2)
  {
    switch (paramInt1)
    {
    default: 
      return paramView;
    case 2: 
      return bindIssueView(paramView, applicationContext, paramInt2);
    case 0: 
      return bindSeparatorView(paramView, applicationContext, paramInt2);
    case 1: 
      return bindZoneView(paramView, applicationContext, paramInt2);
    case 3: 
      return bindCommentView(paramView, applicationContext, paramInt2);
    }
    return bindNoticeView(paramView, applicationContext, paramInt2);
  }
  
  private void dispatchReportUriEvent(String paramString, View paramView)
  {
    if ("scf://report".equalsIgnoreCase(paramString)) {
      paramView.post(new Runnable()
      {
        public void run()
        {
          MyApplication.getEventBus().post(new ShowReportEvent("zone-card"));
        }
      });
    }
  }
  
  private View getErrorView(View paramView, Context paramContext)
  {
    return ViewUtil.inflate(paramContext, 2130903125, (ViewGroup)paramView.getParent());
  }
  
  private int getFeedItemCountOffset(int paramInt)
  {
    int k = 0;
    int i = 0;
    int j = k;
    if (feedItemsMap != null)
    {
      j = k;
      if (feedItemsMap.size() > 0)
      {
        Iterator localIterator = feedItemsMap.keySet().iterator();
        for (;;)
        {
          j = i;
          if (!localIterator.hasNext()) {
            break;
          }
          if (((Integer)localIterator.next()).intValue() < paramInt) {
            i += 1;
          }
        }
      }
    }
    return j;
  }
  
  private String getURLForIssueImage(Issue paramIssue)
  {
    String str = null;
    if (paramIssue.getPhotoLargeUrl() != null) {
      str = paramIssue.getPhotoLargeUrl();
    }
    do
    {
      return str;
      if (paramIssue.getPhotoSmallUrl() != null) {
        return paramIssue.getPhotoSmallUrl();
      }
    } while (paramIssue.getCategoryIcon() == null);
    return paramIssue.getCategoryIcon();
  }
  
  private View newViewByType(int paramInt1, View paramView, ViewGroup paramViewGroup, int paramInt2)
  {
    switch (paramInt1)
    {
    default: 
      return paramView;
    case 2: 
      return newIssueView(paramViewGroup, paramInt2);
    case 0: 
      return newSeparatorView(paramViewGroup, paramInt2);
    case 1: 
      return newZoneView(paramViewGroup, paramInt2);
    case 3: 
      return newCommentView(paramViewGroup, paramInt2);
    }
    return newNoticeView(paramViewGroup, paramInt2);
  }
  
  private void renderCommentsButton(CheckBox paramCheckBox, Issue paramIssue)
  {
    paramCheckBox.setText(String.valueOf(paramIssue.getCommentCountExcludingActivity()));
    boolean bool = mPermissionsManager.isActionableIssue("com.seeclickfix.actions.COMMENT", paramIssue);
    if (bool) {}
    for (int i = -12303292;; i = -3355444)
    {
      paramCheckBox.setEnabled(bool);
      paramCheckBox.setTextColor(i);
      paramCheckBox.refreshDrawableState();
      return;
    }
  }
  
  private void renderVotesButton(CheckBox paramCheckBox, Issue paramIssue)
  {
    boolean bool1 = mPermissionsManager.isActionableIssue("com.seeclickfix.actions.VOTE", paramIssue);
    boolean bool2 = paramIssue.isVotedBefore();
    if (bool1) {}
    for (int i = -12303292;; i = -3355444)
    {
      paramCheckBox.setChecked(bool2);
      paramCheckBox.setEnabled(bool1);
      paramCheckBox.setTextColor(i);
      paramCheckBox.setText(String.valueOf(paramIssue.getRating()));
      paramCheckBox.refreshDrawableState();
      return;
    }
  }
  
  private void showDisclaimer(ZoneViewHolder paramZoneViewHolder)
  {
    Object localObject = DedicatedAppManager.getDedicatedApp(applicationContext);
    if (!((DedicatedApp)localObject).getIsDedicatedApp()) {}
    do
    {
      return;
      localObject = ((DedicatedApp)localObject).getDisclaimerText();
    } while (StringUtils.isEmpty((CharSequence)localObject));
    disclaimerTextView.setText((CharSequence)localObject);
    disclaimerTextView.setVisibility(0);
  }
  
  public void addFeedItemAt(int paramInt, FeedItem paramFeedItem)
  {
    if (paramFeedItem == null) {
      return;
    }
    paramFeedItem.setZeroBasedIndex(paramInt);
    feedItemsMap.put(Integer.valueOf(paramFeedItem.getZeroBasedIndex()), paramFeedItem);
  }
  
  public void appendCommentsToList(List<Comment> paramList)
  {
    if (paramList.size() == 0) {}
    for (;;)
    {
      return;
      int j = getCommentCount();
      int k = paramList.size();
      int i = j;
      while (i < k + j)
      {
        if (!commentIdsMap.containsKey(Integer.valueOf(i)))
        {
          commentIdsMap.put(Integer.valueOf(i), Integer.valueOf(((Comment)paramList.get(i - j)).getApiID()));
          commentCache.put(Integer.valueOf(((Comment)paramList.get(i - j)).getApiID()), paramList.get(i - j));
        }
        i += 1;
      }
    }
  }
  
  public void appendFeedItem(FeedItem paramFeedItem)
  {
    addFeedItemAt(feedItemsMap.size(), paramFeedItem);
  }
  
  public void appendList(List<Issue> paramList)
  {
    int j = getIssueCount();
    int k = paramList.size();
    int m = getIssueCount();
    int i = j;
    while (i < k + m)
    {
      if (!issueIdsMap.containsValue(Integer.valueOf(((Issue)paramList.get(i - j)).getId())))
      {
        issueIdsMap.put(Integer.valueOf(i), Integer.valueOf(((Issue)paramList.get(i - j)).getId()));
        issueCache.put(Integer.valueOf(((Issue)paramList.get(i - j)).getId()), paramList.get(i - j));
      }
      i += 1;
    }
  }
  
  public boolean areAllItemsEnabled()
  {
    return false;
  }
  
  @SuppressLint({"DefaultLocale"})
  public View bindCommentView(View paramView, Context paramContext, int paramInt)
  {
    paramContext = (CommentViewHolder)paramView.getTag();
    Comment localComment = (Comment)getItem(paramInt);
    if (localComment == null) {
      return paramView;
    }
    Object localObject = CommentStatusMapper.getCommentStatus(localComment.getCommentType(), applicationContext);
    if (((String)localObject).equals("NOT_DISPLAYABLE"))
    {
      statusTextView.setVisibility(8);
      descriptionTextView.setText(localComment.getComment());
      dateTextView.setText(localComment.getCreatedAtShort());
      if (localComment.getName() == null) {
        break label267;
      }
      usernameTextView.setText(localComment.getName());
      usernameTextView.setVisibility(0);
    }
    for (;;)
    {
      itemObj = localComment;
      position = paramInt;
      localObject = localComment.getSquareCommentImagePath();
      if ((localObject != null) && (((String)localObject).length() > 0)) {}
      localObject = localComment.getUser();
      if (localObject != null)
      {
        localObject = ((User)localObject).getAvatarSquareImage();
        if (StringUtils.isNotEmpty((CharSequence)localObject)) {
          IconLoadUtil.loadIcon((String)localObject, userIcon, mImageLoader);
        }
      }
      paramInt = CommentStatusMapper.getBackground(localComment.getCommentType(), applicationContext);
      headerBg.setBackgroundColor(paramInt);
      mainBtn.setOnClickListener(commentCardListener);
      mainBtn.setTag(localComment);
      return paramView;
      statusTextView.setVisibility(0);
      statusTextView.setText(((String)localObject).toUpperCase());
      statusTextView.setBackgroundColor(CommentStatusMapper.getColorForCommentType(localComment.getCommentType(), applicationContext));
      break;
      label267:
      usernameTextView.setVisibility(4);
    }
  }
  
  public View bindIssueView(View paramView, Context paramContext, int paramInt)
  {
    paramContext = (IssueViewHolder)paramView.getTag();
    Issue localIssue = (Issue)getItem(paramInt);
    if (localIssue == null) {}
    int i;
    do
    {
      return paramView;
      localObject = StatusMap.getStateDisplayStrings();
      i = StatusMap.getStatusStateKeys().indexOf(localIssue.getStatus());
    } while (i < 0);
    Object localObject = (String)((List)localObject).get(i);
    titleTextView.setText(localIssue.getSummary());
    statusTextView.setText((CharSequence)localObject);
    statusTextView.setBackgroundColor(StatusColor.getForeground(localIssue.getStatus(), applicationContext));
    descriptionTextView.setText(localIssue.getDescription());
    dateTextView.setText(DateUtil.getDateDisplayStringFromMSEpoch(localIssue.getCreatedAtEpoch()));
    locationTextView.setText(localIssue.getAddress());
    if (localIssue.getReporterDisplay() != null)
    {
      usernameTextView.setText(localIssue.getReporterDisplay());
      usernameTextView.setVisibility(0);
      itemObj = localIssue;
      position = paramInt;
      statusContainer.removeAllViews();
      localObject = statusSpinnerFactory.buildSpinner(localIssue, mPermissionsManager.closedIsFinal(), activity);
      if (localObject != null)
      {
        ((Spinner)localObject).setOnItemSelectedListener(spinnerClickListener);
        statusContainer.addView((View)localObject);
      }
      renderVotesButton(voteBtn, localIssue);
      renderCommentsButton(commentBtn, localIssue);
      if (!localIssue.isFollowing()) {
        break label476;
      }
      starCheckbox.setChecked(true);
      starCheckbox.setClickable(false);
      starCheckbox.setEnabled(false);
      label286:
      localObject = getURLForIssueImage(localIssue);
      if ((localObject == null) || (!((String)localObject).contains("no-image"))) {
        break label503;
      }
      if (imageReqContainer != null) {
        imageReqContainer.cancelRequest();
      }
      icon.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
      icon.setImageResource(2130837840);
      icon.setBackgroundColor(StatusColor.getBackground(localIssue.getStatus(), applicationContext));
    }
    for (;;)
    {
      commentBtn.setOnClickListener(commentBtnListener);
      voteBtn.setOnClickListener(voteClickListener);
      flagBtn.setOnClickListener(flagClickListener);
      starCheckbox.setOnClickListener(starClickListener);
      voteBtn.setTag(localIssue);
      flagBtn.setTag(localIssue);
      starCheckbox.setTag(localIssue);
      commentBtn.setTag(localIssue);
      mainBtn.setOnClickListener(issueCardClickListener);
      mainBtn.setTag(localIssue);
      return paramView;
      usernameTextView.setVisibility(4);
      break;
      label476:
      starCheckbox.setChecked(false);
      starCheckbox.setClickable(true);
      starCheckbox.setEnabled(true);
      break label286;
      label503:
      if (localIssue.getPhotoSmallUrl() != null)
      {
        if (imageReqContainer != null) {
          imageReqContainer.cancelRequest();
        }
        icon.setScaleType(ImageView.ScaleType.CENTER_CROP);
        icon.setBackgroundColor(StatusColor.getBackground(localIssue.getStatus(), applicationContext));
        imageReqContainer = mImageLoader.get(localIssue.getPhotoSmallUrl(), ImageLoader.getImageListener(icon, 2130837848, 2130837848), 680, 300);
      }
      else if (localObject != null)
      {
        icon.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        icon.setBackgroundColor(StatusColor.getBackground(localIssue.getStatus(), applicationContext));
        if (imageReqContainer != null) {
          imageReqContainer.cancelRequest();
        }
        imageReqContainer = mImageLoader.get((String)localObject, ImageLoader.getImageListener(icon, 2130837848, 2130837848), 680, 300);
      }
      else
      {
        icon.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        icon.setBackgroundDrawable(null);
        icon.setImageResource(2130837840);
        icon.setBackgroundColor(StatusColor.getBackground(localIssue.getStatus(), applicationContext));
      }
    }
  }
  
  public View bindNoticeView(View paramView, Context paramContext, int paramInt)
  {
    paramContext = (NoticeViewHolder)paramView.getTag();
    NoticeItem localNoticeItem = (NoticeItem)feedItemsMap.get(Integer.valueOf(paramInt));
    titleTextView.setText(localNoticeItem.getTitle());
    bodyTextView.setText(localNoticeItem.getBody());
    if (localNoticeItem.getExtra().isEmpty())
    {
      extraTextView.setVisibility(8);
      if (localNoticeItem.getAction() == 0) {
        break label158;
      }
      actionTextView.setText(localNoticeItem.getAction());
      actionTextView.setOnClickListener(localNoticeItem.getListener());
      actionTextView.setVisibility(0);
      dividerView.setVisibility(0);
    }
    for (;;)
    {
      paramView.setEnabled(false);
      paramView.setFocusable(false);
      paramView.setClickable(false);
      return paramView;
      extraTextView.setText(localNoticeItem.getExtra());
      extraTextView.setVisibility(0);
      break;
      label158:
      actionTextView.setVisibility(8);
      dividerView.setVisibility(8);
    }
  }
  
  public View bindSeparatorView(View paramView, Context paramContext, int paramInt)
  {
    paramContext = (SeparatorViewHolder)paramView.getTag();
    Separator localSeparator = (Separator)feedItemsMap.get(Integer.valueOf(paramInt));
    textView.setText(localSeparator.getText());
    imgView.setVisibility(8);
    paramView.setEnabled(false);
    paramView.setFocusable(false);
    paramView.setClickable(false);
    return paramView;
  }
  
  @SuppressLint({"DefaultLocale"})
  public View bindZoneView(View paramView, Context paramContext, int paramInt)
  {
    paramContext = (ZoneViewHolder)paramView.getTag();
    Object localObject1 = (EnhancedWatchAreas)feedItemsMap.get(Integer.valueOf(paramInt));
    Object localObject2 = ((EnhancedWatchAreas)localObject1).getLogoURL();
    paramInt = ((EnhancedWatchAreas)localObject1).getBackgroundColor();
    showDisclaimer(paramContext);
    List localList = ((EnhancedWatchAreas)localObject1).getMobileButtonsWithDefaults();
    bgColorContainer.setBackgroundColor(paramInt);
    if (imageReqContainer != null) {
      imageReqContainer.cancelRequest();
    }
    if (localObject2 != null) {
      if (imageReqContainer == null) {
        imageReqContainer = mImageLoader.get((String)localObject2, ImageLoader.getImageListener(icon, 2130837848, 2130837848));
      }
    }
    for (;;)
    {
      try
      {
        localObject2 = ZoneBtnListFilter.convert(localList, applicationContext);
        if ((localObject2 == null) || (((List)localObject2).size() <= 0)) {
          continue;
        }
        localObject1 = new ZoneBtnAdapter(applicationContext, (EnhancedWatchAreas)localObject1, (List)localObject2);
        ((ZoneBtnAdapter)localObject1).setZoneButtonListener(zoneBtnListener);
        gridView.setVisibility(0);
        gridView.setExpanded(true);
        gridView.setAdapter((ListAdapter)localObject1);
      }
      catch (Exception localException)
      {
        continue;
      }
      titleTextView.setVisibility(8);
      titleTextView.invalidate();
      titleTextView.requestLayout();
      descriptionTextView.setVisibility(8);
      descriptionTextView.invalidate();
      descriptionTextView.requestLayout();
      return paramView;
      if (imageReqContainer.getBitmap() != null)
      {
        continue;
        icon.setImageDrawable(null);
        icon.setImageResource(2130837838);
        continue;
        gridView.setVisibility(8);
        gridView.invalidate();
        gridView.requestLayout();
      }
    }
  }
  
  public boolean containsItem(FeedItem paramFeedItem)
  {
    return feedItemsMap.containsValue(paramFeedItem);
  }
  
  public int getCommentCount()
  {
    return commentIdsMap.size();
  }
  
  public int getCount()
  {
    if (isCommentList) {
      return commentIdsMap.size() + feedItemsMap.size();
    }
    return issueIdsMap.size() + feedItemsMap.size();
  }
  
  public int getFeedItemCount()
  {
    return feedItemsMap.size();
  }
  
  public int getIssueCount()
  {
    return issueIdsMap.size();
  }
  
  public Object getItem(int paramInt)
  {
    if (onScrollListener != null) {
      onScrollListener.onScrollToPosition(paramInt, getCount());
    }
    if (feedItemsMap.containsKey(Integer.valueOf(paramInt))) {
      localObject = feedItemsMap.get(Integer.valueOf(paramInt));
    }
    do
    {
      return localObject;
      paramInt -= getFeedItemCountOffset(paramInt);
      if (!isCommentList) {
        break;
      }
      localObject = null;
      localInteger = (Integer)commentIdsMap.get(Integer.valueOf(paramInt));
    } while (localInteger == null);
    return (Comment)commentCache.get(localInteger);
    Object localObject = null;
    Integer localInteger = (Integer)issueIdsMap.get(Integer.valueOf(paramInt));
    if (localInteger != null) {
      localObject = (Issue)issueCache.get(localInteger);
    }
    return localObject;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getItemViewType(int paramInt)
  {
    int i = 3;
    if (feedItemsMap.containsKey(Integer.valueOf(paramInt))) {
      if ((feedItemsMap.get(Integer.valueOf(paramInt)) instanceof EnhancedWatchAreas)) {
        i = 1;
      }
    }
    while (isCommentList)
    {
      do
      {
        return i;
        if ((feedItemsMap.get(Integer.valueOf(paramInt)) instanceof NoticeItem)) {
          return 4;
        }
        if ((feedItemsMap.get(Integer.valueOf(paramInt)) instanceof Separator)) {
          return 0;
        }
      } while ((feedItemsMap.get(Integer.valueOf(paramInt)) instanceof Comment));
      throw new IllegalStateException("item is of an invalid view type");
    }
    return 2;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i = getItemViewType(paramInt);
    if (paramView == null) {
      return newViewByType(i, paramView, paramViewGroup, paramInt);
    }
    return bindViewByType(i, paramView, paramInt);
  }
  
  public int getViewTypeCount()
  {
    return 5;
  }
  
  public boolean hasStableIds()
  {
    return false;
  }
  
  public boolean isEnabled(int paramInt)
  {
    switch (getItemViewType(paramInt))
    {
    default: 
      return false;
    case 2: 
      return true;
    case 3: 
      return true;
    case 1: 
      return false;
    case 4: 
      return false;
    }
    return false;
  }
  
  public View newCommentView(ViewGroup paramViewGroup, int paramInt)
  {
    paramViewGroup = ViewUtil.inflate(applicationContext, 2130903124, paramViewGroup);
    CommentViewHolder localCommentViewHolder = new CommentViewHolder();
    descriptionTextView = ((TextView)paramViewGroup.findViewById(2131362127));
    icon = ((ImageView)paramViewGroup.findViewById(2131362123));
    userIcon = ((ImageView)paramViewGroup.findViewById(2131362125));
    dateTextView = ((TextView)paramViewGroup.findViewById(2131362124));
    usernameTextView = ((TextView)paramViewGroup.findViewById(2131362126));
    mainBtn = ((ViewGroup)paramViewGroup.findViewById(2131362120));
    statusTextView = ((TextView)paramViewGroup.findViewById(2131362122));
    headerBg = paramViewGroup.findViewById(2131362121);
    paramViewGroup.setTag(localCommentViewHolder);
    return bindCommentView(paramViewGroup, applicationContext, paramInt);
  }
  
  public View newIssueView(ViewGroup paramViewGroup, int paramInt)
  {
    paramViewGroup = ViewUtil.inflate(applicationContext, 2130903126, paramViewGroup);
    IssueViewHolder localIssueViewHolder = new IssueViewHolder();
    titleTextView = ((TextView)paramViewGroup.findViewById(2131362136));
    statusTextView = ((TextView)paramViewGroup.findViewById(2131362134));
    descriptionTextView = ((TextView)paramViewGroup.findViewById(2131362138));
    icon = ((ImageView)paramViewGroup.findViewById(2131362133));
    dateTextView = ((TextView)paramViewGroup.findViewById(2131362131));
    locationTextView = ((TextView)paramViewGroup.findViewById(2131362137));
    commentBtn = ((CheckBox)paramViewGroup.findViewById(2131362140));
    statusContainer = ((ViewGroup)paramViewGroup.findViewById(2131362143));
    voteBtn = ((CheckBox)paramViewGroup.findViewById(2131362141));
    flagBtn = ((CheckBox)paramViewGroup.findViewById(2131362142));
    usernameTextView = ((TextView)paramViewGroup.findViewById(2131362132));
    starCheckbox = ((CheckBox)paramViewGroup.findViewById(2131362135));
    mainBtn = ((ViewGroup)paramViewGroup.findViewById(2131362130));
    paramViewGroup.setTag(localIssueViewHolder);
    return bindIssueView(paramViewGroup, applicationContext, paramInt);
  }
  
  public View newNoticeView(ViewGroup paramViewGroup, int paramInt)
  {
    paramViewGroup = ViewUtil.inflate(applicationContext, 2130903128, paramViewGroup);
    NoticeViewHolder localNoticeViewHolder = new NoticeViewHolder();
    titleTextView = ((TextView)paramViewGroup.findViewById(2131362147));
    bodyTextView = ((TextView)paramViewGroup.findViewById(2131362148));
    actionTextView = ((TextView)paramViewGroup.findViewById(2131362151));
    extraTextView = ((TextView)paramViewGroup.findViewById(2131362149));
    dividerView = paramViewGroup.findViewById(2131362150);
    paramViewGroup.setTag(localNoticeViewHolder);
    return bindNoticeView(paramViewGroup, applicationContext, paramInt);
  }
  
  public View newSeparatorView(ViewGroup paramViewGroup, int paramInt)
  {
    paramViewGroup = ViewUtil.inflate(applicationContext, 2130903137, paramViewGroup);
    SeparatorViewHolder localSeparatorViewHolder = new SeparatorViewHolder();
    textView = ((TextView)paramViewGroup.findViewById(2131362162));
    imgView = ((ImageView)paramViewGroup.findViewById(2131362161));
    paramViewGroup.setTag(localSeparatorViewHolder);
    return bindSeparatorView(paramViewGroup, applicationContext, paramInt);
  }
  
  public View newZoneView(ViewGroup paramViewGroup, int paramInt)
  {
    paramViewGroup = ViewUtil.inflate(applicationContext, 2130903143, paramViewGroup);
    ZoneViewHolder localZoneViewHolder = new ZoneViewHolder();
    descriptionTextView = ((TextView)paramViewGroup.findViewById(2131362169));
    disclaimerTextView = ((TextView)paramViewGroup.findViewById(2131362170));
    titleTextView = ((TextView)paramViewGroup.findViewById(2131362168));
    icon = ((ImageView)paramViewGroup.findViewById(2131362166));
    bgColorContainer = ((ViewGroup)paramViewGroup.findViewById(2131362165));
    gridView = ((ResizableGridView)paramViewGroup.findViewById(2131362171));
    paramViewGroup.setTag(localZoneViewHolder);
    return bindZoneView(paramViewGroup, applicationContext, paramInt);
  }
  
  public void setCommentCardClickListener(CommentCardClickListener paramCommentCardClickListener)
  {
    commentCardClickListener = paramCommentCardClickListener;
  }
  
  public void setCommentClickListener(CommentBtnClickListener paramCommentBtnClickListener)
  {
    commentListener = paramCommentBtnClickListener;
  }
  
  public void setIsCommentList(boolean paramBoolean)
  {
    isCommentList = paramBoolean;
  }
  
  public void setIssueClickListener(IssueClickListener paramIssueClickListener)
  {
    issueClickListener = paramIssueClickListener;
  }
  
  public void setOnIssueStarClickListener(OnIssueStarClickListener paramOnIssueStarClickListener)
  {
    issueStarListener = paramOnIssueStarClickListener;
  }
  
  public void setOnScrollListener(OnScrollListener paramOnScrollListener)
  {
    onScrollListener = paramOnScrollListener;
  }
  
  public void setOnStatusChangeListener(OnStatusChangeListener paramOnStatusChangeListener)
  {
    statusListener = paramOnStatusChangeListener;
  }
  
  public void setPermissionsManager(PermissionsManager paramPermissionsManager)
  {
    mPermissionsManager = paramPermissionsManager;
  }
  
  public void setVoteClickListener(VoteClickListener paramVoteClickListener)
  {
    voteListener = paramVoteClickListener;
  }
  
  public void updateIssue(Issue paramIssue)
  {
    issueCache = IssueLruObjectCache.getInstance("ISSUES");
    issueCache.put(Integer.valueOf(paramIssue.getId()), paramIssue);
    notifyDataSetChanged();
  }
  
  public void updateStatusByIssue(Issue paramIssue)
  {
    feedItemsMap.containsValue(paramIssue);
    paramIssue = feedItemsMap.keySet().iterator();
    while (paramIssue.hasNext())
    {
      Integer localInteger = (Integer)paramIssue.next();
      if (!((FeedItem)feedItemsMap.get(localInteger) instanceof Issue)) {}
    }
  }
  
  static class CommentViewHolder
    implements TypedViewHolder
  {
    TextView dateTextView;
    TextView descriptionTextView;
    View headerBg;
    ImageView icon;
    ImageLoader.ImageContainer imageReqContainer;
    Object itemObj;
    ViewGroup mainBtn;
    int position;
    TextView statusTextView;
    ImageView userIcon;
    TextView usernameTextView;
    final int viewType = 3;
    
    public int getType()
    {
      return 3;
    }
  }
  
  static class IssueViewHolder
    implements TypedViewHolder
  {
    CheckBox commentBtn;
    TextView dateTextView;
    TextView descriptionTextView;
    CheckBox flagBtn;
    ImageView icon;
    ImageLoader.ImageContainer imageReqContainer;
    Object itemObj;
    TextView locationTextView;
    ViewGroup mainBtn;
    int position;
    CheckBox starCheckbox;
    ViewGroup statusContainer;
    Spinner statusSpinner;
    TextView statusTextView;
    TextView titleTextView;
    ImageView userIcon;
    TextView usernameTextView;
    final int viewType = 2;
    CheckBox voteBtn;
    
    public int getType()
    {
      return 2;
    }
  }
  
  static class NoticeViewHolder
    implements TypedViewHolder
  {
    TextView actionTextView;
    TextView bodyTextView;
    View dividerView;
    TextView extraTextView;
    TextView titleTextView;
    final int viewType = 4;
    
    public int getType()
    {
      return 4;
    }
  }
  
  public static abstract interface OnScrollListener
  {
    public abstract void onScrollToPosition(int paramInt1, int paramInt2);
  }
  
  static class SeparatorViewHolder
    implements TypedViewHolder
  {
    ImageView imgView;
    TextView textView;
    final int viewType = 0;
    
    public int getType()
    {
      return 0;
    }
  }
  
  private class ViewTypes
  {
    static final int COMMENT = 3;
    static final int ISSUE = 2;
    static final int NOTICE = 4;
    static final int SEPARATOR = 0;
    static final int ZONE = 1;
    
    private ViewTypes() {}
  }
  
  static class ZoneViewHolder
    implements TypedViewHolder
  {
    ViewGroup bgColorContainer;
    TextView descriptionTextView;
    TextView disclaimerTextView;
    ResizableGridView gridView;
    ImageView icon;
    ImageLoader.ImageContainer imageReqContainer;
    TextView titleTextView;
    final int viewType = 1;
    
    public int getType()
    {
      return 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */