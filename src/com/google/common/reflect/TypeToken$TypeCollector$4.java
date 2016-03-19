package com.google.common.reflect;

import com.google.common.collect.Ordering;
import java.util.Comparator;
import java.util.Map;

final class TypeToken$TypeCollector$4
  extends Ordering<K>
{
  TypeToken$TypeCollector$4(Comparator paramComparator, Map paramMap) {}
  
  public int compare(K paramK1, K paramK2)
  {
    return val$valueComparator.compare(val$map.get(paramK1), val$map.get(paramK2));
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.TypeCollector.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */