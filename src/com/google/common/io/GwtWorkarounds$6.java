package com.google.common.io;

final class GwtWorkarounds$6
  implements GwtWorkarounds.CharOutput
{
  GwtWorkarounds$6(StringBuilder paramStringBuilder) {}
  
  public void close() {}
  
  public void flush() {}
  
  public String toString()
  {
    return val$builder.toString();
  }
  
  public void write(char paramChar)
  {
    val$builder.append(paramChar);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */