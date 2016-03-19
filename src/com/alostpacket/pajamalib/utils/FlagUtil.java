package com.alostpacket.pajamalib.utils;

public class FlagUtil
{
  public static int getProtectionLevelInt(int paramInt)
  {
    if (matchFlag(paramInt, 1)) {
      return 2;
    }
    if (matchFlag(paramInt, 32)) {
      return 6;
    }
    if (matchFlag(paramInt, 0)) {
      return 1;
    }
    if (matchFlag(paramInt, 16)) {
      return 5;
    }
    if (matchFlag(paramInt, 2)) {
      return 4;
    }
    if (matchFlag(paramInt, 3)) {
      return 3;
    }
    return 0;
  }
  
  public static String getProtectionLevelString(int paramInt)
  {
    if (matchFlag(paramInt, 1)) {
      return "DANGEROUS";
    }
    if (matchFlag(paramInt, 32)) {
      return "DEVELOPMENT";
    }
    if (matchFlag(paramInt, 0)) {
      return "NORMAL";
    }
    if (matchFlag(paramInt, 16)) {
      return "SYSTEM";
    }
    if (matchFlag(paramInt, 2)) {
      return "SIGNATURE";
    }
    if (matchFlag(paramInt, 3)) {
      return "SIGNATURE OR SYSTEM";
    }
    return "UNKNOWN";
  }
  
  public static boolean isSystemApp(int paramInt)
  {
    return (paramInt & 0x1) > 0;
  }
  
  public static boolean matchFlag(int paramInt1, int paramInt2)
  {
    return (paramInt1 & paramInt2) > 0;
  }
}

/* Location:
 * Qualified Name:     com.alostpacket.pajamalib.utils.FlagUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */