package com.google.android.gms.maps;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.a;
import com.google.android.gms.dynamic.e;
import com.google.android.gms.dynamic.f;
import com.google.android.gms.internal.jx;
import com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate;
import com.google.android.gms.maps.internal.IStreetViewPanoramaViewDelegate;
import com.google.android.gms.maps.internal.StreetViewLifecycleDelegate;
import com.google.android.gms.maps.internal.c;
import com.google.android.gms.maps.internal.u.a;
import com.google.android.gms.maps.internal.x;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class StreetViewPanoramaView
  extends FrameLayout
{
  private StreetViewPanorama alm;
  private final b aly;
  
  public StreetViewPanoramaView(Context paramContext)
  {
    super(paramContext);
    aly = new b(this, paramContext, null);
  }
  
  public StreetViewPanoramaView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    aly = new b(this, paramContext, null);
  }
  
  public StreetViewPanoramaView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    aly = new b(this, paramContext, null);
  }
  
  public StreetViewPanoramaView(Context paramContext, StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
  {
    super(paramContext);
    aly = new b(this, paramContext, paramStreetViewPanoramaOptions);
  }
  
  @Deprecated
  public final StreetViewPanorama getStreetViewPanorama()
  {
    if (alm != null) {
      return alm;
    }
    aly.nO();
    if (aly.je() == null) {
      return null;
    }
    try
    {
      alm = new StreetViewPanorama(((a)aly.je()).nV().getStreetViewPanorama());
      return alm;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
  {
    jx.aU("getStreetViewPanoramaAsync() must be called on the main thread");
    aly.getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
  }
  
  public final void onCreate(Bundle paramBundle)
  {
    aly.onCreate(paramBundle);
    if (aly.je() == null) {
      a.b(this);
    }
  }
  
  public final void onDestroy()
  {
    aly.onDestroy();
  }
  
  public final void onLowMemory()
  {
    aly.onLowMemory();
  }
  
  public final void onPause()
  {
    aly.onPause();
  }
  
  public final void onResume()
  {
    aly.onResume();
  }
  
  public final void onSaveInstanceState(Bundle paramBundle)
  {
    aly.onSaveInstanceState(paramBundle);
  }
  
  static class a
    implements StreetViewLifecycleDelegate
  {
    private final ViewGroup akZ;
    private View alA;
    private final IStreetViewPanoramaViewDelegate alz;
    
    public a(ViewGroup paramViewGroup, IStreetViewPanoramaViewDelegate paramIStreetViewPanoramaViewDelegate)
    {
      alz = ((IStreetViewPanoramaViewDelegate)jx.i(paramIStreetViewPanoramaViewDelegate));
      akZ = ((ViewGroup)jx.i(paramViewGroup));
    }
    
    public void getStreetViewPanoramaAsync(final OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      try
      {
        alz.getStreetViewPanoramaAsync(new u.a()
        {
          public void a(IStreetViewPanoramaDelegate paramAnonymousIStreetViewPanoramaDelegate)
            throws RemoteException
          {
            paramOnStreetViewPanoramaReadyCallback.onStreetViewPanoramaReady(new StreetViewPanorama(paramAnonymousIStreetViewPanoramaDelegate));
          }
        });
        return;
      }
      catch (RemoteException paramOnStreetViewPanoramaReadyCallback)
      {
        throw new RuntimeRemoteException(paramOnStreetViewPanoramaReadyCallback);
      }
    }
    
    public IStreetViewPanoramaViewDelegate nV()
    {
      return alz;
    }
    
    public void onCreate(Bundle paramBundle)
    {
      try
      {
        alz.onCreate(paramBundle);
        alA = ((View)e.f(alz.getView()));
        akZ.removeAllViews();
        akZ.addView(alA);
        return;
      }
      catch (RemoteException paramBundle)
      {
        throw new RuntimeRemoteException(paramBundle);
      }
    }
    
    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      throw new UnsupportedOperationException("onCreateView not allowed on StreetViewPanoramaViewDelegate");
    }
    
    public void onDestroy()
    {
      try
      {
        alz.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onDestroyView()
    {
      throw new UnsupportedOperationException("onDestroyView not allowed on StreetViewPanoramaViewDelegate");
    }
    
    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      throw new UnsupportedOperationException("onInflate not allowed on StreetViewPanoramaViewDelegate");
    }
    
    public void onLowMemory()
    {
      try
      {
        alz.onLowMemory();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onPause()
    {
      try
      {
        alz.onPause();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onResume()
    {
      try
      {
        alz.onResume();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onSaveInstanceState(Bundle paramBundle)
    {
      try
      {
        alz.onSaveInstanceState(paramBundle);
        return;
      }
      catch (RemoteException paramBundle)
      {
        throw new RuntimeRemoteException(paramBundle);
      }
    }
    
    public void onStart() {}
    
    public void onStop() {}
  }
  
  static class b
    extends a<StreetViewPanoramaView.a>
  {
    protected f<StreetViewPanoramaView.a> akW;
    private final StreetViewPanoramaOptions alC;
    private final ViewGroup ald;
    private final List<OnStreetViewPanoramaReadyCallback> alq = new ArrayList();
    private final Context mContext;
    
    b(ViewGroup paramViewGroup, Context paramContext, StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
    {
      ald = paramViewGroup;
      mContext = paramContext;
      alC = paramStreetViewPanoramaOptions;
    }
    
    protected void a(f<StreetViewPanoramaView.a> paramf)
    {
      akW = paramf;
      nO();
    }
    
    public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      if (je() != null)
      {
        ((StreetViewPanoramaView.a)je()).getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
        return;
      }
      alq.add(paramOnStreetViewPanoramaReadyCallback);
    }
    
    public void nO()
    {
      if ((akW != null) && (je() == null)) {}
      try
      {
        Object localObject = x.S(mContext).a(e.k(mContext), alC);
        akW.a(new StreetViewPanoramaView.a(ald, (IStreetViewPanoramaViewDelegate)localObject));
        localObject = alq.iterator();
        while (((Iterator)localObject).hasNext())
        {
          OnStreetViewPanoramaReadyCallback localOnStreetViewPanoramaReadyCallback = (OnStreetViewPanoramaReadyCallback)((Iterator)localObject).next();
          ((StreetViewPanoramaView.a)je()).getStreetViewPanoramaAsync(localOnStreetViewPanoramaReadyCallback);
        }
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
        alq.clear();
        return;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException) {}
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.maps.StreetViewPanoramaView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */