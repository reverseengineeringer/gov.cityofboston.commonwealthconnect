package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.auth.PermissionsManager;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class FeedFrag$$InjectAdapter
  extends Binding<FeedFrag>
  implements Provider<FeedFrag>, MembersInjector<FeedFrag>
{
  private Binding<LocationAdapter> locationAdapter;
  private Binding<PermissionsManager> mPermissionsManager;
  private Binding<BaseFrag> supertype;
  
  public FeedFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.FeedFrag", "members/com.seeclickfix.ma.android.fragments.FeedFrag", false, FeedFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    locationAdapter = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationAdapter", FeedFrag.class, getClass().getClassLoader());
    mPermissionsManager = paramLinker.requestBinding("com.seeclickfix.ma.android.auth.PermissionsManager", FeedFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", FeedFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public FeedFrag get()
  {
    FeedFrag localFeedFrag = new FeedFrag();
    injectMembers(localFeedFrag);
    return localFeedFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(locationAdapter);
    paramSet2.add(mPermissionsManager);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(FeedFrag paramFeedFrag)
  {
    locationAdapter = ((LocationAdapter)locationAdapter.get());
    mPermissionsManager = ((PermissionsManager)mPermissionsManager.get());
    supertype.injectMembers(paramFeedFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */