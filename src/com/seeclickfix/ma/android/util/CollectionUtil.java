package com.seeclickfix.ma.android.util;

import java.util.Collection;

public class CollectionUtil
{
  private static final String[] EMPTY_ARRAY = new String[0];
  
  public static boolean isNotNullOrEmpty(Collection<?> paramCollection)
  {
    return !isNullOrEmpty(paramCollection);
  }
  
  public static boolean isNullOrEmpty(Collection<?> paramCollection)
  {
    if (paramCollection == null) {}
    while ((paramCollection.size() == 0) || (paramCollection.isEmpty())) {
      return true;
    }
    return false;
  }
  
  public static String[] nullToEmpty(String[] paramArrayOfString)
  {
    String[] arrayOfString;
    if (paramArrayOfString != null)
    {
      arrayOfString = paramArrayOfString;
      if (paramArrayOfString.length != 0) {}
    }
    else
    {
      arrayOfString = EMPTY_ARRAY;
    }
    return arrayOfString;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.util.CollectionUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */