package com.google.common.collect;

import com.google.common.annotations.Beta;

@Beta
public class ForwardingMultiset$StandardElementSet
  extends Multisets.ElementSet<E>
{
  public ForwardingMultiset$StandardElementSet(ForwardingMultiset paramForwardingMultiset) {}
  
  Multiset<E> multiset()
  {
    return this$0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ForwardingMultiset.StandardElementSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */