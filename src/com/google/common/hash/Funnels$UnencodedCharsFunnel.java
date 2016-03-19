package com.google.common.hash;

 enum Funnels$UnencodedCharsFunnel
  implements Funnel<CharSequence>
{
  INSTANCE;
  
  private Funnels$UnencodedCharsFunnel() {}
  
  public void funnel(CharSequence paramCharSequence, PrimitiveSink paramPrimitiveSink)
  {
    paramPrimitiveSink.putUnencodedChars(paramCharSequence);
  }
  
  public String toString()
  {
    return "Funnels.unencodedCharsFunnel()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Funnels.UnencodedCharsFunnel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */