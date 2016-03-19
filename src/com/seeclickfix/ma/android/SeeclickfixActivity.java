package com.seeclickfix.ma.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentManager.BackStackEntry;
import android.support.v4.app.FragmentManager.OnBackStackChangedListener;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.widget.DrawerLayout;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.ActionBarDrawerToggle;
import com.actionbarsherlock.app.SherlockFragment;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.google.android.gms.maps.MapsInitializer;
import com.seeclickfix.ma.android.adapters.MenuAdapter;
import com.seeclickfix.ma.android.anim.Transitions;
import com.seeclickfix.ma.android.api.SCFService.IssueCreatedEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueFailureEvent;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.auth.LoginOnStartupFlag;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.auth.ProfileController;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.dagger.GraphProvider;
import com.seeclickfix.ma.android.db.DbUpgradeHelper;
import com.seeclickfix.ma.android.db.DbUpgradeHelper.OnDbReadyListener;
import com.seeclickfix.ma.android.dialogs.FlagDialog;
import com.seeclickfix.ma.android.dialogs.launchers.GooglePlayErrorDialogLauncher;
import com.seeclickfix.ma.android.dialogs.launchers.LocationDisableDialogLauncher;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.events.FlagContentEvent;
import com.seeclickfix.ma.android.events.GooglePlayErrorEvent;
import com.seeclickfix.ma.android.events.LocationNotEnabledEvent;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.events.LoginSkipEvent;
import com.seeclickfix.ma.android.events.LogoutEvent;
import com.seeclickfix.ma.android.events.ShowReportEvent;
import com.seeclickfix.ma.android.events.SplashContinueEvent;
import com.seeclickfix.ma.android.events.UnboxingContinueEvent;
import com.seeclickfix.ma.android.events.UserProfileLoadedEvent;
import com.seeclickfix.ma.android.fragments.AboutFrag;
import com.seeclickfix.ma.android.fragments.FeedFrag;
import com.seeclickfix.ma.android.fragments.HelpFrag;
import com.seeclickfix.ma.android.fragments.ImageViewerFrag;
import com.seeclickfix.ma.android.fragments.IssueDetailsFrag;
import com.seeclickfix.ma.android.fragments.IssueDetailsMapFrag;
import com.seeclickfix.ma.android.fragments.IssuesMapFrag;
import com.seeclickfix.ma.android.fragments.LoginFrag;
import com.seeclickfix.ma.android.fragments.MeFrag;
import com.seeclickfix.ma.android.fragments.NoticeItem;
import com.seeclickfix.ma.android.fragments.PlacesFrag;
import com.seeclickfix.ma.android.fragments.PlacesMapFrag;
import com.seeclickfix.ma.android.fragments.RegisterFrag;
import com.seeclickfix.ma.android.fragments.ReportFragment;
import com.seeclickfix.ma.android.fragments.ReportMapFrag;
import com.seeclickfix.ma.android.fragments.SplashFrag;
import com.seeclickfix.ma.android.fragments.UnboxingPagerFrag;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.CameraLaunchingActivity;
import com.seeclickfix.ma.android.fragments.interfaces.GalleryLauncher;
import com.seeclickfix.ma.android.fragments.interfaces.HomeButtonsInterface;
import com.seeclickfix.ma.android.fragments.interfaces.ImageCapturedCallback;
import com.seeclickfix.ma.android.fragments.interfaces.IssueListFragInterface;
import com.seeclickfix.ma.android.fragments.interfaces.OnBackKeyListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnCommentUploadListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnMapBackKeyListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnPlaceAddedListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnPlaceMapListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnReportLocationListener;
import com.seeclickfix.ma.android.fragments.interfaces.PlaceMapLauncher;
import com.seeclickfix.ma.android.fragments.interfaces.ReportMapLaunchActivity;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.objects.BundleFactory;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.PageParamsFactory;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.media.ImageParcel;
import com.seeclickfix.ma.android.objects.modules.ContextModule;
import com.seeclickfix.ma.android.objects.modules.MainActivityModule;
import com.seeclickfix.ma.android.services.CityLoadingService;
import com.seeclickfix.ma.android.sidenav.SideNavHelper;
import com.seeclickfix.ma.android.style.StyleUtil;
import com.seeclickfix.ma.android.util.DisplayUtil;
import com.seeclickfix.ma.android.util.IssueUri;
import com.seeclickfix.ma.android.views.ToastFactory;
import com.squareup.otto.Bus;
import com.squareup.otto.Subscribe;
import dagger.ObjectGraph;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class SeeclickfixActivity
  extends SherlockFragmentActivity
  implements HomeButtonsInterface, IssueListFragInterface, CameraLaunchingActivity, OnReportLocationListener, GalleryLauncher, ReportMapLaunchActivity, OnPlaceAddedListener, OnPlaceMapListener, PlaceMapLauncher, FragmentManager.OnBackStackChangedListener, GraphProvider
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SeeclickfixActivity";
  ObjectGraph activityGraph;
  private OnCommentUploadListener commentUploadListener;
  private DbUpgradeHelper.OnDbReadyListener dbUpgradeListener = new DbUpgradeHelper.OnDbReadyListener()
  {
    public void onDbReady()
    {
      SeeclickfixActivity.access$402(SeeclickfixActivity.this, null);
      SeeclickfixActivity.this.start();
    }
  };
  protected FragmentManager fm = getSupportFragmentManager();
  @InjectView(2131361856)
  RelativeLayout mDrawerContainer;
  private DrawerLayout mDrawerLayout;
  private ListView mDrawerList;
  ActionBarDrawerToggle mDrawerToggle;
  private boolean mIsBound;
  @Inject
  LocationAdapter mLocationAdapter;
  @Inject
  LoginOnStartupFlag mLoginOnStartupFlag;
  private MenuAdapter mMenuAdapter;
  @InjectView(2131361859)
  Button mNavBtnAbout;
  @InjectView(2131361858)
  Button mNavBtnHelp;
  OnBackKeyListener mainPagerBackListener = new OnBackKeyListener()
  {
    public PageParams onBackKey()
    {
      SeeclickfixActivity.this.exitActivity();
      return null;
    }
    
    public boolean willHandleBackKey()
    {
      return true;
    }
  };
  private OnMapBackKeyListener mapBackKey;
  protected BaseFrag myFrag;
  private ImageCapturedCallback onCaptureCallback;
  private OnReportLocationListener onReportLocationListener;
  private boolean paused = true;
  private OnPlaceAddedListener placeAddedListener;
  private OnPlaceMapListener placeMapListener;
  private boolean shouldInit = true;
  private DbUpgradeHelper upgradeHelper;
  protected boolean useMultiplePanes;
  
  private boolean checkIfDeepLinkIntent()
  {
    boolean bool = false;
    if (isNotificationIntent()) {
      bool = true;
    }
    while (!checkIfShareIntent()) {
      return bool;
    }
    return true;
  }
  
  private boolean checkIfShareIntent()
  {
    Object localObject1 = getIntent();
    if (localObject1 == null) {
      return false;
    }
    Object localObject2 = ((Intent)localObject1).getExtras();
    if ((!"android.intent.action.SEND".equals(((Intent)localObject1).getAction())) || (((Bundle)localObject2).containsKey("android.intent.extra.STREAM"))) {}
    try
    {
      Uri localUri = (Uri)((Bundle)localObject2).getParcelable("android.intent.extra.STREAM");
      fm = getSupportFragmentManager();
      localObject2 = (ReportFragment)fm.findFragmentByTag("FragmentTags.REPORT");
      localObject3 = new Intent();
      ((Intent)localObject3).setData(localUri);
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = (ReportFragment)showFrag("FragmentTags.REPORT", ReportFragment.class, toBundle("shared_img_uri", localUri));
      }
      ((ReportFragment)localObject1).onImageCallback((Intent)localObject3);
      setIntent(null);
      return true;
    }
    catch (Exception localException2)
    {
      Object localObject3;
      for (;;) {}
    }
    if (((Bundle)localObject2).containsKey("android.intent.extra.TEXT"))
    {
      return false;
      try
      {
        localObject1 = ((Intent)localObject1).getDataString();
        localObject2 = new IssueUri();
        int i = ((IssueUri)localObject2).getId((String)localObject1);
        if (i > 0)
        {
          localObject3 = new Bundle();
          ((Bundle)localObject3).putInt("issue_id", i);
          ((Bundle)localObject3).putSerializable("url_params_map", ((IssueUri)localObject2).getUrlParams((String)localObject1));
          showFrag("FragmentTags.ISSUE_DETAIL", IssueDetailsFrag.class, (Bundle)localObject3);
          setIntent(null);
          return true;
        }
      }
      catch (Exception localException1) {}
    }
    return false;
  }
  
  private void clearBackKeyRefs()
  {
    mapBackKey = null;
  }
  
  private void closeDrawer()
  {
    if (!isTabletLayout()) {
      mDrawerLayout.closeDrawer(mDrawerContainer);
    }
  }
  
  private void exitActivity()
  {
    finish();
  }
  
  private BaseFrag getActiveFragment()
  {
    if (getSupportFragmentManager().getBackStackEntryCount() == 0) {
      return null;
    }
    String str = getSupportFragmentManager().getBackStackEntryAt(getSupportFragmentManager().getBackStackEntryCount() - 1).getName();
    return (BaseFrag)getSupportFragmentManager().findFragmentByTag(str);
  }
  
  private void handleIssueDetailClick(Object paramObject)
  {
    if ((paramObject instanceof Issue))
    {
      localBundle = new Bundle();
      localBundle.putParcelable("issue_bundle", (Issue)paramObject);
      showFrag("FragmentTags.ISSUE_DETAIL", IssueDetailsFrag.class, localBundle);
    }
    while (!(paramObject instanceof Integer)) {
      return;
    }
    Bundle localBundle = new Bundle();
    localBundle.putInt("issue_id", ((Integer)paramObject).intValue());
    showFrag("FragmentTags.ISSUE_DETAIL", IssueDetailsFrag.class, localBundle);
  }
  
  private void initFrags()
  {
    boolean bool1 = PrefsUtil.getBoolean("Pref:HAS_UNBOXED", false, getApplicationContext());
    boolean bool2 = DedicatedAppManager.isDedicatedApp(this);
    if ((!bool1) && (!bool2))
    {
      showFrag(null, UnboxingPagerFrag.class);
      PrefsUtil.putBoolean("Pref:HAS_UNBOXED", true, getApplicationContext());
    }
    for (;;)
    {
      getSupportFragmentManager().addOnBackStackChangedListener(this);
      return;
      if (bool2) {
        showFragAndForget("FragmentTags:SPLASH", SplashFrag.class);
      } else {
        showDefaultFragNoHistory();
      }
    }
  }
  
  private SherlockFragment instantiateNewFrag(Class paramClass)
  {
    try
    {
      paramClass = (SherlockFragment)paramClass.newInstance();
      return paramClass;
    }
    catch (IllegalAccessException paramClass)
    {
      return null;
    }
    catch (InstantiationException paramClass) {}
    return null;
  }
  
  private boolean isNotificationIntent()
  {
    Object localObject = getIntent();
    if (localObject != null)
    {
      Bundle localBundle = ((Intent)localObject).getExtras();
      if ("com.seeclickfix.actions.ISSUE_DETAIL_NOTIF".equals(((Intent)localObject).getAction()))
      {
        localObject = (Issue)localBundle.getParcelable("issue_bundle");
        localBundle = new Bundle();
        localBundle.putParcelable("issue_bundle", (Parcelable)localObject);
        localBundle.putString("action_extra", "com.seeclickfix.actions.ISSUE_DETAIL_NOTIF");
        showFrag("FragmentTags.ISSUE_DETAIL", IssueDetailsFrag.class, localBundle);
        getIntent().setAction("android.intent.action.VIEW");
        return true;
      }
    }
    return false;
  }
  
  private boolean isTabletLayout()
  {
    return !(findViewById(2131361854) instanceof DrawerLayout);
  }
  
  private void loadCityData()
  {
    Intent localIntent = new Intent();
    localIntent.setClass(getApplicationContext(), CityLoadingService.class);
    startService(localIntent);
  }
  
  private void registerOnEventBus()
  {
    try
    {
      MyApplication.getEventBus().register(this);
      return;
    }
    catch (Exception localException) {}
  }
  
  private void setImageOnCallbackFrag(int paramInt1, int paramInt2, Intent paramIntent)
  {
    shouldInit = false;
    try
    {
      onCaptureCallback.onImageCallback(paramIntent);
      onCaptureCallback = null;
      return;
    }
    catch (Exception paramIntent) {}
  }
  
  private void setupActionBar()
  {
    Object localObject = getSupportActionBar();
    ((ActionBar)localObject).setDisplayShowTitleEnabled(true);
    ((ActionBar)localObject).setDisplayUseLogoEnabled(false);
    ((ActionBar)localObject).setIcon(2130837746);
    ((ActionBar)localObject).setDisplayShowHomeEnabled(true);
    ((ActionBar)localObject).setBackgroundDrawable(getApplicationContext().getResources().getDrawable(2130837616));
    try
    {
      localObject = (ImageView)findViewById(Resources.getSystem().getIdentifier("home", "id", "android"));
      FrameLayout.LayoutParams localLayoutParams = (FrameLayout.LayoutParams)((ImageView)localObject).getLayoutParams();
      bottomMargin = 0;
      topMargin = 0;
      ((ImageView)localObject).setLayoutParams(localLayoutParams);
      return;
    }
    catch (Exception localException) {}
  }
  
  private void setupSideDrawer()
  {
    ActionBar localActionBar = getSupportActionBar();
    if (isTabletLayout())
    {
      getSupportActionBar().setHomeButtonEnabled(false);
      mDrawerList = ((ListView)findViewById(2131361860));
      mMenuAdapter = new MenuAdapter(getApplicationContext());
      mDrawerList.setAdapter(mMenuAdapter);
      mDrawerList.setOnItemClickListener(new DrawerItemClickListener(null));
      return;
    }
    mDrawerLayout = ((DrawerLayout)findViewById(2131361854));
    mDrawerList = ((ListView)findViewById(2131361860));
    mMenuAdapter = new MenuAdapter(getApplicationContext());
    mDrawerList.setAdapter(mMenuAdapter);
    mDrawerList.setOnItemClickListener(new DrawerItemClickListener(null));
    mDrawerToggle = new ActionBarDrawerToggle(this, localActionBar, mDrawerLayout, 2130837765, 2131492946, 2131492945)
    {
      public void onDrawerClosed(View paramAnonymousView)
      {
        super.onDrawerClosed(paramAnonymousView);
      }
      
      public void onDrawerOpened(View paramAnonymousView)
      {
        super.onDrawerOpened(paramAnonymousView);
      }
    };
    mDrawerLayout.setDrawerListener(mDrawerToggle);
  }
  
  private void showAccountFrag()
  {
    PageParams localPageParams = PageParamsFactory.getMePageParams(this);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("page_params", localPageParams);
    showFrag("FragmentTags.ME", MeFrag.class, localBundle);
  }
  
  private void showDefaultFrag()
  {
    showDefaultFrag(Boolean.valueOf(true));
  }
  
  private void showDefaultFrag(Boolean paramBoolean)
  {
    PageParams localPageParams = PageParamsFactory.getFeedParams(getApplicationContext());
    DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(this);
    if (mLoginOnStartupFlag.shouldPromptForLogin(localDedicatedApp))
    {
      localPageParams.setActionExtra("com.seeclickfix.actions.STARTUP_LOGIN_PROMPT");
      postEvent(new AuthRequiredEvent(localPageParams));
      return;
    }
    LoginStateController.getInstance().clearAuthCompleteParams();
    showFrag(localPageParams.getTag(), FeedFrag.class, toBundle("page_params", localPageParams), paramBoolean);
  }
  
  private void showDefaultFragNoHistory()
  {
    showDefaultFrag(Boolean.valueOf(false));
  }
  
  private Fragment showFrag(String paramString, Class<? extends SherlockFragment> paramClass)
  {
    return showFrag(paramString, paramClass, null, Boolean.valueOf(true));
  }
  
  private Fragment showFrag(String paramString, Class<? extends SherlockFragment> paramClass, Bundle paramBundle)
  {
    return showFrag(paramString, paramClass, paramBundle, Boolean.valueOf(true));
  }
  
  private Fragment showFrag(String paramString, Class<? extends SherlockFragment> paramClass, Bundle paramBundle, Boolean paramBoolean)
  {
    Bundle localBundle = paramBundle;
    if (paramBundle == null) {
      localBundle = new Bundle();
    }
    paramClass = instantiateNewFrag(paramClass);
    paramClass.setArguments(localBundle);
    fm = getSupportFragmentManager();
    if (!paramClass.isVisible())
    {
      paramBundle = fm.beginTransaction();
      Transitions.setFragTransAnim(paramBundle);
      if (paramString != null) {
        break label81;
      }
      paramBundle.disallowAddToBackStack();
    }
    for (;;)
    {
      paramBundle.replace(2131361855, paramClass, paramString);
      paramBundle.commit();
      return paramClass;
      label81:
      if ((paramBoolean.booleanValue()) && (paramBundle.isAddToBackStackAllowed())) {
        paramBundle.addToBackStack(paramString);
      }
    }
  }
  
  private Fragment showFragAndForget(String paramString, Class<? extends SherlockFragment> paramClass)
  {
    return showFrag(paramString, paramClass, null, Boolean.valueOf(false));
  }
  
  private void showImageViewer(ImageParcel paramImageParcel)
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("IMAGE_PARCEL", paramImageParcel);
    showFrag("FragmentTags:IMAGE_VIEWER", ImageViewerFrag.class, localBundle);
  }
  
  private void showIssueDetailFrag(Issue paramIssue, String paramString)
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("issue_bundle", paramIssue);
    localBundle.putString("action_extra", paramString);
    showFrag("FragmentTags.ISSUE_DETAIL", IssueDetailsFrag.class, localBundle);
  }
  
  private void showIssueDetailsMap(Issue paramIssue)
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("issue_bundle", paramIssue);
    showFrag("FragmentTags:ISSUE_DETAILS_MAP", IssueDetailsMapFrag.class, localBundle);
  }
  
  private void showIssuesMapFrag(Place paramPlace)
  {
    showFrag("FragmentTags.MAP", IssuesMapFrag.class, BundleFactory.createFromParcel("place_bundle", paramPlace));
  }
  
  private void showLocationFrag()
  {
    showFrag("FragmentTags.PLACES", PlacesFrag.class);
  }
  
  private void showPlaceChooserMapFrag()
  {
    showFrag("FragmentTags.PLACES_MAP", PlacesMapFrag.class);
  }
  
  private void showReportFrag()
  {
    PageParams localPageParams = PageParamsFactory.getReportParams(this);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("page_params", localPageParams);
    showFrag("FragmentTags.REPORT", ReportFragment.class, localBundle);
  }
  
  private void showReportFragBlank()
  {
    PageParams localPageParams = PageParamsFactory.getReportParams(this);
    localPageParams.setActionExtra("com.seeclickfix.actions.NEW_REPORT");
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("page_params", localPageParams);
    showFrag("FragmentTags.REPORT", ReportFragment.class, localBundle);
  }
  
  private void start()
  {
    if (paused) {
      return;
    }
    setupSideDrawer();
    loadCityData();
    if (!isTabletLayout()) {
      mDrawerToggle.syncState();
    }
    registerOnEventBus();
    if ((!checkIfDeepLinkIntent()) && (shouldInit)) {
      initFrags();
    }
    for (;;)
    {
      mLocationAdapter.startUpdates();
      if (!AuthManager.isAuthenticated()) {
        break;
      }
      ProfileController.getInstance().loadUserProfile(AuthManager.authenticatedUser(), getApplicationContext());
      return;
      shouldInit = true;
    }
  }
  
  private Bundle toBundle(String paramString, Parcelable paramParcelable)
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable(paramString, paramParcelable);
    return localBundle;
  }
  
  public List<Object> getActivityModules()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new ContextModule(getApplicationContext()));
    localArrayList.add(new MainActivityModule());
    return localArrayList;
  }
  
  public IssueModel getIssueModel()
  {
    return MyApplication.getIssueModel();
  }
  
  public ObjectGraph getObjectGraph()
  {
    activityGraph = MyApplication.getObjectGraph().plus(getActivityModules().toArray());
    return activityGraph;
  }
  
  public OnPlaceAddedListener getPlaceAddedListener()
  {
    return placeAddedListener;
  }
  
  public ReportModel getReportModel()
  {
    return MyApplication.getReportModel();
  }
  
  public void launchCameraWithCallback(ImageCapturedCallback paramImageCapturedCallback, Intent paramIntent)
  {
    onCaptureCallback = paramImageCapturedCallback;
    startActivityForResult(paramIntent, 1729);
  }
  
  public void launchGalleryForCallback(ImageCapturedCallback paramImageCapturedCallback, Intent paramIntent)
  {
    onCaptureCallback = paramImageCapturedCallback;
    startActivityForResult(paramIntent, 1800);
  }
  
  public void launchPlacesMap(OnPlaceMapListener paramOnPlaceMapListener, PageParams paramPageParams)
  {
    placeMapListener = paramOnPlaceMapListener;
    mapBackKey = ((OnMapBackKeyListener)showFrag("FragmentTags.PLACES_MAP", PlacesMapFrag.class, toBundle("page_params", paramPageParams)));
  }
  
  public void launchReportMap(OnReportLocationListener paramOnReportLocationListener, PageParams paramPageParams)
  {
    onReportLocationListener = paramOnReportLocationListener;
    mapBackKey = ((OnMapBackKeyListener)showFrag("FragmentTags.REPORT_MAP", ReportMapFrag.class, toBundle("page_params", paramPageParams)));
  }
  
  public void notifyUser(int paramInt)
  {
    ToastFactory.showCenteredLong(this, paramInt);
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if ((paramInt1 == 1729) && (paramInt2 == -1)) {
      setImageOnCallbackFrag(paramInt1, paramInt2, paramIntent);
    }
    while ((paramInt1 != 1800) || (paramInt2 != -1)) {
      return;
    }
    setImageOnCallbackFrag(paramInt1, paramInt2, paramIntent);
  }
  
  @Subscribe
  public void onAuthRequiredEvent(AuthRequiredEvent paramAuthRequiredEvent)
  {
    paramAuthRequiredEvent = paramAuthRequiredEvent.getParams();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("page_params", paramAuthRequiredEvent);
    showFrag("FragmentTags.LOGIN", LoginFrag.class, localBundle);
  }
  
  public void onBackPressed()
  {
    OnBackKeyListener localOnBackKeyListener = (OnBackKeyListener)getSupportFragmentManager().findFragmentByTag("FragmentTags.LOGIN");
    if ((localOnBackKeyListener != null) && (((Fragment)localOnBackKeyListener).isVisible()) && (localOnBackKeyListener.willHandleBackKey())) {
      localOnBackKeyListener.onBackKey();
    }
    super.onBackPressed();
  }
  
  public void onBackStackChanged()
  {
    getActiveFragment();
  }
  
  public void onClickButton(int paramInt, Object paramObject)
  {
    switch (paramInt)
    {
    case 3: 
    case 6: 
    case 7: 
    case 8: 
    case 9: 
    case 10: 
    case 11: 
    case 12: 
    case 13: 
    case 16: 
    default: 
      return;
    case 21: 
      initFrags();
      return;
    case 2: 
      showReportFrag();
      return;
    case 17: 
      showReportFragBlank();
      return;
    case 5: 
      showIssuesMapFrag((Place)paramObject);
      return;
    case 14: 
      showFrag("FragmentTags.LOGIN", LoginFrag.class);
      return;
    case 15: 
      showFrag("FragmentTags.REGISTER", RegisterFrag.class);
      return;
    case 1: 
      showLocationFrag();
      return;
    case 18: 
      showPlaceChooserMapFrag();
      return;
    case 19: 
      showImageViewer((ImageParcel)paramObject);
      return;
    case 20: 
      showIssueDetailsMap((Issue)paramObject);
      return;
    }
    handleIssueDetailClick(paramObject);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    activityGraph = getObjectGraph();
    activityGraph.inject(this);
    DisplayUtil.getDisplayMetrics(this);
    DisplayUtil.logDisplayMetrics(this);
    requestWindowFeature(5);
    setSupportProgressBarIndeterminateVisibility(false);
    ActionBar localActionBar = getSupportActionBar();
    localActionBar.setIcon(2130837746);
    localActionBar.setDisplayUseLogoEnabled(false);
    localActionBar.setDisplayShowHomeEnabled(true);
    localActionBar.setDisplayHomeAsUpEnabled(true);
    localActionBar.setHomeButtonEnabled(true);
    if (paramBundle != null)
    {
      shouldInit = false;
      setContentView(2130903061);
    }
    for (;;)
    {
      localActionBar.hide();
      ButterKnife.inject(this);
      SideNavHelper.hideHelpButtonFromView(getApplicationContext(), mNavBtnHelp);
      try
      {
        MapsInitializer.initialize(this);
        return;
      }
      catch (Exception paramBundle) {}
      setContentView(2130903061);
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    paramMenu.clear();
    super.onCreateOptionsMenu(paramMenu);
    getSupportMenuInflater().inflate(2131623936, paramMenu);
    return true;
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    mLocationAdapter.stopUpdates();
  }
  
  @Subscribe
  public void onFlagContentEvent(FlagContentEvent paramFlagContentEvent)
  {
    paramFlagContentEvent.flagContent(new Callback()
    {
      public void failure(RetrofitError paramAnonymousRetrofitError)
      {
        notifyUser(2131492993);
      }
      
      public void success(HashMap<String, String> paramAnonymousHashMap, Response paramAnonymousResponse)
      {
        notifyUser(2131492991);
      }
    });
  }
  
  @Subscribe
  public void onGooglePlayErrorEvent(GooglePlayErrorEvent paramGooglePlayErrorEvent)
  {
    new GooglePlayErrorDialogLauncher().showDialog(paramGooglePlayErrorEvent, this);
  }
  
  @Subscribe
  public void onIssueCreatedEvent(SCFService.IssueCreatedEvent paramIssueCreatedEvent)
  {
    NoticeItem localNoticeItem = paramIssueCreatedEvent.getNoticeItem();
    if (paramIssueCreatedEvent.getResponse().getStatus() == 201)
    {
      Bundle localBundle = new Bundle();
      localBundle.putParcelable("issue_bundle", paramIssueCreatedEvent.getIssue());
      getIssueModel().setNotice(localNoticeItem);
      getIssueModel().setNoticeIssue(paramIssueCreatedEvent.getIssue().getId());
      showFrag("FragmentTags.ISSUE_DETAIL", IssueDetailsFrag.class, localBundle);
      return;
    }
    showFrag("FragmentTags.REPORT", ReportFragment.class, null);
  }
  
  @Subscribe
  public void onIssueFailureEvent(SCFService.IssueFailureEvent paramIssueFailureEvent)
  {
    getReportModel().setNotice(paramIssueFailureEvent.getNoticeItem(this));
    showFrag("FragmentTags.REPORT", ReportFragment.class, null, Boolean.valueOf(false));
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (mapBackKey != null))
    {
      mapBackKey.onBackKey();
      mapBackKey = null;
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  @Subscribe
  public void onLocationNotEnabledEvent(LocationNotEnabledEvent paramLocationNotEnabledEvent)
  {
    ((LocationDisableDialogLauncher)activityGraph.get(LocationDisableDialogLauncher.class)).showDialog(paramLocationNotEnabledEvent, this);
  }
  
  @Subscribe
  public void onLoginEvent(LoginEvent paramLoginEvent)
  {
    paramLoginEvent = paramLoginEvent.getOnAuthCompleteParams();
    if (paramLoginEvent != null)
    {
      if (!"com.seeclickfix.actions.STARTUP_LOGIN_PROMPT".equals(paramLoginEvent.getActionExtra())) {
        break label48;
      }
      paramLoginEvent.setActionExtra(null);
      LoginStateController.getInstance().clearAuthCompleteParams();
      getSupportFragmentManager().popBackStackImmediate(null, 1);
      showDefaultFrag();
    }
    label48:
    while (!"com.seeclickfix.actions.SHOW_ME_FRAG".equals(paramLoginEvent.getActionExtra())) {
      return;
    }
    paramLoginEvent.setActionExtra(null);
    LoginStateController.getInstance().clearAuthCompleteParams();
    getSupportFragmentManager().popBackStackImmediate(null, 1);
    showAccountFrag();
  }
  
  @Subscribe
  public void onLoginSkipEvent(LoginSkipEvent paramLoginSkipEvent)
  {
    PrefsUtil.putBoolean("PrefNames:SKIPPED_LOGIN", true, this);
    LoginStateController.getInstance().clearAuthCompleteParams();
    showDefaultFrag();
  }
  
  @Subscribe
  public void onLogoutEvent(LogoutEvent paramLogoutEvent)
  {
    if (mMenuAdapter != null)
    {
      mMenuAdapter.setUserProfile(null);
      mMenuAdapter.notifyDataSetChanged();
    }
  }
  
  public void onMapPlaceCancel()
  {
    mapBackKey = null;
  }
  
  public void onMapPlaceSaved(PageParams paramPageParams)
  {
    mapBackKey = null;
    if (placeMapListener != null) {
      placeMapListener.onMapPlaceSaved(paramPageParams);
    }
    getSupportFragmentManager().popBackStack("FragmentTags.PLACES_MAP", 1);
  }
  
  public boolean onMenuItemSelected(int paramInt, MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 2131362180)
    {
      showFrag("FragmentTags.REPORT", ReportFragment.class);
      closeDrawer();
    }
    return super.onMenuItemSelected(paramInt, paramMenuItem);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if ((!isTabletLayout()) && (mDrawerToggle.onOptionsItemSelected(paramMenuItem))) {
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  protected void onPause()
  {
    paused = true;
    try
    {
      MyApplication.getEventBus().unregister(this);
      shouldInit = false;
      super.onPause();
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public void onPlaceAdded(Place paramPlace)
  {
    mMenuAdapter.notifyDataSetChanged();
  }
  
  public void onPlaceRemoved(Place paramPlace)
  {
    mMenuAdapter.notifyDataSetChanged();
  }
  
  protected void onPostCreate(Bundle paramBundle)
  {
    super.onPostCreate(paramBundle);
  }
  
  public void onReportLocationSet(PageParams paramPageParams)
  {
    if (onReportLocationListener != null)
    {
      onReportLocationListener.onReportLocationSet(paramPageParams);
      onReportLocationListener = null;
    }
    clearBackKeyRefs();
    getSupportFragmentManager().popBackStack("FragmentTags.REPORT_MAP", 1);
  }
  
  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    super.onRestoreInstanceState(paramBundle);
    final View localView = findViewById(paramBundle.getInt("focusID", -1));
    if ((localView != null) && ((localView instanceof EditText)))
    {
      localView.setFocusable(true);
      localView.setFocusableInTouchMode(true);
      localView.requestFocus();
      int i = paramBundle.getInt("cursorLoc", 0);
      ((EditText)localView).setSelection(i);
      localView.postDelayed(new Runnable()
      {
        public void run()
        {
          ((InputMethodManager)getSystemService("input_method")).showSoftInput(localView, 1);
        }
      }, 500L);
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    setupActionBar();
    upgradeHelper = new DbUpgradeHelper(this);
    upgradeHelper.setOnDbReadyListner(dbUpgradeListener);
    upgradeHelper.start();
    paused = false;
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    View localView = getCurrentFocus();
    if (localView != null)
    {
      int j = localView.getId();
      int i = 0;
      if ((localView instanceof EditText)) {
        i = ((EditText)localView).getSelectionStart();
      }
      paramBundle.putInt("focusID", j);
      paramBundle.putInt("cursorLoc", i);
    }
  }
  
  public void onSelectIssueListItem(Issue paramIssue, String paramString)
  {
    showIssueDetailFrag(paramIssue, paramString);
  }
  
  @Subscribe
  public void onShowReportEvent(ShowReportEvent paramShowReportEvent)
  {
    showReportFrag();
  }
  
  @Subscribe
  public void onSplashContinueEvent(SplashContinueEvent paramSplashContinueEvent)
  {
    showDefaultFragNoHistory();
  }
  
  protected void onStart()
  {
    super.onStart();
  }
  
  protected void onStop()
  {
    super.onStop();
    mLocationAdapter.stopUpdates();
  }
  
  @Subscribe
  public void onUnboxingContinueEvent(UnboxingContinueEvent paramUnboxingContinueEvent)
  {
    showDefaultFrag();
  }
  
  @Subscribe
  public void onUserProfileEvent(UserProfileLoadedEvent paramUserProfileLoadedEvent)
  {
    if (mMenuAdapter != null)
    {
      mMenuAdapter.setUserProfile(paramUserProfileLoadedEvent.getUser());
      mMenuAdapter.notifyDataSetChanged();
    }
  }
  
  protected void postEvent(Object paramObject)
  {
    MyApplication.getEventBus().post(paramObject);
  }
  
  public void setPlaceAddedListener(OnPlaceAddedListener paramOnPlaceAddedListener)
  {
    placeAddedListener = paramOnPlaceAddedListener;
  }
  
  public void setPlaceMapListener(OnPlaceMapListener paramOnPlaceMapListener)
  {
    placeMapListener = paramOnPlaceMapListener;
  }
  
  @OnClick({2131361859})
  void showAbout()
  {
    showFrag("FragmentTags.ABOUT", AboutFrag.class);
    closeDrawer();
  }
  
  public void showFlagDialog(String paramString, int paramInt)
  {
    FlagDialog.newInstance(paramString, paramInt).show(getSupportFragmentManager(), null);
  }
  
  @OnClick({2131361858})
  void showHelp()
  {
    String str = SideNavHelper.getHelpUrl(getApplicationContext());
    if (str != null)
    {
      Intent localIntent = new Intent("android.intent.action.VIEW");
      localIntent.setData(Uri.parse(str));
      startActivity(localIntent);
    }
    for (;;)
    {
      closeDrawer();
      return;
      showFrag("FragmentTags.HELP", HelpFrag.class);
    }
  }
  
  public void showTerms(View paramView)
  {
    paramView = new Intent("android.intent.action.VIEW");
    paramView.setData(Uri.parse("http://seeclickfix.com/legal/terms-of-use"));
    startActivity(paramView);
  }
  
  private class DrawerItemClickListener
    implements AdapterView.OnItemClickListener
  {
    private DrawerItemClickListener() {}
    
    public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
    {
      paramAdapterView = (PageParams)paramView.getTag();
      paramView = getSupportActionBar();
      paramView.show();
      paramView.setTitle(paramAdapterView.getDisplayName());
      paramView = new Bundle();
      paramView.putParcelable("page_params", paramAdapterView);
      try
      {
        paramInt = Resources.getSystem().getIdentifier("action_bar_title", "id", "android");
        TextView localTextView = (TextView)findViewById(paramInt);
        StyleUtil.setActionBarSubBasic(paramAdapterView.getDisplayName(), localTextView, getApplicationContext());
        SeeclickfixActivity.this.clearBackKeyRefs();
        SeeclickfixActivity.this.showFrag(paramAdapterView.getTag(), paramAdapterView.getFragClass(), paramView);
        if (!SeeclickfixActivity.this.isTabletLayout()) {
          SeeclickfixActivity.this.closeDrawer();
        }
        return;
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.SeeclickfixActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */