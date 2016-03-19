package com.seeclickfix.ma.android.dialogs;

import android.content.DialogInterface;

public abstract interface DialogInstance<T>
  extends DialogInterface
{
  public abstract void onNegativeClick();
  
  public abstract void onPositiveClick();
  
  public abstract void setClickListener(ClickListener<T> paramClickListener);
  
  public static abstract interface ClickListener<T>
  {
    public abstract void onNegativeClick();
    
    public abstract void onPositiveClick(T paramT);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.DialogInstance
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */