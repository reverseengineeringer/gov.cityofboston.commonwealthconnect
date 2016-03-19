package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Comparator;
import java.util.Map;

public abstract class MultimapBuilder$MultimapBuilderWithKeys<K0>
{
  private static final int DEFAULT_EXPECTED_VALUES_PER_KEY = 2;
  
  public MultimapBuilder.ListMultimapBuilder<K0, Object> arrayListValues()
  {
    return arrayListValues(2);
  }
  
  public MultimapBuilder.ListMultimapBuilder<K0, Object> arrayListValues(final int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "expectedValuesPerKey");
    new MultimapBuilder.ListMultimapBuilder()
    {
      public <K extends K0, V> ListMultimap<K, V> build()
      {
        return Multimaps.newListMultimap(createMap(), new MultimapBuilder.ArrayListSupplier(paramInt));
      }
    };
  }
  
  abstract <K extends K0, V> Map<K, Collection<V>> createMap();
  
  public <V0 extends Enum<V0>> MultimapBuilder.SetMultimapBuilder<K0, V0> enumSetValues(final Class<V0> paramClass)
  {
    Preconditions.checkNotNull(paramClass, "valueClass");
    new MultimapBuilder.SetMultimapBuilder()
    {
      public <K extends K0, V extends V0> SetMultimap<K, V> build()
      {
        MultimapBuilder.EnumSetSupplier localEnumSetSupplier = new MultimapBuilder.EnumSetSupplier(paramClass);
        return Multimaps.newSetMultimap(createMap(), localEnumSetSupplier);
      }
    };
  }
  
  public MultimapBuilder.SetMultimapBuilder<K0, Object> hashSetValues()
  {
    return hashSetValues(2);
  }
  
  public MultimapBuilder.SetMultimapBuilder<K0, Object> hashSetValues(final int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "expectedValuesPerKey");
    new MultimapBuilder.SetMultimapBuilder()
    {
      public <K extends K0, V> SetMultimap<K, V> build()
      {
        return Multimaps.newSetMultimap(createMap(), new MultimapBuilder.HashSetSupplier(paramInt));
      }
    };
  }
  
  public MultimapBuilder.SetMultimapBuilder<K0, Object> linkedHashSetValues()
  {
    return linkedHashSetValues(2);
  }
  
  public MultimapBuilder.SetMultimapBuilder<K0, Object> linkedHashSetValues(final int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "expectedValuesPerKey");
    new MultimapBuilder.SetMultimapBuilder()
    {
      public <K extends K0, V> SetMultimap<K, V> build()
      {
        return Multimaps.newSetMultimap(createMap(), new MultimapBuilder.LinkedHashSetSupplier(paramInt));
      }
    };
  }
  
  public MultimapBuilder.ListMultimapBuilder<K0, Object> linkedListValues()
  {
    new MultimapBuilder.ListMultimapBuilder()
    {
      public <K extends K0, V> ListMultimap<K, V> build()
      {
        return Multimaps.newListMultimap(createMap(), MultimapBuilder.LinkedListSupplier.instance());
      }
    };
  }
  
  public MultimapBuilder.SortedSetMultimapBuilder<K0, Comparable> treeSetValues()
  {
    return treeSetValues(Ordering.natural());
  }
  
  public <V0> MultimapBuilder.SortedSetMultimapBuilder<K0, V0> treeSetValues(final Comparator<V0> paramComparator)
  {
    Preconditions.checkNotNull(paramComparator, "comparator");
    new MultimapBuilder.SortedSetMultimapBuilder()
    {
      public <K extends K0, V extends V0> SortedSetMultimap<K, V> build()
      {
        return Multimaps.newSortedSetMultimap(createMap(), new MultimapBuilder.TreeSetSupplier(paramComparator));
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.MultimapBuilderWithKeys
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */