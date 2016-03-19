package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import java.util.Set;
import java.util.SortedSet;

@GwtCompatible
final class Constraints
{
  private static <E> Collection<E> checkElements(Collection<E> paramCollection, Constraint<? super E> paramConstraint)
  {
    paramCollection = Lists.newArrayList(paramCollection);
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext()) {
      paramConstraint.checkElement(localIterator.next());
    }
    return paramCollection;
  }
  
  public static <E> Collection<E> constrainedCollection(Collection<E> paramCollection, Constraint<? super E> paramConstraint)
  {
    return new ConstrainedCollection(paramCollection, paramConstraint);
  }
  
  public static <E> List<E> constrainedList(List<E> paramList, Constraint<? super E> paramConstraint)
  {
    if ((paramList instanceof RandomAccess)) {
      return new ConstrainedRandomAccessList(paramList, paramConstraint);
    }
    return new ConstrainedList(paramList, paramConstraint);
  }
  
  private static <E> ListIterator<E> constrainedListIterator(ListIterator<E> paramListIterator, Constraint<? super E> paramConstraint)
  {
    return new ConstrainedListIterator(paramListIterator, paramConstraint);
  }
  
  public static <E> Set<E> constrainedSet(Set<E> paramSet, Constraint<? super E> paramConstraint)
  {
    return new ConstrainedSet(paramSet, paramConstraint);
  }
  
  public static <E> SortedSet<E> constrainedSortedSet(SortedSet<E> paramSortedSet, Constraint<? super E> paramConstraint)
  {
    return new ConstrainedSortedSet(paramSortedSet, paramConstraint);
  }
  
  static <E> Collection<E> constrainedTypePreservingCollection(Collection<E> paramCollection, Constraint<E> paramConstraint)
  {
    if ((paramCollection instanceof SortedSet)) {
      return constrainedSortedSet((SortedSet)paramCollection, paramConstraint);
    }
    if ((paramCollection instanceof Set)) {
      return constrainedSet((Set)paramCollection, paramConstraint);
    }
    if ((paramCollection instanceof List)) {
      return constrainedList((List)paramCollection, paramConstraint);
    }
    return constrainedCollection(paramCollection, paramConstraint);
  }
  
  static class ConstrainedCollection<E>
    extends ForwardingCollection<E>
  {
    private final Constraint<? super E> constraint;
    private final Collection<E> delegate;
    
    public ConstrainedCollection(Collection<E> paramCollection, Constraint<? super E> paramConstraint)
    {
      delegate = ((Collection)Preconditions.checkNotNull(paramCollection));
      constraint = ((Constraint)Preconditions.checkNotNull(paramConstraint));
    }
    
    public boolean add(E paramE)
    {
      constraint.checkElement(paramE);
      return delegate.add(paramE);
    }
    
    public boolean addAll(Collection<? extends E> paramCollection)
    {
      return delegate.addAll(Constraints.checkElements(paramCollection, constraint));
    }
    
    protected Collection<E> delegate()
    {
      return delegate;
    }
  }
  
  @GwtCompatible
  private static class ConstrainedList<E>
    extends ForwardingList<E>
  {
    final Constraint<? super E> constraint;
    final List<E> delegate;
    
    ConstrainedList(List<E> paramList, Constraint<? super E> paramConstraint)
    {
      delegate = ((List)Preconditions.checkNotNull(paramList));
      constraint = ((Constraint)Preconditions.checkNotNull(paramConstraint));
    }
    
    public void add(int paramInt, E paramE)
    {
      constraint.checkElement(paramE);
      delegate.add(paramInt, paramE);
    }
    
    public boolean add(E paramE)
    {
      constraint.checkElement(paramE);
      return delegate.add(paramE);
    }
    
    public boolean addAll(int paramInt, Collection<? extends E> paramCollection)
    {
      return delegate.addAll(paramInt, Constraints.checkElements(paramCollection, constraint));
    }
    
    public boolean addAll(Collection<? extends E> paramCollection)
    {
      return delegate.addAll(Constraints.checkElements(paramCollection, constraint));
    }
    
    protected List<E> delegate()
    {
      return delegate;
    }
    
    public ListIterator<E> listIterator()
    {
      return Constraints.constrainedListIterator(delegate.listIterator(), constraint);
    }
    
    public ListIterator<E> listIterator(int paramInt)
    {
      return Constraints.constrainedListIterator(delegate.listIterator(paramInt), constraint);
    }
    
    public E set(int paramInt, E paramE)
    {
      constraint.checkElement(paramE);
      return (E)delegate.set(paramInt, paramE);
    }
    
    public List<E> subList(int paramInt1, int paramInt2)
    {
      return Constraints.constrainedList(delegate.subList(paramInt1, paramInt2), constraint);
    }
  }
  
  static class ConstrainedListIterator<E>
    extends ForwardingListIterator<E>
  {
    private final Constraint<? super E> constraint;
    private final ListIterator<E> delegate;
    
    public ConstrainedListIterator(ListIterator<E> paramListIterator, Constraint<? super E> paramConstraint)
    {
      delegate = paramListIterator;
      constraint = paramConstraint;
    }
    
    public void add(E paramE)
    {
      constraint.checkElement(paramE);
      delegate.add(paramE);
    }
    
    protected ListIterator<E> delegate()
    {
      return delegate;
    }
    
    public void set(E paramE)
    {
      constraint.checkElement(paramE);
      delegate.set(paramE);
    }
  }
  
  static class ConstrainedRandomAccessList<E>
    extends Constraints.ConstrainedList<E>
    implements RandomAccess
  {
    ConstrainedRandomAccessList(List<E> paramList, Constraint<? super E> paramConstraint)
    {
      super(paramConstraint);
    }
  }
  
  static class ConstrainedSet<E>
    extends ForwardingSet<E>
  {
    private final Constraint<? super E> constraint;
    private final Set<E> delegate;
    
    public ConstrainedSet(Set<E> paramSet, Constraint<? super E> paramConstraint)
    {
      delegate = ((Set)Preconditions.checkNotNull(paramSet));
      constraint = ((Constraint)Preconditions.checkNotNull(paramConstraint));
    }
    
    public boolean add(E paramE)
    {
      constraint.checkElement(paramE);
      return delegate.add(paramE);
    }
    
    public boolean addAll(Collection<? extends E> paramCollection)
    {
      return delegate.addAll(Constraints.checkElements(paramCollection, constraint));
    }
    
    protected Set<E> delegate()
    {
      return delegate;
    }
  }
  
  private static class ConstrainedSortedSet<E>
    extends ForwardingSortedSet<E>
  {
    final Constraint<? super E> constraint;
    final SortedSet<E> delegate;
    
    ConstrainedSortedSet(SortedSet<E> paramSortedSet, Constraint<? super E> paramConstraint)
    {
      delegate = ((SortedSet)Preconditions.checkNotNull(paramSortedSet));
      constraint = ((Constraint)Preconditions.checkNotNull(paramConstraint));
    }
    
    public boolean add(E paramE)
    {
      constraint.checkElement(paramE);
      return delegate.add(paramE);
    }
    
    public boolean addAll(Collection<? extends E> paramCollection)
    {
      return delegate.addAll(Constraints.checkElements(paramCollection, constraint));
    }
    
    protected SortedSet<E> delegate()
    {
      return delegate;
    }
    
    public SortedSet<E> headSet(E paramE)
    {
      return Constraints.constrainedSortedSet(delegate.headSet(paramE), constraint);
    }
    
    public SortedSet<E> subSet(E paramE1, E paramE2)
    {
      return Constraints.constrainedSortedSet(delegate.subSet(paramE1, paramE2), constraint);
    }
    
    public SortedSet<E> tailSet(E paramE)
    {
      return Constraints.constrainedSortedSet(delegate.tailSet(paramE), constraint);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Constraints
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */