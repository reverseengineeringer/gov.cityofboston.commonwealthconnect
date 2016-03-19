package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.location.Address;
import android.location.Location;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.ForeignCollection;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.ReportModel;
import com.seeclickfix.ma.android.adapters.CategorySpinnerAdapter;
import com.seeclickfix.ma.android.api.SCFService.APIv1;
import com.seeclickfix.ma.android.api.SCFService.IssueCreatedEvent;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.cache.GlobalReportCache;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.date.DateUtil;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.dialogs.ErrorDialog;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog.ClickListener;
import com.seeclickfix.ma.android.dialogs.ProgressWheelDialog;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.events.LoginEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.fragments.interfaces.CameraLaunchingActivity;
import com.seeclickfix.ma.android.fragments.interfaces.GalleryLauncher;
import com.seeclickfix.ma.android.fragments.interfaces.ImageCapturedCallback;
import com.seeclickfix.ma.android.fragments.interfaces.OnReportLocationListener;
import com.seeclickfix.ma.android.fragments.interfaces.ReportMapLaunchActivity;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.map.MapOptionsFactory;
import com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn;
import com.seeclickfix.ma.android.fragments.reporting.ActionableReqType;
import com.seeclickfix.ma.android.fragments.reporting.BlankReqType;
import com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone;
import com.seeclickfix.ma.android.fragments.reporting.FeatureFlagHelper;
import com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypes;
import com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper;
import com.seeclickfix.ma.android.fragments.reporting.ReportProvider;
import com.seeclickfix.ma.android.location.AddressLocalizer;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.location.SimpleLocation;
import com.seeclickfix.ma.android.media.GalleryPathHelper;
import com.seeclickfix.ma.android.media.GalleryPicker;
import com.seeclickfix.ma.android.media.MediaCaptureHelper;
import com.seeclickfix.ma.android.media.MediaCaptureHelper.Builder;
import com.seeclickfix.ma.android.media.PhotoTaker;
import com.seeclickfix.ma.android.net.GoogleGeocodeRequest;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.PageParamsFactory;
import com.seeclickfix.ma.android.objects.app.AppOptions;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.services.DraftSaveService;
import com.seeclickfix.ma.android.services.ReportUploadService;
import com.seeclickfix.ma.android.tasks.RequestTypesTask;
import com.seeclickfix.ma.android.tasks.ReverseGeocodeTask;
import com.seeclickfix.ma.android.util.CollectionUtil;
import com.seeclickfix.ma.android.util.FormUtil;
import com.seeclickfix.ma.android.views.ColorMarkers;
import com.seeclickfix.ma.android.views.CustomScrollView;
import com.seeclickfix.ma.android.views.EditTextWithBackDetect;
import com.seeclickfix.ma.android.views.EditTextWithBackDetect.EditTextImeBackListener;
import com.seeclickfix.ma.android.views.ProgressWheelFactory;
import com.seeclickfix.ma.android.views.ToastFactory;
import com.seeclickfix.ma.android.views.questions.QuestionFactory;
import com.seeclickfix.ma.android.views.questions.QuestionInterface;
import com.seeclickfix.ma.android.views.questions.QuestionInterface.OnAnswerSetCallback;
import com.squareup.otto.Subscribe;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class ReportFragment
  extends BaseFrag
  implements ImageCapturedCallback, OnReportLocationListener
{
  private static final boolean D = false;
  private static final long DRAFT_QUIET_TIME = 120000L;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_ReportFragment";
  @InjectView(2131362034)
  ViewGroup accuracyContainerView;
  @Inject
  AccuracyWarn accuracyWarning;
  private ImageButton addressEditBtn;
  private View.OnClickListener addressEditBtnListener;
  private EditTextWithBackDetect addressEditText;
  private EditTextWithBackDetect.EditTextImeBackListener addressEditTextListener;
  @InjectView(2131362035)
  ViewGroup alertContainerView;
  private View.OnClickListener camBtnListener;
  private View.OnClickListener cancelBtnListener;
  private AdapterView.OnItemSelectedListener catSpinnerClickListener = new AdapterView.OnItemSelectedListener()
  {
    public void onItemSelected(final AdapterView<?> paramAnonymousAdapterView, final View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      if (paramAnonymousInt <= 0)
      {
        onNothingSelected(paramAnonymousAdapterView);
        return;
      }
      final Object localObject1 = (RequestType)paramAnonymousView.getTag();
      if (StringUtils.isNotEmpty(((RequestType)localObject1).getAction()))
      {
        paramAnonymousAdapterView.setSelection(((RequestWatchArea)paramAnonymousAdapterView.getTag()).getSelectedPosition());
        paramAnonymousAdapterView = new Intent("android.intent.action.DIAL");
        paramAnonymousAdapterView.setData(Uri.parse(((RequestType)localObject1).getActionData()));
        getActivity().startActivity(paramAnonymousAdapterView);
        return;
      }
      if (selectedWatchArea != null)
      {
        localObject1 = (RequestWatchArea)paramAnonymousAdapterView.getTag();
        ((RequestWatchArea)localObject1).setReport(report);
        if (isRequestTypeSwitch(paramAnonymousView, (RequestWatchArea)localObject1))
        {
          if (shouldShowDialog("Pref:warn_watch_area"))
          {
            localObject2 = OneTimeWarnDialog.newInstance("Pref:warn_watch_area", 2131493104, 2131493103, 2131492944, 2130837727);
            ((OneTimeWarnDialog)localObject2).setClickListener(new OneTimeWarnDialog.ClickListener()
            {
              public void onNegativeClick()
              {
                int i = localObject1.getSelectedPosition();
                paramAnonymousAdapterView.setSelection(i);
              }
              
              public void onPositiveClick()
              {
                showFollowupRow(true);
                ReportFragment.access$1002(ReportFragment.this, localObject1);
                report.setSelectedWatchAreaApiId(selectedWatchArea.getId());
                setRequestTypeByView(paramAnonymousView, paramAnonymousAdapterView);
              }
            });
            ((OneTimeWarnDialog)localObject2).show(getFragmentManager(), null);
            return;
          }
          setRequestTypeByView(paramAnonymousView, paramAnonymousAdapterView);
          return;
        }
        showFollowupQuestions(report.getQuestions(), selectedWatchArea);
        return;
      }
      Object localObject2 = (RequestWatchArea)paramAnonymousAdapterView.getTag();
      ((RequestWatchArea)localObject2).setReport(report);
      ReportFragment.access$1002(ReportFragment.this, (RequestWatchArea)localObject2);
      report.setSelectedWatchAreaApiId(selectedWatchArea.getId());
      if (((RequestType)localObject1).getApiId().equals(report.getRequestTypeId()))
      {
        showFollowupQuestions(report.getQuestions(), selectedWatchArea);
        report.setRequestType((RequestType)localObject1);
        return;
      }
      setRequestTypeByView(paramAnonymousView, paramAnonymousAdapterView);
    }
    
    public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView)
    {
      RequestWatchArea localRequestWatchArea = (RequestWatchArea)paramAnonymousAdapterView.getTag();
      if (localRequestWatchArea.getIsFromDraft()) {
        paramAnonymousAdapterView.setSelection(localRequestWatchArea.getSelectedPosition());
      }
    }
  };
  private ViewGroup categoryParentRow;
  private ViewGroup categoryRow;
  private List<Spinner> categorySpinnerList = new ArrayList();
  private EditText descriptionEditText;
  @InjectView(2131362046)
  TextView descriptionLabel;
  private ErrorDialog errorDialog;
  private View.OnFocusChangeListener focusListener = new View.OnFocusChangeListener()
  {
    public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
    {
      if ((paramAnonymousView.getId() == 2131362032) && (paramAnonymousBoolean)) {
        editAddress();
      }
      while ((paramAnonymousView.getId() != 2131362032) || (paramAnonymousBoolean)) {
        return;
      }
      handleAddressEdit();
    }
  };
  private ViewGroup followupRow;
  private View.OnClickListener galleryBtnListener;
  private boolean hasSavedInstance;
  private Intent imageIntent;
  private boolean isEditingAddress = false;
  private LatLng latLng;
  @Inject
  LocationAdapter locationAdapter;
  private boolean mAddressIsGenerated = false;
  private CompoundButton.OnCheckedChangeListener mAnonymousReportCheckBoxListener;
  private CompoundButton.OnCheckedChangeListener mCheckBoxListener;
  private String mCurrentPhotoPath;
  @Inject
  DefaultOtherZone mDefaultOtherZone;
  private CheckBox mKeepAnonymousCheckBox;
  private long mLastDraftNotice = 0L;
  private GoogleMap mMap;
  private SupportMapFragment mMapFragment;
  @Inject
  NonDedicatedReqTypes mNonDedicatedReqTypes;
  @Inject
  ReportProvider mReportProvider;
  private View.OnTouchListener mRootOnTouchListener;
  private CheckBox mUseCurrentLocationCheckBox;
  private ViewGroup mainTable;
  private View.OnClickListener mapBtnListener;
  private ViewGroup mapContainer;
  @Inject
  MapHelper mapHelper;
  private View.OnClickListener mediaClearBtnListener;
  private Button mediaClearButton;
  private MediaCaptureHelper mediaHelper;
  @Inject
  OutsideAreaHelper outsideAreaHelper;
  private PageParams pageParams;
  private ViewGroup photoRow;
  private ProgressWheelDialog progWheelDiag;
  QuestionInterface.OnAnswerSetCallback questionCallback = new QuestionInterface.OnAnswerSetCallback()
  {
    public void onRemoveAnswer(Answer paramAnonymousAnswer)
    {
      if (paramAnonymousAnswer != null) {
        report.removeAnswer(paramAnonymousAnswer);
      }
    }
    
    public void onSetAnswer(Answer paramAnonymousAnswer)
    {
      report.addAnswer(paramAnonymousAnswer);
    }
  };
  private Report report;
  private View.OnClickListener reportBtnListener;
  private CustomScrollView scrollView;
  private List<View> selectableRows;
  private RequestWatchArea selectedWatchArea;
  private boolean setMapOnResume;
  private boolean setPicOnResume = false;
  private boolean shouldSaveDraft = true;
  private Button startCameraBtn;
  private Button startGalleryBtn;
  private Button submitBtn;
  private EditText summaryEditText;
  
  private void attachListeners()
  {
    startCameraBtn.setOnClickListener(camBtnListener);
    startGalleryBtn.setOnClickListener(galleryBtnListener);
    rootFrag.findViewById(2131362026).setOnClickListener(mapBtnListener);
  }
  
  private void buildReport()
  {
    report.setState("ReportState:DRAFT");
    report.setDao(DaoUtil.getReportDao(getAppContext()));
    perhapsShowDraftIndicator();
    List localList = report.getWatchAreas();
    boolean bool;
    if (!localList.isEmpty())
    {
      bool = true;
      mUseCurrentLocationCheckBox.setOnCheckedChangeListener(null);
      mUseCurrentLocationCheckBox.setChecked(report.getIsUsingCurrentLocation());
      mUseCurrentLocationCheckBox.setOnCheckedChangeListener(mCheckBoxListener);
      mKeepAnonymousCheckBox.setOnCheckedChangeListener(null);
      mKeepAnonymousCheckBox.setChecked(report.getAnonymizeReporter());
      mKeepAnonymousCheckBox.setOnCheckedChangeListener(mAnonymousReportCheckBoxListener);
      if (setPicOnResume != true) {
        break label179;
      }
      setPic();
      setPicOnResume = false;
      label130:
      if (!report.getLatLngModified()) {
        break label212;
      }
      setMapOnResume = false;
      setAddressString(report.getAddress());
      performLocationTasks();
    }
    for (;;)
    {
      if (bool) {
        showZones(localList);
      }
      setUpMapIfNeeded();
      return;
      bool = false;
      break;
      label179:
      if (report.getLocalImagePath() == null) {
        break label130;
      }
      mCurrentPhotoPath = report.getLocalImagePath();
      setPic();
      setPicOnResume = false;
      break label130;
      label212:
      if (report.getAddress() != null)
      {
        setUpMapIfNeeded();
        setAddressString(report.getAddress());
        if (bool)
        {
          showZones(localList);
          return;
        }
        getRequestTypes(null);
      }
      else if (setMapOnResume)
      {
        setMapOnResume = false;
        setUpMapIfNeeded();
        performLocationTasks(bool);
      }
      else if (report.getLatLng() != null)
      {
        setMapOnResume = false;
        setUpMapIfNeeded();
        performLocationTasks(bool);
      }
      else
      {
        setUpMapIfNeeded();
      }
    }
  }
  
  private boolean checkAddressModified()
  {
    if (report == null) {}
    String str1;
    String str2;
    do
    {
      do
      {
        do
        {
          return false;
          str1 = report.getAddress();
          str2 = addressEditText.getText().toString();
        } while ((str2 == null) || (str2.trim().isEmpty()) || (str2.trim().equals("")));
        if ((str1 == null) && (str2 != null)) {
          return true;
        }
        if ((str1 == null) || (str2 == null)) {
          break;
        }
      } while (str1.equals(str2));
      return true;
    } while ((str1 == null) || (str2 != null));
    return false;
  }
  
  private Report constructReport(Bundle paramBundle)
  {
    if (paramBundle != null)
    {
      pageParams = ((PageParams)paramBundle.getParcelable("page_params"));
      if ((pageParams != null) && ("com.seeclickfix.actions.NEW_REPORT".equals(pageParams.getActionExtra())))
      {
        report = new Report();
        report.setDao(DaoUtil.getReportDao(getAppContext()));
        report.setModified(false);
        resetReportView();
        setUpMapIfNeeded();
        return report;
      }
    }
    return mReportProvider.load();
  }
  
  private void displayWatchArea(RequestWatchArea paramRequestWatchArea, ViewGroup paramViewGroup, boolean paramBoolean)
  {
    paramRequestWatchArea.setReport(report);
    Object localObject = paramRequestWatchArea.getRequestTypes();
    if (paramBoolean)
    {
      selectedWatchArea = paramRequestWatchArea;
      report.setSelectedWatchAreaApiId(selectedWatchArea.getId());
      hideCategoryRow();
      setRequestType((RequestType)((List)localObject).get(0), paramRequestWatchArea);
      if (report.getIsUsingCurrentLocation()) {
        report.setModified(false);
      }
    }
    CategorySpinnerAdapter localCategorySpinnerAdapter;
    do
    {
      return;
      localCategorySpinnerAdapter = new CategorySpinnerAdapter(getSherlockActivity().getParent());
      new BlankReqType().addIfNeeded((List)localObject);
      new ActionableReqType().add311IfNeeded((List)localObject, paramRequestWatchArea.getId(), getAppContext());
      localCategorySpinnerAdapter.setList((List)localObject);
      localObject = new Spinner(getSherlockActivity());
      categorySpinnerList.add(localObject);
      ((Spinner)localObject).setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
      ((Spinner)localObject).setPrompt(paramRequestWatchArea.getTitle());
      ViewGroup localViewGroup1 = (ViewGroup)ViewUtil.inflate(getSherlockActivity(), 2130903135, paramViewGroup);
      ViewGroup localViewGroup2 = (ViewGroup)localViewGroup1.findViewById(2131362160);
      ((TextView)localViewGroup1.findViewById(2131362159)).setText(paramRequestWatchArea.getTitle());
      localViewGroup2.addView((View)localObject);
      paramViewGroup.addView(localViewGroup1);
      ((Spinner)localObject).setOnItemSelectedListener(catSpinnerClickListener);
      ((Spinner)localObject).setAdapter(localCategorySpinnerAdapter);
      ((Spinner)localObject).setTag(paramRequestWatchArea);
      i = report.getSelectedWatchAreaApiId();
    } while (paramRequestWatchArea.getId() != i);
    int i = localCategorySpinnerAdapter.getSelectionById(report.getRequestTypeId());
    ((Spinner)localObject).setSelection(i, true);
    localCategorySpinnerAdapter.notifyDataSetChanged();
    paramRequestWatchArea.setSelectedPosition(i);
  }
  
  private void geocode()
  {
    Location localLocation = locationAdapter.getLastLocationIfAvailable();
    String str = addressEditText.getText().toString();
    report.setAddress(str);
    setFragState(BaseFrag.FragState.BUSY);
    GoogleGeocodeRequest.geocode(str, localLocation, new SafeListener(this, new SimpleListener()
    {
      public void onFailure(SimpleListener.Code paramAnonymousCode)
      {
        setFragState(BaseFrag.FragState.ACTIVE);
        processSimpleLocations(new ArrayList());
      }
      
      public void onSuccess(List<SimpleLocation> paramAnonymousList)
      {
        setFragState(BaseFrag.FragState.ACTIVE);
        processSimpleLocations(paramAnonymousList);
      }
    }));
  }
  
  private GoogleMapOptions getMapOptions()
  {
    GoogleMapOptions localGoogleMapOptions = MapOptionsFactory.getMiniMapOptions(locationAdapter.getLastLocationIfAvailable());
    localGoogleMapOptions.zoomGesturesEnabled(false);
    return localGoogleMapOptions;
  }
  
  private void getRequestTypes(final Runnable paramRunnable)
  {
    showCategoryRow();
    RequestTypesTask.launch(latLng, new SafeListener(this, new SimpleListener()
    {
      public void onFailure(SimpleListener.Code paramAnonymousCode)
      {
        setFragState(BaseFrag.FragState.ERROR);
        errorDialog.showErrorPanel(2131492980, 2131492971, 2130837778, 2131492978, new Runnable()
        {
          public void run()
          {
            ReportFragment.this.getRequestTypes(val$runner);
          }
        });
      }
      
      public void onSuccess(List<RequestWatchArea> paramAnonymousList)
      {
        showZones(paramAnonymousList);
        showDescriptionAndSummary();
        if (paramRunnable != null) {
          paramRunnable.run();
        }
      }
    }));
  }
  
  private void handleAlertMessage(List<RequestWatchArea> paramList)
  {
    if (outsideAreaHelper.shouldShowWarning(paramList))
    {
      outsideAreaHelper.showAlert(alertContainerView);
      return;
    }
    outsideAreaHelper.hideAlert(alertContainerView);
  }
  
  private void handleArgs(Bundle paramBundle)
  {
    report = constructReport(paramBundle);
    buildReport();
  }
  
  private boolean hasLocation()
  {
    if (report == null) {
      report = new Report();
    }
    if (mAddressIsGenerated) {}
    while ((latLng == null) && (!report.getLatLngModified()) && (report.getLat() == 0.0D) && (report.getLng() == 0.0D)) {
      return false;
    }
    return true;
  }
  
  private void hideCategoryRow()
  {
    categoryParentRow.setVisibility(8);
    categoryRow.setVisibility(8);
  }
  
  private void hideDraftIndicator()
  {
    rootFrag.findViewById(2131362024).setVisibility(8);
  }
  
  private void hideView(View paramView)
  {
    if (paramView != null) {
      paramView.setVisibility(8);
    }
  }
  
  private void initMapFragAndServices()
  {
    mMapFragment = mapHelper.initMap(this, 2131362027, getMapOptions());
  }
  
  private boolean isAuth()
  {
    return AuthManager.isAuthenticated();
  }
  
  private boolean isValidReport()
  {
    boolean bool1 = true;
    gatherReportData();
    if (report.getLat() == 0.0D)
    {
      bool1 = false;
      notifyUser(2131493112);
    }
    boolean bool2;
    for (;;)
    {
      Object localObject = report.getQuestions();
      bool2 = bool1;
      if (!CollectionUtil.isNotNullOrEmpty((Collection)localObject)) {
        break;
      }
      localObject = ((List)localObject).iterator();
      for (;;)
      {
        bool2 = bool1;
        if (!((Iterator)localObject).hasNext()) {
          break;
        }
        Question localQuestion = (Question)((Iterator)localObject).next();
        if (localQuestion.isRequired())
        {
          Answer localAnswer = localQuestion.getSelectedAnswer();
          if ((localAnswer == null) || (localAnswer.getAnswer().length() < 1))
          {
            bool1 = false;
            notifyUser(getString(2131493111, new Object[] { localQuestion.getQuestionText() }));
          }
        }
      }
      if (report.getLng() == 0.0D)
      {
        bool1 = false;
        notifyUser(2131493112);
      }
      else if (report.getRequestType() == null)
      {
        bool1 = false;
        notifyUser(2131493110);
      }
      else if (StringUtils.isBlank(report.getSummary()))
      {
        bool1 = false;
        notifyUser(2131493113);
      }
    }
    return bool2;
  }
  
  private void killAsyncTasks()
  {
    if (mediaHelper != null) {
      mediaHelper.cancel();
    }
    ReverseGeocodeTask.cancel("SCFAPP_ReportFragment");
    RequestTypesTask.cancel("SCFAPP_ReportFragment");
  }
  
  private void launchLoginFrag()
  {
    postEvent(new AuthRequiredEvent(PageParamsFactory.getReportParamsWithAction(getSherlockActivity(), "com.seeclickfix.actions.SEND_REPORT_ON_RETURN")));
  }
  
  private void performLocationTasks()
  {
    performLocationTasks(false);
  }
  
  private void performLocationTasks(final boolean paramBoolean)
  {
    reverseGeocode(new Runnable()
    {
      public void run()
      {
        if (!paramBoolean) {
          ReportFragment.this.getRequestTypes(null);
        }
      }
    });
  }
  
  private void perhapsShowDraftIndicator()
  {
    View localView = rootFrag.findViewById(2131362024);
    TextView localTextView = (TextView)rootFrag.findViewById(2131362025);
    long l = report.getLastEdited();
    if (l > 0L)
    {
      localView.setVisibility(0);
      localTextView.setText(DateUtil.getDateTimeDisplayStringFromMSEpoch(l));
      runWhenDraftNoticeIsStale(l, new Runnable()
      {
        public void run()
        {
          notifyUser(2131493108);
        }
      });
      return;
    }
    localTextView.setText("");
  }
  
  private void resetReportView()
  {
    getReportModel().setNotice(NoticeItem.emptyNotice());
    processNotice();
    scrollView.scrollTo(0, 0);
    outsideAreaHelper.hideAlert(alertContainerView);
    summaryEditText.setText("");
    descriptionEditText.setText("");
    addressEditText.setText("");
    if (mediaHelper != null)
    {
      mediaHelper.cancel();
      mediaHelper.hidePic();
    }
    if (pageParams != null)
    {
      pageParams.setDataParcel(null);
      pageParams.setParcel(null);
      pageParams.setActionExtra(null);
    }
    setMapOnResume = false;
    setPicOnResume = false;
    latLng = null;
    mCurrentPhotoPath = null;
    selectedWatchArea = null;
    hasSavedInstance = false;
    mAddressIsGenerated = false;
    mUseCurrentLocationCheckBox.setChecked(true);
    mKeepAnonymousCheckBox.setChecked(false);
    if (mMap != null) {
      mMap.clear();
    }
    try
    {
      ViewGroup localViewGroup = (ViewGroup)rootFrag.findViewById(2131362048);
      TextView localTextView = (TextView)rootFrag.findViewById(2131362042);
      localViewGroup.removeAllViews();
      localTextView.setText("\n ");
      localTextView.setVisibility(8);
      hideView(categoryRow);
      hideView(followupRow);
      hideView(categoryParentRow);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  private void reverseGeocode(final Runnable paramRunnable)
  {
    report.setLatLngModified(false);
    if (latLng == null) {
      return;
    }
    ReverseGeocodeTask.launch("SCFAPP_ReportFragment", latLng, this, new SafeListener(this, new SimpleListener()
    {
      public void onFailure(SimpleListener.Code paramAnonymousCode)
      {
        setFragState(BaseFrag.FragState.ERROR);
        errorDialog.showErrorPanel(2131492980, 2131492971, 2130837778, 2131492978, new Runnable()
        {
          public void run()
          {
            ReportFragment.this.reverseGeocode(val$callback);
          }
        });
      }
      
      public void onSuccess(Address paramAnonymousAddress)
      {
        showGeocodedAddress(paramAnonymousAddress);
        if (paramRunnable != null) {
          paramRunnable.run();
        }
      }
    }));
  }
  
  private void runWhenDraftNoticeIsStale(long paramLong, Runnable paramRunnable)
  {
    long l = System.currentTimeMillis();
    if ((l > paramLong + 120000L) && (l > mLastDraftNotice + 120000L))
    {
      mLastDraftNotice = l;
      paramRunnable.run();
    }
  }
  
  private void saveDraft()
  {
    if (!shouldSaveDraft) {
      shouldSaveDraft = true;
    }
    do
    {
      return;
      gatherReportData();
    } while ((report == null) || (report.isEmpty()) || (!report.isModified()));
    report.setState("ReportState:DRAFT");
    GlobalReportCache.clearReport();
    GlobalReportCache.putReport(report);
    Intent localIntent = new Intent("com.seeclickfix.actions.SAVE_DRAFT");
    localIntent.setClass(getActivity().getApplicationContext(), DraftSaveService.class);
    localIntent.putExtra("report_bundle", report);
    getActivity().startService(localIntent);
  }
  
  private void scrollToDetails()
  {
    scrollView.scrollTo(0, rootFrag.findViewById(2131362047).getTop() + 100);
  }
  
  private void send()
  {
    setFragState(BaseFrag.FragState.BUSY);
    Object localObject = currentUser();
    report.setUserInfo((AuthUser)localObject);
    localObject = new Intent("com.seeclickfix.actions.UPLOAD_REPORT");
    ((Intent)localObject).setClass(getActivity().getApplicationContext(), ReportUploadService.class);
    shouldSaveDraft = false;
    Report localReport = new Report(report);
    localReport.setState("ReportState:SENDING");
    ((Intent)localObject).putExtra("report_bundle", localReport);
    getActivity().startService((Intent)localObject);
  }
  
  private void setMarkerAndAnimate()
  {
    Object localObject;
    if (latLng != null)
    {
      localObject = CameraUpdateFactory.newLatLngZoom(latLng, 16.0F);
      mMap.animateCamera((CameraUpdate)localObject, 500, null);
      mMap.clear();
      mMap.addMarker(new MarkerOptions().position(latLng).icon(ColorMarkers.getPinByStatus("Open", getAppContext())));
      mAddressIsGenerated = false;
      return;
    }
    try
    {
      latLng = report.getLatLng();
      if (latLng == null)
      {
        localObject = locationAdapter.getLastLocationIfAvailable();
        if (localObject != null)
        {
          latLng = new LatLng(((Location)localObject).getLatitude(), ((Location)localObject).getLongitude());
          mAddressIsGenerated = true;
          report.setLatLng(latLng);
          report.setModified(false);
        }
      }
      for (;;)
      {
        localObject = CameraUpdateFactory.newLatLngZoom(latLng, 16.0F);
        mMap.animateCamera((CameraUpdate)localObject, 500, null);
        mMap.clear();
        mMap.addMarker(new MarkerOptions().position(latLng).icon(ColorMarkers.getPinByStatus("Open", getAppContext())));
        performLocationTasks();
        return;
        latLng = mMap.getCameraPosition().target;
        break;
        mAddressIsGenerated = false;
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  private void setPic()
  {
    if (mCurrentPhotoPath != null) {
      report.setLocalImagePath(mCurrentPhotoPath);
    }
    for (;;)
    {
      Object localObject = (ImageView)rootFrag.findViewById(2131362053);
      View localView1 = rootFrag.findViewById(2131362056);
      View localView2 = rootFrag.findViewById(2131362052);
      MediaCaptureHelper.Builder localBuilder = new MediaCaptureHelper.Builder();
      localBuilder.activity(getActivity());
      localBuilder.imageView((ImageView)localObject);
      localBuilder.imgIntent(imageIntent);
      localBuilder.viewToHide(localView1);
      localBuilder.viewToShow(localView2);
      localBuilder.photoPath(mCurrentPhotoPath);
      mediaHelper = localBuilder.build();
      mediaHelper.setPic();
      report.setLocalImagePath(mCurrentPhotoPath);
      scrollView.scrollTo(0, ((ImageView)localObject).getTop() - 50);
      return;
      if (imageIntent != null)
      {
        localObject = imageIntent.getData();
        mCurrentPhotoPath = GalleryPathHelper.getPath(getActivity(), (Uri)localObject);
        report.setLocalImagePath(mCurrentPhotoPath);
      }
      else if (report.getLocalImagePath() != null)
      {
        mCurrentPhotoPath = report.getLocalImagePath();
      }
    }
  }
  
  private void setReferences()
  {
    scrollView = ((CustomScrollView)rootFrag.findViewById(2131362022));
    startCameraBtn = ((Button)rootFrag.findViewById(2131362058));
    startGalleryBtn = ((Button)rootFrag.findViewById(2131362059));
    addressEditBtn = ((ImageButton)rootFrag.findViewById(2131362030));
    submitBtn = ((Button)rootFrag.findViewById(2131362066));
    addressEditText = ((EditTextWithBackDetect)rootFrag.findViewById(2131362032));
    summaryEditText = ((EditText)rootFrag.findViewById(2131362045));
    descriptionEditText = ((EditText)rootFrag.findViewById(2131362047));
    mainTable = ((ViewGroup)rootFrag.findViewById(2131362023));
    categoryRow = ((ViewGroup)rootFrag.findViewById(2131362038));
    followupRow = ((ViewGroup)rootFrag.findViewById(2131362040));
    categoryParentRow = ((ViewGroup)rootFrag.findViewById(2131362036));
    photoRow = ((ViewGroup)rootFrag.findViewById(2131362049));
    mapContainer = ((ViewGroup)rootFrag.findViewById(2131362027));
    mediaClearButton = ((Button)rootFrag.findViewById(2131362055));
    mUseCurrentLocationCheckBox = ((CheckBox)rootFrag.findViewById(2131362033));
    mKeepAnonymousCheckBox = ((CheckBox)rootFrag.findViewById(2131362063));
    selectableRows = new ArrayList();
    selectableRows.add(categoryRow);
    selectableRows.add(followupRow);
    selectableRows.add(categoryParentRow);
    selectableRows.add(photoRow);
  }
  
  private void setRequestType(RequestType paramRequestType, RequestWatchArea paramRequestWatchArea)
  {
    selectedWatchArea = paramRequestWatchArea;
    paramRequestWatchArea = paramRequestType.getApiId();
    selectedWatchArea.setReport(report);
    boolean bool = selectedWatchArea.getIsFromDraft();
    if (bool) {
      selectedWatchArea.setIsFromDraft(false);
    }
    if (paramRequestType.getNumQuestions() > 0)
    {
      if (!bool)
      {
        showFollowupRow(true);
        report.setRequestType(paramRequestType);
        report.setSelectedWatchAreaApiId(selectedWatchArea.getId());
        getFollowupQuestions(selectedWatchArea, paramRequestWatchArea, null);
        return;
      }
      if (GlobalReportCache.getReport() != null)
      {
        showFollowupQuestions(report.getQuestions(), selectedWatchArea);
        return;
      }
      if (report.getQuestionsDb() != null)
      {
        showFollowupRow(false);
        paramRequestType = report.getQuestionsDb().iterator();
        paramRequestWatchArea = new ArrayList();
        Dao localDao = DaoUtil.getAnswerDao(getAppContext());
        for (;;)
        {
          if (paramRequestType.hasNext())
          {
            Question localQuestion = (Question)paramRequestType.next();
            try
            {
              localDao.refresh(localQuestion.getSelectedAnswer());
              paramRequestWatchArea.add(localQuestion);
            }
            catch (SQLException localSQLException)
            {
              for (;;)
              {
                localSQLException.printStackTrace();
              }
            }
          }
        }
        report.setQuestions(paramRequestWatchArea);
        showFollowupQuestions(report.getQuestions(), selectedWatchArea);
        return;
      }
      Log.e("SCFAPP_ReportFragment", "we have a req type with follow up q's but are unable to find them in db or memory??");
      return;
    }
    report.clearSecondaryData();
    report.setRequestType(paramRequestType);
    showDescriptionAndSummary();
    showFollowupRow(false);
    showSubmitButtonRow();
    showFollowupHeaders();
    scrollToDetails();
  }
  
  private void setUpMapIfNeeded()
  {
    showAccuracyWarning();
    if (report.getLatLng() != null) {
      latLng = report.getLatLng();
    }
    if (mMap == null) {
      mMap = mMapFragment.getMap();
    }
    if (mMap != null) {
      setMarkerAndAnimate();
    }
  }
  
  private void setupListeners()
  {
    camBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        try
        {
          launchCameraIntent();
          return;
        }
        catch (IOException paramAnonymousView) {}
      }
    };
    mapBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if ((ReportFragment.this.hasLocation()) && (shouldShowDialog("Pref:WARN_LOCATION_CHANGE")))
        {
          paramAnonymousView = OneTimeWarnDialog.newInstance("Pref:WARN_LOCATION_CHANGE", 2131493106, 2131493105, 2131492944, 2130837727);
          paramAnonymousView.setClickListener(new OneTimeWarnDialog.ClickListener()
          {
            public void onNegativeClick() {}
            
            public void onPositiveClick()
            {
              showMapFrag();
            }
          });
          paramAnonymousView.show(getFragmentManager(), null);
          return;
        }
        showMapFrag();
      }
    };
    reportBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        prepareAndSendReport();
      }
    };
    galleryBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        launchGalleryIntent();
      }
    };
    mediaClearBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        clearMedia();
      }
    };
    mRootOnTouchListener = new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        FormUtil.hideKeyboard(paramAnonymousView);
        if (isEditingAddress)
        {
          handleAddressEdit();
          return true;
        }
        return false;
      }
    };
    FormUtil.setupUI(rootFrag, mRootOnTouchListener);
    addressEditBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (isEditingAddress)
        {
          handleAddressEdit();
          return;
        }
        editAddress();
      }
    };
    addressEditTextListener = new EditTextWithBackDetect.EditTextImeBackListener()
    {
      public void onImeBack(EditTextWithBackDetect paramAnonymousEditTextWithBackDetect, String paramAnonymousString)
      {
        handleAddressEdit();
      }
    };
    mCheckBoxListener = new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        report.setIsUsingCurrentLocation(paramAnonymousBoolean);
        if (paramAnonymousBoolean)
        {
          paramAnonymousCompoundButton = locationAdapter.getLastLocationIfAvailable();
          if (paramAnonymousCompoundButton == null) {
            break label190;
          }
          ReportFragment.access$302(ReportFragment.this, new LatLng(paramAnonymousCompoundButton.getLatitude(), paramAnonymousCompoundButton.getLongitude()));
        }
        for (;;)
        {
          report.setLatLng(latLng);
          report.setLatLngModified(true);
          paramAnonymousCompoundButton = CameraUpdateFactory.newLatLngZoom(latLng, 16.0F);
          mMap.animateCamera(paramAnonymousCompoundButton, 500, null);
          mMap.clear();
          mMap.addMarker(new MarkerOptions().position(latLng).icon(ColorMarkers.getPinByStatus("Open", getAppContext())));
          ReportFragment.access$502(ReportFragment.this, false);
          ReportFragment.this.performLocationTasks();
          report.setModified(false);
          return;
          label190:
          ReportFragment.access$302(ReportFragment.this, mMap.getCameraPosition().target);
        }
      }
    };
    mAnonymousReportCheckBoxListener = new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        report.setAnonymizeReporter(paramAnonymousBoolean);
      }
    };
    addressEditBtn.setOnClickListener(addressEditBtnListener);
    addressEditText.setOnFocusChangeListener(focusListener);
    addressEditText.setOnEditTextImeBackListener(addressEditTextListener);
    mediaClearButton.setOnClickListener(mediaClearBtnListener);
    submitBtn.setOnClickListener(reportBtnListener);
    mUseCurrentLocationCheckBox.setOnCheckedChangeListener(mCheckBoxListener);
    mKeepAnonymousCheckBox.setOnCheckedChangeListener(mAnonymousReportCheckBoxListener);
  }
  
  private void showAccuracyWarning()
  {
    if (accuracyWarning.shouldShowWarning())
    {
      accuracyWarning.showAlert(accuracyContainerView);
      return;
    }
    accuracyWarning.hideAlert(accuracyContainerView);
  }
  
  private void showCategoryRow()
  {
    categoryParentRow.setVisibility(0);
    categoryRow.setVisibility(0);
  }
  
  private void showFollowupHeaders()
  {
    Object localObject = (ViewGroup)rootFrag.findViewById(2131362048);
    TextView localTextView1 = (TextView)rootFrag.findViewById(2131362042);
    TextView localTextView2 = (TextView)rootFrag.findViewById(2131362043);
    ((ViewGroup)localObject).removeAllViews();
    localObject = (RequestType)selectedWatchArea.getRequestTypes().get(selectedWatchArea.getSelectedPosition());
    localTextView1.setText(selectedWatchArea.getTitle());
    localTextView2.setText(((RequestType)localObject).getTitle());
    localTextView1.setVisibility(0);
    localTextView2.setVisibility(0);
  }
  
  protected void cancelReport()
  {
    report = new Report();
    report.setDao(DaoUtil.getReportDao(getAppContext()));
    report.setModified(false);
    resetReportView();
    hideDraftIndicator();
    setUpMapIfNeeded();
    clearDraft();
  }
  
  protected void clearMedia()
  {
    mCurrentPhotoPath = null;
    imageIntent = null;
    View localView1 = rootFrag.findViewById(2131362056);
    View localView2 = rootFrag.findViewById(2131362052);
    localView1.setVisibility(0);
    localView2.setVisibility(8);
    report.setLocalImagePath(null);
    try
    {
      ((PageParams)getArguments().getParcelable("page_params")).setIntent(null);
      return;
    }
    catch (Exception localException) {}
  }
  
  protected void editAddress()
  {
    isEditingAddress = true;
    if (!addressEditText.hasFocus()) {
      addressEditText.requestFocus();
    }
    addressEditText.selectAll();
    addressEditBtn.setImageResource(2130837730);
    ((InputMethodManager)getAppContext().getSystemService("input_method")).showSoftInput(addressEditText, 1);
    mUseCurrentLocationCheckBox.setFocusable(false);
    mUseCurrentLocationCheckBox.setFocusableInTouchMode(false);
    mUseCurrentLocationCheckBox.setEnabled(false);
  }
  
  protected void gatherReportData()
  {
    try
    {
      String str1 = summaryEditText.getText().toString();
      String str2 = descriptionEditText.getText().toString();
      report.setSummary(str1);
      report.setDescription(str2);
      return;
    }
    catch (Exception localException) {}
  }
  
  protected void getFollowupQuestions(final RequestWatchArea paramRequestWatchArea, final String paramString, final Runnable paramRunnable)
  {
    MyApplication.scfV1.requestTypeQuestions(paramString, new Callback()
    {
      public void failure(RetrofitError paramAnonymousRetrofitError)
      {
        if (getActivity() != null)
        {
          setFragState(BaseFrag.FragState.ERROR);
          errorDialog.showErrorPanel(2131492980, 2131492971, 2130837778, 2131492978, new Runnable()
          {
            public void run()
            {
              getFollowupQuestions(val$watchArea, val$reqId, val$runner);
            }
          });
        }
      }
      
      public void success(List<Question> paramAnonymousList, Response paramAnonymousResponse)
      {
        if (getActivity() != null)
        {
          showFollowupQuestions(paramAnonymousList, paramRequestWatchArea);
          report.setQuestions(paramAnonymousList);
          if (paramRunnable != null) {
            paramRunnable.run();
          }
        }
      }
    });
  }
  
  public NoticeItem getNotice()
  {
    return getReportModel().getNotice();
  }
  
  public ReportModel getReportModel()
  {
    return MyApplication.getReportModel();
  }
  
  protected void handleAddressEdit()
  {
    isEditingAddress = false;
    if (checkAddressModified())
    {
      geocode();
      mAddressIsGenerated = false;
      if (mUseCurrentLocationCheckBox != null) {
        mUseCurrentLocationCheckBox.setChecked(false);
      }
      report.setIsUsingCurrentLocation(false);
    }
    mUseCurrentLocationCheckBox.setEnabled(true);
    mUseCurrentLocationCheckBox.setFocusable(true);
    mUseCurrentLocationCheckBox.setFocusableInTouchMode(true);
    addressEditText.clearFocus();
    addressEditBtn.setImageResource(2130837731);
    addressEditBtn.requestFocus();
  }
  
  protected void hideFollowupRow()
  {
    ViewGroup localViewGroup = (ViewGroup)rootFrag.findViewById(2131362048);
    localViewGroup.removeAllViews();
    localViewGroup.invalidate();
    localViewGroup.requestLayout();
    followupRow.setVisibility(8);
    followupRow.invalidate();
    followupRow.requestLayout();
  }
  
  protected boolean isRequestTypeSwitch(View paramView, RequestWatchArea paramRequestWatchArea)
  {
    paramView = ((RequestType)paramView.getTag()).getApiId();
    if (paramRequestWatchArea.getId() != selectedWatchArea.getId()) {}
    while (!paramView.equals(report.getRequestTypeId())) {
      return true;
    }
    return false;
  }
  
  protected void launchCameraIntent()
    throws IOException
  {
    imageIntent = null;
    try
    {
      ((PageParams)getArguments().getParcelable("page_params")).setIntent(null);
      mCurrentPhotoPath = PhotoTaker.launchCameraWithCallback(this, (CameraLaunchingActivity)getActivity());
      report.setLocalImagePath(mCurrentPhotoPath);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  protected void launchGalleryIntent()
  {
    report.setLocalImagePath(null);
    GalleryPicker.launchGalleryForCallback(this, (GalleryLauncher)getActivity());
  }
  
  public void notifyUser(int paramInt)
  {
    ToastFactory.showCenteredShortToast(getSherlockActivity(), paramInt);
  }
  
  public void notifyUser(String paramString)
  {
    ToastFactory.showCenteredShortToast(getSherlockActivity(), paramString);
  }
  
  public void notifyUserLong(int paramInt)
  {
    ToastFactory.showCenteredLong(getSherlockActivity(), paramInt);
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    subscribeToEventBus();
    setHasOptionsMenu(true);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenu.clear();
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
    paramMenuInflater.inflate(2131623941, paramMenu);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903093, paramViewGroup, false));
    errorDialog = new ErrorDialog(rootFrag.findViewById(2131361912));
    MyApplication.inject(this);
    ButterKnife.inject(this, rootFrag);
    initMapFragAndServices();
    if (paramBundle == null) {
      setFragState(BaseFrag.FragState.ACTIVE);
    }
    return rootFrag;
  }
  
  public void onDetach()
  {
    super.onDetach();
  }
  
  public void onImageCallback(Intent paramIntent)
  {
    if (paramIntent != null) {
      imageIntent = paramIntent;
    }
    setPicOnResume = true;
    try
    {
      ((PageParams)getArguments().getParcelable("page_params")).setIntent(imageIntent);
      return;
    }
    catch (Exception paramIntent) {}
  }
  
  @Subscribe
  public void onIssueCreatedEvent(SCFService.IssueCreatedEvent paramIssueCreatedEvent)
  {
    if (paramIssueCreatedEvent.getResponse().getStatus() == 201)
    {
      cancelReport();
      getReportModel().setNotice(NoticeItem.emptyNotice());
      return;
    }
    getReportModel().setNotice(paramIssueCreatedEvent.getNoticeItem());
  }
  
  @Subscribe
  public void onLoginEvent(LoginEvent paramLoginEvent)
  {
    AuthUser localAuthUser = paramLoginEvent.getUser();
    paramLoginEvent = paramLoginEvent.getOnAuthCompleteParams();
    if ((paramLoginEvent != null) && (localAuthUser != null) && ("com.seeclickfix.actions.SEND_REPORT_ON_RETURN".equals(paramLoginEvent.getActionExtra())))
    {
      report.setUserInfo(localAuthUser);
      prepareAndSendReport();
      LoginStateController.getInstance().clearAuthCompleteParams();
    }
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 2131362183)
    {
      notifyUserLong(2131493109);
      cancelReport();
      return true;
    }
    if (paramMenuItem.getItemId() == 2131362184)
    {
      prepareAndSendReport();
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public void onReportLocationSet(PageParams paramPageParams)
  {
    mAddressIsGenerated = false;
    pageParams = paramPageParams;
    report = ((Report)pageParams.getParcel());
    latLng = report.getLatLng();
    buildReport();
  }
  
  public void onResume()
  {
    super.onResume();
    setReferences();
    setupListeners();
    attachListeners();
    processNotice();
    handleArgs(getArguments());
    subscribeToEventBus();
    locationAdapter.startHighAccuracyLocationUpdates();
    ((TextView)rootFrag.findViewById(2131362064)).setMovementMethod(LinkMovementMethod.getInstance());
    ((TextView)rootFrag.findViewById(2131362064)).setText(Html.fromHtml(getResources().getString(2131493099)));
  }
  
  public void onStop()
  {
    unSubscribeFromEventBus();
    killAsyncTasks();
    saveDraft();
    super.onStop();
  }
  
  protected void prepareAndSendReport()
  {
    gatherReportData();
    if (isValidReport())
    {
      if (isAuth()) {
        send();
      }
    }
    else {
      return;
    }
    launchLoginFrag();
  }
  
  public void processSimpleLocations(List<SimpleLocation> paramList)
  {
    if (paramList.isEmpty())
    {
      notifyUser(2131493097);
      return;
    }
    report.setLatLng(((SimpleLocation)paramList.get(0)).latLng());
    report.setLatLngModified(true);
    setUpMapIfNeeded();
    getRequestTypes(null);
  }
  
  protected void setAddressString(String paramString)
  {
    addressEditText.setText(paramString);
  }
  
  protected void setRequestTypeByView(View paramView, AdapterView<?> paramAdapterView)
  {
    Object localObject = categorySpinnerList.iterator();
    while (((Iterator)localObject).hasNext())
    {
      Spinner localSpinner = (Spinner)((Iterator)localObject).next();
      if (!localSpinner.equals(paramAdapterView)) {
        localSpinner.setSelection(0);
      }
    }
    localObject = (RequestWatchArea)paramAdapterView.getTag();
    paramView = (RequestType)paramView.getTag();
    ((RequestWatchArea)localObject).setReport(report);
    ((RequestWatchArea)localObject).setSelectedPosition(paramAdapterView.getSelectedItemPosition());
    setRequestType(paramView, (RequestWatchArea)localObject);
  }
  
  protected boolean shouldShowDialog(String paramString)
  {
    return PrefsUtil.getBoolean(paramString, true, getActivity());
  }
  
  protected void showDescriptionAndSummary()
  {
    Object localObject = report.getSummary();
    if (localObject != null) {
      summaryEditText.setText((CharSequence)localObject);
    }
    localObject = report.getWatchAreas();
    if (CollectionUtil.isNotNullOrEmpty((Collection)localObject))
    {
      DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(getAppContext());
      if (FeatureFlagHelper.hasEnabledZone(getOptionssuppressDescriptionField, (List)localObject, localDedicatedApp))
      {
        descriptionEditText.setVisibility(8);
        descriptionLabel.setVisibility(8);
      }
    }
    do
    {
      return;
      localObject = report.getDescription();
      descriptionEditText.setVisibility(0);
      descriptionLabel.setVisibility(0);
    } while (localObject == null);
    descriptionEditText.setText((CharSequence)localObject);
  }
  
  protected void showFollowupQuestions(List<Question> paramList, RequestWatchArea paramRequestWatchArea)
  {
    showFollowupRow(true);
    ViewGroup localViewGroup = (ViewGroup)rootFrag.findViewById(2131362048);
    TextView localTextView1 = (TextView)rootFrag.findViewById(2131362042);
    TextView localTextView2 = (TextView)rootFrag.findViewById(2131362043);
    localViewGroup.removeAllViews();
    RequestType localRequestType = (RequestType)paramRequestWatchArea.getRequestTypes().get(paramRequestWatchArea.getSelectedPosition());
    localTextView1.setText(paramRequestWatchArea.getTitle());
    localTextView2.setText(localRequestType.getTitle());
    localTextView1.setVisibility(0);
    localTextView2.setVisibility(0);
    localTextView1.invalidate();
    localTextView1.requestLayout();
    localTextView2.invalidate();
    localTextView2.requestLayout();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      paramRequestWatchArea = (Question)paramList.next();
      paramRequestWatchArea.getQuestionType();
      paramRequestWatchArea = QuestionFactory.getQuestionWidget(paramRequestWatchArea, localViewGroup, getSherlockActivity());
      if (paramRequestWatchArea != null) {
        paramRequestWatchArea.setOnAnswerCallback(questionCallback);
      }
    }
    showDescriptionAndSummary();
    showSubmitButtonRow();
  }
  
  protected void showFollowupRow(boolean paramBoolean)
  {
    followupRow.setVisibility(0);
    ViewGroup localViewGroup = (ViewGroup)rootFrag.findViewById(2131362048);
    TextView localTextView1 = (TextView)rootFrag.findViewById(2131362042);
    TextView localTextView2 = (TextView)rootFrag.findViewById(2131362043);
    localViewGroup.removeAllViews();
    if (paramBoolean)
    {
      localTextView1.setVisibility(8);
      localTextView2.setVisibility(8);
      ProgressWheelFactory.addPorgreesWheel(localViewGroup);
    }
    for (;;)
    {
      localViewGroup.invalidate();
      localViewGroup.requestLayout();
      return;
      localTextView1.setVisibility(0);
    }
  }
  
  protected void showGeocodedAddress(Address paramAddress)
  {
    if (paramAddress == null) {
      return;
    }
    paramAddress = AddressLocalizer.getAddressString(paramAddress);
    if (!mAddressIsGenerated) {
      report.setAddress(paramAddress);
    }
    setAddressString(paramAddress);
  }
  
  protected void showMapFrag()
  {
    if (mMap != null) {
      report.setCamPosition(mMap.getCameraPosition());
    }
    ((ReportMapLaunchActivity)getActivity()).launchReportMap(this, PageParamsFactory.getReportParamsWithParcel(getSherlockActivity(), report));
  }
  
  protected void showSubmitButtonRow() {}
  
  protected void showView(View paramView)
  {
    paramView.setVisibility(0);
  }
  
  protected void showZones(List<RequestWatchArea> paramList)
  {
    handleAlertMessage(paramList);
    showCategoryRow();
    LinearLayout localLinearLayout = (LinearLayout)categoryRow.findViewById(2131362039);
    localLinearLayout.removeAllViews();
    categorySpinnerList = new ArrayList();
    Object localObject = paramList;
    if (paramList == null) {
      localObject = new ArrayList();
    }
    paramList = DedicatedAppManager.getDedicatedApp(getAppContext());
    paramList = mNonDedicatedReqTypes.filterIfNeeded((List)localObject, paramList);
    mDefaultOtherZone.addOtherIfNeeded(paramList, report);
    report.setWatchAreas(paramList);
    if (paramList.size() == 0) {
      hideCategoryRow();
    }
    localObject = paramList.iterator();
    if (((Iterator)localObject).hasNext())
    {
      RequestWatchArea localRequestWatchArea = (RequestWatchArea)((Iterator)localObject).next();
      boolean bool = localRequestWatchArea.isDefault();
      if ((paramList.size() == 1) && (bool)) {}
      for (bool = true;; bool = false)
      {
        if (bool) {
          report.setSelectedWatchAreaApiId(localRequestWatchArea.getId());
        }
        displayWatchArea(localRequestWatchArea, localLinearLayout, bool);
        break;
      }
    }
    if ((report.getSelectedWatchAreaApiId() != 0) || (report.getLatLngModified()))
    {
      int j = 0;
      paramList = paramList.iterator();
      do
      {
        i = j;
        if (!paramList.hasNext()) {
          break;
        }
      } while (((RequestWatchArea)paramList.next()).getId() != report.getSelectedWatchAreaApiId());
      int i = 1;
      if (i == 0)
      {
        hideFollowupRow();
        report.clearWatchAreaAndReqTypes();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */