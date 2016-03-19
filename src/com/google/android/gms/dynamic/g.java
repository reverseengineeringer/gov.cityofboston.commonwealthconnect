package com.google.android.gms.dynamic;

import android.content.Context;
import android.os.IBinder;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.jx;

public abstract class g<T>
{
  private final String TI;
  private T TJ;
  
  protected g(String paramString)
  {
    TI = paramString;
  }
  
  protected final T L(Context paramContext)
    throws g.a
  {
    if (TJ == null)
    {
      jx.i(paramContext);
      paramContext = GooglePlayServicesUtil.getRemoteContext(paramContext);
      if (paramContext == null) {
        throw new a("Could not get remote context.");
      }
      paramContext = paramContext.getClassLoader();
    }
    try
    {
      TJ = d((IBinder)paramContext.loadClass(TI).newInstance());
      return (T)TJ;
    }
    catch (ClassNotFoundException paramContext)
    {
      throw new a("Could not load creator class.", paramContext);
    }
    catch (InstantiationException paramContext)
    {
      throw new a("Could not instantiate creator.", paramContext);
    }
    catch (IllegalAccessException paramContext)
    {
      throw new a("Could not access creator.", paramContext);
    }
  }
  
  protected abstract T d(IBinder paramIBinder);
  
  public static class a
    extends Exception
  {
    public a(String paramString)
    {
      super();
    }
    
    public a(String paramString, Throwable paramThrowable)
    {
      super(paramThrowable);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.dynamic.g
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */