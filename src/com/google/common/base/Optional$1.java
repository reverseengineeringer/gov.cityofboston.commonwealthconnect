package com.google.common.base;

import java.util.Iterator;

final class Optional$1
  implements Iterable<T>
{
  Optional$1(Iterable paramIterable) {}
  
  public Iterator<T> iterator()
  {
    new AbstractIterator()
    {
      private final Iterator<? extends Optional<? extends T>> iterator = (Iterator)Preconditions.checkNotNull(val$optionals.iterator());
      
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
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Optional.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */