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
import com.google.android.gms.maps.internal.IStreetViewPanoramaDelegate;
import com.google.android.gms.maps.internal.IStreetViewPanoramaFragmentDelegate;
import com.google.android.gms.maps.internal.StreetViewLifecycleDelegate;
import com.google.android.gms.maps.internal.c;
import com.google.android.gms.maps.internal.u.a;
import com.google.android.gms.maps.internal.w;
import com.google.android.gms.maps.internal.x;
import com.google.android.gms.maps.model.RuntimeRemoteException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SupportStreetViewPanoramaFragment
  extends Fragment
{
  private final b alF = new b(this);
  private StreetViewPanorama alm;
  
  public static SupportStreetViewPanoramaFragment newInstance()
  {
    return new SupportStreetViewPanoramaFragment();
  }
  
  public static SupportStreetViewPanoramaFragment newInstance(StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
  {
    SupportStreetViewPanoramaFragment localSupportStreetViewPanoramaFragment = new SupportStreetViewPanoramaFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("StreetViewPanoramaOptions", paramStreetViewPanoramaOptions);
    localSupportStreetViewPanoramaFragment.setArguments(localBundle);
    return localSupportStreetViewPanoramaFragment;
  }
  
  @Deprecated
  public final StreetViewPanorama getStreetViewPanorama()
  {
    Object localObject = nR();
    if (localObject == null) {}
    for (;;)
    {
      return null;
      try
      {
        localObject = ((IStreetViewPanoramaFragmentDelegate)localObject).getStreetViewPanorama();
        if (localObject == null) {
          continue;
        }
        if ((alm == null) || (alm.nQ().asBinder() != ((IStreetViewPanoramaDelegate)localObject).asBinder())) {
          alm = new StreetViewPanorama((IStreetViewPanoramaDelegate)localObject);
        }
        return alm;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
  }
  
  public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
  {
    jx.aU("getStreetViewPanoramaAsync() must be called on the main thread");
    alF.getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
  }
  
  protected IStreetViewPanoramaFragmentDelegate nR()
  {
    alF.nO();
    if (alF.je() == null) {
      return null;
    }
    return ((a)alF.je()).nR();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    if (paramBundle != null) {
      paramBundle.setClassLoader(SupportStreetViewPanoramaFragment.class.getClassLoader());
    }
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    b.a(alF, paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    alF.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return alF.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    alF.onDestroy();
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    alF.onDestroyView();
    super.onDestroyView();
  }
  
  public void onInflate(Activity paramActivity, AttributeSet paramAttributeSet, Bundle paramBundle)
  {
    super.onInflate(paramActivity, paramAttributeSet, paramBundle);
    b.a(alF, paramActivity);
    paramAttributeSet = new Bundle();
    alF.onInflate(paramActivity, paramAttributeSet, paramBundle);
  }
  
  public void onLowMemory()
  {
    alF.onLowMemory();
    super.onLowMemory();
  }
  
  public void onPause()
  {
    alF.onPause();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    alF.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (paramBundle != null) {
      paramBundle.setClassLoader(SupportStreetViewPanoramaFragment.class.getClassLoader());
    }
    super.onSaveInstanceState(paramBundle);
    alF.onSaveInstanceState(paramBundle);
  }
  
  public void setArguments(Bundle paramBundle)
  {
    super.setArguments(paramBundle);
  }
  
  static class a
    implements StreetViewLifecycleDelegate
  {
    private final Fragment Mx;
    private final IStreetViewPanoramaFragmentDelegate aln;
    
    public a(Fragment paramFragment, IStreetViewPanoramaFragmentDelegate paramIStreetViewPanoramaFragmentDelegate)
    {
      aln = ((IStreetViewPanoramaFragmentDelegate)jx.i(paramIStreetViewPanoramaFragmentDelegate));
      Mx = ((Fragment)jx.i(paramFragment));
    }
    
    public void getStreetViewPanoramaAsync(final OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      try
      {
        aln.getStreetViewPanoramaAsync(new u.a()
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
    
    public IStreetViewPanoramaFragmentDelegate nR()
    {
      return aln;
    }
    
    public void onCreate(Bundle paramBundle)
    {
      Bundle localBundle = paramBundle;
      if (paramBundle == null) {}
      try
      {
        localBundle = new Bundle();
        paramBundle = Mx.getArguments();
        if ((paramBundle != null) && (paramBundle.containsKey("StreetViewPanoramaOptions"))) {
          w.a(localBundle, "StreetViewPanoramaOptions", paramBundle.getParcelable("StreetViewPanoramaOptions"));
        }
        aln.onCreate(localBundle);
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
        paramLayoutInflater = aln.onCreateView(e.k(paramLayoutInflater), e.k(paramViewGroup), paramBundle);
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
        aln.onDestroy();
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
        aln.onDestroyView();
        return;
      }
      catch (RemoteException localRemoteException)
      {
        throw new RuntimeRemoteException(localRemoteException);
      }
    }
    
    public void onInflate(Activity paramActivity, Bundle paramBundle1, Bundle paramBundle2)
    {
      try
      {
        aln.onInflate(e.k(paramActivity), null, paramBundle2);
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
        aln.onLowMemory();
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
        aln.onPause();
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
        aln.onResume();
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
        aln.onSaveInstanceState(paramBundle);
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
    extends a<SupportStreetViewPanoramaFragment.a>
  {
    private final Fragment Mx;
    protected f<SupportStreetViewPanoramaFragment.a> akW;
    private final List<OnStreetViewPanoramaReadyCallback> alq = new ArrayList();
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
    
    protected void a(f<SupportStreetViewPanoramaFragment.a> paramf)
    {
      akW = paramf;
      nO();
    }
    
    public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      if (je() != null)
      {
        ((SupportStreetViewPanoramaFragment.a)je()).getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
        return;
      }
      alq.add(paramOnStreetViewPanoramaReadyCallback);
    }
    
    public void nO()
    {
      if ((nB != null) && (akW != null) && (je() == null)) {}
      try
      {
        MapsInitializer.initialize(nB);
        Object localObject = x.S(nB).k(e.k(nB));
        akW.a(new SupportStreetViewPanoramaFragment.a(Mx, (IStreetViewPanoramaFragmentDelegate)localObject));
        localObject = alq.iterator();
        while (((Iterator)localObject).hasNext())
        {
          OnStreetViewPanoramaReadyCallback localOnStreetViewPanoramaReadyCallback = (OnStreetViewPanoramaReadyCallback)((Iterator)localObject).next();
          ((SupportStreetViewPanoramaFragment.a)je()).getStreetViewPanoramaAsync(localOnStreetViewPanoramaReadyCallback);
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
 * Qualified Name:     com.google.android.gms.maps.SupportStreetViewPanoramaFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */