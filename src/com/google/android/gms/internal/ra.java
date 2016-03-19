package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;

public abstract interface ra
{
  public static final class a
    extends qq<a>
  {
    public String[] azr;
    public String[] azs;
    public int[] azt;
    
    public a()
    {
      sa();
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      int j = 0;
      int i;
      String str;
      if ((azr != null) && (azr.length > 0))
      {
        i = 0;
        while (i < azr.length)
        {
          str = azr[i];
          if (str != null) {
            paramqp.b(1, str);
          }
          i += 1;
        }
      }
      if ((azs != null) && (azs.length > 0))
      {
        i = 0;
        while (i < azs.length)
        {
          str = azs[i];
          if (str != null) {
            paramqp.b(2, str);
          }
          i += 1;
        }
      }
      if ((azt != null) && (azt.length > 0))
      {
        i = j;
        while (i < azt.length)
        {
          paramqp.t(3, azt[i]);
          i += 1;
        }
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int i2 = 0;
      int i1 = super.c();
      int j;
      int k;
      String str;
      int n;
      int m;
      if ((azr != null) && (azr.length > 0))
      {
        i = 0;
        j = 0;
        for (k = 0; i < azr.length; k = m)
        {
          str = azr[i];
          n = j;
          m = k;
          if (str != null)
          {
            m = k + 1;
            n = j + qp.dk(str);
          }
          i += 1;
          j = n;
        }
      }
      for (int i = i1 + j + k * 1;; i = i1)
      {
        j = i;
        if (azs != null)
        {
          j = i;
          if (azs.length > 0)
          {
            j = 0;
            k = 0;
            for (m = 0; j < azs.length; m = n)
            {
              str = azs[j];
              i1 = k;
              n = m;
              if (str != null)
              {
                n = m + 1;
                i1 = k + qp.dk(str);
              }
              j += 1;
              k = i1;
            }
            j = i + k + m * 1;
          }
        }
        i = j;
        if (azt != null)
        {
          i = j;
          if (azt.length > 0)
          {
            k = 0;
            i = i2;
            while (i < azt.length)
            {
              k += qp.gZ(azt[i]);
              i += 1;
            }
            i = j + k + azt.length * 1;
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
              return bool1;
              bool1 = bool2;
            } while (!(paramObject instanceof a));
            paramObject = (a)paramObject;
            bool1 = bool2;
          } while (!qu.equals(azr, azr));
          bool1 = bool2;
        } while (!qu.equals(azs, azs));
        bool1 = bool2;
      } while (!qu.equals(azt, azt));
      return a((qq)paramObject);
    }
    
    public int hashCode()
    {
      return (((qu.hashCode(azr) + 527) * 31 + qu.hashCode(azs)) * 31 + qu.hashCode(azt)) * 31 + rQ();
    }
    
    public a sa()
    {
      azr = qz.azo;
      azs = qz.azo;
      azt = qz.azj;
      ayW = null;
      azh = -1;
      return this;
    }
    
    public a y(qo paramqo)
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
          if (azr == null) {}
          for (i = 0;; i = azr.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(azr, 0, localObject, 0, i);
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
          azr = ((String[])localObject);
          break;
        case 18: 
          j = qz.b(paramqo, 18);
          if (azs == null) {}
          for (i = 0;; i = azs.length)
          {
            localObject = new String[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(azs, 0, localObject, 0, i);
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
          azs = ((String[])localObject);
          break;
        case 24: 
          j = qz.b(paramqo, 24);
          if (azt == null) {}
          for (i = 0;; i = azt.length)
          {
            localObject = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(azt, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length - 1)
            {
              localObject[j] = paramqo.rC();
              paramqo.rz();
              j += 1;
            }
          }
          localObject[j] = paramqo.rC();
          azt = ((int[])localObject);
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
          if (azt == null) {}
          for (i = 0;; i = azt.length)
          {
            localObject = new int[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(azt, 0, localObject, 0, i);
              j = i;
            }
            while (j < localObject.length)
            {
              localObject[j] = paramqo.rC();
              j += 1;
            }
          }
          azt = ((int[])localObject);
          paramqo.gT(k);
        }
      }
    }
  }
  
  public static final class b
    extends qq<b>
  {
    public int azu;
    public String azv;
    public String version;
    
    public b()
    {
      sb();
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if (azu != 0) {
        paramqp.t(1, azu);
      }
      if (!azv.equals("")) {
        paramqp.b(2, azv);
      }
      if (!version.equals("")) {
        paramqp.b(3, version);
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int j = super.c();
      int i = j;
      if (azu != 0) {
        i = j + qp.v(1, azu);
      }
      j = i;
      if (!azv.equals("")) {
        j = i + qp.j(2, azv);
      }
      i = j;
      if (!version.equals("")) {
        i = j + qp.j(3, version);
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
            } while (!(paramObject instanceof b));
            paramObject = (b)paramObject;
            bool1 = bool2;
          } while (azu != azu);
          if (azv != null) {
            break;
          }
          bool1 = bool2;
        } while (azv != null);
        if (version != null) {
          break label92;
        }
        bool1 = bool2;
      } while (version != null);
      label92:
      while (version.equals(version))
      {
        return a((qq)paramObject);
        if (azv.equals(azv)) {
          break;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int j = 0;
      int k = azu;
      int i;
      if (azv == null)
      {
        i = 0;
        if (version != null) {
          break label58;
        }
      }
      for (;;)
      {
        return ((i + (k + 527) * 31) * 31 + j) * 31 + rQ();
        i = azv.hashCode();
        break;
        label58:
        j = version.hashCode();
      }
    }
    
    public b sb()
    {
      azu = 0;
      azv = "";
      version = "";
      ayW = null;
      azh = -1;
      return this;
    }
    
    public b z(qo paramqo)
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
          case 0: 
          case 1: 
          case 2: 
          case 3: 
          case 4: 
          case 5: 
          case 6: 
          case 7: 
          case 8: 
          case 9: 
          case 10: 
          case 11: 
          case 12: 
          case 13: 
          case 14: 
          case 15: 
          case 16: 
          case 17: 
          case 18: 
          case 19: 
          case 20: 
          case 21: 
          case 22: 
            azu = i;
          }
          break;
        case 18: 
          azv = paramqo.readString();
          break;
        case 26: 
          version = paramqo.readString();
        }
      }
    }
  }
  
  public static final class c
    extends qq<c>
  {
    public ra.d[] azA;
    public ra.b azB;
    public byte[] azC;
    public byte[] azD;
    public byte[] azE;
    public ra.a azF;
    public String azG;
    public long azH;
    public long azw;
    public int azx;
    public int azy;
    public boolean azz;
    public String tag;
    
    public c()
    {
      sc();
    }
    
    public c A(qo paramqo)
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
          azw = paramqo.rB();
          break;
        case 18: 
          tag = paramqo.readString();
          break;
        case 26: 
          int j = qz.b(paramqo, 26);
          if (azA == null) {}
          ra.d[] arrayOfd;
          for (i = 0;; i = azA.length)
          {
            arrayOfd = new ra.d[j + i];
            j = i;
            if (i != 0)
            {
              System.arraycopy(azA, 0, arrayOfd, 0, i);
              j = i;
            }
            while (j < arrayOfd.length - 1)
            {
              arrayOfd[j] = new ra.d();
              paramqo.a(arrayOfd[j]);
              paramqo.rz();
              j += 1;
            }
          }
          arrayOfd[j] = new ra.d();
          paramqo.a(arrayOfd[j]);
          azA = arrayOfd;
          break;
        case 50: 
          azC = paramqo.readBytes();
          break;
        case 58: 
          if (azF == null) {
            azF = new ra.a();
          }
          paramqo.a(azF);
          break;
        case 66: 
          azD = paramqo.readBytes();
          break;
        case 74: 
          if (azB == null) {
            azB = new ra.b();
          }
          paramqo.a(azB);
          break;
        case 80: 
          azz = paramqo.rD();
          break;
        case 88: 
          azx = paramqo.rC();
          break;
        case 96: 
          azy = paramqo.rC();
          break;
        case 106: 
          azE = paramqo.readBytes();
          break;
        case 114: 
          azG = paramqo.readString();
          break;
        case 120: 
          azH = paramqo.rF();
        }
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if (azw != 0L) {
        paramqp.b(1, azw);
      }
      if (!tag.equals("")) {
        paramqp.b(2, tag);
      }
      if ((azA != null) && (azA.length > 0))
      {
        int i = 0;
        while (i < azA.length)
        {
          ra.d locald = azA[i];
          if (locald != null) {
            paramqp.a(3, locald);
          }
          i += 1;
        }
      }
      if (!Arrays.equals(azC, qz.azq)) {
        paramqp.a(6, azC);
      }
      if (azF != null) {
        paramqp.a(7, azF);
      }
      if (!Arrays.equals(azD, qz.azq)) {
        paramqp.a(8, azD);
      }
      if (azB != null) {
        paramqp.a(9, azB);
      }
      if (azz) {
        paramqp.b(10, azz);
      }
      if (azx != 0) {
        paramqp.t(11, azx);
      }
      if (azy != 0) {
        paramqp.t(12, azy);
      }
      if (!Arrays.equals(azE, qz.azq)) {
        paramqp.a(13, azE);
      }
      if (!azG.equals("")) {
        paramqp.b(14, azG);
      }
      if (azH != 0L) {
        paramqp.c(15, azH);
      }
      super.a(paramqp);
    }
    
    protected int c()
    {
      int i = super.c();
      int j = i;
      if (azw != 0L) {
        j = i + qp.d(1, azw);
      }
      i = j;
      if (!tag.equals("")) {
        i = j + qp.j(2, tag);
      }
      j = i;
      if (azA != null)
      {
        j = i;
        if (azA.length > 0)
        {
          j = 0;
          while (j < azA.length)
          {
            ra.d locald = azA[j];
            int k = i;
            if (locald != null) {
              k = i + qp.c(3, locald);
            }
            j += 1;
            i = k;
          }
          j = i;
        }
      }
      i = j;
      if (!Arrays.equals(azC, qz.azq)) {
        i = j + qp.b(6, azC);
      }
      j = i;
      if (azF != null) {
        j = i + qp.c(7, azF);
      }
      i = j;
      if (!Arrays.equals(azD, qz.azq)) {
        i = j + qp.b(8, azD);
      }
      j = i;
      if (azB != null) {
        j = i + qp.c(9, azB);
      }
      i = j;
      if (azz) {
        i = j + qp.c(10, azz);
      }
      j = i;
      if (azx != 0) {
        j = i + qp.v(11, azx);
      }
      i = j;
      if (azy != 0) {
        i = j + qp.v(12, azy);
      }
      j = i;
      if (!Arrays.equals(azE, qz.azq)) {
        j = i + qp.b(13, azE);
      }
      i = j;
      if (!azG.equals("")) {
        i = j + qp.j(14, azG);
      }
      j = i;
      if (azH != 0L) {
        j = i + qp.e(15, azH);
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
      label55:
      label126:
      label190:
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
                              } while (!(paramObject instanceof c));
                              paramObject = (c)paramObject;
                              bool1 = bool2;
                            } while (azw != azw);
                            if (tag != null) {
                              break;
                            }
                            bool1 = bool2;
                          } while (tag != null);
                          bool1 = bool2;
                        } while (azx != azx);
                        bool1 = bool2;
                      } while (azy != azy);
                      bool1 = bool2;
                    } while (azz != azz);
                    bool1 = bool2;
                  } while (!qu.equals(azA, azA));
                  if (azB != null) {
                    break label242;
                  }
                  bool1 = bool2;
                } while (azB != null);
                bool1 = bool2;
              } while (!Arrays.equals(azC, azC));
              bool1 = bool2;
            } while (!Arrays.equals(azD, azD));
            bool1 = bool2;
          } while (!Arrays.equals(azE, azE));
          if (azF != null) {
            break label258;
          }
          bool1 = bool2;
        } while (azF != null);
        if (azG != null) {
          break label274;
        }
        bool1 = bool2;
      } while (azG != null);
      label242:
      label258:
      label274:
      while (azG.equals(azG))
      {
        bool1 = bool2;
        if (azH != azH) {
          break;
        }
        return a((qq)paramObject);
        if (tag.equals(tag)) {
          break label55;
        }
        return false;
        if (azB.equals(azB)) {
          break label126;
        }
        return false;
        if (azF.equals(azF)) {
          break label190;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int n = 0;
      int i1 = (int)(azw ^ azw >>> 32);
      int i;
      int i2;
      int i3;
      int j;
      label50:
      int i4;
      int k;
      label68:
      int i5;
      int i6;
      int i7;
      int m;
      if (tag == null)
      {
        i = 0;
        i2 = azx;
        i3 = azy;
        if (!azz) {
          break label218;
        }
        j = 1231;
        i4 = qu.hashCode(azA);
        if (azB != null) {
          break label225;
        }
        k = 0;
        i5 = Arrays.hashCode(azC);
        i6 = Arrays.hashCode(azD);
        i7 = Arrays.hashCode(azE);
        if (azF != null) {
          break label236;
        }
        m = 0;
        label105:
        if (azG != null) {
          break label248;
        }
      }
      for (;;)
      {
        return (((m + ((((k + ((j + (((i + (i1 + 527) * 31) * 31 + i2) * 31 + i3) * 31) * 31 + i4) * 31) * 31 + i5) * 31 + i6) * 31 + i7) * 31) * 31 + n) * 31 + (int)(azH ^ azH >>> 32)) * 31 + rQ();
        i = tag.hashCode();
        break;
        label218:
        j = 1237;
        break label50;
        label225:
        k = azB.hashCode();
        break label68;
        label236:
        m = azF.hashCode();
        break label105;
        label248:
        n = azG.hashCode();
      }
    }
    
    public c sc()
    {
      azw = 0L;
      tag = "";
      azx = 0;
      azy = 0;
      azz = false;
      azA = ra.d.sd();
      azB = null;
      azC = qz.azq;
      azD = qz.azq;
      azE = qz.azq;
      azF = null;
      azG = "";
      azH = 0L;
      ayW = null;
      azh = -1;
      return this;
    }
  }
  
  public static final class d
    extends qq<d>
  {
    private static volatile d[] azI;
    public String fv;
    public String value;
    
    public d()
    {
      se();
    }
    
    public static d[] sd()
    {
      if (azI == null) {}
      synchronized (qu.azg)
      {
        if (azI == null) {
          azI = new d[0];
        }
        return azI;
      }
    }
    
    public d B(qo paramqo)
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
        case 18: 
          value = paramqo.readString();
        }
      }
    }
    
    public void a(qp paramqp)
      throws IOException
    {
      if (!fv.equals("")) {
        paramqp.b(1, fv);
      }
      if (!value.equals("")) {
        paramqp.b(2, value);
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
      if (!value.equals("")) {
        j = i + qp.j(2, value);
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
            return bool1;
            bool1 = bool2;
          } while (!(paramObject instanceof d));
          paramObject = (d)paramObject;
          if (fv != null) {
            break;
          }
          bool1 = bool2;
        } while (fv != null);
        if (value != null) {
          break label79;
        }
        bool1 = bool2;
      } while (value != null);
      label79:
      while (value.equals(value))
      {
        return a((qq)paramObject);
        if (fv.equals(fv)) {
          break;
        }
        return false;
      }
      return false;
    }
    
    public int hashCode()
    {
      int j = 0;
      int i;
      if (fv == null)
      {
        i = 0;
        if (value != null) {
          break label48;
        }
      }
      for (;;)
      {
        return ((i + 527) * 31 + j) * 31 + rQ();
        i = fv.hashCode();
        break;
        label48:
        j = value.hashCode();
      }
    }
    
    public d se()
    {
      fv = "";
      value = "";
      ayW = null;
      azh = -1;
      return this;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.ra
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */