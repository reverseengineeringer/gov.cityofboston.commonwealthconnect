package com.google.android.gms.maps;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.os.RemoteException;
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

public class StreetViewPanoramaFragment
  extends Fragment
{
  private final b all = new b(this);
  private StreetViewPanorama alm;
  
  public static StreetViewPanoramaFragment newInstance()
  {
    return new StreetViewPanoramaFragment();
  }
  
  public static StreetViewPanoramaFragment newInstance(StreetViewPanoramaOptions paramStreetViewPanoramaOptions)
  {
    StreetViewPanoramaFragment localStreetViewPanoramaFragment = new StreetViewPanoramaFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("StreetViewPanoramaOptions", paramStreetViewPanoramaOptions);
    localStreetViewPanoramaFragment.setArguments(localBundle);
    return localStreetViewPanoramaFragment;
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
    all.getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
  }
  
  protected IStreetViewPanoramaFragmentDelegate nR()
  {
    all.nO();
    if (all.je() == null) {
      return null;
    }
    return ((a)all.je()).nR();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    if (paramBundle != null) {
      paramBundle.setClassLoader(StreetViewPanoramaFragment.class.getClassLoader());
    }
    super.onActivityCreated(paramBundle);
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    b.a(all, paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    all.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return all.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
  }
  
  public void onDestroy()
  {
    all.onDestroy();
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    all.onDestroyView();
    super.onDestroyView();
  }
  
  public void onInflate(Activity paramActivity, AttributeSet paramAttributeSet, Bundle paramBundle)
  {
    super.onInflate(paramActivity, paramAttributeSet, paramBundle);
    b.a(all, paramActivity);
    paramAttributeSet = new Bundle();
    all.onInflate(paramActivity, paramAttributeSet, paramBundle);
  }
  
  public void onLowMemory()
  {
    all.onLowMemory();
    super.onLowMemory();
  }
  
  public void onPause()
  {
    all.onPause();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    all.onResume();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (paramBundle != null) {
      paramBundle.setClassLoader(StreetViewPanoramaFragment.class.getClassLoader());
    }
    super.onSaveInstanceState(paramBundle);
    all.onSaveInstanceState(paramBundle);
  }
  
  public void setArguments(Bundle paramBundle)
  {
    super.setArguments(paramBundle);
  }
  
  static class a
    implements StreetViewLifecycleDelegate
  {
    private final Fragment TG;
    private final IStreetViewPanoramaFragmentDelegate aln;
    
    public a(Fragment paramFragment, IStreetViewPanoramaFragmentDelegate paramIStreetViewPanoramaFragmentDelegate)
    {
      aln = ((IStreetViewPanoramaFragmentDelegate)jx.i(paramIStreetViewPanoramaFragmentDelegate));
      TG = ((Fragment)jx.i(paramFragment));
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
        paramBundle = TG.getArguments();
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
    extends a<StreetViewPanoramaFragment.a>
  {
    private final Fragment TG;
    protected f<StreetViewPanoramaFragment.a> akW;
    private final List<OnStreetViewPanoramaReadyCallback> alq = new ArrayList();
    private Activity nB;
    
    b(Fragment paramFragment)
    {
      TG = paramFragment;
    }
    
    private void setActivity(Activity paramActivity)
    {
      nB = paramActivity;
      nO();
    }
    
    protected void a(f<StreetViewPanoramaFragment.a> paramf)
    {
      akW = paramf;
      nO();
    }
    
    public void getStreetViewPanoramaAsync(OnStreetViewPanoramaReadyCallback paramOnStreetViewPanoramaReadyCallback)
    {
      if (je() != null)
      {
        ((StreetViewPanoramaFragment.a)je()).getStreetViewPanoramaAsync(paramOnStreetViewPanoramaReadyCallback);
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
        akW.a(new StreetViewPanoramaFragment.a(TG, (IStreetViewPanoramaFragmentDelegate)localObject));
        localObject = alq.iterator();
        while (((Iterator)localObject).hasNext())
        {
          OnStreetViewPanoramaReadyCallback localOnStreetViewPanoramaReadyCallback = (OnStreetViewPanoramaReadyCallback)((Iterator)localObject).next();
          ((StreetViewPanoramaFragment.a)je()).getStreetViewPanoramaAsync(localOnStreetViewPanoramaReadyCallback);
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
 * Qualified Name:     com.google.android.gms.maps.StreetViewPanoramaFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */