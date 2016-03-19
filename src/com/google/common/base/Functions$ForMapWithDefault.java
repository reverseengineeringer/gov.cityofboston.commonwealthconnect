package com.google.common.base;

import java.io.Serializable;
import java.util.Map;
import javax.annotation.Nullable;

class Functions$ForMapWithDefault<K, V>
  implements Function<K, V>, Serializable
{
  private static final long serialVersionUID = 0L;
  final V defaultValue;
  final Map<K, ? extends V> map;
  
  Functions$ForMapWithDefault(Map<K, ? extends V> paramMap, @Nullable V paramV)
  {
    map = ((Map)Preconditions.checkNotNull(paramMap));
    defaultValue = paramV;
  }
  
  public V apply(@Nullable K paramK)
  {
    Object localObject = map.get(paramK);
    if ((localObject != null) || (map.containsKey(paramK))) {
      return (V)localObject;
    }
    return (V)defaultValue;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof ForMapWithDefault))
    {
      paramObject = (ForMapWithDefault)paramObject;
      bool1 = bool2;
      if (map.equals(map))
      {
        bool1 = bool2;
        if (Objects.equal(defaultValue, defaultValue)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { map, defaultValue });
  }
  
  public String toString()
  {
    return "forMap(" + map + ", defaultValue=" + defaultValue + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Functions.ForMapWithDefault
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */