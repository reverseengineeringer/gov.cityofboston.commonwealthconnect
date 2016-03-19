package com.google.android.gms.internal;

import java.io.IOException;

public abstract interface c
{
  public static final class a
    extends qq<a>
  {
    public int fn;
    public int fo;
    public int level;
    
    public a()
    {
      b();
    }
    
    public a a(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          i = paramqo.rC();
          switch (i)
          {
          default: 
            break;
          case 1: 
          case 2: 
          case 3: 
            level = i;
          }
          break;
        case 16: 
          fn = paramqo.rC();
          break;
        case 24: 
          fo = paramqo.rC();
        }
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if (level != 1) {
        paramqp.t(1, level);
      }
      if (fn != 0) {
        paramqp.t(2, fn);
      }
      if (fo != 0) {
        paramqp.t(3, fo);
      }
      super.a(paramqp);
    }
    
    public a b()
    {
      level = 1;
      fn = 0;
      fo = 0;
      ayW = null;
      azh = -1;
      return this;
    }
    
    protected int c()
    {
      int j = super.c();
      int i = j;
      if (level != 1) {
        i = j + qp.v(1, level);
      }
      j = i;
      if (fn != 0) {
        j = i + qp.v(2, fn);
      }
      i = j;
      if (fo != 0) {
        i = j + qp.v(3, fo);
      }
      return i;
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof a));
            paramObject = (a)paramObject;
            bool1 = bool2;
          } while (level != level);
          bool1 = bool2;
        } while (fn != fn);
        bool1 = bool2;
      } while (fo != fo);
      return a((qq)paramObject);
    }
    
    public int hashCode()
    {
      return (((level + 527) * 31 + fn) * 31 + fo) * 31 + rQ();
    }
  }
  
  public static final class b
    extends qq<b>
  {
    private static volatile b[] fp;
    public int[] fq;
    public int fr;
    public boolean fs;
    public boolean ft;
    public int name;
    
    public b()
    {
      e();
    }
    
    public static b[] d()
    {
      if (fp == null) {}
      synchronized (qu.azg)
      {
        if (fp == null) {
          fp = new b[0];
        }
        return fp;
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if (ft) {
        paramqp.b(1, ft);
      }
      paramqp.t(2, fr);
      if ((fq != null) && (fq.length > 0))
      {
        int i = 0;
        while (i < fq.length)
        {
          paramqp.t(3, fq[i]);
          i += 1;
        }
      }
      if (name != 0) {
        paramqp.t(4, name);
      }
      if (fs) {
        paramqp.b(6, fs);
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int j = 0;
      int k = super.c();
      int i = k;
      if (ft) {
        i = k + qp.c(1, ft);
      }
      k = qp.v(2, fr) + i;
      if ((fq != null) && (fq.length > 0))
      {
        i = 0;
        while (i < fq.length)
        {
          j += qp.gZ(fq[i]);
          i += 1;
        }
      }
      for (j = k + j + fq.length * 1;; j = k)
      {
        i = j;
        if (name != 0) {
          i = j + qp.v(4, name);
        }
        j = i;
        if (fs) {
          j = i + qp.c(6, fs);
        }
        return j;
      }
    }
    
    public b c(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        int j;
        int[] arrayOfInt;
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          ft = paramqo.rD();
          break;
        case 16: 
          fr = paramqo.rC();
          break;
        case 24: 
          j = qz.b(paramqo, 24);
          if (fq == null) {}
          for (i = 0;; i = fq.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fq, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          fq = arrayOfInt;
          break;
        case 26: 
          int k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (fq == null) {}
          for (i = 0;; i = fq.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fq, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          fq = arrayOfInt;
          paramqo.gT(k);
          break;
        case 32: 
          name = paramqo.rC();
          break;
        case 48: 
          fs = paramqo.rD();
        }
      }
    }
    
    public b e()
    {
      fq = qz.azj;
      fr = 0;
      name = 0;
      fs = false;
      ft = false;
      ayW = null;
      azh = -1;
      return this;
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  return bool1;
                  bool1 = bool2;
                } while (!(paramObject instanceof b));
                paramObject = (b)paramObject;
                bool1 = bool2;
              } while (!qu.equals(fq, fq));
              bool1 = bool2;
            } while (fr != fr);
            bool1 = bool2;
          } while (name != name);
          bool1 = bool2;
        } while (fs != fs);
        bool1 = bool2;
      } while (ft != ft);
      return a((qq)paramObject);
    }
    
    public int hashCode()
    {
      int j = 1231;
      int k = qu.hashCode(fq);
      int m = fr;
      int n = name;
      int i;
      if (fs)
      {
        i = 1231;
        if (!ft) {
          break label85;
        }
      }
      for (;;)
      {
        return ((i + (((k + 527) * 31 + m) * 31 + n) * 31) * 31 + j) * 31 + rQ();
        i = 1237;
        break;
        label85:
        j = 1237;
      }
    }
  }
  
  public static final class c
    extends qq<c>
  {
    private static volatile c[] fu;
    public String fv;
    public long fw;
    public long fx;
    public boolean fy;
    public long fz;
    
    public c()
    {
      g();
    }
    
    public static c[] f()
    {
      if (fu == null) {}
      synchronized (qu.azg)
      {
        if (fu == null) {
          fu = new c[0];
        }
        return fu;
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if (!fv.equals("")) {
        paramqp.b(1, fv);
      }
      if (fw != 0L) {
        paramqp.b(2, fw);
      }
      if (fx != 2147483647L) {
        paramqp.b(3, fx);
      }
      if (fy) {
        paramqp.b(4, fy);
      }
      if (fz != 0L) {
        paramqp.b(5, fz);
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int j = super.c();
      int i = j;
      if (!fv.equals("")) {
        i = j + qp.j(1, fv);
      }
      j = i;
      if (fw != 0L) {
        j = i + qp.d(2, fw);
      }
      i = j;
      if (fx != 2147483647L) {
        i = j + qp.d(3, fx);
      }
      j = i;
      if (fy) {
        j = i + qp.c(4, fy);
      }
      i = j;
      if (fz != 0L) {
        i = j + qp.d(5, fz);
      }
      return i;
    }
    
    public c d(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          fv = paramqo.readString();
          break;
        case 16: 
          fw = paramqo.rB();
          break;
        case 24: 
          fx = paramqo.rB();
          break;
        case 32: 
          fy = paramqo.rD();
          break;
        case 40: 
          fz = paramqo.rB();
        }
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          return bool1;
          bool1 = bool2;
        } while (!(paramObject instanceof c));
        paramObject = (c)paramObject;
        if (fv != null) {
          break;
        }
        bool1 = bool2;
      } while (fv != null);
      while (fv.equals(fv))
      {
        bool1 = bool2;
        if (fw != fw) {
          break;
        }
        bool1 = bool2;
        if (fx != fx) {
          break;
        }
        bool1 = bool2;
        if (fy != fy) {
          break;
        }
        bool1 = bool2;
        if (fz != fz) {
          break;
        }
        return a((qq)paramObject);
      }
      return false;
    }
    
    public c g()
    {
      fv = "";
      fw = 0L;
      fx = 2147483647L;
      fy = false;
      fz = 0L;
      ayW = null;
      azh = -1;
      return this;
    }
    
    public int hashCode()
    {
      int i;
      int k;
      int m;
      if (fv == null)
      {
        i = 0;
        k = (int)(fw ^ fw >>> 32);
        m = (int)(fx ^ fx >>> 32);
        if (!fy) {
          break label107;
        }
      }
      label107:
      for (int j = 1231;; j = 1237)
      {
        return ((j + (((i + 527) * 31 + k) * 31 + m) * 31) * 31 + (int)(fz ^ fz >>> 32)) * 31 + rQ();
        i = fv.hashCode();
        break;
      }
    }
  }
  
  public static final class d
    extends qq<d>
  {
    public d.a[] fA;
    public d.a[] fB;
    public c.c[] fC;
    
    public d()
    {
      h();
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      int j = 0;
      int i;
      Object localObject;
      if ((fA != null) && (fA.length > 0))
      {
        i = 0;
        while (i < fA.length)
        {
          localObject = fA[i];
          if (localObject != null) {
            paramqp.a(1, (qw)localObject);
          }
          i += 1;
        }
      }
      if ((fB != null) && (fB.length > 0))
      {
        i = 0;
        while (i < fB.length)
        {
          localObject = fB[i];
          if (localObject != null) {
            paramqp.a(2, (qw)localObject);
          }
          i += 1;
        }
      }
      if ((fC != null) && (fC.length > 0))
      {
        i = j;
        while (i < fC.length)
        {
          localObject = fC[i];
          if (localObject != null) {
            paramqp.a(3, (qw)localObject);
          }
          i += 1;
        }
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int m = 0;
      int i = super.c();
      int j = i;
      Object localObject;
      if (fA != null)
      {
        j = i;
        if (fA.length > 0)
        {
          j = 0;
          while (j < fA.length)
          {
            localObject = fA[j];
            k = i;
            if (localObject != null) {
              k = i + qp.c(1, (qw)localObject);
            }
            j += 1;
            i = k;
          }
          j = i;
        }
      }
      i = j;
      if (fB != null)
      {
        i = j;
        if (fB.length > 0)
        {
          i = j;
          j = 0;
          while (j < fB.length)
          {
            localObject = fB[j];
            k = i;
            if (localObject != null) {
              k = i + qp.c(2, (qw)localObject);
            }
            j += 1;
            i = k;
          }
        }
      }
      int k = i;
      if (fC != null)
      {
        k = i;
        if (fC.length > 0)
        {
          j = m;
          for (;;)
          {
            k = i;
            if (j >= fC.length) {
              break;
            }
            localObject = fC[j];
            k = i;
            if (localObject != null) {
              k = i + qp.c(3, (qw)localObject);
            }
            j += 1;
            i = k;
          }
        }
      }
      return k;
    }
    
    public d e(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        int j;
        Object localObject;
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          j = qz.b(paramqo, 10);
          if (fA == null) {}
          for (i = 0;; i = fA.length)
          {
            localObject = new d.a[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fA, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new d.a();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new d.a();
          paramqo.a(localObject[j]);
          fA = ((d.a[])localObject);
          break;
        case 18: 
          j = qz.b(paramqo, 18);
          if (fB == null) {}
          for (i = 0;; i = fB.length)
          {
            localObject = new d.a[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fB, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new d.a();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new d.a();
          paramqo.a(localObject[j]);
          fB = ((d.a[])localObject);
          break;
        case 26: 
          j = qz.b(paramqo, 26);
          if (fC == null) {}
          for (i = 0;; i = fC.length)
          {
            localObject = new c.c[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fC, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new c.c();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new c.c();
          paramqo.a(localObject[j]);
          fC = ((c.c[])localObject);
        }
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof d));
            paramObject = (d)paramObject;
            bool1 = bool2;
          } while (!qu.equals(fA, fA));
          bool1 = bool2;
        } while (!qu.equals(fB, fB));
        bool1 = bool2;
      } while (!qu.equals(fC, fC));
      return a((qq)paramObject);
    }
    
    public d h()
    {
      fA = d.a.r();
      fB = d.a.r();
      fC = c.c.f();
      ayW = null;
      azh = -1;
      return this;
    }
    
    public int hashCode()
    {
      return (((qu.hashCode(fA) + 527) * 31 + qu.hashCode(fB)) * 31 + qu.hashCode(fC)) * 31 + rQ();
    }
  }
  
  public static final class e
    extends qq<e>
  {
    private static volatile e[] fD;
    public int key;
    public int value;
    
    public e()
    {
      j();
    }
    
    public static e[] i()
    {
      if (fD == null) {}
      synchronized (qu.azg)
      {
        if (fD == null) {
          fD = new e[0];
        }
        return fD;
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      paramqp.t(1, key);
      paramqp.t(2, value);
      super.a(paramqp);
    }
    
    protected int c()
    {
      return super.c() + qp.v(1, key) + qp.v(2, value);
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            return bool1;
            bool1 = bool2;
          } while (!(paramObject instanceof e));
          paramObject = (e)paramObject;
          bool1 = bool2;
        } while (key != key);
        bool1 = bool2;
      } while (value != value);
      return a((qq)paramObject);
    }
    
    public e f(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          key = paramqo.rC();
          break;
        case 16: 
          value = paramqo.rC();
        }
      }
    }
    
    public int hashCode()
    {
      return ((key + 527) * 31 + value) * 31 + rQ();
    }
    
    public e j()
    {
      key = 0;
      value = 0;
      ayW = null;
      azh = -1;
      return this;
    }
  }
  
  public static final class f
    extends qq<f>
  {
    public String[] fE;
    public String[] fF;
    public d.a[] fG;
    public c.e[] fH;
    public c.b[] fI;
    public c.b[] fJ;
    public c.b[] fK;
    public c.g[] fL;
    public String fM;
    public String fN;
    public String fO;
    public c.a fP;
    public float fQ;
    public boolean fR;
    public String[] fS;
    public int fT;
    public String version;
    
    public f()
    {
      k();
    }
    
    public static f a(byte[] paramArrayOfByte)
      throws qv
    {
      return (f)qw.a(new f(), paramArrayOfByte);
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      int j = 0;
      int i;
      Object localObject;
      if ((fF != null) && (fF.length > 0))
      {
        i = 0;
        while (i < fF.length)
        {
          localObject = fF[i];
          if (localObject != null) {
            paramqp.b(1, (String)localObject);
          }
          i += 1;
        }
      }
      if ((fG != null) && (fG.length > 0))
      {
        i = 0;
        while (i < fG.length)
        {
          localObject = fG[i];
          if (localObject != null) {
            paramqp.a(2, (qw)localObject);
          }
          i += 1;
        }
      }
      if ((fH != null) && (fH.length > 0))
      {
        i = 0;
        while (i < fH.length)
        {
          localObject = fH[i];
          if (localObject != null) {
            paramqp.a(3, (qw)localObject);
          }
          i += 1;
        }
      }
      if ((fI != null) && (fI.length > 0))
      {
        i = 0;
        while (i < fI.length)
        {
          localObject = fI[i];
          if (localObject != null) {
            paramqp.a(4, (qw)localObject);
          }
          i += 1;
        }
      }
      if ((fJ != null) && (fJ.length > 0))
      {
        i = 0;
        while (i < fJ.length)
        {
          localObject = fJ[i];
          if (localObject != null) {
            paramqp.a(5, (qw)localObject);
          }
          i += 1;
        }
      }
      if ((fK != null) && (fK.length > 0))
      {
        i = 0;
        while (i < fK.length)
        {
          localObject = fK[i];
          if (localObject != null) {
            paramqp.a(6, (qw)localObject);
          }
          i += 1;
        }
      }
      if ((fL != null) && (fL.length > 0))
      {
        i = 0;
        while (i < fL.length)
        {
          localObject = fL[i];
          if (localObject != null) {
            paramqp.a(7, (qw)localObject);
          }
          i += 1;
        }
      }
      if (!fM.equals("")) {
        paramqp.b(9, fM);
      }
      if (!fN.equals("")) {
        paramqp.b(10, fN);
      }
      if (!fO.equals("0")) {
        paramqp.b(12, fO);
      }
      if (!version.equals("")) {
        paramqp.b(13, version);
      }
      if (fP != null) {
        paramqp.a(14, fP);
      }
      if (Float.floatToIntBits(fQ) != Float.floatToIntBits(0.0F)) {
        paramqp.b(15, fQ);
      }
      if ((fS != null) && (fS.length > 0))
      {
        i = 0;
        while (i < fS.length)
        {
          localObject = fS[i];
          if (localObject != null) {
            paramqp.b(16, (String)localObject);
          }
          i += 1;
        }
      }
      if (fT != 0) {
        paramqp.t(17, fT);
      }
      if (fR) {
        paramqp.b(18, fR);
      }
      if ((fE != null) && (fE.length > 0))
      {
        i = j;
        while (i < fE.length)
        {
          localObject = fE[i];
          if (localObject != null) {
            paramqp.b(19, (String)localObject);
          }
          i += 1;
        }
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int i2 = 0;
      int i1 = super.c();
      int i;
      int k;
      Object localObject;
      int n;
      int m;
      if ((fF != null) && (fF.length > 0))
      {
        i = 0;
        j = 0;
        for (k = 0; i < fF.length; k = m)
        {
          localObject = fF[i];
          n = j;
          m = k;
          if (localObject != null)
          {
            m = k + 1;
            n = j + qp.dk((String)localObject);
          }
          i += 1;
          j = n;
        }
      }
      for (int j = i1 + j + k * 1;; j = i1)
      {
        i = j;
        if (fG != null)
        {
          i = j;
          if (fG.length > 0)
          {
            i = j;
            j = 0;
            while (j < fG.length)
            {
              localObject = fG[j];
              k = i;
              if (localObject != null) {
                k = i + qp.c(2, (qw)localObject);
              }
              j += 1;
              i = k;
            }
          }
        }
        j = i;
        if (fH != null)
        {
          j = i;
          if (fH.length > 0)
          {
            j = 0;
            while (j < fH.length)
            {
              localObject = fH[j];
              k = i;
              if (localObject != null) {
                k = i + qp.c(3, (qw)localObject);
              }
              j += 1;
              i = k;
            }
            j = i;
          }
        }
        i = j;
        if (fI != null)
        {
          i = j;
          if (fI.length > 0)
          {
            i = j;
            j = 0;
            while (j < fI.length)
            {
              localObject = fI[j];
              k = i;
              if (localObject != null) {
                k = i + qp.c(4, (qw)localObject);
              }
              j += 1;
              i = k;
            }
          }
        }
        j = i;
        if (fJ != null)
        {
          j = i;
          if (fJ.length > 0)
          {
            j = 0;
            while (j < fJ.length)
            {
              localObject = fJ[j];
              k = i;
              if (localObject != null) {
                k = i + qp.c(5, (qw)localObject);
              }
              j += 1;
              i = k;
            }
            j = i;
          }
        }
        i = j;
        if (fK != null)
        {
          i = j;
          if (fK.length > 0)
          {
            i = j;
            j = 0;
            while (j < fK.length)
            {
              localObject = fK[j];
              k = i;
              if (localObject != null) {
                k = i + qp.c(6, (qw)localObject);
              }
              j += 1;
              i = k;
            }
          }
        }
        j = i;
        if (fL != null)
        {
          j = i;
          if (fL.length > 0)
          {
            j = 0;
            while (j < fL.length)
            {
              localObject = fL[j];
              k = i;
              if (localObject != null) {
                k = i + qp.c(7, (qw)localObject);
              }
              j += 1;
              i = k;
            }
            j = i;
          }
        }
        i = j;
        if (!fM.equals("")) {
          i = j + qp.j(9, fM);
        }
        j = i;
        if (!fN.equals("")) {
          j = i + qp.j(10, fN);
        }
        i = j;
        if (!fO.equals("0")) {
          i = j + qp.j(12, fO);
        }
        j = i;
        if (!version.equals("")) {
          j = i + qp.j(13, version);
        }
        k = j;
        if (fP != null) {
          k = j + qp.c(14, fP);
        }
        i = k;
        if (Float.floatToIntBits(fQ) != Float.floatToIntBits(0.0F)) {
          i = k + qp.c(15, fQ);
        }
        j = i;
        if (fS != null)
        {
          j = i;
          if (fS.length > 0)
          {
            j = 0;
            k = 0;
            for (m = 0; j < fS.length; m = n)
            {
              localObject = fS[j];
              i1 = k;
              n = m;
              if (localObject != null)
              {
                n = m + 1;
                i1 = k + qp.dk((String)localObject);
              }
              j += 1;
              k = i1;
            }
            j = i + k + m * 2;
          }
        }
        k = j;
        if (fT != 0) {
          k = j + qp.v(17, fT);
        }
        i = k;
        if (fR) {
          i = k + qp.c(18, fR);
        }
        j = i;
        if (fE != null)
        {
          j = i;
          if (fE.length > 0)
          {
            k = 0;
            m = 0;
            j = i2;
            while (j < fE.length)
            {
              localObject = fE[j];
              i1 = k;
              n = m;
              if (localObject != null)
              {
                n = m + 1;
                i1 = k + qp.dk((String)localObject);
              }
              j += 1;
              k = i1;
              m = n;
            }
            j = i + k + m * 2;
          }
        }
        return j;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      label169:
      label185:
      label201:
      label217:
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              do
                              {
                                do
                                {
                                  return bool1;
                                  bool1 = bool2;
                                } while (!(paramObject instanceof f));
                                paramObject = (f)paramObject;
                                bool1 = bool2;
                              } while (!qu.equals(fE, fE));
                              bool1 = bool2;
                            } while (!qu.equals(fF, fF));
                            bool1 = bool2;
                          } while (!qu.equals(fG, fG));
                          bool1 = bool2;
                        } while (!qu.equals(fH, fH));
                        bool1 = bool2;
                      } while (!qu.equals(fI, fI));
                      bool1 = bool2;
                    } while (!qu.equals(fJ, fJ));
                    bool1 = bool2;
                  } while (!qu.equals(fK, fK));
                  bool1 = bool2;
                } while (!qu.equals(fL, fL));
                if (fM != null) {
                  break;
                }
                bool1 = bool2;
              } while (fM != null);
              if (fN != null) {
                break label316;
              }
              bool1 = bool2;
            } while (fN != null);
            if (fO != null) {
              break label332;
            }
            bool1 = bool2;
          } while (fO != null);
          if (version != null) {
            break label348;
          }
          bool1 = bool2;
        } while (version != null);
        if (fP != null) {
          break label364;
        }
        bool1 = bool2;
      } while (fP != null);
      label316:
      label332:
      label348:
      label364:
      while (fP.equals(fP))
      {
        bool1 = bool2;
        if (Float.floatToIntBits(fQ) != Float.floatToIntBits(fQ)) {
          break;
        }
        bool1 = bool2;
        if (fR != fR) {
          break;
        }
        bool1 = bool2;
        if (!qu.equals(fS, fS)) {
          break;
        }
        bool1 = bool2;
        if (fT != fT) {
          break;
        }
        return a((qq)paramObject);
        if (fM.equals(fM)) {
          break label169;
        }
        return false;
        if (fN.equals(fN)) {
          break label185;
        }
        return false;
        if (fO.equals(fO)) {
          break label201;
        }
        return false;
        if (version.equals(version)) {
          break label217;
        }
        return false;
      }
      return false;
    }
    
    public f g(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        int j;
        Object localObject;
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          j = qz.b(paramqo, 10);
          if (fF == null) {}
          for (i = 0;; i = fF.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fF, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = paramqo.readString();
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = paramqo.readString();
          fF = ((String[])localObject);
          break;
        case 18: 
          j = qz.b(paramqo, 18);
          if (fG == null) {}
          for (i = 0;; i = fG.length)
          {
            localObject = new d.a[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fG, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new d.a();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new d.a();
          paramqo.a(localObject[j]);
          fG = ((d.a[])localObject);
          break;
        case 26: 
          j = qz.b(paramqo, 26);
          if (fH == null) {}
          for (i = 0;; i = fH.length)
          {
            localObject = new c.e[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fH, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new c.e();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new c.e();
          paramqo.a(localObject[j]);
          fH = ((c.e[])localObject);
          break;
        case 34: 
          j = qz.b(paramqo, 34);
          if (fI == null) {}
          for (i = 0;; i = fI.length)
          {
            localObject = new c.b[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fI, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new c.b();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new c.b();
          paramqo.a(localObject[j]);
          fI = ((c.b[])localObject);
          break;
        case 42: 
          j = qz.b(paramqo, 42);
          if (fJ == null) {}
          for (i = 0;; i = fJ.length)
          {
            localObject = new c.b[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fJ, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new c.b();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new c.b();
          paramqo.a(localObject[j]);
          fJ = ((c.b[])localObject);
          break;
        case 50: 
          j = qz.b(paramqo, 50);
          if (fK == null) {}
          for (i = 0;; i = fK.length)
          {
            localObject = new c.b[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fK, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new c.b();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new c.b();
          paramqo.a(localObject[j]);
          fK = ((c.b[])localObject);
          break;
        case 58: 
          j = qz.b(paramqo, 58);
          if (fL == null) {}
          for (i = 0;; i = fL.length)
          {
            localObject = new c.g[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fL, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = new c.g();
              paramqo.a(localObject[j]);
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = new c.g();
          paramqo.a(localObject[j]);
          fL = ((c.g[])localObject);
          break;
        case 74: 
          fM = paramqo.readString();
          break;
        case 82: 
          fN = paramqo.readString();
          break;
        case 98: 
          fO = paramqo.readString();
          break;
        case 106: 
          version = paramqo.readString();
          break;
        case 114: 
          if (fP == null) {
            fP = new c.a();
          }
          paramqo.a(fP);
          break;
        case 125: 
          fQ = paramqo.readFloat();
          break;
        case 130: 
          j = qz.b(paramqo, 130);
          if (fS == null) {}
          for (i = 0;; i = fS.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fS, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = paramqo.readString();
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = paramqo.readString();
          fS = ((String[])localObject);
          break;
        case 136: 
          fT = paramqo.rC();
          break;
        case 144: 
          fR = paramqo.rD();
          break;
        case 154: 
          j = qz.b(paramqo, 154);
          if (fE == null) {}
          for (i = 0;; i = fE.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fE, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = paramqo.readString();
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = paramqo.readString();
          fE = ((String[])localObject);
        }
      }
    }
    
    public int hashCode()
    {
      int n = 0;
      int i2 = qu.hashCode(fE);
      int i3 = qu.hashCode(fF);
      int i4 = qu.hashCode(fG);
      int i5 = qu.hashCode(fH);
      int i6 = qu.hashCode(fI);
      int i7 = qu.hashCode(fJ);
      int i8 = qu.hashCode(fK);
      int i9 = qu.hashCode(fL);
      int i;
      int j;
      label93:
      int k;
      label102:
      int m;
      label112:
      label119:
      int i10;
      if (fM == null)
      {
        i = 0;
        if (fN != null) {
          break label266;
        }
        j = 0;
        if (fO != null) {
          break label277;
        }
        k = 0;
        if (version != null) {
          break label288;
        }
        m = 0;
        if (fP != null) {
          break label300;
        }
        i10 = Float.floatToIntBits(fQ);
        if (!fR) {
          break label312;
        }
      }
      label266:
      label277:
      label288:
      label300:
      label312:
      for (int i1 = 1231;; i1 = 1237)
      {
        return (((i1 + (((m + (k + (j + (i + ((((((((i2 + 527) * 31 + i3) * 31 + i4) * 31 + i5) * 31 + i6) * 31 + i7) * 31 + i8) * 31 + i9) * 31) * 31) * 31) * 31) * 31 + n) * 31 + i10) * 31) * 31 + qu.hashCode(fS)) * 31 + fT) * 31 + rQ();
        i = fM.hashCode();
        break;
        j = fN.hashCode();
        break label93;
        k = fO.hashCode();
        break label102;
        m = version.hashCode();
        break label112;
        n = fP.hashCode();
        break label119;
      }
    }
    
    public f k()
    {
      fE = qz.azo;
      fF = qz.azo;
      fG = d.a.r();
      fH = c.e.i();
      fI = c.b.d();
      fJ = c.b.d();
      fK = c.b.d();
      fL = c.g.l();
      fM = "";
      fN = "";
      fO = "0";
      version = "";
      fP = null;
      fQ = 0.0F;
      fR = false;
      fS = qz.azo;
      fT = 0;
      ayW = null;
      azh = -1;
      return this;
    }
  }
  
  public static final class g
    extends qq<g>
  {
    private static volatile g[] fU;
    public int[] fV;
    public int[] fW;
    public int[] fX;
    public int[] fY;
    public int[] fZ;
    public int[] ga;
    public int[] gb;
    public int[] gc;
    public int[] gd;
    public int[] ge;
    
    public g()
    {
      m();
    }
    
    public static g[] l()
    {
      if (fU == null) {}
      synchronized (qu.azg)
      {
        if (fU == null) {
          fU = new g[0];
        }
        return fU;
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      int j = 0;
      int i;
      if ((fV != null) && (fV.length > 0))
      {
        i = 0;
        while (i < fV.length)
        {
          paramqp.t(1, fV[i]);
          i += 1;
        }
      }
      if ((fW != null) && (fW.length > 0))
      {
        i = 0;
        while (i < fW.length)
        {
          paramqp.t(2, fW[i]);
          i += 1;
        }
      }
      if ((fX != null) && (fX.length > 0))
      {
        i = 0;
        while (i < fX.length)
        {
          paramqp.t(3, fX[i]);
          i += 1;
        }
      }
      if ((fY != null) && (fY.length > 0))
      {
        i = 0;
        while (i < fY.length)
        {
          paramqp.t(4, fY[i]);
          i += 1;
        }
      }
      if ((fZ != null) && (fZ.length > 0))
      {
        i = 0;
        while (i < fZ.length)
        {
          paramqp.t(5, fZ[i]);
          i += 1;
        }
      }
      if ((ga != null) && (ga.length > 0))
      {
        i = 0;
        while (i < ga.length)
        {
          paramqp.t(6, ga[i]);
          i += 1;
        }
      }
      if ((gb != null) && (gb.length > 0))
      {
        i = 0;
        while (i < gb.length)
        {
          paramqp.t(7, gb[i]);
          i += 1;
        }
      }
      if ((gc != null) && (gc.length > 0))
      {
        i = 0;
        while (i < gc.length)
        {
          paramqp.t(8, gc[i]);
          i += 1;
        }
      }
      if ((gd != null) && (gd.length > 0))
      {
        i = 0;
        while (i < gd.length)
        {
          paramqp.t(9, gd[i]);
          i += 1;
        }
      }
      if ((ge != null) && (ge.length > 0))
      {
        i = j;
        while (i < ge.length)
        {
          paramqp.t(10, ge[i]);
          i += 1;
        }
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int m = 0;
      int k = super.c();
      int i;
      if ((fV != null) && (fV.length > 0))
      {
        i = 0;
        j = 0;
        while (i < fV.length)
        {
          j += qp.gZ(fV[i]);
          i += 1;
        }
      }
      for (int j = k + j + fV.length * 1;; j = k)
      {
        i = j;
        if (fW != null)
        {
          i = j;
          if (fW.length > 0)
          {
            i = 0;
            k = 0;
            while (i < fW.length)
            {
              k += qp.gZ(fW[i]);
              i += 1;
            }
            i = j + k + fW.length * 1;
          }
        }
        j = i;
        if (fX != null)
        {
          j = i;
          if (fX.length > 0)
          {
            j = 0;
            k = 0;
            while (j < fX.length)
            {
              k += qp.gZ(fX[j]);
              j += 1;
            }
            j = i + k + fX.length * 1;
          }
        }
        i = j;
        if (fY != null)
        {
          i = j;
          if (fY.length > 0)
          {
            i = 0;
            k = 0;
            while (i < fY.length)
            {
              k += qp.gZ(fY[i]);
              i += 1;
            }
            i = j + k + fY.length * 1;
          }
        }
        j = i;
        if (fZ != null)
        {
          j = i;
          if (fZ.length > 0)
          {
            j = 0;
            k = 0;
            while (j < fZ.length)
            {
              k += qp.gZ(fZ[j]);
              j += 1;
            }
            j = i + k + fZ.length * 1;
          }
        }
        i = j;
        if (ga != null)
        {
          i = j;
          if (ga.length > 0)
          {
            i = 0;
            k = 0;
            while (i < ga.length)
            {
              k += qp.gZ(ga[i]);
              i += 1;
            }
            i = j + k + ga.length * 1;
          }
        }
        j = i;
        if (gb != null)
        {
          j = i;
          if (gb.length > 0)
          {
            j = 0;
            k = 0;
            while (j < gb.length)
            {
              k += qp.gZ(gb[j]);
              j += 1;
            }
            j = i + k + gb.length * 1;
          }
        }
        i = j;
        if (gc != null)
        {
          i = j;
          if (gc.length > 0)
          {
            i = 0;
            k = 0;
            while (i < gc.length)
            {
              k += qp.gZ(gc[i]);
              i += 1;
            }
            i = j + k + gc.length * 1;
          }
        }
        j = i;
        if (gd != null)
        {
          j = i;
          if (gd.length > 0)
          {
            j = 0;
            k = 0;
            while (j < gd.length)
            {
              k += qp.gZ(gd[j]);
              j += 1;
            }
            j = i + k + gd.length * 1;
          }
        }
        i = j;
        if (ge != null)
        {
          i = j;
          if (ge.length > 0)
          {
            k = 0;
            i = m;
            while (i < ge.length)
            {
              k += qp.gZ(ge[i]);
              i += 1;
            }
            i = j + k + ge.length * 1;
          }
        }
        return i;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            return bool1;
                            bool1 = bool2;
                          } while (!(paramObject instanceof g));
                          paramObject = (g)paramObject;
                          bool1 = bool2;
                        } while (!qu.equals(fV, fV));
                        bool1 = bool2;
                      } while (!qu.equals(fW, fW));
                      bool1 = bool2;
                    } while (!qu.equals(fX, fX));
                    bool1 = bool2;
                  } while (!qu.equals(fY, fY));
                  bool1 = bool2;
                } while (!qu.equals(fZ, fZ));
                bool1 = bool2;
              } while (!qu.equals(ga, ga));
              bool1 = bool2;
            } while (!qu.equals(gb, gb));
            bool1 = bool2;
          } while (!qu.equals(gc, gc));
          bool1 = bool2;
        } while (!qu.equals(gd, gd));
        bool1 = bool2;
      } while (!qu.equals(ge, ge));
      return a((qq)paramObject);
    }
    
    public g h(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        int j;
        int[] arrayOfInt;
        int k;
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          j = qz.b(paramqo, 8);
          if (fV == null) {}
          for (i = 0;; i = fV.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fV, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          fV = arrayOfInt;
          break;
        case 10: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (fV == null) {}
          for (i = 0;; i = fV.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fV, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          fV = arrayOfInt;
          paramqo.gT(k);
          break;
        case 16: 
          j = qz.b(paramqo, 16);
          if (fW == null) {}
          for (i = 0;; i = fW.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fW, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          fW = arrayOfInt;
          break;
        case 18: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (fW == null) {}
          for (i = 0;; i = fW.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fW, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          fW = arrayOfInt;
          paramqo.gT(k);
          break;
        case 24: 
          j = qz.b(paramqo, 24);
          if (fX == null) {}
          for (i = 0;; i = fX.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fX, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          fX = arrayOfInt;
          break;
        case 26: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (fX == null) {}
          for (i = 0;; i = fX.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fX, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          fX = arrayOfInt;
          paramqo.gT(k);
          break;
        case 32: 
          j = qz.b(paramqo, 32);
          if (fY == null) {}
          for (i = 0;; i = fY.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fY, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          fY = arrayOfInt;
          break;
        case 34: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (fY == null) {}
          for (i = 0;; i = fY.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fY, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          fY = arrayOfInt;
          paramqo.gT(k);
          break;
        case 40: 
          j = qz.b(paramqo, 40);
          if (fZ == null) {}
          for (i = 0;; i = fZ.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fZ, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          fZ = arrayOfInt;
          break;
        case 42: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (fZ == null) {}
          for (i = 0;; i = fZ.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(fZ, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          fZ = arrayOfInt;
          paramqo.gT(k);
          break;
        case 48: 
          j = qz.b(paramqo, 48);
          if (ga == null) {}
          for (i = 0;; i = ga.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(ga, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          ga = arrayOfInt;
          break;
        case 50: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (ga == null) {}
          for (i = 0;; i = ga.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(ga, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          ga = arrayOfInt;
          paramqo.gT(k);
          break;
        case 56: 
          j = qz.b(paramqo, 56);
          if (gb == null) {}
          for (i = 0;; i = gb.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gb, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          gb = arrayOfInt;
          break;
        case 58: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (gb == null) {}
          for (i = 0;; i = gb.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gb, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          gb = arrayOfInt;
          paramqo.gT(k);
          break;
        case 64: 
          j = qz.b(paramqo, 64);
          if (gc == null) {}
          for (i = 0;; i = gc.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gc, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          gc = arrayOfInt;
          break;
        case 66: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (gc == null) {}
          for (i = 0;; i = gc.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gc, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          gc = arrayOfInt;
          paramqo.gT(k);
          break;
        case 72: 
          j = qz.b(paramqo, 72);
          if (gd == null) {}
          for (i = 0;; i = gd.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gd, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          gd = arrayOfInt;
          break;
        case 74: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (gd == null) {}
          for (i = 0;; i = gd.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gd, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          gd = arrayOfInt;
          paramqo.gT(k);
          break;
        case 80: 
          j = qz.b(paramqo, 80);
          if (ge == null) {}
          for (i = 0;; i = ge.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(ge, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          ge = arrayOfInt;
          break;
        case 82: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (ge == null) {}
          for (i = 0;; i = ge.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(ge, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          ge = arrayOfInt;
          paramqo.gT(k);
        }
      }
    }
    
    public int hashCode()
    {
      return ((((((((((qu.hashCode(fV) + 527) * 31 + qu.hashCode(fW)) * 31 + qu.hashCode(fX)) * 31 + qu.hashCode(fY)) * 31 + qu.hashCode(fZ)) * 31 + qu.hashCode(ga)) * 31 + qu.hashCode(gb)) * 31 + qu.hashCode(gc)) * 31 + qu.hashCode(gd)) * 31 + qu.hashCode(ge)) * 31 + rQ();
    }
    
    public g m()
    {
      fV = qz.azj;
      fW = qz.azj;
      fX = qz.azj;
      fY = qz.azj;
      fZ = qz.azj;
      ga = qz.azj;
      gb = qz.azj;
      gc = qz.azj;
      gd = qz.azj;
      ge = qz.azj;
      ayW = null;
      azh = -1;
      return this;
    }
  }
  
  public static final class h
    extends qq<h>
  {
    public static final qr<d.a, h> gf = qr.a(11, h.class, 810);
    private static final h[] gg = new h[0];
    public int[] gh;
    public int[] gi;
    public int[] gj;
    public int gk;
    public int[] gl;
    public int gm;
    public int gn;
    
    public h()
    {
      n();
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      int j = 0;
      int i;
      if ((gh != null) && (gh.length > 0))
      {
        i = 0;
        while (i < gh.length)
        {
          paramqp.t(1, gh[i]);
          i += 1;
        }
      }
      if ((gi != null) && (gi.length > 0))
      {
        i = 0;
        while (i < gi.length)
        {
          paramqp.t(2, gi[i]);
          i += 1;
        }
      }
      if ((gj != null) && (gj.length > 0))
      {
        i = 0;
        while (i < gj.length)
        {
          paramqp.t(3, gj[i]);
          i += 1;
        }
      }
      if (gk != 0) {
        paramqp.t(4, gk);
      }
      if ((gl != null) && (gl.length > 0))
      {
        i = j;
        while (i < gl.length)
        {
          paramqp.t(5, gl[i]);
          i += 1;
        }
      }
      if (gm != 0) {
        paramqp.t(6, gm);
      }
      if (gn != 0) {
        paramqp.t(7, gn);
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int m = 0;
      int k = super.c();
      int i;
      if ((gh != null) && (gh.length > 0))
      {
        i = 0;
        j = 0;
        while (i < gh.length)
        {
          j += qp.gZ(gh[i]);
          i += 1;
        }
      }
      for (int j = k + j + gh.length * 1;; j = k)
      {
        i = j;
        if (gi != null)
        {
          i = j;
          if (gi.length > 0)
          {
            i = 0;
            k = 0;
            while (i < gi.length)
            {
              k += qp.gZ(gi[i]);
              i += 1;
            }
            i = j + k + gi.length * 1;
          }
        }
        j = i;
        if (gj != null)
        {
          j = i;
          if (gj.length > 0)
          {
            j = 0;
            k = 0;
            while (j < gj.length)
            {
              k += qp.gZ(gj[j]);
              j += 1;
            }
            j = i + k + gj.length * 1;
          }
        }
        i = j;
        if (gk != 0) {
          i = j + qp.v(4, gk);
        }
        j = i;
        if (gl != null)
        {
          j = i;
          if (gl.length > 0)
          {
            k = 0;
            j = m;
            while (j < gl.length)
            {
              k += qp.gZ(gl[j]);
              j += 1;
            }
            j = i + k + gl.length * 1;
          }
        }
        i = j;
        if (gm != 0) {
          i = j + qp.v(6, gm);
        }
        j = i;
        if (gn != 0) {
          j = i + qp.v(7, gn);
        }
        return j;
      }
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      return bool1;
                      bool1 = bool2;
                    } while (!(paramObject instanceof h));
                    paramObject = (h)paramObject;
                    bool1 = bool2;
                  } while (!qu.equals(gh, gh));
                  bool1 = bool2;
                } while (!qu.equals(gi, gi));
                bool1 = bool2;
              } while (!qu.equals(gj, gj));
              bool1 = bool2;
            } while (gk != gk);
            bool1 = bool2;
          } while (!qu.equals(gl, gl));
          bool1 = bool2;
        } while (gm != gm);
        bool1 = bool2;
      } while (gn != gn);
      return a((qq)paramObject);
    }
    
    public int hashCode()
    {
      return (((((((qu.hashCode(gh) + 527) * 31 + qu.hashCode(gi)) * 31 + qu.hashCode(gj)) * 31 + gk) * 31 + qu.hashCode(gl)) * 31 + gm) * 31 + gn) * 31 + rQ();
    }
    
    public h i(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        int j;
        int[] arrayOfInt;
        int k;
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 8: 
          j = qz.b(paramqo, 8);
          if (gh == null) {}
          for (i = 0;; i = gh.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gh, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          gh = arrayOfInt;
          break;
        case 10: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (gh == null) {}
          for (i = 0;; i = gh.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gh, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          gh = arrayOfInt;
          paramqo.gT(k);
          break;
        case 16: 
          j = qz.b(paramqo, 16);
          if (gi == null) {}
          for (i = 0;; i = gi.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gi, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          gi = arrayOfInt;
          break;
        case 18: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (gi == null) {}
          for (i = 0;; i = gi.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gi, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          gi = arrayOfInt;
          paramqo.gT(k);
          break;
        case 24: 
          j = qz.b(paramqo, 24);
          if (gj == null) {}
          for (i = 0;; i = gj.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gj, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          gj = arrayOfInt;
          break;
        case 26: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (gj == null) {}
          for (i = 0;; i = gj.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gj, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          gj = arrayOfInt;
          paramqo.gT(k);
          break;
        case 32: 
          gk = paramqo.rC();
          break;
        case 40: 
          j = qz.b(paramqo, 40);
          if (gl == null) {}
          for (i = 0;; i = gl.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gl, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length - 1)
            {
              arrayOfInt[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfInt[j] = paramqo.rC();
          gl = arrayOfInt;
          break;
        case 42: 
          k = paramqo.gS(paramqo.rG());
          i = paramqo.getPosition();
          j = 0;
          while (paramqo.rL() > 0)
          {
            paramqo.rC();
            j += 1;
          }
          paramqo.gU(i);
          if (gl == null) {}
          for (i = 0;; i = gl.length)
          {
            arrayOfInt = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gl, 0, arrayOfInt, 0, i);
              j = i;
            }
            while (j < arrayOfInt.length)
            {
              arrayOfInt[j] = paramqo.rC();
              j += 1;
            }
          }
          gl = arrayOfInt;
          paramqo.gT(k);
          break;
        case 48: 
          gm = paramqo.rC();
          break;
        case 56: 
          gn = paramqo.rC();
        }
      }
    }
    
    public h n()
    {
      gh = qz.azj;
      gi = qz.azj;
      gj = qz.azj;
      gk = 0;
      gl = qz.azj;
      gm = 0;
      gn = 0;
      ayW = null;
      azh = -1;
      return this;
    }
  }
  
  public static final class i
    extends qq<i>
  {
    private static volatile i[] go;
    public d.a gp;
    public c.d gq;
    public String name;
    
    public i()
    {
      p();
    }
    
    public static i[] o()
    {
      if (go == null) {}
      synchronized (qu.azg)
      {
        if (go == null) {
          go = new i[0];
        }
        return go;
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if (!name.equals("")) {
        paramqp.b(1, name);
      }
      if (gp != null) {
        paramqp.a(2, gp);
      }
      if (gq != null) {
        paramqp.a(3, gq);
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int j = super.c();
      int i = j;
      if (!name.equals("")) {
        i = j + qp.j(1, name);
      }
      j = i;
      if (gp != null) {
        j = i + qp.c(2, gp);
      }
      i = j;
      if (gq != null) {
        i = j + qp.c(3, gq);
      }
      return i;
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      label57:
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof i));
            paramObject = (i)paramObject;
            if (name != null) {
              break;
            }
            bool1 = bool2;
          } while (name != null);
          if (gp != null) {
            break label95;
          }
          bool1 = bool2;
        } while (gp != null);
        if (gq != null) {
          break label111;
        }
        bool1 = bool2;
      } while (gq != null);
      label95:
      label111:
      while (gq.equals(gq))
      {
        return a((qq)paramObject);
        if (name.equals(name)) {
          break;
        }
        return false;
        if (gp.equals(gp)) {
          break label57;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int k = 0;
      int i;
      int j;
      if (name == null)
      {
        i = 0;
        if (gp != null) {
          break label62;
        }
        j = 0;
        label20:
        if (gq != null) {
          break label73;
        }
      }
      for (;;)
      {
        return ((j + (i + 527) * 31) * 31 + k) * 31 + rQ();
        i = name.hashCode();
        break;
        label62:
        j = gp.hashCode();
        break label20;
        label73:
        k = gq.hashCode();
      }
    }
    
    public i j(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          name = paramqo.readString();
          break;
        case 18: 
          if (gp == null) {
            gp = new d.a();
          }
          paramqo.a(gp);
          break;
        case 26: 
          if (gq == null) {
            gq = new c.d();
          }
          paramqo.a(gq);
        }
      }
    }
    
    public i p()
    {
      name = "";
      gp = null;
      gq = null;
      ayW = null;
      azh = -1;
      return this;
    }
  }
  
  public static final class j
    extends qq<j>
  {
    public c.i[] gr;
    public c.f gs;
    public String gt;
    
    public j()
    {
      q();
    }
    
    public static j b(byte[] paramArrayOfByte)
      throws qv
    {
      return (j)qw.a(new j(), paramArrayOfByte);
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if ((gr != null) && (gr.length > 0))
      {
        int i = 0;
        while (i < gr.length)
        {
          c.i locali = gr[i];
          if (locali != null) {
            paramqp.a(1, locali);
          }
          i += 1;
        }
      }
      if (gs != null) {
        paramqp.a(2, gs);
      }
      if (!gt.equals("")) {
        paramqp.b(3, gt);
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int i = super.c();
      int j = i;
      if (gr != null)
      {
        j = i;
        if (gr.length > 0)
        {
          int k = 0;
          for (;;)
          {
            j = i;
            if (k >= gr.length) {
              break;
            }
            c.i locali = gr[k];
            j = i;
            if (locali != null) {
              j = i + qp.c(1, locali);
            }
            k += 1;
            i = j;
          }
        }
      }
      i = j;
      if (gs != null) {
        i = j + qp.c(2, gs);
      }
      j = i;
      if (!gt.equals("")) {
        j = i + qp.j(3, gt);
      }
      return j;
    }
    
    public boolean equals(Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1;
      if (paramObject == this) {
        bool1 = true;
      }
      do
      {
        do
        {
          do
          {
            do
            {
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof j));
            paramObject = (j)paramObject;
            bool1 = bool2;
          } while (!qu.equals(gr, gr));
          if (gs != null) {
            break;
          }
          bool1 = bool2;
        } while (gs != null);
        if (gt != null) {
          break label95;
        }
        bool1 = bool2;
      } while (gt != null);
      label95:
      while (gt.equals(gt))
      {
        return a((qq)paramObject);
        if (gs.equals(gs)) {
          break;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int j = 0;
      int k = qu.hashCode(gr);
      int i;
      if (gs == null)
      {
        i = 0;
        if (gt != null) {
          break label61;
        }
      }
      for (;;)
      {
        return ((i + (k + 527) * 31) * 31 + j) * 31 + rQ();
        i = gs.hashCode();
        break;
        label61:
        j = gt.hashCode();
      }
    }
    
    public j k(qo paramqo)
      throws IOException
    {
      for (;;)
      {
        int i = paramqo.rz();
        switch (i)
        {
        default: 
          if (a(paramqo, i)) {}
          break;
        case 0: 
          return this;
        case 10: 
          int j = qz.b(paramqo, 10);
          if (gr == null) {}
          c.i[] arrayOfi;
          for (i = 0;; i = gr.length)
          {
            arrayOfi = new c.i[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(gr, 0, arrayOfi, 0, i);
              j = i;
            }
            while (j < arrayOfi.length - 1)
            {
              arrayOfi[j] = new c.i();
              paramqo.a(arrayOfi[j]);
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfi[j] = new c.i();
          paramqo.a(arrayOfi[j]);
          gr = arrayOfi;
          break;
        case 18: 
          if (gs == null) {
            gs = new c.f();
          }
          paramqo.a(gs);
          break;
        case 26: 
          gt = paramqo.readString();
        }
      }
    }
    
    public j q()
    {
      gr = c.i.o();
      gs = null;
      gt = "";
      ayW = null;
      azh = -1;
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.c
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */