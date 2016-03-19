package com.seeclickfix.ma.android.style;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Typeface;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.view.ViewParent;
import android.widget.TextView;
import android.widget.TextView.BufferType;
import com.seeclickfix.ma.android.util.DisplayUtil;

public class StyleUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = false;
  private static final String TAG = "StyleUtil";
  private static Typeface face;
  private static Typeface faceBold;
  private static Typeface logoface;
  
  public static void appendNotPublicString(String paramString, TextView paramTextView, Context paramContext)
  {
    setTwoColorsTextStrings(paramString, " " + paramContext.getString(2131493128), paramTextView, paramContext, paramTextView.getTextColors().getDefaultColor(), paramContext.getResources().getColor(2131230750));
  }
  
  public static void appendReqAndNotPub(String paramString, TextView paramTextView, Context paramContext)
  {
    String str1 = " " + paramContext.getString(2131493157);
    String str2 = " " + paramContext.getString(2131493128);
    int i = paramTextView.getTextColors().getDefaultColor();
    int j = paramContext.getResources().getColor(2131230750);
    setThreeColorsTextStrings(paramString, str1, str2, paramTextView, paramContext, i, paramContext.getResources().getColor(2131230775), j);
  }
  
  public static void appendRequiredString(String paramString, TextView paramTextView, Context paramContext)
  {
    setTwoColorsTextStrings(paramString, " " + paramContext.getString(2131493157), paramTextView, paramContext, paramTextView.getTextColors().getDefaultColor(), paramContext.getResources().getColor(2131230775));
  }
  
  public static final Typeface getLogoTypeFace(Context paramContext)
  {
    if (logoface == null) {
      logoface = Typeface.createFromAsset(paramContext.getAssets(), "AvantGaurdGothicDemi.otf");
    }
    return logoface;
  }
  
  public static final Typeface getTypeFace(Context paramContext)
  {
    if (face == null) {
      face = Typeface.createFromAsset(paramContext.getAssets(), "OpenSansSemibold.ttf");
    }
    return face;
  }
  
  public static final Typeface getTypeFaceBold(Context paramContext)
  {
    if (faceBold == null) {
      faceBold = Typeface.createFromAsset(paramContext.getAssets(), "OpenSansSemibold.ttf");
    }
    return faceBold;
  }
  
  public static void setActionBarBasic(String paramString, TextView paramTextView, Context paramContext)
  {
    try
    {
      SpannableString localSpannableString = new SpannableString(paramString);
      int i = paramContext.getResources().getColor(2131230752);
      int j = paramString.length();
      localSpannableString.setSpan(new ForegroundColorSpan(i), 0, j, 18);
      paramString = SpannableString.valueOf(localSpannableString);
      paramTextView.setTextSize(16.0F);
      paramTextView.setText(paramString, TextView.BufferType.SPANNABLE);
      setTypeFace(paramTextView, paramContext);
      return;
    }
    catch (Exception paramString) {}
  }
  
  public static void setActionBarSubBasic(String paramString, TextView paramTextView, Context paramContext)
  {
    try
    {
      SpannableString localSpannableString = new SpannableString(paramString);
      int i = paramContext.getResources().getColor(2131230768);
      int j = paramString.length();
      localSpannableString.setSpan(new ForegroundColorSpan(i), 0, j, 18);
      paramString = SpannableString.valueOf(localSpannableString);
      paramTextView.setTextSize(14.0F);
      paramTextView.setText(paramString, TextView.BufferType.SPANNABLE);
      setTypeFace(paramTextView, paramContext);
      paramTextView.setPadding(0, DisplayUtil.getPixelsForDp(2), 0, 0);
      paramTextView.setTextColor(i);
      return;
    }
    catch (Exception paramString) {}
  }
  
  public static void setActionBarTextColors(TextView paramTextView, Context paramContext)
  {
    String str1 = paramContext.getString(2131493178);
    String str2 = paramContext.getString(2131492886);
    String str3 = paramContext.getString(2131492990);
    SpannableString localSpannableString1 = new SpannableString(str1);
    SpannableString localSpannableString2 = new SpannableString(str2);
    SpannableString localSpannableString3 = new SpannableString(str3);
    int i = Color.parseColor("#FFEF7F25");
    int j = Color.parseColor("#FF2486B5");
    int k = Color.parseColor("#FF5E5E5E");
    int m = str1.length();
    int n = str2.length();
    int i1 = str3.length();
    localSpannableString1.setSpan(new ForegroundColorSpan(k), 0, m, 18);
    localSpannableString2.setSpan(new ForegroundColorSpan(i), 0, n, 18);
    localSpannableString3.setSpan(new ForegroundColorSpan(j), 0, i1, 18);
    paramTextView.setText(SpannableString.valueOf(TextUtils.concat(new CharSequence[] { localSpannableString1, localSpannableString2, localSpannableString3 })), TextView.BufferType.SPANNABLE);
    paramTextView.setTextSize(16.0F);
    setLogoTypeFace(paramTextView, paramContext);
  }
  
  public static void setBoldTextStrings(SpannableString paramSpannableString1, SpannableString paramSpannableString2, TextView paramTextView, Context paramContext)
  {
    int i = paramSpannableString1.length();
    paramSpannableString1.setSpan(new StyleSpan(1), 0, i, 33);
    paramTextView.setText(SpannableString.valueOf(TextUtils.concat(new CharSequence[] { paramSpannableString1, paramSpannableString2 })), TextView.BufferType.SPANNABLE);
  }
  
  public static void setLogoTypeFace(TextView paramTextView, Context paramContext)
  {
    paramTextView.setTypeface(getLogoTypeFace(paramContext));
    paramTextView.getParent().recomputeViewAttributes(paramTextView);
  }
  
  public static void setThreeColorsTextStrings(String paramString1, String paramString2, String paramString3, TextView paramTextView, Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    paramContext = new SpannableString(paramString1);
    SpannableString localSpannableString1 = new SpannableString(paramString2);
    SpannableString localSpannableString2 = new SpannableString(paramString3);
    int i = paramString1.length();
    int j = paramString2.length();
    int k = paramString3.length();
    paramContext.setSpan(new ForegroundColorSpan(paramInt1), 0, i, 33);
    localSpannableString1.setSpan(new ForegroundColorSpan(paramInt2), 0, j, 33);
    localSpannableString2.setSpan(new ForegroundColorSpan(paramInt3), 0, k, 33);
    paramTextView.setText(SpannableString.valueOf(TextUtils.concat(new CharSequence[] { paramContext, localSpannableString1, localSpannableString2 })), TextView.BufferType.SPANNABLE);
  }
  
  public static void setTwoColorsBoldTextStrings(String paramString1, String paramString2, TextView paramTextView, Context paramContext, int paramInt1, int paramInt2)
  {
    paramContext = new SpannableString(paramString1);
    SpannableString localSpannableString = new SpannableString(paramString2);
    int i = paramString1.length();
    int j = paramString2.length();
    paramContext.setSpan(new ForegroundColorSpan(paramInt1), 0, i, 33);
    paramContext.setSpan(new StyleSpan(1), 0, i, 33);
    localSpannableString.setSpan(new ForegroundColorSpan(paramInt2), 0, j, 33);
    paramTextView.setText(SpannableString.valueOf(TextUtils.concat(new CharSequence[] { paramContext, localSpannableString })), TextView.BufferType.SPANNABLE);
  }
  
  public static void setTwoColorsTextStrings(String paramString1, String paramString2, TextView paramTextView, Context paramContext, int paramInt1, int paramInt2)
  {
    paramContext = new SpannableString(paramString1);
    SpannableString localSpannableString = new SpannableString(paramString2);
    int i = paramString1.length();
    int j = paramString2.length();
    paramContext.setSpan(new ForegroundColorSpan(paramInt1), 0, i, 33);
    localSpannableString.setSpan(new ForegroundColorSpan(paramInt2), 0, j, 33);
    paramTextView.setText(SpannableString.valueOf(TextUtils.concat(new CharSequence[] { paramContext, localSpannableString })), TextView.BufferType.SPANNABLE);
  }
  
  public static void setTypeFace(TextView paramTextView, Context paramContext)
  {
    paramTextView.setTypeface(getTypeFace(paramContext));
    paramTextView.getParent().recomputeViewAttributes(paramTextView);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.style.StyleUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */