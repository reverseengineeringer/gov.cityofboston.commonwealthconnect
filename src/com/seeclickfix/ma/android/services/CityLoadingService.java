package com.seeclickfix.ma.android.services;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.IBinder;
import android.util.Log;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.j256.ormlite.android.apptools.OpenHelperManager;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.db.OrmDbHelper;
import com.seeclickfix.ma.android.objects.loc.City;
import com.seeclickfix.ma.android.providers.DataProvider;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;

public class CityLoadingService
  extends Service
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "CityLoadingService";
  private Context c;
  private Dao<City, Integer> dao;
  private LoadCityThread loadCityThread;
  private List<String> sqlArray;
  
  private void executeInserts()
  {
    Log.v("sqlArray ", "" + sqlArray.size());
    try
    {
      long l1 = System.currentTimeMillis();
      long l2 = dao.countOf();
      Log.v("countOf ", "count:" + l2 + " time:" + (System.currentTimeMillis() - l1) + "ms");
      if (sqlArray.size() < (int)l2) {
        return;
      }
      Object localObject = new ArrayList();
      int j = sqlArray.size();
      int i = 0;
      while (i < j)
      {
        ((List)localObject).add(new ArrayList(sqlArray.subList(i, Math.min(j, i + 100))));
        i += 100;
      }
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        List localList = (List)((Iterator)localObject).next();
        dao.callBatchTasks(getCallableForChunk(localList));
      }
      return;
    }
    catch (SQLException localSQLException)
    {
      Log.e("CityLoadingService", "" + localSQLException);
      return;
      PrefsUtil.putBoolean("Pref:CITY_DATA_LOADED", true, getApplicationContext());
      return;
    }
    catch (Exception localException)
    {
      Log.e("CityLoadingService", "" + localException);
      localException.printStackTrace();
    }
  }
  
  private Callable<Void> getCallableForChunk(final List<String> paramList)
  {
    new Callable()
    {
      public Void call()
        throws Exception
      {
        int i = 0;
        Iterator localIterator = paramList.iterator();
        while (localIterator.hasNext())
        {
          String str = (String)localIterator.next();
          i += dao.executeRaw(str, new String[0]);
        }
        Log.v("numInserted ", "" + i);
        return null;
      }
    };
  }
  
  private void initDatabase(Context paramContext)
  {
    paramContext = (OrmDbHelper)OpenHelperManager.getHelper(paramContext, OrmDbHelper.class);
    try
    {
      dao = paramContext.getCityDao();
      return;
    }
    catch (SQLException paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  private void readSql(Context paramContext)
  {
    sqlArray = new ArrayList();
    try
    {
      paramContext = new BufferedReader(new InputStreamReader(paramContext.getResources().openRawResource(2131034112)));
      for (;;)
      {
        String str = paramContext.readLine();
        if (str == null) {
          break;
        }
        sqlArray.add(str);
      }
      paramContext.close();
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
      return;
    }
  }
  
  private void startCityLoad(Context paramContext)
  {
    loadCityThread = new LoadCityThread(paramContext);
    loadCityThread.setPriority(1);
    loadCityThread.start();
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }
  
  public void onCreate()
  {
    super.onCreate();
    c = getApplicationContext();
    DataProvider.initCursor(c);
    if (!PrefsUtil.getBoolean("Pref:CITY_DATA_LOADED", false, c))
    {
      initDatabase(c);
      startCityLoad(c);
    }
  }
  
  private class LoadCityThread
    extends Thread
  {
    private Context ctx;
    
    public LoadCityThread(Context paramContext)
    {
      ctx = paramContext;
    }
    
    public void run()
    {
      CityLoadingService.this.readSql(ctx);
      CityLoadingService.this.executeInserts();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.services.CityLoadingService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */