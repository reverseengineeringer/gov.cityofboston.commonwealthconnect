package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.view.View;
import com.actionbarsherlock.view.MenuItem;

class ActionMenuPresenter$ActionButtonSubmenu
  extends MenuPopupHelper
{
  public ActionMenuPresenter$ActionButtonSubmenu(ActionMenuPresenter paramActionMenuPresenter, Context paramContext, SubMenuBuilder paramSubMenuBuilder)
  {
    super(paramContext, paramSubMenuBuilder);
    boolean bool2;
    int j;
    int i;
    if (!((MenuItemImpl)paramSubMenuBuilder.getItem()).isActionButton())
    {
      if (ActionMenuPresenter.access$200(paramActionMenuPresenter) == null)
      {
        paramContext = (View)mMenuView;
        setAnchorView(paramContext);
      }
    }
    else
    {
      setCallback(mPopupPresenterCallback);
      bool2 = false;
      j = paramSubMenuBuilder.size();
      i = 0;
    }
    for (;;)
    {
      boolean bool1 = bool2;
      if (i < j)
      {
        paramActionMenuPresenter = paramSubMenuBuilder.getItem(i);
        if ((paramActionMenuPresenter.isVisible()) && (paramActionMenuPresenter.getIcon() != null)) {
          bool1 = true;
        }
      }
      else
      {
        setForceShowIcon(bool1);
        return;
        paramContext = ActionMenuPresenter.access$200(paramActionMenuPresenter);
        break;
      }
      i += 1;
    }
  }
  
  public void onDismiss()
  {
    super.onDismiss();
    ActionMenuPresenter.access$302(this$0, null);
    this$0.mOpenSubMenuId = 0;
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.view.menu.ActionMenuPresenter.ActionButtonSubmenu
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */