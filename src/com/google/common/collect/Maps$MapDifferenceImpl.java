package com.google.common.collect;

import com.google.common.base.Objects;
import java.util.Map;

class Maps$MapDifferenceImpl<K, V>
  implements MapDifference<K, V>
{
  final Map<K, MapDifference.ValueDifference<V>> differences;
  final Map<K, V> onBoth;
  final Map<K, V> onlyOnLeft;
  final Map<K, V> onlyOnRight;
  
  Maps$MapDifferenceImpl(Map<K, V> paramMap1, Map<K, V> paramMap2, Map<K, V> paramMap3, Map<K, MapDifference.ValueDifference<V>> paramMap)
  {
    onlyOnLeft = Maps.access$100(paramMap1);
    onlyOnRight = Maps.access$100(paramMap2);
    onBoth = Maps.access$100(paramMap3);
    differences = Maps.access$100(paramMap);
  }
  
  public boolean areEqual()
  {
    return (onlyOnLeft.isEmpty()) && (onlyOnRight.isEmpty()) && (differences.isEmpty());
  }
  
  public Map<K, MapDifference.ValueDifference<V>> entriesDiffering()
  {
    return differences;
  }
  
  public Map<K, V> entriesInCommon()
  {
    return onBoth;
  }
  
  public Map<K, V> entriesOnlyOnLeft()
  {
    return onlyOnLeft;
  }
  
  public Map<K, V> entriesOnlyOnRight()
  {
    return onlyOnRight;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof MapDifference)) {
        break;
      }
      paramObject = (MapDifference)paramObject;
    } while ((entriesOnlyOnLeft().equals(((MapDifference)paramObject).entriesOnlyOnLeft())) && (entriesOnlyOnRight().equals(((MapDifference)paramObject).entriesOnlyOnRight())) && (entriesInCommon().equals(((MapDifference)paramObject).entriesInCommon())) && (entriesDiffering().equals(((MapDifference)paramObject).entriesDiffering())));
    return false;
    return false;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { entriesOnlyOnLeft(), entriesOnlyOnRight(), entriesInCommon(), entriesDiffering() });
  }
  
  public String toString()
  {
    if (areEqual()) {
      return "equal";
    }
    StringBuilder localStringBuilder = new StringBuilder("not equal");
    if (!onlyOnLeft.isEmpty()) {
      localStringBuilder.append(": only on left=").append(onlyOnLeft);
    }
    if (!onlyOnRight.isEmpty()) {
      localStringBuilder.append(": only on right=").append(onlyOnRight);
    }
    if (!differences.isEmpty()) {
      localStringBuilder.append(": value differences=").append(differences);
    }
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.MapDifferenceImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */