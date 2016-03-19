package com.google.common.base;

import java.io.Serializable;
import java.util.Map;
import javax.annotation.Nullable;

class Functions$FunctionForMapNoDefault<K, V>
  implements Function<K, V>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Map<K, V> map;
  
  Functions$FunctionForMapNoDefault(Map<K, V> paramMap)
  {
    map = ((Map)Preconditions.checkNotNull(paramMap));
  }
  
  public V apply(@Nullable K paramK)
  {
    Object localObject = map.get(paramK);
    if ((localObject != null) || (map.containsKey(paramK))) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Key '%s' not present in map", new Object[] { paramK });
      return (V)localObject;
    }
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof FunctionForMapNoDefault))
    {
      paramObject = (FunctionForMapNoDefault)paramObject;
      return map.equals(map);
    }
    return false;
  }
  
  public int hashCode()
  {
    return map.hashCode();
  }
  
  public String toString()
  {
    return "forMap(" + map + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Functions.FunctionForMapNoDefault
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */