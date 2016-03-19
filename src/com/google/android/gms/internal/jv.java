package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class jv
{
  public static boolean equal(Object paramObject1, Object paramObject2)
  {
    return (paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)));
  }
  
  public static a h(Object paramObject)
  {
    return new a(paramObject, null);
  }
  
  public static int hashCode(Object... paramVarArgs)
  {
    return Arrays.hashCode(paramVarArgs);
  }
  
  public static final class a
  {
    private final List<String> Nr;
    private final Object Ns;
    
    private a(Object paramObject)
    {
      Ns = jx.i(paramObject);
      Nr = new ArrayList();
    }
    
    public a a(String paramString, Object paramObject)
    {
      Nr.add((String)jx.i(paramString) + "=" + String.valueOf(paramObject));
      return this;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder(100).append(Ns.getClass().getSimpleName()).append('{');
      int j = Nr.size();
      int i = 0;
      while (i < j)
      {
        localStringBuilder.append((String)Nr.get(i));
        if (i < j - 1) {
          localStringBuilder.append(", ");
        }
        i += 1;
      }
      return '}';
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.jv
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */