package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class IssuesMapFrag$$InjectAdapter
  extends Binding<IssuesMapFrag>
  implements Provider<IssuesMapFrag>, MembersInjector<IssuesMapFrag>
{
  private Binding<MapHelper> mapHelper;
  private Binding<BaseFrag> supertype;
  
  public IssuesMapFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.IssuesMapFrag", "members/com.seeclickfix.ma.android.fragments.IssuesMapFrag", false, IssuesMapFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mapHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.map.MapHelper", IssuesMapFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", IssuesMapFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public IssuesMapFrag get()
  {
    IssuesMapFrag localIssuesMapFrag = new IssuesMapFrag();
    injectMembers(localIssuesMapFrag);
    return localIssuesMapFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mapHelper);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(IssuesMapFrag paramIssuesMapFrag)
  {
    mapHelper = ((MapHelper)mapHelper.get());
    supertype.injectMembers(paramIssuesMapFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */