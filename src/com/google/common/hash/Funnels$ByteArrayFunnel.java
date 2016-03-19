package com.google.common.hash;

 enum Funnels$ByteArrayFunnel
  implements Funnel<byte[]>
{
  INSTANCE;
  
  private Funnels$ByteArrayFunnel() {}
  
  public void funnel(byte[] paramArrayOfByte, PrimitiveSink paramPrimitiveSink)
  {
    paramPrimitiveSink.putBytes(paramArrayOfByte);
  }
  
  public String toString()
  {
    return "Funnels.byteArrayFunnel()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.ByteArrayFunnel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */