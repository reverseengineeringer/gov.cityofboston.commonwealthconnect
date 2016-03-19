package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.OutputStream;

class Funnels$SinkAsStream
  extends OutputStream
{
  final PrimitiveSink sink;
  
  Funnels$SinkAsStream(PrimitiveSink paramPrimitiveSink)
  {
    sink = ((PrimitiveSink)Preconditions.checkNotNull(paramPrimitiveSink));
  }
  
  public String toString()
  {
    return "Funnels.asOutputStream(" + sink + ")";
  }
  
  public void write(int paramInt)
  {
    sink.putByte((byte)paramInt);
  }
  
  public void write(byte[] paramArrayOfByte)
  {
    sink.putBytes(paramArrayOfByte);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    sink.putBytes(paramArrayOfByte, paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.SinkAsStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */