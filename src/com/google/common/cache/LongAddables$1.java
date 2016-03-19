package com.google.common.cache;

import com.google.common.base.Supplier;

final class LongAddables$1
  implements Supplier<LongAddable>
{
  public LongAddable get()
  {
    return new LongAdder();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LongAddables.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */