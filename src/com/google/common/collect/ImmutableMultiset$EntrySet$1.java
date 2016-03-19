package com.google.common.collect;

class ImmutableMultiset$EntrySet$1
  extends ImmutableAsList<Multiset.Entry<E>>
{
  ImmutableMultiset$EntrySet$1(ImmutableMultiset.EntrySet paramEntrySet) {}
  
  ImmutableCollection<Multiset.Entry<E>> delegateCollection()
  {
    return this$1;
  }
  
  public Multiset.Entry<E> get(int paramInt)
  {
    return this$1.this$0.getEntry(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultiset.EntrySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */