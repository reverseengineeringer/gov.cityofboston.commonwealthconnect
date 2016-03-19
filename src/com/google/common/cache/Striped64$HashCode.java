package com.google.common.cache;

import java.util.Random;

final class Striped64$HashCode
{
  static final Random rng = new Random();
  int code;
  
  Striped64$HashCode()
  {
    int j = rng.nextInt();
    int i = j;
    if (j == 0) {
      i = 1;
    }
    code = i;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.Striped64.HashCode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */