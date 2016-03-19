package com.seeclickfix.ma.android;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.seeclickfix.ma.android.auth.LoginOnStartupFlag;
import com.seeclickfix.ma.android.location.LocationAdapter;
import dagger.MembersInjector;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class SeeclickfixActivity$$InjectAdapter
  extends Binding<SeeclickfixActivity>
  implements Provider<SeeclickfixActivity>, MembersInjector<SeeclickfixActivity>
{
  private Binding<LocationAdapter> mLocationAdapter;
  private Binding<LoginOnStartupFlag> mLoginOnStartupFlag;
  private Binding<SherlockFragmentActivity> supertype;
  
  public SeeclickfixActivity$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.SeeclickfixActivity", "members/com.seeclickfix.ma.android.SeeclickfixActivity", false, SeeclickfixActivity.class);
  }
  
  public void attach(Linker paramLinker)
  {
    mLocationAdapter = paramLinker.requestBinding("com.seeclickfix.ma.android.location.LocationAdapter", SeeclickfixActivity.class, getClass().getClassLoader());
    mLoginOnStartupFlag = paramLinker.requestBinding("com.seeclickfix.ma.android.auth.LoginOnStartupFlag", SeeclickfixActivity.class, getClass().getClassLoader());
    supertype = paramLinker.requestBinding("members/com.actionbarsherlock.app.SherlockFragmentActivity", SeeclickfixActivity.class, getClass().getClassLoader(), false, true);
  }
  
  public SeeclickfixActivity get()
  {
    SeeclickfixActivity localSeeclickfixActivity = new SeeclickfixActivity();
    injectMembers(localSeeclickfixActivity);
    return localSeeclickfixActivity;
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet2.add(mLocationAdapter);
    paramSet2.add(mLoginOnStartupFlag);
    paramSet2.add(supertype);
  }
  
  public void injectMembers(SeeclickfixActivity paramSeeclickfixActivity)
  {
    mLocationAdapter = ((LocationAdapter)mLocationAdapter.get());
    mLoginOnStartupFlag = ((LoginOnStartupFlag)mLoginOnStartupFlag.get());
    supertype.injectMembers(paramSeeclickfixActivity);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.SeeclickfixActivity..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */