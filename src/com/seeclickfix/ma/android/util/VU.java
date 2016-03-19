package com.seeclickfix.ma.android.util;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class VU
{
  public static View inflate(ViewGroup paramViewGroup, int paramInt)
  {
    return inflater(paramViewGroup).inflate(paramInt, paramViewGroup, false);
  }
  
  public static LayoutInflater inflater(ViewGroup paramViewGroup)
  {
    return (LayoutInflater)paramViewGroup.getContext().getSystemService("layout_inflater");
  }
  
  public static TextView setText(View paramView, int paramInt1, int paramInt2)
  {
    paramView = text(paramView, paramInt1);
    paramView.setText(paramInt2);
    return paramView;
  }
  
  public static TextView setText(View paramView, int paramInt, String paramString)
  {
    paramView = text(paramView, paramInt);
    paramView.setText(paramString);
    return paramView;
  }
  
  public static TextView text(View paramView, int paramInt)
  {
    return (TextView)paramView.findViewById(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.util.VU
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */