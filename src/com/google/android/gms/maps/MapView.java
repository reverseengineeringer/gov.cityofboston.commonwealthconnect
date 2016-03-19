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
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.IMapViewDelegate;
import com.google.android.gms.maps.internal.MapLifecycleDelegate;
import com.google.android.gms.maps.internal.c;
import com.google.android.gms.maps.internal.m.a;
import com.google.android.gms.maps.internal.x;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MapView
  extends FrameLayout
{
  private GoogleMap akS;
  private final b akY;
  
  public MapView(Context paramContext)
  {
    super(paramContext);
    akY = new b(this, paramContext, null);
  }
  
  public MapView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    akY = new b(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }
  
  public MapView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    akY = new b(this, paramContext, GoogleMapOptions.createFromAttributes(paramContext, paramAttributeSet));
  }
  
  public MapView(Context paramContext, GoogleMapOptions paramGoogleMapOptions)
  {
    super(paramContext);
    akY = new b(this, paramContext, paramGoogleMapOptions);
  }
  
  @Deprecated
  public final GoogleMap getMap()
  {
    if (akS != null) {
      return akS;
    }
    akY.nO();
    if (akY.je() == null) {
      return null;
    }
    try
    {
      akS = new GoogleMap(((a)akY.je()).nP().getMap());
      return akS;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeRemoteException(localRemoteException);
    }
  }
  
  public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
  {
    jx.aU("getMapAsync() must be called on the main thread");
    akY.getMapAsync(paramOnMapReadyCallback);
  }
  
  public final void onCreate(Bundle paramBundle)
  {
    akY.onCreate(paramBundle);
    if (akY.je() == null) {
      a.b(this);
    }
  }
  
  public final void onDestroy()
  {
    akY.onDestroy();
  }
  
  public final void onLowMemory()
  {
    akY.onLowMemory();
  }
  
  public final void onPause()
  {
    akY.onPause();
  }
  
  public final void onResume()
  {
    akY.onResume();
  }
  
  public final void onSaveInstanceState(Bundle paramBundle)
  {
    akY.onSaveInstanceState(paramBundle);
  }
  
  static class a
    implements MapLifecycleDelegate
  {
    private final ViewGroup akZ;
    private final IMapViewDelegate ala;
    private View alb;
    
    public a(ViewGroup paramViewGroup, IMapViewDelegate paramIMapViewDelegate)
    {
      ala = ((IMapViewDelegate)jx.i(paramIMapViewDelegate));
      akZ = ((ViewGroup)jx.i(paramViewGroup));
    }
    
    public void getMapAsync(final OnMapReadyCallback paramOnMapReadyCallback)
    {
      try
      {
        ala.getMapAsync(new m.a()
        {
          public void a(IGoogleMapDelegate paramAnonymousIGoogleMapDelegate)
            throws RemoteException
          {
            paramOnMapReadyCallback.onMapReady(new GoogleMap(paramAnonymousIGoogleMapDelegate));
          }
        });
        return;
      }
      catch (RemoteException paramOnMapReadyCallback)
      {
        throw new RuntimeRemoteException(paramOnMapReadyCallback);
      }
    }
    
    public IMapViewDelegate nP()
    {
      return ala;
    }
    
    public void onCreate(Bundle paramBundle)
    {
      try
      {
        ala.onCreate(paramBundle);
        alb = ((View)e.f(ala.getView()));
        akZ.removeAllViews();
        akZ.addView(alb);
        return;
      }
      catch (RemoteException paramBundle)
      {
        throw new RuntimeRemoteException(paramBundle);
      }
    }
    
    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      throw new UnsupportedOperationException("onCreateView not allowed on MapViewDelegate");
    }
    
    public void onDestroy()
    {
      try
      {
        ala.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onDestroyView()
    {
      throw new UnsupportedOperationException("onDestroyView not allowed on MapViewDelegate");
    }
    
    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      throw new UnsupportedOperationException("onInflate not allowed on MapViewDelegate");
    }
    
    public void onLowMemory()
    {
      try
      {
        ala.onLowMemory();
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
        ala.onPause();
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
        ala.onResume();
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
        ala.onSaveInstanceState(paramBundle);
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
    extends a<MapView.a>
  {
    protected f<MapView.a> akW;
    private final List<OnMapReadyCallback> akX = new ArrayList();
    private final ViewGroup ald;
    private final GoogleMapOptions ale;
    private final Context mContext;
    
    b(ViewGroup paramViewGroup, Context paramContext, GoogleMapOptions paramGoogleMapOptions)
    {
      ald = paramViewGroup;
      mContext = paramContext;
      ale = paramGoogleMapOptions;
    }
    
    protected void a(f<MapView.a> paramf)
    {
      akW = paramf;
      nO();
    }
    
    public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
    {
      if (je() != null)
      {
        ((MapView.a)je()).getMapAsync(paramOnMapReadyCallback);
        return;
      }
      akX.add(paramOnMapReadyCallback);
    }
    
    public void nO()
    {
      if ((akW != null) && (je() == null)) {}
      try
      {
        Object localObject = x.S(mContext).a(e.k(mContext), ale);
        akW.a(new MapView.a(ald, (IMapViewDelegate)localObject));
        localObject = akX.iterator();
        while (((Iterator)localObject).hasNext())
        {
          OnMapReadyCallback localOnMapReadyCallback = (OnMapReadyCallback)((Iterator)localObject).next();
          ((MapView.a)je()).getMapAsync(localOnMapReadyCallback);
        }
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
        akX.clear();
        return;
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException) {}
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.maps.MapView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */