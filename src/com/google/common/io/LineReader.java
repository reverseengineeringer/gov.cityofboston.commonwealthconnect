package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.Reader;
import java.nio.CharBuffer;
import java.util.LinkedList;
import java.util.Queue;

@Beta
public final class LineReader
{
  private final char[] buf = new char['က'];
  private final CharBuffer cbuf = CharBuffer.wrap(buf);
  private final LineBuffer lineBuf = new LineBuffer()
  {
    protected void handleLine(String paramAnonymousString1, String paramAnonymousString2)
    {
      lines.add(paramAnonymousString1);
    }
  };
  private final Queue<String> lines = new LinkedList();
  private final Readable readable;
  private final Reader reader;
  
  public LineReader(Readable paramReadable)
  {
    readable = ((Readable)Preconditions.checkNotNull(paramReadable));
    if ((paramReadable instanceof Reader)) {}
    for (paramReadable = (Reader)paramReadable;; paramReadable = null)
    {
      reader = paramReadable;
      return;
    }
  }
  
  public String readLine()
    throws IOException
  {
    for (;;)
    {
      if (lines.peek() == null)
      {
        cbuf.clear();
        if (reader == null) {
          break label70;
        }
      }
      label70:
      for (int i = reader.read(buf, 0, buf.length); i == -1; i = readable.read(cbuf))
      {
        lineBuf.finish();
        return (String)lines.poll();
      }
      lineBuf.add(buf, 0, i);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.LineReader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */