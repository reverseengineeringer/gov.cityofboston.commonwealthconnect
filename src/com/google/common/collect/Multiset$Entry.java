package com.google.common.collect;

public abstract interface Multiset$Entry<E>
{
  public abstract boolean equals(Object paramObject);
  
  public abstract int getCount();
  
  public abstract E getElement();
  
  public abstract int hashCode();
  
  public abstract String toString();
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multiset.Entry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */