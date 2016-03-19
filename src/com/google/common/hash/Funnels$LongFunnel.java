package com.google.common.hash;

 enum Funnels$LongFunnel
  implements Funnel<Long>
{
  INSTANCE;
  
  private Funnels$LongFunnel() {}
  
  public void funnel(Long paramLong, PrimitiveSink paramPrimitiveSink)
  {
    paramPrimitiveSink.putLong(paramLong.longValue());
  }
  
  public String toString()
  {
    return "Funnels.longFunnel()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.LongFunnel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */