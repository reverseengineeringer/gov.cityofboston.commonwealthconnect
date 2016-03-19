package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class OutsideAreaHelper$$InjectAdapter
  extends Binding<OutsideAreaHelper>
  implements Provider<OutsideAreaHelper>, MembersInjector<OutsideAreaHelper>
{
  private Binding<Context> context;
  
  public OutsideAreaHelper$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper", "members/com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper", false, OutsideAreaHelper.class);
  }
  
  public void attach(Linker paramLinker)
  {
    context = paramLinker.requestBinding("android.content.Context", OutsideAreaHelper.class, getClass().getClassLoader());
  }
  
  public OutsideAreaHelper get()
  {
    OutsideAreaHelper localOutsideAreaHelper = new OutsideAreaHelper();
    injectMembers(localOutsideAreaHelper);
    return localOutsideAreaHelper;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(context);
  }
  
  public void injectMembers(OutsideAreaHelper paramOutsideAreaHelper)
  {
    context = ((Context)context.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */