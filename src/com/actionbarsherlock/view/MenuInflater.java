package com.actionbarsherlock.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.InflateException;
import android.view.View;
import com.actionbarsherlock.R.styleable;
import com.actionbarsherlock.internal.view.menu.MenuItemImpl;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class MenuInflater
{
  private static final Class<?>[] ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE = ACTION_VIEW_CONSTRUCTOR_SIGNATURE;
  private static final Class<?>[] ACTION_VIEW_CONSTRUCTOR_SIGNATURE = { Context.class };
  private static final String LOG_TAG = "MenuInflater";
  private static final int NO_ID = 0;
  private static final String XML_GROUP = "group";
  private static final String XML_ITEM = "item";
  private static final String XML_MENU = "menu";
  private final Object[] mActionProviderConstructorArguments;
  private final Object[] mActionViewConstructorArguments;
  private Context mContext;
  private Object mRealOwner;
  
  public MenuInflater(Context paramContext)
  {
    mContext = paramContext;
    mRealOwner = paramContext;
    mActionViewConstructorArguments = new Object[] { paramContext };
    mActionProviderConstructorArguments = mActionViewConstructorArguments;
  }
  
  public MenuInflater(Context paramContext, Object paramObject)
  {
    mContext = paramContext;
    mRealOwner = paramObject;
    mActionViewConstructorArguments = new Object[] { paramContext };
    mActionProviderConstructorArguments = mActionViewConstructorArguments;
  }
  
  private void parseMenu(XmlPullParser paramXmlPullParser, AttributeSet paramAttributeSet, Menu paramMenu)
    throws XmlPullParserException, IOException
  {
    MenuState localMenuState = new MenuState(paramMenu);
    int i = paramXmlPullParser.getEventType();
    int k = 0;
    Menu localMenu = null;
    label55:
    int j;
    int n;
    if (i == 2)
    {
      paramMenu = paramXmlPullParser.getName();
      if (paramMenu.equals("menu"))
      {
        i = paramXmlPullParser.next();
        j = 0;
        n = i;
        label62:
        if (j != 0) {
          return;
        }
      }
    }
    int m;
    switch (n)
    {
    default: 
      paramMenu = localMenu;
      m = j;
      i = k;
    case 2: 
    case 3: 
      for (;;)
      {
        n = paramXmlPullParser.next();
        k = i;
        j = m;
        localMenu = paramMenu;
        break label62;
        throw new RuntimeException("Expecting menu, got " + paramMenu);
        j = paramXmlPullParser.next();
        i = j;
        if (j != 1) {
          break;
        }
        i = j;
        break label55;
        i = k;
        m = j;
        paramMenu = localMenu;
        if (k == 0)
        {
          paramMenu = paramXmlPullParser.getName();
          if (paramMenu.equals("group"))
          {
            localMenuState.readGroup(paramAttributeSet);
            i = k;
            m = j;
            paramMenu = localMenu;
          }
          else if (paramMenu.equals("item"))
          {
            localMenuState.readItem(paramAttributeSet);
            i = k;
            m = j;
            paramMenu = localMenu;
          }
          else if (paramMenu.equals("menu"))
          {
            parseMenu(paramXmlPullParser, paramAttributeSet, localMenuState.addSubMenuItem());
            i = k;
            m = j;
            paramMenu = localMenu;
          }
          else
          {
            i = 1;
            m = j;
            continue;
            String str = paramXmlPullParser.getName();
            if ((k != 0) && (str.equals(localMenu)))
            {
              i = 0;
              paramMenu = null;
              m = j;
            }
            else if (str.equals("group"))
            {
              localMenuState.resetGroup();
              i = k;
              m = j;
              paramMenu = localMenu;
            }
            else if (str.equals("item"))
            {
              i = k;
              m = j;
              paramMenu = localMenu;
              if (!localMenuState.hasAddedItem()) {
                if ((itemActionProvider != null) && (itemActionProvider.hasSubMenu()))
                {
                  localMenuState.addSubMenuItem();
                  i = k;
                  m = j;
                  paramMenu = localMenu;
                }
                else
                {
                  localMenuState.addItem();
                  i = k;
                  m = j;
                  paramMenu = localMenu;
                }
              }
            }
            else
            {
              i = k;
              m = j;
              paramMenu = localMenu;
              if (str.equals("menu"))
              {
                m = 1;
                i = k;
                paramMenu = localMenu;
              }
            }
          }
        }
      }
    }
    throw new RuntimeException("Unexpected end of document");
  }
  
  /* Error */
  public void inflate(int paramInt, Menu paramMenu)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_3
    //   2: aconst_null
    //   3: astore 5
    //   5: aconst_null
    //   6: astore 4
    //   8: aload_0
    //   9: getfield 54	com/actionbarsherlock/view/MenuInflater:mContext	Landroid/content/Context;
    //   12: invokevirtual 157	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   15: iload_1
    //   16: invokevirtual 163	android/content/res/Resources:getLayout	(I)Landroid/content/res/XmlResourceParser;
    //   19: astore 6
    //   21: aload 6
    //   23: astore 4
    //   25: aload 6
    //   27: astore_3
    //   28: aload 6
    //   30: astore 5
    //   32: aload_0
    //   33: aload 6
    //   35: aload 6
    //   37: invokestatic 169	android/util/Xml:asAttributeSet	(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;
    //   40: aload_2
    //   41: invokespecial 129	com/actionbarsherlock/view/MenuInflater:parseMenu	(Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Lcom/actionbarsherlock/view/Menu;)V
    //   44: aload 6
    //   46: ifnull +10 -> 56
    //   49: aload 6
    //   51: invokeinterface 174 1 0
    //   56: return
    //   57: astore_2
    //   58: aload 4
    //   60: astore_3
    //   61: new 176	android/view/InflateException
    //   64: dup
    //   65: ldc -78
    //   67: aload_2
    //   68: invokespecial 181	android/view/InflateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   71: athrow
    //   72: astore_2
    //   73: aload_3
    //   74: ifnull +9 -> 83
    //   77: aload_3
    //   78: invokeinterface 174 1 0
    //   83: aload_2
    //   84: athrow
    //   85: astore_2
    //   86: aload 5
    //   88: astore_3
    //   89: new 176	android/view/InflateException
    //   92: dup
    //   93: ldc -78
    //   95: aload_2
    //   96: invokespecial 181	android/view/InflateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   99: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	100	0	this	MenuInflater
    //   0	100	1	paramInt	int
    //   0	100	2	paramMenu	Menu
    //   1	88	3	localObject1	Object
    //   6	53	4	localObject2	Object
    //   3	84	5	localObject3	Object
    //   19	31	6	localXmlResourceParser	android.content.res.XmlResourceParser
    // Exception table:
    //   from	to	target	type
    //   8	21	57	org/xmlpull/v1/XmlPullParserException
    //   32	44	57	org/xmlpull/v1/XmlPullParserException
    //   8	21	72	finally
    //   32	44	72	finally
    //   61	72	72	finally
    //   89	100	72	finally
    //   8	21	85	java/io/IOException
    //   32	44	85	java/io/IOException
  }
  
  private static class InflatedOnMenuItemClickListener
    implements MenuItem.OnMenuItemClickListener
  {
    private static final Class<?>[] PARAM_TYPES = { MenuItem.class };
    private Method mMethod;
    private Object mRealOwner;
    
    public InflatedOnMenuItemClickListener(Object paramObject, String paramString)
    {
      mRealOwner = paramObject;
      Class localClass = paramObject.getClass();
      try
      {
        mMethod = localClass.getMethod(paramString, PARAM_TYPES);
        return;
      }
      catch (Exception paramObject)
      {
        paramString = new InflateException("Couldn't resolve menu item onClick handler " + paramString + " in class " + localClass.getName());
        paramString.initCause((Throwable)paramObject);
        throw paramString;
      }
    }
    
    public boolean onMenuItemClick(MenuItem paramMenuItem)
    {
      try
      {
        if (mMethod.getReturnType() == Boolean.TYPE) {
          return ((Boolean)mMethod.invoke(mRealOwner, new Object[] { paramMenuItem })).booleanValue();
        }
        mMethod.invoke(mRealOwner, new Object[] { paramMenuItem });
        return true;
      }
      catch (Exception paramMenuItem)
      {
        throw new RuntimeException(paramMenuItem);
      }
    }
  }
  
  private class MenuState
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
    
    public MenuState(Menu paramMenu)
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
        paramArrayOfClass = mContext.getClassLoader().loadClass(paramString).getConstructor(paramArrayOfClass).newInstance(paramArrayOfObject);
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
        if (!mContext.isRestricted()) {
          break;
        }
        throw new IllegalStateException("The android:onClick attribute cannot be used within a restricted context");
      }
      paramMenuItem.setOnMenuItemClickListener(new MenuInflater.InflatedOnMenuItemClickListener(mRealOwner, itemListenerMethodName));
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
          paramMenuItem.setActionView((View)newInstance(itemActionViewClassName, MenuInflater.ACTION_VIEW_CONSTRUCTOR_SIGNATURE, mActionViewConstructorArguments));
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
      paramAttributeSet = mContext.obtainStyledAttributes(paramAttributeSet, R.styleable.SherlockMenuGroup);
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
      TypedArray localTypedArray = mContext.obtainStyledAttributes(paramAttributeSet, R.styleable.SherlockMenuItem);
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
      for (itemActionProvider = ((ActionProvider)newInstance(itemActionProviderClassName, MenuInflater.ACTION_PROVIDER_CONSTRUCTOR_SIGNATURE, mActionProviderConstructorArguments));; itemActionProvider = null)
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
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.view.MenuInflater
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */