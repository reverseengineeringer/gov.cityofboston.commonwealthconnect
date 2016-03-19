package com.google.common.hash;

import java.util.zip.Adler32;
import java.util.zip.Checksum;

 enum Hashing$ChecksumType$2
{
  Hashing$ChecksumType$2(int paramInt1)
  {
    super(paramString, paramInt, paramInt1, null);
  }
  
  public Checksum get()
  {
    return new Adler32();
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Hashing.ChecksumType.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */