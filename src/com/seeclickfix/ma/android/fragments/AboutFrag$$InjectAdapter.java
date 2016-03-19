package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class AboutFrag$$InjectAdapter
  extends Binding<AboutFrag>
  implements Provider<AboutFrag>, MembersInjector<AboutFrag>
{
  private Binding<LocationAdapter> mLocationAdapter;
  private Binding<BaseFrag> supertype;
  
  public AboutFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.AboutFrag", "members/com.seeclickfix.ma.android.fragments.AboutFrag", false, AboutFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mLocationAdapter = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationAdapter", AboutFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", AboutFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public AboutFrag get()
  {
    AboutFrag localAboutFrag = new AboutFrag();
    injectMembers(localAboutFrag);
    return localAboutFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mLocationAdapter);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(AboutFrag paramAboutFrag)
  {
    mLocationAdapter = ((LocationAdapter)mLocationAdapter.get());
    supertype.injectMembers(paramAboutFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.AboutFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */