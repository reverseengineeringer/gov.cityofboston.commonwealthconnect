package com.google.android.gms.maps;

import android.app.Activity;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.v4.app.Fragment;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.dynamic.a;
import com.google.android.gms.dynamic.e;
import com.google.android.gms.dynamic.f;
import com.google.android.gms.internal.jx;
import com.google.android.gms.maps.internal.IGoogleMapDelegate;
import com.google.android.gms.maps.internal.IMapFragmentDelegate;
import com.google.android.gms.maps.internal.MapLifecycleDelegate;
import com.google.android.gms.maps.internal.c;
import com.google.android.gms.maps.internal.m.a;
import com.google.android.gms.maps.internal.w;
import com.google.android.gms.maps.internal.x;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SupportMapFragment
  extends Fragment
{
  private GoogleMap akS;
  private final b alD = new b(this);
  
  public static SupportMapFragment newInstance()
  {
    return new SupportMapFragment();
  }
  
  public static SupportMapFragment newInstance(GoogleMapOptions paramGoogleMapOptions)
  {
    SupportMapFragment localSupportMapFragment = new SupportMapFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("MapOptions", paramGoogleMapOptions);
    localSupportMapFragment.setArguments(localBundle);
    return localSupportMapFragment;
  }
  
  @Deprecated
  public final GoogleMap getMap()
  {
    Object localObject = nN();
    if (localObject == null) {}
    for (;;)
    {
      return null;
      try
      {
        localObject = ((IMapFragmentDelegate)localObject).getMap();
        if (localObject == null) {
          continue;
        }
        if ((akS == null) || (akS.nC().asBinder() != ((IGoogleMapDelegate)localObject).asBinder())) {
          akS = new GoogleMap((IGoogleMapDelegate)localObject);
        }
        return akS;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }
  
  public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
  {
    jx.aU("getMapAsync must be called on the main thread.");
    alD.getMapAsync(paramOnMapReadyCallback);
  }
  
  protected IMapFragmentDelegate nN()
  {
    alD.nO();
    if (alD.je() == null) {
      return null;
    }
    return ((a)alD.je()).nN();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    if (paramBundle != null) {
      paramBundle.setClassLoader(SupportMapFragment.class.getClassLoader());
    }
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    b.a(alD, paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    alD.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return alD.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    alD.onDestroy();
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    alD.onDestroyView();
    super.onDestroyView();
  }
  
  public void onInflate(Activity paramActivity, AttributeSet paramAttributeSet, Bundle paramBundle)
  {
    super.onInflate(paramActivity, paramAttributeSet, paramBundle);
    b.a(alD, paramActivity);
    paramAttributeSet = GoogleMapOptions.createFromAttributes(paramActivity, paramAttributeSet);
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("MapOptions", paramAttributeSet);
    alD.onInflate(paramActivity, localBundle, paramBundle);
  }
  
  public void onLowMemory()
  {
    alD.onLowMemory();
    super.onLowMemory();
  }
  
  public void onPause()
  {
    alD.onPause();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    alD.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (paramBundle != null) {
      paramBundle.setClassLoader(SupportMapFragment.class.getClassLoader());
    }
    super.onSaveInstanceState(paramBundle);
    alD.onSaveInstanceState(paramBundle);
  }
  
  public void setArguments(Bundle paramBundle)
  {
    super.setArguments(paramBundle);
  }
  
  static class a
    implements MapLifecycleDelegate
  {
    private final Fragment Mx;
    private final IMapFragmentDelegate akT;
    
    public a(Fragment paramFragment, IMapFragmentDelegate paramIMapFragmentDelegate)
    {
      akT = ((IMapFragmentDelegate)jx.i(paramIMapFragmentDelegate));
      Mx = ((Fragment)jx.i(paramFragment));
    }
    
    public void getMapAsync(final OnMapReadyCallback paramOnMapReadyCallback)
    {
      try
      {
        akT.getMapAsync(new m.a()
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
    
    public IMapFragmentDelegate nN()
    {
      return akT;
    }
    
    public void onCreate(Bundle paramBundle)
    {
      Bundle localBundle = paramBundle;
      if (paramBundle == null) {}
      try
      {
        localBundle = new Bundle();
        paramBundle = Mx.getArguments();
        if ((paramBundle != null) && (paramBundle.containsKey("MapOptions"))) {
          w.a(localBundle, "MapOptions", paramBundle.getParcelable("MapOptions"));
        }
        akT.onCreate(localBundle);
        return;
      }
      catch (RemoteException paramBundle)
      {
        throw new RuntimeRemoteException(paramBundle);
      }
    }
    
    public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
    {
      try
      {
        paramLayoutInflater = akT.onCreateView(e.k(paramLayoutInflater), e.k(paramViewGroup), paramBundle);
        return (View)e.f(paramLayoutInflater);
      }
      catch (RemoteException paramLayoutInflater)
      {
        throw new RuntimeRemoteException(paramLayoutInflater);
      }
    }
    
    public void onDestroy()
    {
      try
      {
        akT.onDestroy();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onDestroyView()
    {
      try
      {
        akT.onDestroyView();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      paramBundle1 = (GoogleMapOptions)paramBundle1.getParcelable("MapOptions");
      try
      {
        akT.onInflate(e.k(paramActivity), paramBundle1, paramBundle2);
        return;
      }
      catch (RemoteException paramActivity)
      {
        throw new RuntimeRemoteException(paramActivity);
      }
    }
    
    public void onLowMemory()
    {
      try
      {
        akT.onLowMemory();
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
        akT.onPause();
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
        akT.onResume();
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
        akT.onSaveInstanceState(paramBundle);
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
    extends a<SupportMapFragment.a>
  {
    private final Fragment Mx;
    protected f<SupportMapFragment.a> akW;
    private final List<OnMapReadyCallback> akX = new ArrayList();
    private Activity nB;
    
    b(Fragment paramFragment)
    {
      Mx = paramFragment;
    }
    
    private void setActivity(Activity paramActivity)
    {
      nB = paramActivity;
      nO();
    }
    
    protected void a(f<SupportMapFragment.a> paramf)
    {
      akW = paramf;
      nO();
    }
    
    public void getMapAsync(OnMapReadyCallback paramOnMapReadyCallback)
    {
      if (je() != null)
      {
        ((SupportMapFragment.a)je()).getMapAsync(paramOnMapReadyCallback);
        return;
      }
      akX.add(paramOnMapReadyCallback);
    }
    
    public void nO()
    {
      if ((nB != null) && (akW != null) && (je() == null)) {}
      try
      {
        MapsInitializer.initialize(nB);
        Object localObject = x.S(nB).j(e.k(nB));
        akW.a(new SupportMapFragment.a(Mx, (IMapFragmentDelegate)localObject));
        localObject = akX.iterator();
        while (((Iterator)localObject).hasNext())
        {
          OnMapReadyCallback localOnMapReadyCallback = (OnMapReadyCallback)((Iterator)localObject).next();
          ((SupportMapFragment.a)je()).getMapAsync(localOnMapReadyCallback);
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
 * Qualified Name:     com.google.android.gms.maps.SupportMapFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */