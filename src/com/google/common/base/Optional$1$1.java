package com.google.common.base;

import java.util.Iterator;

class Optional$1$1
  extends AbstractIterator<T>
{
  private final Iterator<? extends Optional<? extends T>> iterator = (Iterator)Preconditions.checkNotNull(this$0.val$optionals.iterator());
  
  Optional$1$1(Optional.1 param1) {}
  
  protected T computeNext()
  {
    while (iterator.hasNext())
    {
      Optional localOptional = (Optional)iterator.next();
      if (localOptional.isPresent()) {
        return (T)localOptional.get();
      }
    }
    return (T)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Optional.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */