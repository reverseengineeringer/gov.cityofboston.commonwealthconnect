package com.google.common.util.concurrent;

import com.google.common.base.Function;
import java.util.concurrent.atomic.AtomicLong;

class AtomicLongMap$1
  implements Function<AtomicLong, Long>
{
  AtomicLongMap$1(AtomicLongMap paramAtomicLongMap) {}
  
  public Long apply(AtomicLong paramAtomicLong)
  {
    return Long.valueOf(paramAtomicLong.get());
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AtomicLongMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */