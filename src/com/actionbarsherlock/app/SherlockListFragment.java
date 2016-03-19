package com.actionbarsherlock.app;

import android.app.Activity;
import android.support.v4.app.ListFragment;
import android.support.v4.app.Watson.OnCreateOptionsMenuListener;
import android.support.v4.app.Watson.OnOptionsItemSelectedListener;
import android.support.v4.app.Watson.OnPrepareOptionsMenuListener;
import com.actionbarsherlock.internal.view.menu.MenuItemWrapper;
import com.actionbarsherlock.internal.view.menu.MenuWrapper;

public class SherlockListFragment
  extends ListFragment
  implements Watson.OnCreateOptionsMenuListener, Watson.OnPrepareOptionsMenuListener, Watson.OnOptionsItemSelectedListener
{
  private SherlockFragmentActivity mActivity;
  
  public SherlockFragmentActivity getSherlockActivity()
  {
    return mActivity;
  }
  
  public void onAttach(Activity paramActivity)
  {
    if (!(paramActivity instanceof SherlockFragmentActivity)) {
      throw new IllegalStateException(getClass().getSimpleName() + " must be attached to a SherlockFragmentActivity.");
    }
    mActivity = ((SherlockFragmentActivity)paramActivity);
    super.onAttach(paramActivity);
  }
  
  public final void onCreateOptionsMenu(android.view.Menu paramMenu, android.view.MenuInflater paramMenuInflater)
  {
    onCreateOptionsMenu(new MenuWrapper(paramMenu), mActivity.getSupportMenuInflater());
  }
  
  public void onCreateOptionsMenu(com.actionbarsherlock.view.Menu paramMenu, com.actionbarsherlock.view.MenuInflater paramMenuInflater) {}
  
  public void onDetach()
  {
    mActivity = null;
    super.onDetach();
  }
  
  public final boolean onOptionsItemSelected(android.view.MenuItem paramMenuItem)
  {
    return onOptionsItemSelected(new MenuItemWrapper(paramMenuItem));
  }
  
  public boolean onOptionsItemSelected(com.actionbarsherlock.view.MenuItem paramMenuItem)
  {
    return false;
  }
  
  public final void onPrepareOptionsMenu(android.view.Menu paramMenu)
  {
    onPrepareOptionsMenu(new MenuWrapper(paramMenu));
  }
  
  public void onPrepareOptionsMenu(com.actionbarsherlock.view.Menu paramMenu) {}
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.app.SherlockListFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */