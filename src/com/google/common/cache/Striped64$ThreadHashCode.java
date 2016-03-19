package com.google.common.cache;

final class Striped64$ThreadHashCode
  extends ThreadLocal<Striped64.HashCode>
{
  public Striped64.HashCode initialValue()
  {
    return new Striped64.HashCode();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.Striped64.ThreadHashCode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */