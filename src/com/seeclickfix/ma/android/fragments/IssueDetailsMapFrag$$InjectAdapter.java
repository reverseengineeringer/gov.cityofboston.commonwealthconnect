package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class IssueDetailsMapFrag$$InjectAdapter
  extends Binding<IssueDetailsMapFrag>
  implements Provider<IssueDetailsMapFrag>, MembersInjector<IssueDetailsMapFrag>
{
  private Binding<MapHelper> mapHelper;
  private Binding<BaseFrag> supertype;
  
  public IssueDetailsMapFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.IssueDetailsMapFrag", "members/com.seeclickfix.ma.android.fragments.IssueDetailsMapFrag", false, IssueDetailsMapFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mapHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.map.MapHelper", IssueDetailsMapFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", IssueDetailsMapFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public IssueDetailsMapFrag get()
  {
    IssueDetailsMapFrag localIssueDetailsMapFrag = new IssueDetailsMapFrag();
    injectMembers(localIssueDetailsMapFrag);
    return localIssueDetailsMapFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mapHelper);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(IssueDetailsMapFrag paramIssueDetailsMapFrag)
  {
    mapHelper = ((MapHelper)mapHelper.get());
    supertype.injectMembers(paramIssueDetailsMapFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsMapFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */