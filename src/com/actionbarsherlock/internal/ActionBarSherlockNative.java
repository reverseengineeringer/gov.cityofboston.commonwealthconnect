package com.actionbarsherlock.internal;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources.Theme;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import com.actionbarsherlock.ActionBarSherlock;
import com.actionbarsherlock.ActionBarSherlock.Implementation;
import com.actionbarsherlock.ActionBarSherlock.OnActionModeFinishedListener;
import com.actionbarsherlock.ActionBarSherlock.OnActionModeStartedListener;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.internal.app.ActionBarWrapper;
import com.actionbarsherlock.internal.view.menu.MenuItemWrapper;
import com.actionbarsherlock.internal.view.menu.MenuWrapper;
import com.actionbarsherlock.view.MenuInflater;

@ActionBarSherlock.Implementation(api=14)
public class ActionBarSherlockNative
  extends ActionBarSherlock
{
  private ActionBarWrapper mActionBar;
  private ActionModeWrapper mActionMode;
  private MenuWrapper mMenu;
  
  public ActionBarSherlockNative(Activity paramActivity, int paramInt)
  {
    super(paramActivity, paramInt);
  }
  
  private void initActionBar()
  {
    if ((mActionBar != null) || (mActivity.getActionBar() == null)) {
      return;
    }
    mActionBar = new ActionBarWrapper(mActivity);
  }
  
  public void addContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    mActivity.getWindow().addContentView(paramView, paramLayoutParams);
    initActionBar();
  }
  
  public boolean dispatchCreateOptionsMenu(Menu paramMenu)
  {
    if ((mMenu == null) || (paramMenu != mMenu.unwrap())) {
      mMenu = new MenuWrapper(paramMenu);
    }
    return callbackCreateOptionsMenu(mMenu);
  }
  
  public void dispatchInvalidateOptionsMenu()
  {
    mActivity.getWindow().invalidatePanelMenu(0);
    if (mMenu != null) {
      mMenu.invalidate();
    }
  }
  
  public boolean dispatchOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (mMenu == null) {
      if (paramMenuItem.getItemId() != 16908332) {
        throw new IllegalStateException("Non-home action item clicked before onCreateOptionsMenu with ID " + paramMenuItem.getItemId());
      }
    }
    for (paramMenuItem = new MenuItemWrapper(paramMenuItem);; paramMenuItem = mMenu.findItem(paramMenuItem)) {
      return callbackOptionsItemSelected(paramMenuItem);
    }
  }
  
  public boolean dispatchPrepareOptionsMenu(Menu paramMenu)
  {
    return callbackPrepareOptionsMenu(mMenu);
  }
  
  public ActionBar getActionBar()
  {
    initActionBar();
    return mActionBar;
  }
  
  protected Context getThemedContext()
  {
    Activity localActivity = mActivity;
    TypedValue localTypedValue = new TypedValue();
    mActivity.getTheme().resolveAttribute(16843671, localTypedValue, true);
    Object localObject = localActivity;
    if (resourceId != 0) {
      localObject = new ContextThemeWrapper(localActivity, resourceId);
    }
    return (Context)localObject;
  }
  
  public boolean hasFeature(int paramInt)
  {
    return mActivity.getWindow().hasFeature(paramInt);
  }
  
  public boolean requestFeature(int paramInt)
  {
    return mActivity.getWindow().requestFeature(paramInt);
  }
  
  public void setContentView(int paramInt)
  {
    mActivity.getWindow().setContentView(paramInt);
    initActionBar();
  }
  
  public void setContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    mActivity.getWindow().setContentView(paramView, paramLayoutParams);
    initActionBar();
  }
  
  public void setProgress(int paramInt)
  {
    mActivity.setProgress(paramInt);
  }
  
  public void setProgressBarIndeterminate(boolean paramBoolean)
  {
    mActivity.setProgressBarIndeterminate(paramBoolean);
  }
  
  public void setProgressBarIndeterminateVisibility(boolean paramBoolean)
  {
    mActivity.setProgressBarIndeterminateVisibility(paramBoolean);
  }
  
  public void setProgressBarVisibility(boolean paramBoolean)
  {
    mActivity.setProgressBarVisibility(paramBoolean);
  }
  
  public void setSecondaryProgress(int paramInt)
  {
    mActivity.setSecondaryProgress(paramInt);
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mActivity.getWindow().setTitle(paramCharSequence);
  }
  
  public void setUiOptions(int paramInt)
  {
    mActivity.getWindow().setUiOptions(paramInt);
  }
  
  public void setUiOptions(int paramInt1, int paramInt2)
  {
    mActivity.getWindow().setUiOptions(paramInt1, paramInt2);
  }
  
  public com.actionbarsherlock.view.ActionMode startActionMode(com.actionbarsherlock.view.ActionMode.Callback paramCallback)
  {
    if (mActionMode != null) {
      mActionMode.finish();
    }
    ActionModeCallbackWrapper localActionModeCallbackWrapper = null;
    if (paramCallback != null) {
      localActionModeCallbackWrapper = new ActionModeCallbackWrapper(paramCallback);
    }
    if (mActivity.startActionMode(localActionModeCallbackWrapper) == null) {
      mActionMode = null;
    }
    if (((mActivity instanceof ActionBarSherlock.OnActionModeStartedListener)) && (mActionMode != null)) {
      ((ActionBarSherlock.OnActionModeStartedListener)mActivity).onActionModeStarted(mActionMode);
    }
    return mActionMode;
  }
  
  private class ActionModeCallbackWrapper
    implements android.view.ActionMode.Callback
  {
    private final com.actionbarsherlock.view.ActionMode.Callback mCallback;
    
    public ActionModeCallbackWrapper(com.actionbarsherlock.view.ActionMode.Callback paramCallback)
    {
      mCallback = paramCallback;
    }
    
    public boolean onActionItemClicked(android.view.ActionMode paramActionMode, MenuItem paramMenuItem)
    {
      return mCallback.onActionItemClicked(mActionMode, mActionMode.getMenu().findItem(paramMenuItem));
    }
    
    public boolean onCreateActionMode(android.view.ActionMode paramActionMode, Menu paramMenu)
    {
      ActionBarSherlockNative.access$002(ActionBarSherlockNative.this, new ActionBarSherlockNative.ActionModeWrapper(ActionBarSherlockNative.this, paramActionMode));
      return mCallback.onCreateActionMode(mActionMode, mActionMode.getMenu());
    }
    
    public void onDestroyActionMode(android.view.ActionMode paramActionMode)
    {
      mCallback.onDestroyActionMode(mActionMode);
      if ((mActivity instanceof ActionBarSherlock.OnActionModeFinishedListener)) {
        ((ActionBarSherlock.OnActionModeFinishedListener)mActivity).onActionModeFinished(mActionMode);
      }
    }
    
    public boolean onPrepareActionMode(android.view.ActionMode paramActionMode, Menu paramMenu)
    {
      return mCallback.onPrepareActionMode(mActionMode, mActionMode.getMenu());
    }
  }
  
  private class ActionModeWrapper
    extends com.actionbarsherlock.view.ActionMode
  {
    private final android.view.ActionMode mActionMode;
    private MenuWrapper mMenu = null;
    
    ActionModeWrapper(android.view.ActionMode paramActionMode)
    {
      mActionMode = paramActionMode;
    }
    
    public void finish()
    {
      mActionMode.finish();
    }
    
    public View getCustomView()
    {
      return mActionMode.getCustomView();
    }
    
    public MenuWrapper getMenu()
    {
      if (mMenu == null) {
        mMenu = new MenuWrapper(mActionMode.getMenu());
      }
      return mMenu;
    }
    
    public MenuInflater getMenuInflater()
    {
      return ActionBarSherlockNative.this.getMenuInflater();
    }
    
    public CharSequence getSubtitle()
    {
      return mActionMode.getSubtitle();
    }
    
    public Object getTag()
    {
      return mActionMode.getTag();
    }
    
    public CharSequence getTitle()
    {
      return mActionMode.getTitle();
    }
    
    public void invalidate()
    {
      mActionMode.invalidate();
      if (mMenu != null) {
        mMenu.invalidate();
      }
    }
    
    public void setCustomView(View paramView)
    {
      mActionMode.setCustomView(paramView);
    }
    
    public void setSubtitle(int paramInt)
    {
      mActionMode.setSubtitle(paramInt);
    }
    
    public void setSubtitle(CharSequence paramCharSequence)
    {
      mActionMode.setSubtitle(paramCharSequence);
    }
    
    public void setTag(Object paramObject)
    {
      mActionMode.setTag(paramObject);
    }
    
    public void setTitle(int paramInt)
    {
      mActionMode.setTitle(paramInt);
    }
    
    public void setTitle(CharSequence paramCharSequence)
    {
      mActionMode.setTitle(paramCharSequence);
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.ActionBarSherlockNative
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */