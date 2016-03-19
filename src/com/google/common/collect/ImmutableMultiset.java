package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public abstract class ImmutableMultiset<E>
  extends ImmutableCollection<E>
  implements Multiset<E>
{
  private static final ImmutableMultiset<Object> EMPTY = new RegularImmutableMultiset(ImmutableMap.of(), 0);
  private transient ImmutableSet<Multiset.Entry<E>> entrySet;
  
  public static <E> Builder<E> builder()
  {
    return new Builder();
  }
  
  static <E> ImmutableMultiset<E> copyFromEntries(Collection<? extends Multiset.Entry<? extends E>> paramCollection)
  {
    long l = 0L;
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      Multiset.Entry localEntry = (Multiset.Entry)paramCollection.next();
      int i = localEntry.getCount();
      if (i > 0)
      {
        localBuilder.put(localEntry.getElement(), Integer.valueOf(i));
        l += i;
      }
    }
    if (l == 0L) {
      return of();
    }
    return new RegularImmutableMultiset(localBuilder.build(), Ints.saturatedCast(l));
  }
  
  public static <E> ImmutableMultiset<E> copyOf(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof ImmutableMultiset))
    {
      ImmutableMultiset localImmutableMultiset = (ImmutableMultiset)paramIterable;
      if (!localImmutableMultiset.isPartialView()) {
        return localImmutableMultiset;
      }
    }
    if ((paramIterable instanceof Multiset)) {}
    for (paramIterable = Multisets.cast(paramIterable);; paramIterable = LinkedHashMultiset.create(paramIterable)) {
      return copyOfInternal(paramIterable);
    }
  }
  
  public static <E> ImmutableMultiset<E> copyOf(Iterator<? extends E> paramIterator)
  {
    LinkedHashMultiset localLinkedHashMultiset = LinkedHashMultiset.create();
    Iterators.addAll(localLinkedHashMultiset, paramIterator);
    return copyOfInternal(localLinkedHashMultiset);
  }
  
  public static <E> ImmutableMultiset<E> copyOf(E[] paramArrayOfE)
  {
    return copyOf(Arrays.asList(paramArrayOfE));
  }
  
  private static <E> ImmutableMultiset<E> copyOfInternal(Multiset<? extends E> paramMultiset)
  {
    return copyFromEntries(paramMultiset.entrySet());
  }
  
  private static <E> ImmutableMultiset<E> copyOfInternal(E... paramVarArgs)
  {
    return copyOf(Arrays.asList(paramVarArgs));
  }
  
  private final ImmutableSet<Multiset.Entry<E>> createEntrySet()
  {
    if (isEmpty()) {
      return ImmutableSet.of();
    }
    return new EntrySet(null);
  }
  
  public static <E> ImmutableMultiset<E> of()
  {
    return EMPTY;
  }
  
  public static <E> ImmutableMultiset<E> of(E paramE)
  {
    return copyOfInternal(new Object[] { paramE });
  }
  
  public static <E> ImmutableMultiset<E> of(E paramE1, E paramE2)
  {
    return copyOfInternal(new Object[] { paramE1, paramE2 });
  }
  
  public static <E> ImmutableMultiset<E> of(E paramE1, E paramE2, E paramE3)
  {
    return copyOfInternal(new Object[] { paramE1, paramE2, paramE3 });
  }
  
  public static <E> ImmutableMultiset<E> of(E paramE1, E paramE2, E paramE3, E paramE4)
  {
    return copyOfInternal(new Object[] { paramE1, paramE2, paramE3, paramE4 });
  }
  
  public static <E> ImmutableMultiset<E> of(E paramE1, E paramE2, E paramE3, E paramE4, E paramE5)
  {
    return copyOfInternal(new Object[] { paramE1, paramE2, paramE3, paramE4, paramE5 });
  }
  
  public static <E> ImmutableMultiset<E> of(E paramE1, E paramE2, E paramE3, E paramE4, E paramE5, E paramE6, E... paramVarArgs)
  {
    return new Builder().add(paramE1).add(paramE2).add(paramE3).add(paramE4).add(paramE5).add(paramE6).add(paramVarArgs).build();
  }
  
  @Deprecated
  public final int add(E paramE, int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return count(paramObject) > 0;
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return elementSet().containsAll(paramCollection);
  }
  
  @GwtIncompatible("not present in emulated superclass")
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    Iterator localIterator = entrySet().iterator();
    while (localIterator.hasNext())
    {
      Multiset.Entry localEntry = (Multiset.Entry)localIterator.next();
      Arrays.fill(paramArrayOfObject, paramInt, localEntry.getCount() + paramInt, localEntry.getElement());
      paramInt += localEntry.getCount();
    }
    return paramInt;
  }
  
  public ImmutableSet<Multiset.Entry<E>> entrySet()
  {
    ImmutableSet localImmutableSet2 = entrySet;
    ImmutableSet localImmutableSet1 = localImmutableSet2;
    if (localImmutableSet2 == null)
    {
      localImmutableSet1 = createEntrySet();
      entrySet = localImmutableSet1;
    }
    return localImmutableSet1;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return Multisets.equalsImpl(this, paramObject);
  }
  
  abstract Multiset.Entry<E> getEntry(int paramInt);
  
  public int hashCode()
  {
    return Sets.hashCodeImpl(entrySet());
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    new UnmodifiableIterator()
    {
      E element;
      int remaining;
      
      public boolean hasNext()
      {
        return (remaining > 0) || (val$entryIterator.hasNext());
      }
      
      public E next()
      {
        if (remaining <= 0)
        {
          Multiset.Entry localEntry = (Multiset.Entry)val$entryIterator.next();
          element = localEntry.getElement();
          remaining = localEntry.getCount();
        }
        remaining -= 1;
        return (E)element;
      }
    };
  }
  
  @Deprecated
  public final int remove(Object paramObject, int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  @Deprecated
  public final int setCount(E paramE, int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  @Deprecated
  public final boolean setCount(E paramE, int paramInt1, int paramInt2)
  {
    throw new UnsupportedOperationException();
  }
  
  public String toString()
  {
    return entrySet().toString();
  }
  
  Object writeReplace()
  {
    return new SerializedForm(this);
  }
  
  public static class Builder<E>
    extends ImmutableCollection.Builder<E>
  {
    final Multiset<E> contents;
    
    public Builder()
    {
      this(LinkedHashMultiset.create());
    }
    
    Builder(Multiset<E> paramMultiset)
    {
      contents = paramMultiset;
    }
    
    public Builder<E> add(E paramE)
    {
      contents.add(Preconditions.checkNotNull(paramE));
      return this;
    }
    
    public Builder<E> add(E... paramVarArgs)
    {
      super.add(paramVarArgs);
      return this;
    }
    
    public Builder<E> addAll(Iterable<? extends E> paramIterable)
    {
      if ((paramIterable instanceof Multiset))
      {
        paramIterable = Multisets.cast(paramIterable).entrySet().iterator();
        while (paramIterable.hasNext())
        {
          Multiset.Entry localEntry = (Multiset.Entry)paramIterable.next();
          addCopies(localEntry.getElement(), localEntry.getCount());
        }
      }
      super.addAll(paramIterable);
      return this;
    }
    
    public Builder<E> addAll(Iterator<? extends E> paramIterator)
    {
      super.addAll(paramIterator);
      return this;
    }
    
    public Builder<E> addCopies(E paramE, int paramInt)
    {
      contents.add(Preconditions.checkNotNull(paramE), paramInt);
      return this;
    }
    
    public ImmutableMultiset<E> build()
    {
      return ImmutableMultiset.copyOf(contents);
    }
    
    public Builder<E> setCount(E paramE, int paramInt)
    {
      contents.setCount(Preconditions.checkNotNull(paramE), paramInt);
      return this;
    }
  }
  
  private final class EntrySet
    extends ImmutableSet<Multiset.Entry<E>>
  {
    private static final long serialVersionUID = 0L;
    
    private EntrySet() {}
    
    public boolean contains(Object paramObject)
    {
      if ((paramObject instanceof Multiset.Entry))
      {
        paramObject = (Multiset.Entry)paramObject;
        if (((Multiset.Entry)paramObject).getCount() > 0) {
          break label23;
        }
      }
      label23:
      while (count(((Multiset.Entry)paramObject).getElement()) != ((Multiset.Entry)paramObject).getCount()) {
        return false;
      }
      return true;
    }
    
    ImmutableList<Multiset.Entry<E>> createAsList()
    {
      new ImmutableAsList()
      {
        ImmutableCollection<Multiset.Entry<E>> delegateCollection()
        {
          return ImmutableMultiset.EntrySet.this;
        }
        
        public Multiset.Entry<E> get(int paramAnonymousInt)
        {
          return getEntry(paramAnonymousInt);
        }
      };
    }
    
    public int hashCode()
    {
      return ImmutableMultiset.this.hashCode();
    }
    
    boolean isPartialView()
    {
      return ImmutableMultiset.this.isPartialView();
    }
    
    public UnmodifiableIterator<Multiset.Entry<E>> iterator()
    {
      return asList().iterator();
    }
    
    public int size()
    {
      return elementSet().size();
    }
    
    Object writeReplace()
    {
      return new ImmutableMultiset.EntrySetSerializedForm(ImmutableMultiset.this);
    }
  }
  
  static class EntrySetSerializedForm<E>
    implements Serializable
  {
    final ImmutableMultiset<E> multiset;
    
    EntrySetSerializedForm(ImmutableMultiset<E> paramImmutableMultiset)
    {
      multiset = paramImmutableMultiset;
    }
    
    Object readResolve()
    {
      return multiset.entrySet();
    }
  }
  
  private static class SerializedForm
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final int[] counts;
    final Object[] elements;
    
    SerializedForm(Multiset<?> paramMultiset)
    {
      int i = paramMultiset.entrySet().size();
      elements = new Object[i];
      counts = new int[i];
      i = 0;
      paramMultiset = paramMultiset.entrySet().iterator();
      while (paramMultiset.hasNext())
      {
        Multiset.Entry localEntry = (Multiset.Entry)paramMultiset.next();
        elements[i] = localEntry.getElement();
        counts[i] = localEntry.getCount();
        i += 1;
      }
    }
    
    Object readResolve()
    {
      LinkedHashMultiset localLinkedHashMultiset = LinkedHashMultiset.create(elements.length);
      int i = 0;
      while (i < elements.length)
      {
        localLinkedHashMultiset.add(elements[i], counts[i]);
        i += 1;
      }
      return ImmutableMultiset.copyOf(localLinkedHashMultiset);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */