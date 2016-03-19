package com.google.common.io;

import java.util.Queue;

class LineReader$1
  extends LineBuffer
{
  LineReader$1(LineReader paramLineReader) {}
  
  protected void handleLine(String paramString1, String paramString2)
  {
    LineReader.access$000(this$0).add(paramString1);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.LineReader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */