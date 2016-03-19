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

public class ImmutableMultimap$Builder<K, V>
{
  Multimap<K, V> builderMultimap = new ImmutableMultimap.BuilderMultimap();
  Comparator<? super K> keyComparator;
  Comparator<? super V> valueComparator;
  
  public ImmutableMultimap<K, V> build()
  {
    Object localObject1;
    if (valueComparator != null)
    {
      localObject1 = builderMultimap.asMap().values().iterator();
      while (((Iterator)localObject1).hasNext()) {
        Collections.sort((List)((Iterator)localObject1).next(), valueComparator);
      }
    }
    if (keyComparator != null)
    {
      localObject1 = new ImmutableMultimap.BuilderMultimap();
      Object localObject2 = Lists.newArrayList(builderMultimap.asMap().entrySet());
      Collections.sort((List)localObject2, Ordering.from(keyComparator).onKeys());
      localObject2 = ((List)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        Map.Entry localEntry = (Map.Entry)((Iterator)localObject2).next();
        ((Multimap)localObject1).putAll(localEntry.getKey(), (Iterable)localEntry.getValue());
      }
      builderMultimap = ((Multimap)localObject1);
    }
    return ImmutableMultimap.copyOf(builderMultimap);
  }
  
  public Builder<K, V> orderKeysBy(Comparator<? super K> paramComparator)
  {
    keyComparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    return this;
  }
  
  public Builder<K, V> orderValuesBy(Comparator<? super V> paramComparator)
  {
    valueComparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    return this;
  }
  
  public Builder<K, V> put(K paramK, V paramV)
  {
    CollectPreconditions.checkEntryNotNull(paramK, paramV);
    builderMultimap.put(paramK, paramV);
    return this;
  }
  
  public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
  {
    return put(paramEntry.getKey(), paramEntry.getValue());
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
    if (paramK == null) {
      throw new NullPointerException("null key in entry: null=" + Iterables.toString(paramIterable));
    }
    Collection localCollection = builderMultimap.get(paramK);
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext())
    {
      Object localObject = paramIterable.next();
      CollectPreconditions.checkEntryNotNull(paramK, localObject);
      localCollection.add(localObject);
    }
    return this;
  }
  
  public Builder<K, V> putAll(K paramK, V... paramVarArgs)
  {
    return putAll(paramK, Arrays.asList(paramVarArgs));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultimap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */