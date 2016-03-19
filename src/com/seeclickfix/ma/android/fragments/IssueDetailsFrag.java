package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.seeclickfix.ma.android.IssueModel;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.SeeclickfixActivity;
import com.seeclickfix.ma.android.adapters.StatusSpinnerAdapter;
import com.seeclickfix.ma.android.anim.Transitions;
import com.seeclickfix.ma.android.api.SCFService.IssueActionEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.auth.PermissionsManager;
import com.seeclickfix.ma.android.cache.IssueLruObjectCache;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.config.mappings.StatusMap;
import com.seeclickfix.ma.android.date.DateUtil;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog;
import com.seeclickfix.ma.android.dialogs.StatusSpinnerFactory;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.CameraLaunchingActivity;
import com.seeclickfix.ma.android.fragments.interfaces.GalleryLauncher;
import com.seeclickfix.ma.android.fragments.interfaces.HomeButtonsInterface;
import com.seeclickfix.ma.android.fragments.interfaces.ImageCapturedCallback;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.map.MapOptionsFactory;
import com.seeclickfix.ma.android.media.GalleryPicker;
import com.seeclickfix.ma.android.media.MediaCaptureHelper;
import com.seeclickfix.ma.android.media.MediaCaptureHelper.Builder;
import com.seeclickfix.ma.android.media.PhotoTaker;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import com.seeclickfix.ma.android.objects.issue.Comment;
import com.seeclickfix.ma.android.objects.issue.Follow;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.issue.Nop;
import com.seeclickfix.ma.android.objects.issue.RevokeVote;
import com.seeclickfix.ma.android.objects.issue.Transition;
import com.seeclickfix.ma.android.objects.issue.Vote;
import com.seeclickfix.ma.android.objects.media.ImageParcel;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.objects.user.User;
import com.seeclickfix.ma.android.social.ShareIntentHelper;
import com.seeclickfix.ma.android.style.color.StatusColor;
import com.seeclickfix.ma.android.tasks.GetCommentsTask;
import com.seeclickfix.ma.android.tasks.GetSingleIssueTask;
import com.seeclickfix.ma.android.util.FormUtil;
import com.seeclickfix.ma.android.views.ColorMarkers;
import com.seeclickfix.ma.android.views.ToastFactory;
import com.squareup.otto.Subscribe;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;

public class IssueDetailsFrag
  extends BaseFrag
  implements ImageCapturedCallback, IssueCard
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IssueDetailsFrag";
  private Button addCommentBtn;
  private String authAction;
  private ImageButton commentCameraBtn;
  private EditText commentEditText;
  private ImageButton commentGalleryBtn;
  private List<Comment> commentList = new ArrayList();
  private ViewGroup commentThumbContainer;
  private ImageView commentThumbnail;
  private CheckBox commentsBtn;
  private ViewGroup commentsContainer;
  Response.Listener<JSONArray> commentsListener = new Response.Listener()
  {
    public void onResponse(JSONArray paramAnonymousJSONArray)
    {
      paramAnonymousJSONArray = new DeserializeResponse().getJavaObject(paramAnonymousJSONArray.toString(), Comment.class);
      showComments(paramAnonymousJSONArray);
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
    }
  };
  private AuthUser currentUser;
  private TextView dateText;
  private boolean delayedCommentscroll = false;
  private TextView descriptionText;
  private TextView.OnEditorActionListener doneListener;
  Response.ErrorListener errorListener = new Response.ErrorListener()
  {
    public void onErrorResponse(VolleyError paramAnonymousVolleyError)
    {
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
    }
  };
  Response.ErrorListener errorSingleIssueListener = new Response.ErrorListener()
  {
    public void onErrorResponse(VolleyError paramAnonymousVolleyError)
    {
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
      getRootFrag().findViewById(2131361919).setVisibility(8);
    }
  };
  private CheckBox flagBtn;
  private GetCommentsTask getCommentsTask;
  @Inject
  GetSingleIssueTask getIssueTask;
  private Intent imageIntent;
  private Issue issue;
  private IssueLruObjectCache issueCache;
  private int issueId = -1;
  private TextView issueIdText;
  private ImageView issueImageView;
  private TextView locationText;
  private String mCurrentPhotoPath;
  private ImageLoader mImageLoader;
  private GoogleMap mMap;
  private SupportMapFragment mMapFragment;
  private HashMap<String, String> mParamsMap = new HashMap();
  @Inject
  PermissionsManager mPermissionsManager;
  private View mapButton;
  private ViewGroup mapContainer;
  @Inject
  MapHelper mapHelper;
  private Button mediaClearButton;
  private Button mediaEditButton;
  private MediaCaptureHelper mediaHelper;
  private View.OnClickListener onClickListener;
  private PageParams returnPageParams;
  private boolean setPicOnResume;
  Response.Listener<JSONArray> singleIssueLoadListener = new Response.Listener()
  {
    public void onResponse(JSONArray paramAnonymousJSONArray)
    {
      if (getSherlockActivity() == null) {
        return;
      }
      paramAnonymousJSONArray = new DeserializeResponse().getJavaObject(paramAnonymousJSONArray.toString(), Issue.class);
      IssueDetailsFrag.access$002(IssueDetailsFrag.this, (Issue)paramAnonymousJSONArray.get(0));
      getArguments().putParcelable("issue_bundle", issue);
      IssueDetailsFrag.this.setupContent();
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
      getRootFrag().findViewById(2131361919).setVisibility(8);
    }
  };
  private StatusSpinnerAdapter spinnerAdapter;
  private AdapterView.OnItemSelectedListener spinnerClickListener = new AdapterView.OnItemSelectedListener()
  {
    String newStatus;
    
    public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      if (issue == null) {}
      do
      {
        return;
        newStatus = ((String)paramAnonymousAdapterView.getAdapter().getItem(paramAnonymousInt));
      } while (("Archived".equals(issue.getStatus())) || (newStatus.equals(issue.getStatus())));
      OneTimeWarnDialog.statusChangeWarning(IssueDetailsFrag.this, new Runnable()new Runnable
      {
        public void run()
        {
          IssueDetailsFrag.this.authAndExecute(Transition.fromStatus(issue, newStatus));
        }
      }, new Runnable()
      {
        public void run()
        {
          resetStatus();
        }
      });
    }
    
    public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
  };
  private CheckBox starCheckbox;
  private Spinner statusSpinner;
  private final StatusSpinnerFactory statusSpinnerFactory = new StatusSpinnerFactory();
  private TextView statusTextView;
  private TextView summaryText;
  private TextView userText;
  private CheckBox votesBtn;
  
  private void attachClickListeners()
  {
    votesBtn.setOnClickListener(onClickListener);
    flagBtn.setOnClickListener(onClickListener);
    addCommentBtn.setOnClickListener(onClickListener);
    commentsBtn.setOnClickListener(onClickListener);
    commentCameraBtn.setOnClickListener(onClickListener);
    commentGalleryBtn.setOnClickListener(onClickListener);
    mediaEditButton.setOnClickListener(onClickListener);
    mediaClearButton.setOnClickListener(onClickListener);
    starCheckbox.setOnClickListener(onClickListener);
    mapButton.setOnClickListener(onClickListener);
    commentEditText.setOnEditorActionListener(doneListener);
  }
  
  private void authAndExecute(Comment paramComment)
  {
    if (AuthManager.isAuthenticated())
    {
      paramComment.executeAction();
      return;
    }
    launchLoginFrag(paramComment);
  }
  
  private void decodeLocalBitmap(String paramString, ImageView paramImageView)
  {
    MediaCaptureHelper.Builder localBuilder = new MediaCaptureHelper.Builder();
    localBuilder.imageView(paramImageView);
    localBuilder.activity(getActivity());
    localBuilder.photoPath(paramString);
    localBuilder.build().setPic();
  }
  
  private void displayContent()
  {
    Object localObject1 = getString(2131492963, new Object[] { issue.getSummary() });
    Object localObject2 = getString(2131492955, new Object[] { issue.getDescription() });
    String str = getString(2131492958, new Object[] { issue.getAddress() });
    descriptionText.setText((CharSequence)localObject2);
    locationText.setText(str);
    summaryText.setText((CharSequence)localObject1);
    issueIdText.setText(getDisplayID(issue));
    userText.setText(issue.getReporterDisplay());
    dateText.setText(DateUtil.getDateDisplayStringFromMSEpoch(issue.getCreatedAtEpoch()));
    localObject1 = StatusMap.getStateDisplayStrings();
    int i = StatusMap.getStatusStateKeys().indexOf(issue.getStatus());
    if (i >= 0)
    {
      localObject1 = (String)((List)localObject1).get(i);
      statusTextView.setText((CharSequence)localObject1);
      statusTextView.setBackgroundColor(StatusColor.getForeground(issue.getStatus(), getAppContext()));
    }
    renderVotesButton(issue);
    renderCommentsButton(issue);
    issueImageView.setBackgroundColor(StatusColor.getBackground(issue.getStatus(), getAppContext()));
    if (issue.getLocalImagePath() != null)
    {
      issueImageView.setPadding(0, 0, 0, 0);
      issueImageView.setVisibility(0);
      issueImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
      decodeLocalBitmap(issue.getLocalImagePath(), issueImageView);
    }
    if (issueImageView.getDrawable() != null) {}
    for (;;)
    {
      if (issue.isFollowing())
      {
        localObject1 = (CheckBox)getRootFrag().findViewById(2131361927);
        ((CheckBox)localObject1).setChecked(true);
        ((CheckBox)localObject1).setClickable(false);
      }
      setUpMapIfNeeded();
      localObject1 = (ViewGroup)getRootFrag().findViewById(2131361934);
      ((ViewGroup)localObject1).removeAllViews();
      localObject2 = statusSpinnerFactory.buildSpinner(issue, mPermissionsManager.closedIsFinal(), getSherlockActivity());
      if (localObject2 != null)
      {
        ((Spinner)localObject2).setOnItemSelectedListener(spinnerClickListener);
        ((ViewGroup)localObject1).addView((View)localObject2);
      }
      hideCommentControlsIfArchived();
      return;
      if (issue.getPhotoSmallUrl() != null)
      {
        issueImageView.setPadding(0, 0, 0, 0);
        issueImageView.setVisibility(0);
        issueImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        loadImage(issue.getPhotoSmallUrl(), issueImageView);
        issueImageView.setOnClickListener(onClickListener);
      }
      else if (issue.getCategoryIcon() != null)
      {
        if (issue.getCategoryIcon().contains("no-image"))
        {
          issueImageView.setVisibility(0);
          issueImageView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
          issueImageView.setImageResource(2130837840);
          issueImageView.setOnClickListener(null);
        }
        else
        {
          issueImageView.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
          issueImageView.setVisibility(0);
          loadIcon(issue.getCategoryIcon(), issueImageView);
          issueImageView.setOnClickListener(null);
        }
      }
      else
      {
        issueImageView.setVisibility(8);
        issueImageView.setOnClickListener(null);
      }
    }
  }
  
  private void enableCommentButton()
  {
    View localView = getRootFrag().findViewById(2131361951);
    localView.setEnabled(true);
    localView.setVisibility(0);
    ((ProgressBar)getRootFrag().findViewById(2131361946)).setVisibility(8);
  }
  
  private String getDisplayID(Issue paramIssue)
  {
    DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(getAppContext());
    String str = getString(2131492957, new Object[] { String.valueOf(paramIssue.getId()) });
    Object localObject = str;
    if (localDedicatedApp.getIsDedicatedApp())
    {
      localObject = str;
      if (!getOptionsshowIntegrationId) {}
    }
    try
    {
      localObject = (Map)paramIssue.getIntegrationIssues().get(0);
      paramIssue = (String)((Map)localObject).keySet().iterator().next();
      localObject = (String)((Map)localObject).values().iterator().next();
      localObject = (String)localObject + ": " + paramIssue;
      return (String)localObject;
    }
    catch (Exception paramIssue) {}
    return str;
  }
  
  private GoogleMapOptions getMapOptions()
  {
    GoogleMapOptions localGoogleMapOptions = MapOptionsFactory.getStandardOptions();
    localGoogleMapOptions.scrollGesturesEnabled(false);
    localGoogleMapOptions.zoomControlsEnabled(false);
    return localGoogleMapOptions;
  }
  
  private void handleAction(String paramString)
  {
    if (paramString.equals("com.seeclickfix.actions.COMMENT")) {
      delayedCommentscroll = true;
    }
  }
  
  private void hideCommentControls()
  {
    Button localButton = (Button)getRootFrag().findViewById(2131361931);
    View localView1 = getRootFrag().findViewById(2131361941);
    View localView2 = getRootFrag().findViewById(2131361947);
    View localView3 = getRootFrag().findViewById(2131361948);
    addCommentBtn.setEnabled(false);
    localButton.setEnabled(false);
    localView1.setVisibility(8);
    addCommentBtn.setVisibility(8);
    localView2.setVisibility(8);
    localView3.setVisibility(8);
  }
  
  private void hideCommentControlsIfArchived()
  {
    if ("Archived".equals(issue.getStatus())) {
      hideCommentControls();
    }
  }
  
  private void initMap()
  {
    mMapFragment = mapHelper.initMap(this, 2131361936, getMapOptions());
  }
  
  private void launchLoginFrag(Comment paramComment)
  {
    postEvent(new AuthRequiredEvent(paramComment.getIssueDetailsParams(issue)));
  }
  
  private void loadComments(int paramInt)
  {
    getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
    getCommentsTask = new GetCommentsTask(getAppContext(), paramInt, commentsListener, errorListener);
    getCommentsTask.execute();
  }
  
  private void loadIcon(String paramString, ImageView paramImageView)
  {
    if ((paramString == null) || (paramString.equalsIgnoreCase("null"))) {
      return;
    }
    String str = paramString;
    if (!paramString.startsWith("http://")) {
      str = new String("http://seeclickfix.com" + paramString);
    }
    mImageLoader.get(str, ImageLoader.getImageListener(paramImageView, 2130837848, 2130837840), 96, 96);
  }
  
  private void loadImage(String paramString, ImageView paramImageView)
  {
    if ((paramString == null) || (paramString.equalsIgnoreCase("null"))) {
      return;
    }
    String str = paramString;
    if (!paramString.startsWith("http://")) {
      str = new String("http://seeclickfix.com" + paramString);
    }
    mImageLoader.get(str, ImageLoader.getImageListener(paramImageView, 2130837848, 2130837840), 680, 300);
  }
  
  private void loadIssue()
  {
    Bundle localBundle = getArguments();
    Issue localIssue = (Issue)localBundle.getParcelable("issue_bundle");
    String str = localBundle.getString("action_extra");
    issueCache = IssueLruObjectCache.getInstance("ISSUES");
    if (str != null) {
      handleAction(str);
    }
    if (localIssue == null)
    {
      issueId = localBundle.getInt("issue_id");
      mParamsMap = ((HashMap)localBundle.getSerializable("url_params_map"));
      if (mParamsMap == null) {
        mParamsMap = new HashMap();
      }
    }
    for (;;)
    {
      issue = ((Issue)issueCache.get(Integer.valueOf(issueId)));
      if (issue != null) {
        break;
      }
      loadSingleIssue();
      return;
      issueId = localIssue.getId();
    }
    setupContent();
  }
  
  private void loadSingleIssue()
  {
    getRootFrag().findViewById(2131361919).setVisibility(0);
    getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
    getIssueTask.execute(issueId, singleIssueLoadListener, errorSingleIssueListener, mParamsMap);
  }
  
  private void putPhotoInBundle()
  {
    getArguments().putString("comment_image_path_extra", mCurrentPhotoPath);
  }
  
  private void renderCommentsButton(Issue paramIssue)
  {
    boolean bool = mPermissionsManager.isActionableIssue("com.seeclickfix.actions.COMMENT", paramIssue);
    if (bool) {}
    for (int i = -12303292;; i = -3355444)
    {
      commentsBtn.setEnabled(bool);
      commentsBtn.setTextColor(i);
      commentsBtn.setText(String.valueOf(paramIssue.getCommentCountExcludingActivity()));
      commentsBtn.refreshDrawableState();
      if (!bool) {
        hideCommentControls();
      }
      return;
    }
  }
  
  private void renderVotesButton(Issue paramIssue)
  {
    boolean bool1 = mPermissionsManager.isActionableIssue("com.seeclickfix.actions.VOTE", paramIssue);
    boolean bool2 = paramIssue.isVotedBefore();
    if (bool1) {}
    for (int i = -12303292;; i = -3355444)
    {
      votesBtn.setChecked(bool2);
      votesBtn.setEnabled(bool1);
      votesBtn.setTextColor(i);
      votesBtn.setText(String.valueOf(paramIssue.getRating()));
      votesBtn.refreshDrawableState();
      return;
    }
  }
  
  private void resetAddCommentViews()
  {
    enableCommentButton();
    ((ViewGroup)getRootFrag().findViewById(2131361948)).setVisibility(0);
    commentEditText.setVisibility(0);
    commentEditText.setText("");
    commentEditText.setEnabled(true);
    if (mediaHelper != null) {
      mediaHelper.hidePic();
    }
    mCurrentPhotoPath = null;
    imageIntent = null;
    ((TextView)getRootFrag().findViewById(2131361941)).setText(getString(2131492948));
  }
  
  private void runMediaCaptureHelper()
  {
    MediaCaptureHelper.Builder localBuilder = new MediaCaptureHelper.Builder();
    localBuilder.activity(getActivity());
    localBuilder.imageView(commentThumbnail);
    localBuilder.imgIntent(imageIntent);
    localBuilder.viewToShow(commentThumbContainer);
    localBuilder.photoPath(mCurrentPhotoPath);
    mediaHelper = localBuilder.build();
    if ((imageIntent != null) && (mCurrentPhotoPath == null)) {
      mCurrentPhotoPath = mediaHelper.getPathFromtIntent(imageIntent);
    }
    mediaHelper.setPic();
  }
  
  private void scrollToBottom()
  {
    final ViewGroup localViewGroup = (ViewGroup)((ScrollView)getRootFrag()).getChildAt(0);
    localViewGroup.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
    {
      public void onGlobalLayout()
      {
        localViewGroup.getViewTreeObserver().removeGlobalOnLayoutListener(this);
        doScrollToBottom();
      }
    });
  }
  
  private void setMarkerAndAnimate()
  {
    BitmapDescriptor localBitmapDescriptor = ColorMarkers.getDotByStatus(issue.getStatus(), getAppContext());
    mMap.setMyLocationEnabled(true);
    LatLng localLatLng = new LatLng(issue.getLat(), issue.getLng());
    CameraUpdate localCameraUpdate = CameraUpdateFactory.newLatLngZoom(localLatLng, 15.0F);
    mMap.animateCamera(localCameraUpdate, 500, null);
    mMap.setMyLocationEnabled(false);
    mMap.addMarker(new MarkerOptions().position(localLatLng).title(issue.getSummary()).icon(localBitmapDescriptor).anchor(0.33F, 0.5F));
  }
  
  private void setReferences()
  {
    descriptionText = ((TextView)getRootFrag().findViewById(2131361929));
    locationText = ((TextView)getRootFrag().findViewById(2131361937));
    statusTextView = ((TextView)getRootFrag().findViewById(2131361926));
    commentsBtn = ((CheckBox)getRootFrag().findViewById(2131361931));
    summaryText = ((TextView)getRootFrag().findViewById(2131361928));
    dateText = ((TextView)getRootFrag().findViewById(2131361924));
    userText = ((TextView)getRootFrag().findViewById(2131361923));
    issueIdText = ((TextView)getRootFrag().findViewById(2131361952));
    votesBtn = ((CheckBox)getRootFrag().findViewById(2131361932));
    flagBtn = ((CheckBox)getRootFrag().findViewById(2131361933));
    starCheckbox = ((CheckBox)getRootFrag().findViewById(2131361927));
    addCommentBtn = ((Button)getRootFrag().findViewById(2131361951));
    commentsContainer = ((ViewGroup)getRootFrag().findViewById(2131361939));
    issueImageView = ((ImageView)getRootFrag().findViewById(2131361925));
    commentEditText = ((EditText)getRootFrag().findViewById(2131361947));
    commentCameraBtn = ((ImageButton)getRootFrag().findViewById(2131361949));
    commentGalleryBtn = ((ImageButton)getRootFrag().findViewById(2131361950));
    commentThumbnail = ((ImageView)getRootFrag().findViewById(2131361943));
    commentThumbContainer = ((ViewGroup)getRootFrag().findViewById(2131361942));
    mediaEditButton = ((Button)getRootFrag().findViewById(2131361944));
    mediaClearButton = ((Button)getRootFrag().findViewById(2131361945));
    mapButton = getRootFrag().findViewById(2131361935);
    mapContainer = ((ViewGroup)getRootFrag().findViewById(2131361936));
    mapContainer.setVisibility(0);
  }
  
  private void setUpMapIfNeeded()
  {
    if (mMapFragment == null) {
      initMap();
    }
    if (mMap == null)
    {
      mMap = mMapFragment.getMap();
      if (mMap != null) {
        setMarkerAndAnimate();
      }
      return;
    }
    setMarkerAndAnimate();
  }
  
  private void setupClickListener()
  {
    onClickListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        switch (paramAnonymousView.getId())
        {
        default: 
          return;
        case 2131361951: 
          View localView = getRootFrag().findViewById(2131361951);
          localView.setEnabled(false);
          localView.setVisibility(8);
          FormUtil.hideKeyboard(paramAnonymousView);
          IssueDetailsFrag.this.authAndExecute(buildComment());
          return;
        case 2131361932: 
          votesBtn.setEnabled(false);
          IssueDetailsFrag.this.authAndExecute(issue.suitableVoteAction());
          return;
        case 2131361927: 
          starCheckbox.setEnabled(false);
          IssueDetailsFrag.this.authAndExecute(new Follow(issue));
          return;
        case 2131361931: 
          doScrollToBottom();
          return;
        case 2131361949: 
          launchCamera();
          return;
        case 2131361950: 
          launchGallery();
          return;
        case 2131361945: 
          clearMedia();
          return;
        case 2131362115: 
          paramAnonymousView = (Comment)paramAnonymousView.getTag();
          launchImageViewer(paramAnonymousView.getCommentImagePath(), paramAnonymousView.getSmallCommentImagePath(), issue.getSummary(), paramAnonymousView.getComment(), paramAnonymousView.getUser().getAvatarSquareImage(), paramAnonymousView.getUser().getName());
          return;
        case 2131361925: 
          launchImageViewer(issue.getPhotoLargeUrl(), issue.getPhotoSmallUrl(), issue.getSummary(), issue.getDescription(), null, issue.getReporterDisplay());
          return;
        case 2131361935: 
          showMapLarge();
          return;
        }
        ((SeeclickfixActivity)getActivity()).showFlagDialog("issue", issue.getId());
      }
    };
    doneListener = new TextView.OnEditorActionListener()
    {
      public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
      {
        boolean bool = false;
        if (paramAnonymousInt == 6)
        {
          ((InputMethodManager)paramAnonymousTextView.getContext().getSystemService("input_method")).hideSoftInputFromWindow(paramAnonymousTextView.getWindowToken(), 0);
          bool = true;
        }
        return bool;
      }
    };
  }
  
  private void setupContent()
  {
    setReferences();
    setupClickListener();
    attachClickListeners();
    displayContent();
    loadComments(issue.getId());
    if (shouldSetPicOnResume()) {
      runMediaCaptureHelper();
    }
  }
  
  private void setupTileOverlay() {}
  
  private boolean shouldSetPicOnResume()
  {
    mCurrentPhotoPath = getArguments().getString("comment_image_path_extra");
    if (!StringUtils.isEmpty(mCurrentPhotoPath)) {
      setPicOnResume = true;
    }
    return setPicOnResume;
  }
  
  private void showActionResult(NoticeItem paramNoticeItem)
  {
    if (paramNoticeItem == null) {
      return;
    }
    if (paramNoticeItem.isSuccess())
    {
      paramNoticeItem.showToast(this);
      resetAddCommentViews();
      return;
    }
    paramNoticeItem.showDialog(this);
  }
  
  protected Comment buildComment()
  {
    if ("Archived".equals(issue.getStatus())) {
      return new Nop(issue);
    }
    addCommentBtn.setEnabled(false);
    commentEditText = ((EditText)getRootFrag().findViewById(2131361947));
    Object localObject = commentEditText.getText().toString();
    Comment localComment = new Comment(issue, (String)localObject);
    if (mCurrentPhotoPath != null) {
      localComment.setCommentImagePath(mCurrentPhotoPath);
    }
    while ((localObject != null) && (((String)localObject).length() > 0))
    {
      localObject = (Button)getRootFrag().findViewById(2131361931);
      addCommentBtn.setEnabled(true);
      ((Button)localObject).setEnabled(true);
      addCommentBtn.setVisibility(8);
      ((ProgressBar)getRootFrag().findViewById(2131361946)).setVisibility(0);
      if (mediaHelper != null) {
        mediaHelper.hidePic();
      }
      ((ViewGroup)getRootFrag().findViewById(2131361948)).setVisibility(8);
      commentEditText.setVisibility(8);
      commentEditText.setEnabled(false);
      ((TextView)getRootFrag().findViewById(2131361941)).setText(getString(2131492949));
      mCurrentPhotoPath = null;
      imageIntent = null;
      return localComment;
    }
    ToastFactory.showCenteredShortToast(getAppContext(), 2131492950);
    enableCommentButton();
    return new Nop(issue);
  }
  
  protected void clearMedia()
  {
    if (mediaHelper != null)
    {
      mediaHelper.hidePic();
      mediaHelper = null;
    }
    mCurrentPhotoPath = null;
  }
  
  protected void doScrollToBottom()
  {
    ScrollView localScrollView = (ScrollView)getRootFrag();
    localScrollView.smoothScrollTo(0, localScrollView.getChildAt(0).getHeight());
  }
  
  protected void flagIssue() {}
  
  protected List<Object> getEventReceivers()
  {
    List localList = super.getEventReceivers();
    localList.add(mPermissionsManager);
    return localList;
  }
  
  public IssueModel getIssueModel()
  {
    return MyApplication.getIssueModel();
  }
  
  public NoticeItem getNotice()
  {
    return getIssueModel().getNotice();
  }
  
  protected void launchCamera()
  {
    try
    {
      mCurrentPhotoPath = PhotoTaker.launchCameraWithCallback(this, (CameraLaunchingActivity)getActivity());
      return;
    }
    catch (IOException localIOException) {}
  }
  
  protected void launchGallery()
  {
    GalleryPicker.launchGalleryForCallback(this, (GalleryLauncher)getActivity());
  }
  
  protected void launchImageViewer(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    paramString2 = new ImageParcel();
    paramString2.setType("REMOTE_IMAGE_URL");
    paramString2.setUriPath(paramString1);
    paramString2.setTitle(paramString3);
    paramString2.setSubtitle(paramString4);
    paramString2.setAvatarUri(paramString5);
    paramString2.setUsername(paramString6);
    ((HomeButtonsInterface)getSherlockActivity()).onClickButton(19, paramString2);
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    paramBundle = (MyApplication)getActivity().getApplication();
    MyApplication.inject(this);
    mImageLoader = VolleyRequestQueue.getInstance(getAppContext()).getImageLoader();
    setHasOptionsMenu(true);
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenu.clear();
    paramMenuInflater.inflate(2131623937, paramMenu);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    setRootFrag((ViewGroup)paramLayoutInflater.inflate(2130903083, paramViewGroup, false));
    MyApplication.inject(this);
    initMap();
    return getRootFrag();
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
  }
  
  public void onDetach()
  {
    delayedCommentscroll = false;
    super.onDetach();
  }
  
  public void onImageCallback(Intent paramIntent)
  {
    if (paramIntent != null) {
      imageIntent = paramIntent;
    }
    setPicOnResume = true;
  }
  
  @Subscribe
  public void onIssueActionEvent(SCFService.IssueActionEvent paramIssueActionEvent)
  {
    Comment localComment = paramIssueActionEvent.getComment();
    paramIssueActionEvent = paramIssueActionEvent.getIssueActionResult();
    if (localComment.isAssociatedWith(issue))
    {
      localComment.updateIssue(issue, (SCFService.IssueActionReceipt)paramIssueActionEvent.getReceipt());
      issueCache.put(Integer.valueOf(issue.getId()), issue);
      localComment.updateCard(this, (SCFService.IssueActionReceipt)paramIssueActionEvent.getReceipt());
    }
    showActionResult(paramIssueActionEvent.getNotice());
  }
  
  @Subscribe
  public void onLoginEvent(LoginEvent paramLoginEvent)
  {
    Comment.paramsToComment(paramLoginEvent.getOnAuthCompleteParams(), issue).executeAction();
    LoginStateController.getInstance().clearAuthCompleteParams();
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 2131362179)
    {
      shareIssue();
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public void onPause()
  {
    unSubscribeFromEventBus();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    loadIssue();
    processNotice();
    subscribeToEventBus();
  }
  
  public void onStop()
  {
    if (getCommentsTask != null) {
      getCommentsTask.cancel();
    }
    if (getIssueTask != null) {
      getIssueTask.cancel();
    }
    putPhotoInBundle();
    super.onStop();
  }
  
  public void processNotice()
  {
    if (getIssueModel().getNoticeIssue() != issueId) {
      getIssueModel().setNotice(NoticeItem.emptyNotice());
    }
    super.processNotice();
  }
  
  public void recordVote(Vote paramVote, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    updateVote();
  }
  
  protected void resetStatus()
  {
    int i = StatusMap.getStatusStateKeys().indexOf(issue.getStatus());
    statusSpinner.setSelection(i, true);
  }
  
  public void revokeVote(RevokeVote paramRevokeVote, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    updateVote();
  }
  
  public void setIssue(Issue paramIssue)
  {
    issue = paramIssue;
  }
  
  protected void shareIssue()
  {
    ShareIntentHelper.shareIssue(issue, getActivity());
  }
  
  protected void showComments(List<Comment> paramList)
  {
    if (isDetached()) {}
    do
    {
      return;
      commentList = paramList;
      commentsContainer.removeAllViews();
      if ((paramList == null) || (paramList.isEmpty()))
      {
        ((TextView)getRootFrag().findViewById(2131361940)).setVisibility(0);
        return;
      }
      ((TextView)getRootFrag().findViewById(2131361940)).setVisibility(8);
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Comment localComment = (Comment)localIterator.next();
        Object localObject2 = (ViewGroup)ViewUtil.inflate(getAppContext(), 2130903123, commentsContainer);
        ImageView localImageView = (ImageView)((ViewGroup)localObject2).findViewById(2131362115);
        Object localObject1 = (ImageView)((ViewGroup)localObject2).findViewById(2131362116);
        TextView localTextView1 = (TextView)((ViewGroup)localObject2).findViewById(2131362117);
        TextView localTextView2 = (TextView)((ViewGroup)localObject2).findViewById(2131362114);
        TextView localTextView3 = (TextView)((ViewGroup)localObject2).findViewById(2131362119);
        TextView localTextView4 = (TextView)((ViewGroup)localObject2).findViewById(2131362118);
        if (localComment.isModerated())
        {
          localTextView3.setText(2131492887);
          localTextView3.setVisibility(0);
        }
        localTextView1.setText(localComment.getName());
        localTextView2.setText(localComment.getCreatedAtShort());
        localTextView4.setText(localComment.getComment());
        commentsContainer.addView((View)localObject2);
        localObject2 = localComment.getUser();
        if (localObject2 != null)
        {
          localObject2 = ((User)localObject2).getAvatarSquareImage();
          if (StringUtils.isNotEmpty((CharSequence)localObject2)) {
            loadIcon((String)localObject2, (ImageView)localObject1);
          }
        }
        localObject1 = localComment.getSquareCommentImagePath();
        if (StringUtils.isNotEmpty((CharSequence)localObject1))
        {
          loadImage((String)localObject1, localImageView);
          localImageView.setVisibility(0);
          localImageView.setOnClickListener(onClickListener);
          localImageView.setTag(localComment);
        }
      }
      int i = paramList.size();
      commentsBtn.setText("" + i);
      setupTileOverlay();
    } while (!delayedCommentscroll);
    scrollToBottom();
  }
  
  protected void showMapLarge()
  {
    ((HomeButtonsInterface)getSherlockActivity()).onClickButton(20, issue);
  }
  
  public void updateComment(Comment paramComment, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    if (issue == null)
    {
      resetAddCommentViews();
      return;
    }
    if (paramComment.isEmpty())
    {
      resetAddCommentViews();
      return;
    }
    commentList.add(paramComment);
    paramComment = (Button)getRootFrag().findViewById(2131361931);
    paramComment.setEnabled(true);
    paramComment.setVisibility(0);
    paramComment.setText(String.valueOf(issue.getCommentCountExcludingActivity()));
    paramComment.startAnimation(Transitions.fadeIn(getAppContext()));
    showComments(commentList);
    resetAddCommentViews();
  }
  
  public void updateFollow(Follow paramFollow, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    starCheckbox.setEnabled(false);
  }
  
  public void updateStatus(Transition paramTransition, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    displayContent();
  }
  
  public void updateVote()
  {
    renderVotesButton(issue);
    Button localButton = (Button)getRootFrag().findViewById(2131361932);
    localButton.startAnimation(Transitions.fadeIn(getAppContext()));
    localButton.setEnabled(true);
    resetAddCommentViews();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */