package com.seeclickfix.ma.android.fragments.interfaces;

public abstract interface PageableFragment
{
  public abstract String getNameTag();
  
  public abstract void onLeavePage();
  
  public abstract void onShowPage(PagerInterface paramPagerInterface);
  
  public abstract void setNameTag(String paramString);
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.interfaces.PageableFragment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */