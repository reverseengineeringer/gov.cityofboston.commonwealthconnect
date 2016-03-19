package com.seeclickfix.ma.android;

import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.support.v4.util.ArrayMap;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.google.common.base.Strings;
import com.seeclickfix.ma.android.api.SCFService;
import com.seeclickfix.ma.android.api.SCFService.APIv1;
import com.seeclickfix.ma.android.api.SCFService.APIv2;
import com.seeclickfix.ma.android.auth.LoginStateController;
import com.seeclickfix.ma.android.auth.PermissionManagerModule;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import com.seeclickfix.ma.android.dagger.AccountManagerModule;
import com.seeclickfix.ma.android.fragments.map.MapHelperModule;
import com.seeclickfix.ma.android.fragments.reporting.AccuracyWarningModule;
import com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZoneModule;
import com.seeclickfix.ma.android.fragments.reporting.NonDedicatedReqTypesMod;
import com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelperModule;
import com.seeclickfix.ma.android.fragments.reporting.ReportDbLoaderModule;
import com.seeclickfix.ma.android.fragments.reporting.ReportProviderInjector;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.modules.ContextModule;
import com.seeclickfix.ma.android.objects.modules.LocDialogLauncherModule;
import com.seeclickfix.ma.android.objects.modules.LocationAdapterModule;
import com.seeclickfix.ma.android.objects.modules.LocationEnabledModule;
import com.seeclickfix.ma.android.objects.modules.LocationUsingFragModule;
import com.seeclickfix.ma.android.objects.modules.MainModule;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.squareup.otto.Bus;
import com.squareup.otto.ThreadEnforcer;
import dagger.ObjectGraph;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MyApplication
  extends Application
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "MyApplication";
  private static Map<String, String> deviceParams;
  public static MyApplication instance;
  private static IssueModel issueModel = new IssueModel();
  protected static Bus mEventBus;
  private static ObjectGraph objectGraph;
  private static ReportModel reportModel = new ReportModel();
  public static Resources res;
  public static SCFService.APIv1 scfV1;
  public static SCFService.APIv2 scfV2;
  
  public static MyApplication from(Context paramContext)
  {
    return (MyApplication)paramContext.getApplicationContext();
  }
  
  public static Map<String, String> getDeviceParams()
  {
    return deviceParams;
  }
  
  public static Bus getEventBus()
  {
    return mEventBus;
  }
  
  public static IssueModel getIssueModel()
  {
    return issueModel;
  }
  
  public static ObjectGraph getObjectGraph()
  {
    return objectGraph;
  }
  
  public static ReportModel getReportModel()
  {
    return reportModel;
  }
  
  public static SCFService.APIv1 getScfV1()
  {
    return scfV1;
  }
  
  public static SCFService.APIv2 getScfV2()
  {
    return scfV2;
  }
  
  public static <T> T inject(T paramT)
  {
    return (T)objectGraph.inject(paramT);
  }
  
  public void createV1Service()
  {
    scfV1 = SCFService.createV1Service(getApplicationContext());
  }
  
  public void createV2Service()
  {
    scfV2 = SCFService.createV2Service(getApplicationContext());
  }
  
  public AuthUser currentUser()
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (0 == 0)
    {
      String str = PrefsUtil.getString("Pref:AUTH_USER_JSON", null, getApplicationContext());
      localObject1 = localObject2;
      if (!Strings.isNullOrEmpty(str)) {
        localObject1 = (AuthUser)new DeserializeResponse().getJavaObject(str, AuthUser.class).get(0);
      }
    }
    return (AuthUser)localObject1;
  }
  
  public MyApplication getInstance()
  {
    return instance;
  }
  
  protected List<Object> getModules()
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new MainModule());
    localArrayList.add(new ContextModule(this));
    localArrayList.add(new LocationAdapterModule());
    localArrayList.add(new LocationEnabledModule());
    localArrayList.add(new LocationUsingFragModule());
    localArrayList.add(new LocDialogLauncherModule());
    localArrayList.add(new MapHelperModule());
    localArrayList.add(new OutsideAreaHelperModule());
    localArrayList.add(new AccuracyWarningModule());
    localArrayList.add(new PermissionManagerModule());
    localArrayList.add(new DefaultOtherZoneModule());
    localArrayList.add(new ReportProviderInjector());
    localArrayList.add(new ReportDbLoaderModule());
    localArrayList.add(new AccountManagerModule());
    localArrayList.add(new NonDedicatedReqTypesMod());
    return localArrayList;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    LocaleManager.onConfigurationChange(paramConfiguration);
  }
  
  public void onCreate()
  {
    super.onCreate();
    objectGraph = ObjectGraph.create(getModules().toArray());
    LocaleManager.updateLocale(this);
    mEventBus = new Bus(ThreadEnforcer.MAIN);
    LoginStateController localLoginStateController = LoginStateController.getInstance();
    getEventBus().register(localLoginStateController);
    createV2Service();
    createV1Service();
    deviceParams = RequestFactory.addStaticParamsToMap(new ArrayMap(), getApplicationContext());
    VolleyRequestQueue.getInstance(getApplicationContext());
    res = getApplicationContext().getResources();
    instance = this;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.MyApplication
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */