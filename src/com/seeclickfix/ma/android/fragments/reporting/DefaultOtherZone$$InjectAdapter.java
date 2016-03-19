package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class DefaultOtherZone$$InjectAdapter
  extends Binding<DefaultOtherZone>
  implements Provider<DefaultOtherZone>, MembersInjector<DefaultOtherZone>
{
  private Binding<Context> c;
  
  public DefaultOtherZone$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone", "members/com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone", false, DefaultOtherZone.class);
  }
  
  public void attach(Linker paramLinker)
  {
    c = paramLinker.requestBinding("android.content.Context", DefaultOtherZone.class, getClass().getClassLoader());
  }
  
  public DefaultOtherZone get()
  {
    DefaultOtherZone localDefaultOtherZone = new DefaultOtherZone();
    injectMembers(localDefaultOtherZone);
    return localDefaultOtherZone;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(c);
  }
  
  public void injectMembers(DefaultOtherZone paramDefaultOtherZone)
  {
    c = ((Context)c.get());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.DefaultOtherZone..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */