package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class ImmutableSetMultimap$Builder<K, V>
  extends ImmutableMultimap.Builder<K, V>
{
  public ImmutableSetMultimap$Builder()
  {
    builderMultimap = new ImmutableSetMultimap.BuilderMultimap();
  }
  
  public ImmutableSetMultimap<K, V> build()
  {
    if (keyComparator != null)
    {
      ImmutableSetMultimap.BuilderMultimap localBuilderMultimap = new ImmutableSetMultimap.BuilderMultimap();
      Object localObject = Lists.newArrayList(builderMultimap.asMap().entrySet());
      Collections.sort((List)localObject, Ordering.from(keyComparator).onKeys());
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        Map.Entry localEntry = (Map.Entry)((Iterator)localObject).next();
        localBuilderMultimap.putAll(localEntry.getKey(), (Iterable)localEntry.getValue());
      }
      builderMultimap = localBuilderMultimap;
    }
    return ImmutableSetMultimap.access$000(builderMultimap, valueComparator);
  }
  
  public Builder<K, V> orderKeysBy(Comparator<? super K> paramComparator)
  {
    keyComparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    return this;
  }
  
  public Builder<K, V> orderValuesBy(Comparator<? super V> paramComparator)
  {
    super.orderValuesBy(paramComparator);
    return this;
  }
  
  public Builder<K, V> put(K paramK, V paramV)
  {
    builderMultimap.put(Preconditions.checkNotNull(paramK), Preconditions.checkNotNull(paramV));
    return this;
  }
  
  public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
  {
    builderMultimap.put(Preconditions.checkNotNull(paramEntry.getKey()), Preconditions.checkNotNull(paramEntry.getValue()));
    return this;
  }
  
  public Builder<K, V> putAll(Multimap<? extends K, ? extends V> paramMultimap)
  {
    paramMultimap = paramMultimap.asMap().entrySet().iterator();
    while (paramMultimap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMultimap.next();
      putAll(localEntry.getKey(), (Iterable)localEntry.getValue());
    }
    return this;
  }
  
  public Builder<K, V> putAll(K paramK, Iterable<? extends V> paramIterable)
  {
    paramK = builderMultimap.get(Preconditions.checkNotNull(paramK));
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext()) {
      paramK.add(Preconditions.checkNotNull(paramIterable.next()));
    }
    return this;
  }
  
  public Builder<K, V> putAll(K paramK, V... paramVarArgs)
  {
    return putAll(paramK, Arrays.asList(paramVarArgs));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSetMultimap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */