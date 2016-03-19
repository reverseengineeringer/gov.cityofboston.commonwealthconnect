package com.alostpacket.pajamalib.utils;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class ViewUtil
{
  private static LayoutInflater inflater;
  
  private static LayoutInflater getInflater(Context paramContext)
  {
    if (inflater == null) {}
    for (paramContext = (LayoutInflater)paramContext.getSystemService("layout_inflater");; paramContext = inflater)
    {
      inflater = paramContext;
      return inflater;
    }
  }
  
  public static View inflate(Context paramContext, int paramInt, ViewGroup paramViewGroup)
  {
    return getInflater(paramContext).inflate(paramInt, paramViewGroup, false);
  }
}

/* Location:
 * Qualified Name:     com.alostpacket.pajamalib.utils.ViewUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */