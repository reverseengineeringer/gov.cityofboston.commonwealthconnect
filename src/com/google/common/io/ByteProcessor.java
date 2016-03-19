package com.google.common.io;

import com.google.common.annotations.Beta;
import java.io.IOException;

@Beta
public abstract interface ByteProcessor<T>
{
  public abstract T getResult();
  
  public abstract boolean processBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException;
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteProcessor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */