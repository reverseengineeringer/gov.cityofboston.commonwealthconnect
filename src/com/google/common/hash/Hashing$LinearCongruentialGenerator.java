package com.google.common.hash;

final class Hashing$LinearCongruentialGenerator
{
  private long state;
  
  public Hashing$LinearCongruentialGenerator(long paramLong)
  {
    state = paramLong;
  }
  
  public double nextDouble()
  {
    state = (2862933555777941757L * state + 1L);
    return ((int)(state >>> 33) + 1) / 2.147483648E9D;
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Hashing.LinearCongruentialGenerator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */