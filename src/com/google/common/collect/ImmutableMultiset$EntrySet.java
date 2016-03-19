package com.google.common.collect;

import java.util.Set;

final class ImmutableMultiset$EntrySet
  extends ImmutableSet<Multiset.Entry<E>>
{
  private static final long serialVersionUID = 0L;
  
  private ImmutableMultiset$EntrySet(ImmutableMultiset paramImmutableMultiset) {}
  
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
    while (this$0.count(((Multiset.Entry)paramObject).getElement()) != ((Multiset.Entry)paramObject).getCount()) {
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
        return this$0.getEntry(paramAnonymousInt);
      }
    };
  }
  
  public int hashCode()
  {
    return this$0.hashCode();
  }
  
  boolean isPartialView()
  {
    return this$0.isPartialView();
  }
  
  public UnmodifiableIterator<Multiset.Entry<E>> iterator()
  {
    return asList().iterator();
  }
  
  public int size()
  {
    return this$0.elementSet().size();
  }
  
  Object writeReplace()
  {
    return new ImmutableMultiset.EntrySetSerializedForm(this$0);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultiset.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */