package com.seeclickfix.ma.android.fragments.interfaces;

import com.seeclickfix.ma.android.objects.PageParams;

public abstract interface OnBackKeyListener
{
  public abstract PageParams onBackKey();
  
  public abstract boolean willHandleBackKey();
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.interfaces.OnBackKeyListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */