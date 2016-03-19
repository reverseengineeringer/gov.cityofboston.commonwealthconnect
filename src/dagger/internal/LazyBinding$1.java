package dagger.internal;

import dagger.Lazy;

class LazyBinding$1
  implements Lazy<T>
{
  private volatile Object cacheValue = LazyBinding.access$000();
  
  LazyBinding$1(LazyBinding paramLazyBinding) {}
  
  public T get()
  {
    if (cacheValue == LazyBinding.access$000()) {}
    try
    {
      if (cacheValue == LazyBinding.access$000()) {
        cacheValue = LazyBinding.access$100(this$0).get();
      }
      return (T)cacheValue;
    }
    finally {}
  }
}

/* Location:
 * Qualified Name:     dagger.internal.LazyBinding.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */