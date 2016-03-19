package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;
import butterknife.Optional;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.android.volley.Cache;
import com.android.volley.RequestQueue;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.SimpleAlertDialog;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import com.seeclickfix.ma.android.db.OrmDbHelper;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.location.PresetLocation;
import com.seeclickfix.ma.android.location.TestLocationList;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.services.CityLoadingService;
import com.seeclickfix.ma.android.views.ToastFactory;
import java.util.Arrays;
import java.util.List;
import javax.inject.Inject;

public class AboutFrag
  extends BaseFrag
  implements AdapterView.OnItemSelectedListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "AboutFrag";
  @InjectView(2131361889)
  TextView aboutContent;
  private Context c;
  @InjectView(2131361895)
  ViewGroup devConsoleViewGroup;
  @InjectView(2131361892)
  TextView deviceTextView;
  @InjectView(2131361901)
  Spinner envirnmentSpinner;
  @InjectView(2131361896)
  TextView environmentTextView;
  Handler handler = new Handler() {};
  @InjectView(2131361900)
  Spinner localeSpinner;
  @InjectView(2131361905)
  EditText mLatEditText;
  @InjectView(2131361906)
  EditText mLngEditText;
  @Inject
  LocationAdapter mLocationAdapter;
  @InjectView(2131361904)
  Spinner mPresetLocationSpinner;
  @InjectView(2131361902)
  EditText mServerEditText;
  Runnable openDatabaseRunnable = new Runnable()
  {
    public void run()
    {
      ((OrmDbHelper)OpenHelperManager.getHelper(c, OrmDbHelper.class)).getWritableDatabase();
      ToastFactory.showCenteredShortToast(c, "Created new database.");
    }
  };
  @InjectView(2131361893)
  TextView osTextView;
  AdapterView.OnItemSelectedListener presetLocListener = new AdapterView.OnItemSelectedListener()
  {
    public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      paramAnonymousAdapterView = (PresetLocation)TestLocationList.getPresetLocations(c).get(paramAnonymousInt);
      if (!paramAnonymousAdapterView.name().equals("(No location selected)"))
      {
        mLocationAdapter.forceMockLocation(paramAnonymousAdapterView);
        AboutFrag.this.clearAllVolleyCache();
        ToastFactory.showCenteredShortToast(c, "Location set to: " + paramAnonymousAdapterView.name() + "\n" + "Volley cache cleared.");
      }
    }
    
    public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
  };
  AdapterView.OnItemSelectedListener serverListener = new AdapterView.OnItemSelectedListener()
  {
    public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      setDevEnvironment(paramAnonymousInt);
    }
    
    public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
  };
  @InjectView(2131361899)
  TextView versionCodeView;
  @InjectView(2131361891)
  TextView versionStringView;
  
  private void clearAllVolleyCache()
  {
    VolleyRequestQueue.getInstance(c).getQueue().getCache().clear();
  }
  
  private String getEnviromentText()
  {
    String str = AppBuild.getEnvironment(getActivity());
    if ((str.equals("ENVIRONMENT.PROD")) || (str.equals("ENVIRONMENT.INT")) || (str.equals("ENVIRONMENT.TEST"))) {
      return str;
    }
    return "ENVIRONMENT.CUSTOM";
  }
  
  private void setContent()
  {
    if (!DedicatedAppManager.isDedicatedApp(c)) {
      aboutContent.setVisibility(0);
    }
    versionCodeView.setText(String.valueOf(AppBuild.getVersionCode(c)));
    versionStringView.setText(AppBuild.getVersionName(c));
    Object localObject = Build.MODEL;
    int i = Build.VERSION.SDK_INT;
    environmentTextView.setText(getEnviromentText());
    deviceTextView.setText((CharSequence)localObject);
    osTextView.setText(String.valueOf(i));
    localObject = rootFrag.findViewById(2131361894);
    if (PrefsUtil.getBoolean("dev_mode_enabled", false, c))
    {
      showDevModeIfEnabled();
      return;
    }
    PrefsUtil.putInt("dev_mode_times_pressed", 0, c);
    ((View)localObject).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AboutFrag.this.setDevMode();
      }
    });
  }
  
  private void setDevMode()
  {
    int i = PrefsUtil.getInt("dev_mode_times_pressed", 0, c) + 1;
    PrefsUtil.putInt("dev_mode_times_pressed", i, c);
    if ((i > 5) && (i < 10)) {
      ToastFactory.showCenteredShortToast(c, "press " + (10 - i) + " more times to enable dev mode");
    }
    while (i < 10) {
      return;
    }
    ToastFactory.showCenteredShortToast(c, "dev mode enabled");
    PrefsUtil.putBoolean("dev_mode_enabled", true, c);
    showDevModeIfEnabled();
  }
  
  private void showDevModeIfEnabled()
  {
    if (PrefsUtil.getBoolean("dev_mode_enabled", false, c))
    {
      devConsoleViewGroup.setVisibility(0);
      Object localObject = Arrays.asList(getResources().getStringArray(2131099650));
      ArrayAdapter localArrayAdapter = ArrayAdapter.createFromResource(c, 2131099650, 2130903147);
      localArrayAdapter.setDropDownViewResource(2130903146);
      localeSpinner.setAdapter(localArrayAdapter);
      localeSpinner.setOnItemSelectedListener(this);
      localeSpinner.setSelection(((List)localObject).indexOf(LocaleManager.getAppLanguage()));
      localObject = ArrayAdapter.createFromResource(c, 2131099651, 2130903147);
      ((ArrayAdapter)localObject).setDropDownViewResource(2130903146);
      envirnmentSpinner.setAdapter((SpinnerAdapter)localObject);
      envirnmentSpinner.setOnItemSelectedListener(null);
      getActivity().getResources().getStringArray(2131099651);
      localObject = AppBuild.getEnvironment(getActivity());
      envirnmentSpinner.setSelection(getPositionForEnvironment((String)localObject));
      envirnmentSpinner.setOnItemSelectedListener(serverListener);
      if (((String)localObject).equals("ENVIRONMENT.CUSTOM")) {
        mServerEditText.setText(AppBuild.getHostname(c));
      }
      loadPresetLocations();
    }
  }
  
  @OnClick({2131361909})
  void clearDatabase()
  {
    OrmDbHelper localOrmDbHelper = (OrmDbHelper)OpenHelperManager.getHelper(c, OrmDbHelper.class);
    localOrmDbHelper.getWritableDatabase();
    localOrmDbHelper.close();
    c.deleteDatabase("scfcache.db");
    ((OrmDbHelper)OpenHelperManager.getHelper(c, OrmDbHelper.class)).getWritableDatabase();
    ToastFactory.showCenteredShortToast(c, "Database reset. NOTE: App may crash on next db use.  This is expected, just start it again.");
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  int getPositionForEnvironment(String paramString)
  {
    if ("ENVIRONMENT.TEST".equals(paramString)) {}
    do
    {
      return 0;
      if ("ENVIRONMENT.PROD".equals(paramString)) {
        return 1;
      }
      if ("ENVIRONMENT.INT".equals(paramString)) {
        return 2;
      }
    } while (!"ENVIRONMENT.CUSTOM".equals(paramString));
    return 3;
  }
  
  @OnClick({2131362083})
  @Optional
  void launchMockLocationActivity()
  {
    Intent localIntent = new Intent("com.seeclickfix.actions.SHOW_MOCK_ACTIVITY");
    try
    {
      getActivity().startActivity(localIntent);
      return;
    }
    catch (Exception localException) {}
  }
  
  void loadPresetLocations()
  {
    Object localObject = TestLocationList.getPresetLocations(c);
    localObject = new ArrayAdapter(c, 2130903147, ((List)localObject).toArray());
    ((ArrayAdapter)localObject).setDropDownViewResource(2130903146);
    mPresetLocationSpinner.setAdapter((SpinnerAdapter)localObject);
    mPresetLocationSpinner.setOnItemSelectedListener(presetLocListener);
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
    getSherlockActivity().getSupportActionBar().setTitle(2131493058);
    setContent();
    setHasOptionsMenu(true);
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenu.clear();
    paramMenuInflater.inflate(2131623938, paramMenu);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903078, paramViewGroup, false));
    rootFrag.findViewById(2131361890).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        SimpleAlertDialog.create(GooglePlayServicesUtil.getOpenSourceSoftwareLicenseInfo(getActivity()), "").show(getActivity().getSupportFragmentManager(), "legal");
      }
    });
    MyApplication.inject(this);
    ButterKnife.inject(this, rootFrag);
    return rootFrag;
  }
  
  public void onItemSelected(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    LocaleManager.overrideLocale((String)paramAdapterView.getItemAtPosition(paramInt), getActivity().getApplication());
  }
  
  public void onNothingSelected(AdapterView<?> paramAdapterView) {}
  
  @OnClick({2131361910})
  void reloadCityData()
  {
    PrefsUtil.putBoolean("Pref:CITY_DATA_LOADED", false, c);
    Intent localIntent = new Intent();
    localIntent.setClass(c.getApplicationContext(), CityLoadingService.class);
    c.startService(localIntent);
    ToastFactory.showCenteredShortToast(c, "City data reloading...");
  }
  
  @OnClick({2131361903})
  void setCustomServer()
  {
    String str = mServerEditText.getText().toString();
    if (str.equals(""))
    {
      ToastFactory.showCenteredShortToast(c, "You must enter a server on format IP Address/Port");
      return;
    }
    AppBuild.setEnvironment(str, getActivity().getApplicationContext());
    TextView localTextView = (TextView)rootFrag.findViewById(2131361896);
    localTextView.setTextColor(-65536);
    localTextView.setText(getEnviromentText());
    AuthManager.logout(getActivity().getApplicationContext());
    ((MyApplication)getAppContext()).createV2Service();
    clearAllVolleyCache();
    ToastFactory.showCenteredShortToast(c, "Environment set to: http://" + str + "\n" + "You have been logged out." + "\n" + "Profile picture and name may not display correctly" + "\n" + "Volley cache cleared.");
    envirnmentSpinner.setSelection(getPositionForEnvironment("ENVIRONMENT.CUSTOM"));
    clearDraft();
  }
  
  @OnClick({2131361907})
  void setCustonLocation()
  {
    if ((mLatEditText.getText().toString().equals("")) || (mLngEditText.getText().toString().equals(""))) {
      ToastFactory.showCenteredShortToast(c, "You must enter a lat and a lng");
    }
    PresetLocation localPresetLocation;
    do
    {
      return;
      double d1 = Double.valueOf(mLatEditText.getText().toString()).doubleValue();
      double d2 = Double.valueOf(mLngEditText.getText().toString()).doubleValue();
      localPresetLocation = new PresetLocation().name("Custom").lat(d1).lng(d2).accuracy(100.0F).time(System.currentTimeMillis());
    } while (localPresetLocation.name().equals("(No location selected)"));
    mLocationAdapter.forceMockLocation(localPresetLocation);
    clearAllVolleyCache();
    ToastFactory.showCenteredShortToast(c, "Location set to: " + localPresetLocation.name() + "\n" + "Volley cache cleared.");
  }
  
  void setDevEnvironment(int paramInt)
  {
    getActivity().getResources().getStringArray(2131099651);
    Object localObject = AppBuild.getEnvironment(getActivity());
    String str = AppBuild.DEFAULT_ENVIRONMENT;
    switch (paramInt)
    {
    default: 
      str = AppBuild.DEFAULT_ENVIRONMENT;
    }
    for (;;)
    {
      if ((!((String)localObject).equals(str)) && (!str.equals("ENVIRONMENT.CUSTOM")))
      {
        AppBuild.setEnvironment(str, getActivity().getApplicationContext());
        mServerEditText.setText("");
        localObject = (TextView)rootFrag.findViewById(2131361896);
        ((TextView)localObject).setTextColor(-65536);
        ((TextView)localObject).setText(getEnviromentText());
        AuthManager.logout(getActivity().getApplicationContext());
        ((MyApplication)getAppContext()).createV2Service();
        clearAllVolleyCache();
        ToastFactory.showCenteredShortToast(c, "Environment set to: " + str + "\n" + "You have been logged out." + "\n" + "Profile picture and name may not display correctly" + "\n" + "Volley cache cleared.");
      }
      clearDraft();
      return;
      str = "ENVIRONMENT.TEST";
      continue;
      str = "ENVIRONMENT.PROD";
      continue;
      str = "ENVIRONMENT.INT";
      continue;
      str = "ENVIRONMENT.CUSTOM";
    }
  }
  
  @OnClick({2131361908})
  void stopFakingLocation()
  {
    mLocationAdapter.releaseLocationFaking();
    clearAllVolleyCache();
    ToastFactory.showCenteredShortToast(c, "Location faking stopped, location set to null, cache cleared");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.AboutFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */