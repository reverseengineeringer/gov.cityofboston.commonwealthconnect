package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import javax.annotation.Nullable;

@VisibleForTesting
final class LinkedHashMultimap$ValueEntry<K, V>
  extends ImmutableEntry<K, V>
  implements LinkedHashMultimap.ValueSetLink<K, V>
{
  @Nullable
  ValueEntry<K, V> nextInValueBucket;
  ValueEntry<K, V> predecessorInMultimap;
  LinkedHashMultimap.ValueSetLink<K, V> predecessorInValueSet;
  final int smearedValueHash;
  ValueEntry<K, V> successorInMultimap;
  LinkedHashMultimap.ValueSetLink<K, V> successorInValueSet;
  
  LinkedHashMultimap$ValueEntry(@Nullable K paramK, @Nullable V paramV, int paramInt, @Nullable ValueEntry<K, V> paramValueEntry)
  {
    super(paramK, paramV);
    smearedValueHash = paramInt;
    nextInValueBucket = paramValueEntry;
  }
  
  public ValueEntry<K, V> getPredecessorInMultimap()
  {
    return predecessorInMultimap;
  }
  
  public LinkedHashMultimap.ValueSetLink<K, V> getPredecessorInValueSet()
  {
    return predecessorInValueSet;
  }
  
  public ValueEntry<K, V> getSuccessorInMultimap()
  {
    return successorInMultimap;
  }
  
  public LinkedHashMultimap.ValueSetLink<K, V> getSuccessorInValueSet()
  {
    return successorInValueSet;
  }
  
  boolean matchesValue(@Nullable Object paramObject, int paramInt)
  {
    return (smearedValueHash == paramInt) && (Objects.equal(getValue(), paramObject));
  }
  
  public void setPredecessorInMultimap(ValueEntry<K, V> paramValueEntry)
  {
    predecessorInMultimap = paramValueEntry;
  }
  
  public void setPredecessorInValueSet(LinkedHashMultimap.ValueSetLink<K, V> paramValueSetLink)
  {
    predecessorInValueSet = paramValueSetLink;
  }
  
  public void setSuccessorInMultimap(ValueEntry<K, V> paramValueEntry)
  {
    successorInMultimap = paramValueEntry;
  }
  
  public void setSuccessorInValueSet(LinkedHashMultimap.ValueSetLink<K, V> paramValueSetLink)
  {
    successorInValueSet = paramValueSetLink;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedHashMultimap.ValueEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */