package com.google.common.collect;

import com.google.common.base.Function;
import java.util.ListIterator;

class Lists$TransformingSequentialList$1
  extends TransformedListIterator<F, T>
{
  Lists$TransformingSequentialList$1(Lists.TransformingSequentialList paramTransformingSequentialList, ListIterator paramListIterator)
  {
    super(paramListIterator);
  }
  
  T transform(F paramF)
  {
    return (T)this$0.function.apply(paramF);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.TransformingSequentialList.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */