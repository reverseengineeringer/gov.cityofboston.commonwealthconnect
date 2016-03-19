package com.google.android.gms.analytics;

import java.util.SortedSet;
import java.util.TreeSet;

class y
{
  private static final y zV = new y();
  private SortedSet<a> zS = new TreeSet();
  private StringBuilder zT = new StringBuilder();
  private boolean zU = false;
  
  public static y eK()
  {
    return zV;
  }
  
  public void D(boolean paramBoolean)
  {
    try
    {
      zU = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void a(a parama)
  {
    try
    {
      if (!zU)
      {
        zS.add(parama);
        zT.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(parama.ordinal()));
      }
      return;
    }
    finally
    {
      parama = finally;
      throw parama;
    }
  }
  
  public String eL()
  {
    try
    {
      Object localObject1 = new StringBuilder();
      int j = 6;
      int i = 0;
      while (zS.size() > 0)
      {
        a locala = (a)zS.first();
        zS.remove(locala);
        int k = locala.ordinal();
        while (k >= j)
        {
          ((StringBuilder)localObject1).append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(i));
          j += 6;
          i = 0;
        }
        i += (1 << locala.ordinal() % 6);
      }
      if ((i > 0) || (((StringBuilder)localObject1).length() == 0)) {
        ((StringBuilder)localObject1).append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(i));
      }
      zS.clear();
      localObject1 = ((StringBuilder)localObject1).toString();
      return (String)localObject1;
    }
    finally {}
  }
  
  public String eM()
  {
    try
    {
      if (zT.length() > 0) {
        zT.insert(0, ".");
      }
      String str = zT.toString();
      zT = new StringBuilder();
      return str;
    }
    finally {}
  }
  
  public static enum a
  {
    static
    {
      Aa = new a("BLANK_04", 4);
      Ab = new a("BLANK_05", 5);
      Ac = new a("BLANK_06", 6);
      Ad = new a("BLANK_07", 7);
      Ae = new a("BLANK_08", 8);
      Af = new a("GET", 9);
      Ag = new a("SET", 10);
      Ah = new a("SEND", 11);
      Ai = new a("BLANK_12", 12);
      Aj = new a("BLANK_13", 13);
      Ak = new a("BLANK_14", 14);
      Al = new a("BLANK_15", 15);
      Am = new a("BLANK_16", 16);
      An = new a("BLANK_17", 17);
      Ao = new a("BLANK_18", 18);
      Ap = new a("BLANK_19", 19);
      Aq = new a("BLANK_20", 20);
      Ar = new a("BLANK_21", 21);
      As = new a("BLANK_22", 22);
      At = new a("BLANK_23", 23);
      Au = new a("BLANK_24", 24);
      Av = new a("BLANK_25", 25);
      Aw = new a("BLANK_26", 26);
      Ax = new a("BLANK_27", 27);
      Ay = new a("BLANK_28", 28);
      Az = new a("BLANK_29", 29);
    }
    
    private a() {}
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.analytics.y
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */