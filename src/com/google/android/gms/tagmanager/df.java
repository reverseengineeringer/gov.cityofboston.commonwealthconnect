package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Logger;
import com.google.android.gms.analytics.Tracker;

class df
{
  private Context mContext;
  private Tracker yO;
  private GoogleAnalytics yQ;
  
  df(Context paramContext)
  {
    mContext = paramContext;
  }
  
  private void cX(String paramString)
  {
    try
    {
      if (yQ == null)
      {
        yQ = GoogleAnalytics.getInstance(mContext);
        yQ.setLogger(new a());
        yO = yQ.newTracker(paramString);
      }
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public Tracker cW(String paramString)
  {
    cX(paramString);
    return yO;
  }
  
  static class a
    implements Logger
  {
    private static int fP(int paramInt)
    {
      switch (paramInt)
      {
      case 6: 
      default: 
        return 3;
      case 5: 
        return 2;
      case 3: 
      case 4: 
        return 1;
      }
      return 0;
    }
    
    public void error(Exception paramException)
    {
      bh.b("", paramException);
    }
    
    public void error(String paramString)
    {
      bh.T(paramString);
    }
    
    public int getLogLevel()
    {
      return fP(bh.getLogLevel());
    }
    
    public void info(String paramString)
    {
      bh.U(paramString);
    }
    
    public void setLogLevel(int paramInt)
    {
      bh.W("GA uses GTM logger. Please use TagManager.setLogLevel(int) instead.");
    }
    
    public void verbose(String paramString)
    {
      bh.V(paramString);
    }
    
    public void warn(String paramString)
    {
      bh.W(paramString);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.tagmanager.df
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */