package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public class ImmutableSetMultimap<K, V>
  extends ImmutableMultimap<K, V>
  implements SetMultimap<K, V>
{
  @GwtIncompatible("not needed in emulated source.")
  private static final long serialVersionUID = 0L;
  private final transient ImmutableSet<V> emptySet;
  private transient ImmutableSet<Map.Entry<K, V>> entries;
  private transient ImmutableSetMultimap<V, K> inverse;
  
  ImmutableSetMultimap(ImmutableMap<K, ImmutableSet<V>> paramImmutableMap, int paramInt, @Nullable Comparator<? super V> paramComparator)
  {
    super(paramImmutableMap, paramInt);
    emptySet = emptySet(paramComparator);
  }
  
  public static <K, V> Builder<K, V> builder()
  {
    return new Builder();
  }
  
  public static <K, V> ImmutableSetMultimap<K, V> copyOf(Multimap<? extends K, ? extends V> paramMultimap)
  {
    return copyOf(paramMultimap, null);
  }
  
  private static <K, V> ImmutableSetMultimap<K, V> copyOf(Multimap<? extends K, ? extends V> paramMultimap, Comparator<? super V> paramComparator)
  {
    Preconditions.checkNotNull(paramMultimap);
    if ((paramMultimap.isEmpty()) && (paramComparator == null)) {
      localObject1 = of();
    }
    Object localObject2;
    do
    {
      return (ImmutableSetMultimap<K, V>)localObject1;
      if (!(paramMultimap instanceof ImmutableSetMultimap)) {
        break;
      }
      localObject2 = (ImmutableSetMultimap)paramMultimap;
      localObject1 = localObject2;
    } while (!((ImmutableSetMultimap)localObject2).isPartialView());
    Object localObject1 = ImmutableMap.builder();
    int i = 0;
    paramMultimap = paramMultimap.asMap().entrySet().iterator();
    while (paramMultimap.hasNext())
    {
      Object localObject3 = (Map.Entry)paramMultimap.next();
      localObject2 = ((Map.Entry)localObject3).getKey();
      localObject3 = valueSet(paramComparator, (Collection)((Map.Entry)localObject3).getValue());
      if (!((ImmutableSet)localObject3).isEmpty())
      {
        ((ImmutableMap.Builder)localObject1).put(localObject2, localObject3);
        i += ((ImmutableSet)localObject3).size();
      }
    }
    return new ImmutableSetMultimap(((ImmutableMap.Builder)localObject1).build(), i, paramComparator);
  }
  
  private static <V> ImmutableSet<V> emptySet(@Nullable Comparator<? super V> paramComparator)
  {
    if (paramComparator == null) {
      return ImmutableSet.of();
    }
    return ImmutableSortedSet.emptySet(paramComparator);
  }
  
  private ImmutableSetMultimap<V, K> invert()
  {
    Object localObject = builder();
    Iterator localIterator = entries().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      ((Builder)localObject).put(localEntry.getValue(), localEntry.getKey());
    }
    localObject = ((Builder)localObject).build();
    inverse = this;
    return (ImmutableSetMultimap<V, K>)localObject;
  }
  
  public static <K, V> ImmutableSetMultimap<K, V> of()
  {
    return EmptyImmutableSetMultimap.INSTANCE;
  }
  
  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK, V paramV)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK, paramV);
    return localBuilder.build();
  }
  
  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    return localBuilder.build();
  }
  
  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    localBuilder.put(paramK3, paramV3);
    return localBuilder.build();
  }
  
  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    localBuilder.put(paramK3, paramV3);
    localBuilder.put(paramK4, paramV4);
    return localBuilder.build();
  }
  
  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    localBuilder.put(paramK3, paramV3);
    localBuilder.put(paramK4, paramV4);
    localBuilder.put(paramK5, paramV5);
    return localBuilder.build();
  }
  
  @GwtIncompatible("java.io.ObjectInputStream")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    Comparator localComparator = (Comparator)paramObjectInputStream.readObject();
    int m = paramObjectInputStream.readInt();
    if (m < 0) {
      throw new InvalidObjectException("Invalid key count " + m);
    }
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int j = 0;
    int i = 0;
    while (i < m)
    {
      Object localObject = paramObjectInputStream.readObject();
      int n = paramObjectInputStream.readInt();
      if (n <= 0) {
        throw new InvalidObjectException("Invalid value count " + n);
      }
      Object[] arrayOfObject = new Object[n];
      int k = 0;
      while (k < n)
      {
        arrayOfObject[k] = paramObjectInputStream.readObject();
        k += 1;
      }
      ImmutableSet localImmutableSet = valueSet(localComparator, Arrays.asList(arrayOfObject));
      if (localImmutableSet.size() != arrayOfObject.length) {
        throw new InvalidObjectException("Duplicate key-value pairs exist for key " + localObject);
      }
      localBuilder.put(localObject, localImmutableSet);
      j += n;
      i += 1;
    }
    try
    {
      paramObjectInputStream = localBuilder.build();
      ImmutableMultimap.FieldSettersHolder.MAP_FIELD_SETTER.set(this, paramObjectInputStream);
      ImmutableMultimap.FieldSettersHolder.SIZE_FIELD_SETTER.set(this, j);
      ImmutableMultimap.FieldSettersHolder.EMPTY_SET_FIELD_SETTER.set(this, emptySet(localComparator));
      return;
    }
    catch (IllegalArgumentException paramObjectInputStream)
    {
      throw ((InvalidObjectException)new InvalidObjectException(paramObjectInputStream.getMessage()).initCause(paramObjectInputStream));
    }
  }
  
  private static <V> ImmutableSet<V> valueSet(@Nullable Comparator<? super V> paramComparator, Collection<? extends V> paramCollection)
  {
    if (paramComparator == null) {
      return ImmutableSet.copyOf(paramCollection);
    }
    return ImmutableSortedSet.copyOf(paramComparator, paramCollection);
  }
  
  @GwtIncompatible("java.io.ObjectOutputStream")
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    paramObjectOutputStream.writeObject(valueComparator());
    Serialization.writeMultimap(this, paramObjectOutputStream);
  }
  
  public ImmutableSet<Map.Entry<K, V>> entries()
  {
    ImmutableSet localImmutableSet = entries;
    Object localObject = localImmutableSet;
    if (localImmutableSet == null)
    {
      localObject = new EntrySet(this);
      entries = ((ImmutableSet)localObject);
    }
    return (ImmutableSet<Map.Entry<K, V>>)localObject;
  }
  
  public ImmutableSet<V> get(@Nullable K paramK)
  {
    return (ImmutableSet)Objects.firstNonNull((ImmutableSet)map.get(paramK), emptySet);
  }
  
  public ImmutableSetMultimap<V, K> inverse()
  {
    ImmutableSetMultimap localImmutableSetMultimap2 = inverse;
    ImmutableSetMultimap localImmutableSetMultimap1 = localImmutableSetMultimap2;
    if (localImmutableSetMultimap2 == null)
    {
      localImmutableSetMultimap1 = invert();
      inverse = localImmutableSetMultimap1;
    }
    return localImmutableSetMultimap1;
  }
  
  @Deprecated
  public ImmutableSet<V> removeAll(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  @Deprecated
  public ImmutableSet<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  @Nullable
  Comparator<? super V> valueComparator()
  {
    if ((emptySet instanceof ImmutableSortedSet)) {
      return ((ImmutableSortedSet)emptySet).comparator();
    }
    return null;
  }
  
  public static final class Builder<K, V>
    extends ImmutableMultimap.Builder<K, V>
  {
    public Builder()
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
      return ImmutableSetMultimap.copyOf(builderMultimap, valueComparator);
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
  
  private static class BuilderMultimap<K, V>
    extends AbstractMapBasedMultimap<K, V>
  {
    private static final long serialVersionUID = 0L;
    
    BuilderMultimap()
    {
      super();
    }
    
    Collection<V> createCollection()
    {
      return Sets.newLinkedHashSet();
    }
  }
  
  private static final class EntrySet<K, V>
    extends ImmutableSet<Map.Entry<K, V>>
  {
    private final transient ImmutableSetMultimap<K, V> multimap;
    
    EntrySet(ImmutableSetMultimap<K, V> paramImmutableSetMultimap)
    {
      multimap = paramImmutableSetMultimap;
    }
    
    public boolean contains(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        paramObject = (Map.Entry)paramObject;
        return multimap.containsEntry(((Map.Entry)paramObject).getKey(), ((Map.Entry)paramObject).getValue());
      }
      return false;
    }
    
    boolean isPartialView()
    {
      return false;
    }
    
    public UnmodifiableIterator<Map.Entry<K, V>> iterator()
    {
      return multimap.entryIterator();
    }
    
    public int size()
    {
      return multimap.size();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */