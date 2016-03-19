package com.google.common.io;

import com.google.common.base.CharMatcher;
import java.io.IOException;

class BaseEncoding$StandardBaseEncoding$2
  implements GwtWorkarounds.ByteInput
{
  int bitBuffer = 0;
  int bitBufferLength = 0;
  boolean hitPadding = false;
  final CharMatcher paddingMatcher = this$0.padding();
  int readChars = 0;
  
  BaseEncoding$StandardBaseEncoding$2(BaseEncoding.StandardBaseEncoding paramStandardBaseEncoding, GwtWorkarounds.CharInput paramCharInput) {}
  
  public void close()
    throws IOException
  {
    val$reader.close();
  }
  
  public int read()
    throws IOException
  {
    int j = -1;
    do
    {
      char c;
      for (;;)
      {
        i = val$reader.read();
        if (i == -1)
        {
          i = j;
          if (hitPadding) {
            return i;
          }
          i = j;
          if (BaseEncoding.StandardBaseEncoding.access$000(this$0).isValidPaddingStartPosition(readChars)) {
            return i;
          }
          throw new BaseEncoding.DecodingException("Invalid input length " + readChars);
        }
        readChars += 1;
        c = (char)i;
        if (!paddingMatcher.matches(c)) {
          break;
        }
        if ((!hitPadding) && ((readChars == 1) || (!BaseEncoding.StandardBaseEncoding.access$000(this$0).isValidPaddingStartPosition(readChars - 1)))) {
          throw new BaseEncoding.DecodingException("Padding cannot start at index " + readChars);
        }
        hitPadding = true;
      }
      if (hitPadding) {
        throw new BaseEncoding.DecodingException("Expected padding character but found '" + c + "' at index " + readChars);
      }
      bitBuffer <<= access$000this$0).bitsPerChar;
      bitBuffer |= BaseEncoding.StandardBaseEncoding.access$000(this$0).decode(c);
      bitBufferLength += access$000this$0).bitsPerChar;
    } while (bitBufferLength < 8);
    bitBufferLength -= 8;
    int i = bitBuffer >> bitBufferLength & 0xFF;
    return i;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.BaseEncoding.StandardBaseEncoding.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */