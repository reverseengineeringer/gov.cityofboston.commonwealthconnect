package com.google.common.io;

import java.io.IOException;

class BaseEncoding$StandardBaseEncoding$1
  implements GwtWorkarounds.ByteOutput
{
  int bitBuffer = 0;
  int bitBufferLength = 0;
  int writtenChars = 0;
  
  BaseEncoding$StandardBaseEncoding$1(BaseEncoding.StandardBaseEncoding paramStandardBaseEncoding, GwtWorkarounds.CharOutput paramCharOutput) {}
  
  public void close()
    throws IOException
  {
    if (bitBufferLength > 0)
    {
      int i = bitBuffer;
      int j = access$000this$0).bitsPerChar;
      int k = bitBufferLength;
      int m = access$000this$0).mask;
      val$out.write(BaseEncoding.StandardBaseEncoding.access$000(this$0).encode(i << j - k & m));
      writtenChars += 1;
      if (BaseEncoding.StandardBaseEncoding.access$100(this$0) != null) {
        while (writtenChars % access$000this$0).charsPerChunk != 0)
        {
          val$out.write(BaseEncoding.StandardBaseEncoding.access$100(this$0).charValue());
          writtenChars += 1;
        }
      }
    }
    val$out.close();
  }
  
  public void flush()
    throws IOException
  {
    val$out.flush();
  }
  
  public void write(byte paramByte)
    throws IOException
  {
    bitBuffer <<= 8;
    bitBuffer |= paramByte & 0xFF;
    for (bitBufferLength += 8; bitBufferLength >= access$000this$0).bitsPerChar; bitBufferLength -= access$000this$0).bitsPerChar)
    {
      paramByte = bitBuffer;
      int i = bitBufferLength;
      int j = access$000this$0).bitsPerChar;
      int k = access$000this$0).mask;
      val$out.write(BaseEncoding.StandardBaseEncoding.access$000(this$0).encode(paramByte >> i - j & k));
      writtenChars += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding.StandardBaseEncoding.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */