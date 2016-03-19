package com.google.common.io;

import com.google.common.annotations.Beta;
import java.io.IOException;

@Beta
public abstract interface LineProcessor<T>
{
  public abstract T getResult();
  
  public abstract boolean processLine(String paramString)
    throws IOException;
}

/* Location:
 * Qualified Name:     com.google.common.io.LineProcessor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */