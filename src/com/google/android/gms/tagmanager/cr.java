package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.b;
import com.google.android.gms.internal.c.b;
import com.google.android.gms.internal.c.e;
import com.google.android.gms.internal.c.f;
import com.google.android.gms.internal.c.g;
import com.google.android.gms.internal.c.h;
import com.google.android.gms.internal.d.a;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

class cr
{
  private static d.a a(int paramInt, c.f paramf, d.a[] paramArrayOfa, Set<Integer> paramSet)
    throws cr.g
  {
    int k = 0;
    int m = 0;
    int j = 0;
    if (paramSet.contains(Integer.valueOf(paramInt))) {
      cN("Value cycle detected.  Current value reference: " + paramInt + "." + "  Previous value references: " + paramSet + ".");
    }
    d.a locala1 = (d.a)a(fG, paramInt, "values");
    if (paramArrayOfa[paramInt] != null) {
      return paramArrayOfa[paramInt];
    }
    Object localObject = null;
    paramSet.add(Integer.valueOf(paramInt));
    switch (type)
    {
    }
    for (;;)
    {
      if (localObject == null) {
        cN("Invalid value: " + locala1);
      }
      paramArrayOfa[paramInt] = localObject;
      paramSet.remove(Integer.valueOf(paramInt));
      return (d.a)localObject;
      localObject = h(locala1);
      d.a locala2 = g(locala1);
      gw = new d.a[gh.length];
      int[] arrayOfInt = gh;
      k = arrayOfInt.length;
      int i = 0;
      for (;;)
      {
        localObject = locala2;
        if (j >= k) {
          break;
        }
        m = arrayOfInt[j];
        gw[i] = a(m, paramf, paramArrayOfa, paramSet);
        j += 1;
        i += 1;
      }
      locala2 = g(locala1);
      localObject = h(locala1);
      if (gi.length != gj.length) {
        cN("Uneven map keys (" + gi.length + ") and map values (" + gj.length + ")");
      }
      gx = new d.a[gi.length];
      gy = new d.a[gi.length];
      arrayOfInt = gi;
      m = arrayOfInt.length;
      j = 0;
      i = 0;
      while (j < m)
      {
        int n = arrayOfInt[j];
        gx[i] = a(n, paramf, paramArrayOfa, paramSet);
        j += 1;
        i += 1;
      }
      arrayOfInt = gj;
      m = arrayOfInt.length;
      i = 0;
      j = k;
      for (;;)
      {
        localObject = locala2;
        if (j >= m) {
          break;
        }
        k = arrayOfInt[j];
        gy[i] = a(k, paramf, paramArrayOfa, paramSet);
        j += 1;
        i += 1;
      }
      localObject = g(locala1);
      gz = di.j(a(hgm, paramf, paramArrayOfa, paramSet));
      continue;
      locala2 = g(locala1);
      localObject = h(locala1);
      gD = new d.a[gl.length];
      arrayOfInt = gl;
      k = arrayOfInt.length;
      i = 0;
      j = m;
      for (;;)
      {
        localObject = locala2;
        if (j >= k) {
          break;
        }
        m = arrayOfInt[j];
        gD[i] = a(m, paramf, paramArrayOfa, paramSet);
        j += 1;
        i += 1;
      }
      localObject = locala1;
    }
  }
  
  private static a a(c.b paramb, c.f paramf, d.a[] paramArrayOfa, int paramInt)
    throws cr.g
  {
    b localb = a.qk();
    paramb = fq;
    int i = paramb.length;
    paramInt = 0;
    if (paramInt < i)
    {
      int j = paramb[paramInt];
      Object localObject = (c.e)a(fH, Integer.valueOf(j).intValue(), "properties");
      String str = (String)a(fF, key, "keys");
      localObject = (d.a)a(paramArrayOfa, value, "values");
      if (b.ec.toString().equals(str)) {
        localb.i((d.a)localObject);
      }
      for (;;)
      {
        paramInt += 1;
        break;
        localb.b(str, (d.a)localObject);
      }
    }
    return localb.qn();
  }
  
  private static e a(c.g paramg, List<a> paramList1, List<a> paramList2, List<a> paramList3, c.f paramf)
  {
    f localf = e.qs();
    int[] arrayOfInt = fV;
    int j = arrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      localf.b((a)paramList3.get(Integer.valueOf(arrayOfInt[i]).intValue()));
      i += 1;
    }
    arrayOfInt = fW;
    j = arrayOfInt.length;
    i = 0;
    while (i < j)
    {
      localf.c((a)paramList3.get(Integer.valueOf(arrayOfInt[i]).intValue()));
      i += 1;
    }
    paramList3 = fX;
    j = paramList3.length;
    i = 0;
    while (i < j)
    {
      localf.d((a)paramList1.get(Integer.valueOf(paramList3[i]).intValue()));
      i += 1;
    }
    paramList3 = fZ;
    j = paramList3.length;
    i = 0;
    int k;
    while (i < j)
    {
      k = paramList3[i];
      localf.cP(fG[Integer.valueOf(k).intValue()].gv);
      i += 1;
    }
    paramList3 = fY;
    j = paramList3.length;
    i = 0;
    while (i < j)
    {
      localf.e((a)paramList1.get(Integer.valueOf(paramList3[i]).intValue()));
      i += 1;
    }
    paramList1 = ga;
    j = paramList1.length;
    i = 0;
    while (i < j)
    {
      k = paramList1[i];
      localf.cQ(fG[Integer.valueOf(k).intValue()].gv);
      i += 1;
    }
    paramList1 = gb;
    j = paramList1.length;
    i = 0;
    while (i < j)
    {
      localf.f((a)paramList2.get(Integer.valueOf(paramList1[i]).intValue()));
      i += 1;
    }
    paramList1 = gd;
    j = paramList1.length;
    i = 0;
    while (i < j)
    {
      k = paramList1[i];
      localf.cR(fG[Integer.valueOf(k).intValue()].gv);
      i += 1;
    }
    paramList1 = gc;
    j = paramList1.length;
    i = 0;
    while (i < j)
    {
      localf.g((a)paramList2.get(Integer.valueOf(paramList1[i]).intValue()));
      i += 1;
    }
    paramg = ge;
    j = paramg.length;
    i = 0;
    while (i < j)
    {
      k = paramg[i];
      localf.cS(fG[Integer.valueOf(k).intValue()].gv);
      i += 1;
    }
    return localf.qD();
  }
  
  private static <T> T a(T[] paramArrayOfT, int paramInt, String paramString)
    throws cr.g
  {
    if ((paramInt < 0) || (paramInt >= paramArrayOfT.length)) {
      cN("Index out of bounds detected: " + paramInt + " in " + paramString);
    }
    return paramArrayOfT[paramInt];
  }
  
  public static c b(c.f paramf)
    throws cr.g
  {
    int j = 0;
    Object localObject = new d.a[fG.length];
    int i = 0;
    while (i < fG.length)
    {
      a(i, paramf, (d.a[])localObject, new HashSet(0));
      i += 1;
    }
    d locald = c.qo();
    ArrayList localArrayList1 = new ArrayList();
    i = 0;
    while (i < fJ.length)
    {
      localArrayList1.add(a(fJ[i], paramf, (d.a[])localObject, i));
      i += 1;
    }
    ArrayList localArrayList2 = new ArrayList();
    i = 0;
    while (i < fK.length)
    {
      localArrayList2.add(a(fK[i], paramf, (d.a[])localObject, i));
      i += 1;
    }
    ArrayList localArrayList3 = new ArrayList();
    i = 0;
    while (i < fI.length)
    {
      a locala = a(fI[i], paramf, (d.a[])localObject, i);
      locald.a(locala);
      localArrayList3.add(locala);
      i += 1;
    }
    localObject = fL;
    int k = localObject.length;
    i = j;
    while (i < k)
    {
      locald.a(a(localObject[i], localArrayList1, localArrayList3, localArrayList2, paramf));
      i += 1;
    }
    locald.cO(version);
    locald.fO(fT);
    return locald.qr();
  }
  
  public static void b(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte['Ѐ'];
    for (;;)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1) {
        return;
      }
      paramOutputStream.write(arrayOfByte, 0, i);
    }
  }
  
  private static void cN(String paramString)
    throws cr.g
  {
    bh.T(paramString);
    throw new g(paramString);
  }
  
  public static d.a g(d.a parama)
  {
    d.a locala = new d.a();
    type = type;
    gE = ((int[])gE.clone());
    if (gF) {
      gF = gF;
    }
    return locala;
  }
  
  private static c.h h(d.a parama)
    throws cr.g
  {
    if ((c.h)parama.a(c.h.gf) == null) {
      cN("Expected a ServingValue and didn't get one. Value is: " + parama);
    }
    return (c.h)parama.a(c.h.gf);
  }
  
  public static class a
  {
    private final Map<String, d.a> asM;
    private final d.a asN;
    
    private a(Map<String, d.a> paramMap, d.a parama)
    {
      asM = paramMap;
      asN = parama;
    }
    
    public static cr.b qk()
    {
      return new cr.b(null);
    }
    
    public void a(String paramString, d.a parama)
    {
      asM.put(paramString, parama);
    }
    
    public Map<String, d.a> ql()
    {
      return Collections.unmodifiableMap(asM);
    }
    
    public d.a qm()
    {
      return asN;
    }
    
    public String toString()
    {
      return "Properties: " + ql() + " pushAfterEvaluate: " + asN;
    }
  }
  
  public static class b
  {
    private final Map<String, d.a> asM = new HashMap();
    private d.a asN;
    
    public b b(String paramString, d.a parama)
    {
      asM.put(paramString, parama);
      return this;
    }
    
    public b i(d.a parama)
    {
      asN = parama;
      return this;
    }
    
    public cr.a qn()
    {
      return new cr.a(asM, asN, null);
    }
  }
  
  public static class c
  {
    private final String TU;
    private final List<cr.e> asO;
    private final Map<String, List<cr.a>> asP;
    private final int asQ;
    
    private c(List<cr.e> paramList, Map<String, List<cr.a>> paramMap, String paramString, int paramInt)
    {
      asO = Collections.unmodifiableList(paramList);
      asP = Collections.unmodifiableMap(paramMap);
      TU = paramString;
      asQ = paramInt;
    }
    
    public static cr.d qo()
    {
      return new cr.d(null);
    }
    
    public String getVersion()
    {
      return TU;
    }
    
    public List<cr.e> qp()
    {
      return asO;
    }
    
    public Map<String, List<cr.a>> qq()
    {
      return asP;
    }
    
    public String toString()
    {
      return "Rules: " + qp() + "  Macros: " + asP;
    }
  }
  
  public static class d
  {
    private String TU = "";
    private final List<cr.e> asO = new ArrayList();
    private final Map<String, List<cr.a>> asP = new HashMap();
    private int asQ = 0;
    
    public d a(cr.a parama)
    {
      String str = di.j((d.a)parama.ql().get(b.df.toString()));
      List localList = (List)asP.get(str);
      Object localObject = localList;
      if (localList == null)
      {
        localObject = new ArrayList();
        asP.put(str, localObject);
      }
      ((List)localObject).add(parama);
      return this;
    }
    
    public d a(cr.e parame)
    {
      asO.add(parame);
      return this;
    }
    
    public d cO(String paramString)
    {
      TU = paramString;
      return this;
    }
    
    public d fO(int paramInt)
    {
      asQ = paramInt;
      return this;
    }
    
    public cr.c qr()
    {
      return new cr.c(asO, asP, TU, asQ, null);
    }
  }
  
  public static class e
  {
    private final List<cr.a> asR;
    private final List<cr.a> asS;
    private final List<cr.a> asT;
    private final List<cr.a> asU;
    private final List<cr.a> asV;
    private final List<cr.a> asW;
    private final List<String> asX;
    private final List<String> asY;
    private final List<String> asZ;
    private final List<String> ata;
    
    private e(List<cr.a> paramList1, List<cr.a> paramList2, List<cr.a> paramList3, List<cr.a> paramList4, List<cr.a> paramList5, List<cr.a> paramList6, List<String> paramList7, List<String> paramList8, List<String> paramList9, List<String> paramList10)
    {
      asR = Collections.unmodifiableList(paramList1);
      asS = Collections.unmodifiableList(paramList2);
      asT = Collections.unmodifiableList(paramList3);
      asU = Collections.unmodifiableList(paramList4);
      asV = Collections.unmodifiableList(paramList5);
      asW = Collections.unmodifiableList(paramList6);
      asX = Collections.unmodifiableList(paramList7);
      asY = Collections.unmodifiableList(paramList8);
      asZ = Collections.unmodifiableList(paramList9);
      ata = Collections.unmodifiableList(paramList10);
    }
    
    public static cr.f qs()
    {
      return new cr.f(null);
    }
    
    public List<String> qA()
    {
      return asZ;
    }
    
    public List<String> qB()
    {
      return ata;
    }
    
    public List<cr.a> qC()
    {
      return asW;
    }
    
    public List<cr.a> qt()
    {
      return asR;
    }
    
    public List<cr.a> qu()
    {
      return asS;
    }
    
    public List<cr.a> qv()
    {
      return asT;
    }
    
    public List<cr.a> qw()
    {
      return asU;
    }
    
    public List<cr.a> qx()
    {
      return asV;
    }
    
    public List<String> qy()
    {
      return asX;
    }
    
    public List<String> qz()
    {
      return asY;
    }
    
    public String toString()
    {
      return "Positive predicates: " + qt() + "  Negative predicates: " + qu() + "  Add tags: " + qv() + "  Remove tags: " + qw() + "  Add macros: " + qx() + "  Remove macros: " + qC();
    }
  }
  
  public static class f
  {
    private final List<cr.a> asR = new ArrayList();
    private final List<cr.a> asS = new ArrayList();
    private final List<cr.a> asT = new ArrayList();
    private final List<cr.a> asU = new ArrayList();
    private final List<cr.a> asV = new ArrayList();
    private final List<cr.a> asW = new ArrayList();
    private final List<String> asX = new ArrayList();
    private final List<String> asY = new ArrayList();
    private final List<String> asZ = new ArrayList();
    private final List<String> ata = new ArrayList();
    
    public f b(cr.a parama)
    {
      asR.add(parama);
      return this;
    }
    
    public f c(cr.a parama)
    {
      asS.add(parama);
      return this;
    }
    
    public f cP(String paramString)
    {
      asZ.add(paramString);
      return this;
    }
    
    public f cQ(String paramString)
    {
      ata.add(paramString);
      return this;
    }
    
    public f cR(String paramString)
    {
      asX.add(paramString);
      return this;
    }
    
    public f cS(String paramString)
    {
      asY.add(paramString);
      return this;
    }
    
    public f d(cr.a parama)
    {
      asT.add(parama);
      return this;
    }
    
    public f e(cr.a parama)
    {
      asU.add(parama);
      return this;
    }
    
    public f f(cr.a parama)
    {
      asV.add(parama);
      return this;
    }
    
    public f g(cr.a parama)
    {
      asW.add(parama);
      return this;
    }
    
    public cr.e qD()
    {
      return new cr.e(asR, asS, asT, asU, asV, asW, asX, asY, asZ, ata, null);
    }
  }
  
  public static class g
    extends Exception
  {
    public g(String paramString)
    {
      super();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.tagmanager.cr
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */