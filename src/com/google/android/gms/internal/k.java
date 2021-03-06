package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.net.Uri.Builder;
import android.view.MotionEvent;

public class k
{
  private String kU = "googleads.g.doubleclick.net";
  private String kV = "/pagead/ads";
  private String kW = "ad.doubleclick.net";
  private String[] kX = { ".doubleclick.net", ".googleadservices.com", ".googlesyndication.com" };
  private g kY;
  
  public k(g paramg)
  {
    kY = paramg;
  }
  
  private Uri a(Uri paramUri, Context paramContext, String paramString, boolean paramBoolean)
    throws l
  {
    boolean bool;
    try
    {
      bool = a(paramUri);
      if (bool)
      {
        if (!paramUri.toString().contains("dc_ms=")) {
          break label64;
        }
        throw new l("Parameter already exists: dc_ms");
      }
    }
    catch (UnsupportedOperationException paramUri)
    {
      throw new l("Provided Uri is not in a valid state");
    }
    if (paramUri.getQueryParameter("ms") != null) {
      throw new l("Query parameter already exists: ms");
    }
    label64:
    if (paramBoolean) {}
    for (paramContext = kY.a(paramContext, paramString); bool; paramContext = kY.a(paramContext)) {
      return b(paramUri, "dc_ms", paramContext);
    }
    paramUri = a(paramUri, "ms", paramContext);
    return paramUri;
  }
  
  private Uri a(Uri paramUri, String paramString1, String paramString2)
    throws UnsupportedOperationException
  {
    String str = paramUri.toString();
    int j = str.indexOf("&adurl");
    int i = j;
    if (j == -1) {
      i = str.indexOf("?adurl");
    }
    if (i != -1) {
      return Uri.parse(str.substring(0, i + 1) + paramString1 + "=" + paramString2 + "&" + str.substring(i + 1));
    }
    return paramUri.buildUpon().appendQueryParameter(paramString1, paramString2).build();
  }
  
  private Uri b(Uri paramUri, String paramString1, String paramString2)
  {
    String str = paramUri.toString();
    int i = str.indexOf(";adurl");
    if (i != -1) {
      return Uri.parse(str.substring(0, i + 1) + paramString1 + "=" + paramString2 + ";" + str.substring(i + 1));
    }
    paramUri = paramUri.getEncodedPath();
    i = str.indexOf(paramUri);
    return Uri.parse(str.substring(0, paramUri.length() + i) + ";" + paramString1 + "=" + paramString2 + ";" + str.substring(paramUri.length() + i));
  }
  
  public g C()
  {
    return kY;
  }
  
  public Uri a(Uri paramUri, Context paramContext)
    throws l
  {
    try
    {
      paramUri = a(paramUri, paramContext, paramUri.getQueryParameter("ai"), true);
      return paramUri;
    }
    catch (UnsupportedOperationException paramUri)
    {
      throw new l("Provided Uri is not in a valid state");
    }
  }
  
  public void a(MotionEvent paramMotionEvent)
  {
    kY.a(paramMotionEvent);
  }
  
  public boolean a(Uri paramUri)
  {
    if (paramUri == null) {
      throw new NullPointerException();
    }
    try
    {
      boolean bool = paramUri.getHost().equals(kW);
      return bool;
    }
    catch (NullPointerException paramUri) {}
    return false;
  }
  
  public boolean b(Uri paramUri)
  {
    boolean bool2 = false;
    if (paramUri == null) {
      throw new NullPointerException();
    }
    try
    {
      paramUri = paramUri.getHost();
      String[] arrayOfString = kX;
      int j = arrayOfString.length;
      int i = 0;
      for (;;)
      {
        boolean bool1 = bool2;
        if (i < j)
        {
          bool1 = paramUri.endsWith(arrayOfString[i]);
          if (bool1) {
            bool1 = true;
          }
        }
        else
        {
          return bool1;
        }
        i += 1;
      }
      return false;
    }
    catch (NullPointerException paramUri) {}
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.k
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */