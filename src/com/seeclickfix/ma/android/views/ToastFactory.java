package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class ToastFactory
{
  private static Toast lastToast = null;
  
  public static void showBottomShortToast(Context paramContext, String paramString)
  {
    showToast(paramContext, paramString, 0, 80);
  }
  
  public static void showCenteredLong(Context paramContext, int paramInt)
  {
    showToast(paramContext, paramInt, 1, 17);
  }
  
  public static void showCenteredShortToast(Context paramContext, int paramInt)
  {
    showToast(paramContext, paramInt, 0, 17);
  }
  
  public static void showCenteredShortToast(Context paramContext, String paramString)
  {
    showToast(paramContext, paramString, 0, 17);
  }
  
  public static void showHint(Context paramContext, int paramInt)
  {
    if (lastToast != null) {
      lastToast.cancel();
    }
    Toast localToast = new Toast(paramContext);
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(2130903150, null);
    ((TextView)paramContext.findViewById(2131362178)).setText(paramInt);
    localToast.setView(paramContext);
    localToast.setDuration(0);
    localToast.setGravity(17, 0, 0);
    paramContext.setBackgroundResource(2130837679);
    localToast.show();
    lastToast = localToast;
  }
  
  public static void showToast(Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    showToast(paramContext, paramContext.getResources().getString(paramInt1), paramInt2, paramInt3);
  }
  
  public static void showToast(Context paramContext, String paramString, int paramInt1, int paramInt2)
  {
    if (lastToast != null) {
      lastToast.cancel();
    }
    Toast localToast = Toast.makeText(paramContext, "", paramInt1);
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(2130903150, null);
    ((TextView)paramContext.findViewById(2131362178)).setText(paramString);
    localToast.setGravity(paramInt2, 0, 0);
    paramContext.setBackgroundResource(2130837679);
    localToast.setView(paramContext);
    localToast.show();
    lastToast = localToast;
  }
  
  public static void showTopShortToast(Context paramContext, String paramString)
  {
    showToast(paramContext, paramString, 0, 48);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.ToastFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */