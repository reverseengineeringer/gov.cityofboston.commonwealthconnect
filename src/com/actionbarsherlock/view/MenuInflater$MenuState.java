package com.actionbarsherlock.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import com.actionbarsherlock.R.styleable;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import java.lang.reflect.Constructor;

class MenuInflater$MenuState
{
  private static final int defaultGroupId = 0;
  private static final int defaultItemCategory = 0;
  private static final int defaultItemCheckable = 0;
  private static final boolean defaultItemChecked = false;
  private static final boolean defaultItemEnabled = true;
  private static final int defaultItemId = 0;
  private static final int defaultItemOrder = 0;
  private static final boolean defaultItemVisible = true;
  private int groupCategory;
  private int groupCheckable;
  private boolean groupEnabled;
  private int groupId;
  private int groupOrder;
  private boolean groupVisible;
  private ActionProvider itemActionProvider;
  private String itemActionProviderClassName;
  private String itemActionViewClassName;
  private int itemActionViewLayout;
  private boolean itemAdded;
  private char itemAlphabeticShortcut;
  private int itemCategoryOrder;
  private int itemCheckable;
  private boolean itemChecked;
  private boolean itemEnabled;
  private int itemIconResId;
  private int itemId;
  private String itemListenerMethodName;
  private char itemNumericShortcut;
  private int itemShowAsAction;
  private CharSequence itemTitle;
  private CharSequence itemTitleCondensed;
  private boolean itemVisible;
  private Menu menu;
  
  public MenuInflater$MenuState(MenuInflater paramMenuInflater, Menu paramMenu)
  {
    menu = paramMenu;
    resetGroup();
  }
  
  private char getShortcut(String paramString)
  {
    if (paramString == null) {
      return '\000';
    }
    return paramString.charAt(0);
  }
  
  private <T> T newInstance(String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    try
    {
      paramArrayOfClass = MenuInflater.access$100(this$0).getClassLoader().loadClass(paramString).getConstructor(paramArrayOfClass).newInstance(paramArrayOfObject);
      return paramArrayOfClass;
    }
    catch (Exception paramArrayOfClass)
    {
      Log.w("MenuInflater", "Cannot instantiate class: " + paramString, paramArrayOfClass);
    }
    return null;
  }
  
  private void setItem(MenuItem paramMenuItem)
  {
    MenuItem localMenuItem = paramMenuItem.setChecked(itemChecked).setVisible(itemVisible).setEnabled(itemEnabled);
    if (itemCheckable >= 1) {}
    for (boolean bool = true;; bool = false)
    {
      localMenuItem.setCheckable(bool).setTitleCondensed(itemTitleCondensed).setIcon(itemIconResId).setAlphabeticShortcut(itemAlphabeticShortcut).setNumericShortcut(itemNumericShortcut);
      if (itemShowAsAction >= 0) {
        paramMenuItem.setShowAsAction(itemShowAsAction);
      }
      if (itemListenerMethodName == null) {
        break label162;
      }
      if (!MenuInflater.access$100(this$0).isRestricted()) {
        break;
      }
      throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
    }
    paramMenuItem.setOnMenuItemClickListener(new MenuInflater.InflatedOnMenuItemClickListener(MenuInflater.access$400(this$0), itemListenerMethodName));
    label162:
    if (itemCheckable >= 2)
    {
      if ((paramMenuItem instanceof MenuItemImpl)) {
        ((MenuItemImpl)paramMenuItem).setExclusiveCheckable(true);
      }
    }
    else
    {
      int i = 0;
      if (itemActionViewClassName != null)
      {
        paramMenuItem.setActionView((View)newInstance(itemActionViewClassName, MenuInflater.access$500(), MenuInflater.access$600(this$0)));
        i = 1;
      }
      if (itemActionViewLayout > 0)
      {
        if (i != 0) {
          break label283;
        }
        paramMenuItem.setActionView(itemActionViewLayout);
      }
    }
    for (;;)
    {
      if (itemActionProvider != null) {
        paramMenuItem.setActionProvider(itemActionProvider);
      }
      return;
      menu.setGroupCheckable(groupId, true, true);
      break;
      label283:
      Log.w("MenuInflater", "Ignoring attribute 'itemActionViewLayout'. Action view already specified.");
    }
  }
  
  public void addItem()
  {
    itemAdded = true;
    setItem(menu.add(groupId, itemId, itemCategoryOrder, itemTitle));
  }
  
  public SubMenu addSubMenuItem()
  {
    itemAdded = true;
    SubMenu localSubMenu = menu.addSubMenu(groupId, itemId, itemCategoryOrder, itemTitle);
    setItem(localSubMenu.getItem());
    return localSubMenu;
  }
  
  public boolean hasAddedItem()
  {
    return itemAdded;
  }
  
  public void readGroup(AttributeSet paramAttributeSet)
  {
    paramAttributeSet = MenuInflater.access$100(this$0).obtainStyledAttributes(paramAttributeSet, R.styleable.SherlockMenuGroup);
    groupId = paramAttributeSet.getResourceId(R.styleable.SherlockMenuGroup_android_id, 0);
    groupCategory = paramAttributeSet.getInt(R.styleable.SherlockMenuGroup_android_menuCategory, 0);
    groupOrder = paramAttributeSet.getInt(R.styleable.SherlockMenuGroup_android_orderInCategory, 0);
    groupCheckable = paramAttributeSet.getInt(R.styleable.SherlockMenuGroup_android_checkableBehavior, 0);
    groupVisible = paramAttributeSet.getBoolean(R.styleable.SherlockMenuGroup_android_visible, true);
    groupEnabled = paramAttributeSet.getBoolean(R.styleable.SherlockMenuGroup_android_enabled, true);
    paramAttributeSet.recycle();
  }
  
  public void readItem(AttributeSet paramAttributeSet)
  {
    TypedArray localTypedArray = MenuInflater.access$100(this$0).obtainStyledAttributes(paramAttributeSet, R.styleable.SherlockMenuItem);
    itemId = localTypedArray.getResourceId(R.styleable.SherlockMenuItem_android_id, 0);
    itemCategoryOrder = (0xFFFF0000 & localTypedArray.getInt(R.styleable.SherlockMenuItem_android_menuCategory, groupCategory) | 0xFFFF & localTypedArray.getInt(R.styleable.SherlockMenuItem_android_orderInCategory, groupOrder));
    itemTitle = localTypedArray.getText(R.styleable.SherlockMenuItem_android_title);
    itemTitleCondensed = localTypedArray.getText(R.styleable.SherlockMenuItem_android_titleCondensed);
    itemIconResId = localTypedArray.getResourceId(R.styleable.SherlockMenuItem_android_icon, 0);
    itemAlphabeticShortcut = getShortcut(localTypedArray.getString(R.styleable.SherlockMenuItem_android_alphabeticShortcut));
    itemNumericShortcut = getShortcut(localTypedArray.getString(R.styleable.SherlockMenuItem_android_numericShortcut));
    int i;
    if (localTypedArray.hasValue(R.styleable.SherlockMenuItem_android_checkable)) {
      if (localTypedArray.getBoolean(R.styleable.SherlockMenuItem_android_checkable, false))
      {
        i = 1;
        itemCheckable = i;
        label154:
        itemChecked = localTypedArray.getBoolean(R.styleable.SherlockMenuItem_android_checked, false);
        itemVisible = localTypedArray.getBoolean(R.styleable.SherlockMenuItem_android_visible, groupVisible);
        itemEnabled = localTypedArray.getBoolean(R.styleable.SherlockMenuItem_android_enabled, groupEnabled);
        paramAttributeSet = new TypedValue();
        localTypedArray.getValue(R.styleable.SherlockMenuItem_android_showAsAction, paramAttributeSet);
        if (type != 17) {
          break label413;
        }
        i = data;
        label227:
        itemShowAsAction = i;
        itemListenerMethodName = localTypedArray.getString(R.styleable.SherlockMenuItem_android_onClick);
        itemActionViewLayout = localTypedArray.getResourceId(R.styleable.SherlockMenuItem_android_actionLayout, 0);
        paramAttributeSet = new TypedValue();
        localTypedArray.getValue(R.styleable.SherlockMenuItem_android_actionViewClass, paramAttributeSet);
        if (type != 3) {
          break label418;
        }
        paramAttributeSet = string.toString();
        label290:
        itemActionViewClassName = paramAttributeSet;
        paramAttributeSet = new TypedValue();
        localTypedArray.getValue(R.styleable.SherlockMenuItem_android_actionProviderClass, paramAttributeSet);
        if (type != 3) {
          break label423;
        }
        paramAttributeSet = string.toString();
        label330:
        itemActionProviderClassName = paramAttributeSet;
        if (itemActionProviderClassName == null) {
          break label428;
        }
        i = 1;
        label344:
        if ((i == 0) || (itemActionViewLayout != 0) || (itemActionViewClassName != null)) {
          break label433;
        }
      }
    }
    for (itemActionProvider = ((ActionProvider)newInstance(itemActionProviderClassName, MenuInflater.access$200(), MenuInflater.access$300(this$0)));; itemActionProvider = null)
    {
      localTypedArray.recycle();
      itemAdded = false;
      return;
      i = 0;
      break;
      itemCheckable = groupCheckable;
      break label154;
      label413:
      i = -1;
      break label227;
      label418:
      paramAttributeSet = null;
      break label290;
      label423:
      paramAttributeSet = null;
      break label330;
      label428:
      i = 0;
      break label344;
      label433:
      if (i != 0) {
        Log.w("MenuInflater", "Ignoring attribute 'actionProviderClass'. Action view already specified.");
      }
    }
  }
  
  public void resetGroup()
  {
    groupId = 0;
    groupCategory = 0;
    groupOrder = 0;
    groupCheckable = 0;
    groupVisible = true;
    groupEnabled = true;
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.view.MenuInflater.MenuState
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */