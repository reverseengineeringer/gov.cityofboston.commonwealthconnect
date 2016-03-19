package com.squareup.okhttp.internal.spdy;

final class Http20Draft12$FrameLogger
{
  private static final String[] BINARY;
  private static final String[] FLAGS;
  private static final String[] TYPES = { "DATA", "HEADERS", "PRIORITY", "RST_STREAM", "SETTINGS", "PUSH_PROMISE", "PING", "GOAWAY", "WINDOW_UPDATE", "CONTINUATION", "ALTSVC", "BLOCKED" };
  
  static
  {
    FLAGS = new String[64];
    BINARY = new String['Ā'];
    int i = 0;
    while (i < BINARY.length)
    {
      BINARY[i] = String.format("%8s", new Object[] { Integer.toBinaryString(i) }).replace(' ', '0');
      i += 1;
    }
    FLAGS[0] = "";
    FLAGS[1] = "END_STREAM";
    FLAGS[2] = "END_SEGMENT";
    FLAGS[3] = "END_STREAM|END_SEGMENT";
    int[] arrayOfInt1 = new int[3];
    int[] tmp171_169 = arrayOfInt1;
    tmp171_169[0] = 1;
    int[] tmp175_171 = tmp171_169;
    tmp175_171[1] = 2;
    int[] tmp179_175 = tmp175_171;
    tmp179_175[2] = 3;
    tmp179_175;
    FLAGS[8] = "PAD_LOW";
    FLAGS[24] = "PAD_LOW|PAD_HIGH";
    int[] arrayOfInt2 = new int[2];
    int[] tmp207_205 = arrayOfInt2;
    tmp207_205[0] = 8;
    int[] tmp212_207 = tmp207_205;
    tmp212_207[1] = 24;
    tmp212_207;
    int k = arrayOfInt1.length;
    i = 0;
    int n;
    int j;
    int i1;
    while (i < k)
    {
      m = arrayOfInt1[i];
      n = arrayOfInt2.length;
      j = 0;
      while (j < n)
      {
        i1 = arrayOfInt2[j];
        FLAGS[(m | i1)] = (FLAGS[m] + '|' + FLAGS[i1]);
        j += 1;
      }
      i += 1;
    }
    FLAGS[4] = "END_HEADERS";
    FLAGS[32] = "PRIORITY";
    FLAGS[36] = "END_HEADERS|PRIORITY";
    int[] arrayOfInt3 = new int[3];
    int[] tmp337_335 = arrayOfInt3;
    tmp337_335[0] = 4;
    int[] tmp341_337 = tmp337_335;
    tmp341_337[1] = 32;
    int[] tmp346_341 = tmp341_337;
    tmp346_341[2] = 36;
    tmp346_341;
    int m = arrayOfInt3.length;
    i = 0;
    while (i < m)
    {
      n = arrayOfInt3[i];
      i1 = arrayOfInt1.length;
      j = 0;
      while (j < i1)
      {
        int i2 = arrayOfInt1[j];
        FLAGS[(i2 | n)] = (FLAGS[i2] + '|' + FLAGS[n]);
        int i3 = arrayOfInt2.length;
        k = 0;
        while (k < i3)
        {
          int i4 = arrayOfInt2[k];
          FLAGS[(i2 | n | i4)] = (FLAGS[i2] + '|' + FLAGS[n] + '|' + FLAGS[i4]);
          k += 1;
        }
        j += 1;
      }
      i += 1;
    }
    i = 0;
    while (i < FLAGS.length)
    {
      if (FLAGS[i] == null) {
        FLAGS[i] = BINARY[i];
      }
      i += 1;
    }
  }
  
  static String formatFlags(byte paramByte1, byte paramByte2)
  {
    if (paramByte2 == 0) {
      return "";
    }
    switch (paramByte1)
    {
    case 5: 
    case 9: 
    default: 
      if (paramByte2 >= FLAGS.length) {
        break;
      }
    }
    for (String str = FLAGS[paramByte2]; (paramByte1 == 5) && ((paramByte2 & 0x4) != 0); str = BINARY[paramByte2])
    {
      return str.replace("HEADERS", "PUSH_PROMISE");
      if (paramByte2 == 1) {
        return "ACK";
      }
      return BINARY[paramByte2];
      return BINARY[paramByte2];
    }
    if ((paramByte1 == 0) && ((paramByte2 & 0x20) != 0)) {
      return str.replace("PRIORITY", "COMPRESSED");
    }
    return str;
  }
  
  static String formatHeader(boolean paramBoolean, int paramInt1, int paramInt2, byte paramByte1, byte paramByte2)
  {
    String str1;
    String str3;
    if (paramByte1 < TYPES.length)
    {
      str1 = TYPES[paramByte1];
      str3 = formatFlags(paramByte1, paramByte2);
      if (!paramBoolean) {
        break label91;
      }
    }
    label91:
    for (String str2 = "<<";; str2 = ">>")
    {
      return String.format("%s 0x%08x %5d %-13s %s", new Object[] { str2, Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), str1, str3 });
      str1 = String.format("0x%02x", new Object[] { Byte.valueOf(paramByte1) });
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.Http20Draft12.FrameLogger
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */