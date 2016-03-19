package android.support.v4.app;

import android.view.View;
import com.actionbarsherlock.ActionBarSherlock.OnCreatePanelMenuListener;
import com.actionbarsherlock.ActionBarSherlock.OnMenuItemSelectedListener;
import com.actionbarsherlock.ActionBarSherlock.OnPreparePanelListener;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;

public abstract class Watson
  extends FragmentActivity
  implements ActionBarSherlock.OnCreatePanelMenuListener, ActionBarSherlock.OnPreparePanelListener, ActionBarSherlock.OnMenuItemSelectedListener
{
  private static final String TAG = "Watson";
  private ArrayList<Fragment> mCreatedMenus;
  
  public abstract MenuInflater getSupportMenuInflater();
  
  public abstract boolean onCreateOptionsMenu(Menu paramMenu);
  
  public boolean onCreatePanelMenu(int paramInt, Menu paramMenu)
  {
    if (paramInt == 0)
    {
      int k = onCreateOptionsMenu(paramMenu);
      MenuInflater localMenuInflater = getSupportMenuInflater();
      int i = 0;
      paramInt = 0;
      Object localObject2 = null;
      Object localObject1 = null;
      if (mFragments.mAdded != null)
      {
        int j = 0;
        for (;;)
        {
          localObject2 = localObject1;
          i = paramInt;
          if (j >= mFragments.mAdded.size()) {
            break;
          }
          Fragment localFragment = (Fragment)mFragments.mAdded.get(j);
          localObject2 = localObject1;
          i = paramInt;
          if (localFragment != null)
          {
            localObject2 = localObject1;
            i = paramInt;
            if (!mHidden)
            {
              localObject2 = localObject1;
              i = paramInt;
              if (mHasMenu)
              {
                localObject2 = localObject1;
                i = paramInt;
                if (mMenuVisible)
                {
                  localObject2 = localObject1;
                  i = paramInt;
                  if ((localFragment instanceof OnCreateOptionsMenuListener))
                  {
                    i = 1;
                    ((OnCreateOptionsMenuListener)localFragment).onCreateOptionsMenu(paramMenu, localMenuInflater);
                    localObject2 = localObject1;
                    if (localObject1 == null) {
                      localObject2 = new ArrayList();
                    }
                    ((ArrayList)localObject2).add(localFragment);
                  }
                }
              }
            }
          }
          j += 1;
          localObject1 = localObject2;
          paramInt = i;
        }
      }
      if (mCreatedMenus != null)
      {
        paramInt = 0;
        while (paramInt < mCreatedMenus.size())
        {
          paramMenu = (Fragment)mCreatedMenus.get(paramInt);
          if ((localObject2 == null) || (!((ArrayList)localObject2).contains(paramMenu))) {
            paramMenu.onDestroyOptionsMenu();
          }
          paramInt += 1;
        }
      }
      mCreatedMenus = ((ArrayList)localObject2);
      return k | i;
    }
    return false;
  }
  
  public boolean onMenuItemSelected(int paramInt, MenuItem paramMenuItem)
  {
    if (paramInt == 0)
    {
      if (onOptionsItemSelected(paramMenuItem)) {
        return true;
      }
      if (mFragments.mAdded != null)
      {
        paramInt = 0;
        for (;;)
        {
          if (paramInt >= mFragments.mAdded.size()) {
            break label107;
          }
          Fragment localFragment = (Fragment)mFragments.mAdded.get(paramInt);
          if ((localFragment != null) && (!mHidden) && (mHasMenu) && (mMenuVisible) && ((localFragment instanceof OnOptionsItemSelectedListener)) && (((OnOptionsItemSelectedListener)localFragment).onOptionsItemSelected(paramMenuItem))) {
            break;
          }
          paramInt += 1;
        }
      }
    }
    label107:
    return false;
  }
  
  public abstract boolean onOptionsItemSelected(MenuItem paramMenuItem);
  
  public abstract boolean onPrepareOptionsMenu(Menu paramMenu);
  
  public boolean onPreparePanel(int paramInt, View paramView, Menu paramMenu)
  {
    if (paramInt == 0)
    {
      int k = onPrepareOptionsMenu(paramMenu);
      int j = 0;
      paramInt = 0;
      if (mFragments.mAdded != null)
      {
        int i = 0;
        for (;;)
        {
          j = paramInt;
          if (i >= mFragments.mAdded.size()) {
            break;
          }
          paramView = (Fragment)mFragments.mAdded.get(i);
          j = paramInt;
          if (paramView != null)
          {
            j = paramInt;
            if (!mHidden)
            {
              j = paramInt;
              if (mHasMenu)
              {
                j = paramInt;
                if (mMenuVisible)
                {
                  j = paramInt;
                  if ((paramView instanceof OnPrepareOptionsMenuListener))
                  {
                    j = 1;
                    ((OnPrepareOptionsMenuListener)paramView).onPrepareOptionsMenu(paramMenu);
                  }
                }
              }
            }
          }
          i += 1;
          paramInt = j;
        }
      }
      return (k | j) & paramMenu.hasVisibleItems();
    }
    return false;
  }
  
  public static abstract interface OnCreateOptionsMenuListener
  {
    public abstract void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater);
  }
  
  public static abstract interface OnOptionsItemSelectedListener
  {
    public abstract boolean onOptionsItemSelected(MenuItem paramMenuItem);
  }
  
  public static abstract interface OnPrepareOptionsMenuListener
  {
    public abstract void onPrepareOptionsMenu(Menu paramMenu);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.app.Watson
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */