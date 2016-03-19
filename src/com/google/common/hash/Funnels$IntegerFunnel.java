package com.google.common.hash;

 enum Funnels$IntegerFunnel
  implements Funnel<Integer>
{
  INSTANCE;
  
  private Funnels$IntegerFunnel() {}
  
  public void funnel(Integer paramInteger, PrimitiveSink paramPrimitiveSink)
  {
    paramPrimitiveSink.putInt(paramInteger.intValue());
  }
  
  public String toString()
  {
    return "Funnels.integerFunnel()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.IntegerFunnel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */