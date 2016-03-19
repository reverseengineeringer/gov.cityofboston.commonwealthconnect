package com.google.android.gms.tagmanager;

import android.os.Build.VERSION;

class l<K, V>
{
  final a<K, V> aqk = new a()
  {
    public int sizeOf(K paramAnonymousK, V paramAnonymousV)
    {
      return 1;
    }
  };
  
  public k<K, V> a(int paramInt, a<K, V> parama)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("maxSize <= 0");
    }
    if (pg() < 12) {
      return new da(paramInt, parama);
    }
    return new bb(paramInt, parama);
  }
  
  int pg()
  {
    return Build.VERSION.SDK_INT;
  }
  
  public static abstract interface a<K, V>
  {
    public abstract int sizeOf(K paramK, V paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.tagmanager.l
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */