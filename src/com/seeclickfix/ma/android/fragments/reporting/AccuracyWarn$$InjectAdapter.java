package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class AccuracyWarn$$InjectAdapter
  extends Binding<AccuracyWarn>
  implements Provider<AccuracyWarn>, MembersInjector<AccuracyWarn>
{
  private Binding<Context> context;
  
  public AccuracyWarn$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn", "members/com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn", false, AccuracyWarn.class);
  }
  
  public void attach(Linker paramLinker)
  {
    context = paramLinker.requestBinding("android.content.Context", AccuracyWarn.class, getClass().getClassLoader());
  }
  
  public AccuracyWarn get()
  {
    AccuracyWarn localAccuracyWarn = new AccuracyWarn();
    injectMembers(localAccuracyWarn);
    return localAccuracyWarn;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(context);
  }
  
  public void injectMembers(AccuracyWarn paramAccuracyWarn)
  {
    context = ((Context)context.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */