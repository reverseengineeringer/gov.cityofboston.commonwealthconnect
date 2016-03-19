package com.seeclickfix.ma.android.objects;

import android.os.Bundle;
import android.os.Parcelable;

public class BundleFactory
{
  public static Bundle createFromParcel(String paramString, Parcelable paramParcelable)
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable(paramString, paramParcelable);
    return localBundle;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.BundleFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */