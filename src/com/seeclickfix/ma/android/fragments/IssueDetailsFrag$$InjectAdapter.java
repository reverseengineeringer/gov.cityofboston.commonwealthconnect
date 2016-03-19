package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.auth.PermissionsManager;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.tasks.GetSingleIssueTask;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class IssueDetailsFrag$$InjectAdapter
  extends Binding<IssueDetailsFrag>
  implements Provider<IssueDetailsFrag>, MembersInjector<IssueDetailsFrag>
{
  private Binding<GetSingleIssueTask> getIssueTask;
  private Binding<PermissionsManager> mPermissionsManager;
  private Binding<MapHelper> mapHelper;
  private Binding<BaseFrag> supertype;
  
  public IssueDetailsFrag$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.IssueDetailsFrag", "members/com.seeclickfix.ma.android.fragments.IssueDetailsFrag", false, IssueDetailsFrag.class);
  }
  
  public void attach(Linker paramLinker)
  {
    getIssueTask = paramLinker.requestBinding("com.seeclickfix.ma.android.tasks.GetSingleIssueTask", IssueDetailsFrag.class, getClass().getClassLoader());
    mapHelper = paramLinker.requestBinding("com.seeclickfix.ma.android.fragments.map.MapHelper", IssueDetailsFrag.class, getClass().getClassLoader());
    mPermissionsManager = paramLinker.requestBinding("com.seeclickfix.ma.android.auth.PermissionsManager", IssueDetailsFrag.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.seeclickfix.ma.android.fragments.base.BaseFrag", IssueDetailsFrag.class, getClass().getClassLoader(), false, true);
  }
  
  public IssueDetailsFrag get()
  {
    IssueDetailsFrag localIssueDetailsFrag = new IssueDetailsFrag();
    injectMembers(localIssueDetailsFrag);
    return localIssueDetailsFrag;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(getIssueTask);
    paramSet2.add(mapHelper);
    paramSet2.add(mPermissionsManager);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(IssueDetailsFrag paramIssueDetailsFrag)
  {
    getIssueTask = ((GetSingleIssueTask)getIssueTask.get());
    mapHelper = ((MapHelper)mapHelper.get());
    mPermissionsManager = ((PermissionsManager)mPermissionsManager.get());
    supertype.injectMembers(paramIssueDetailsFrag);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */