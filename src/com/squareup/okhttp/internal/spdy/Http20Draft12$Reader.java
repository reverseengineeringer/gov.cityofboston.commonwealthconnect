package com.squareup.okhttp.internal.spdy;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import okio.BufferedSource;
import okio.ByteString;

final class Http20Draft12$Reader
  implements FrameReader
{
  private final boolean client;
  private final Http20Draft12.ContinuationSource continuation;
  final HpackDraft07.Reader hpackReader;
  private final BufferedSource source;
  
  Http20Draft12$Reader(BufferedSource paramBufferedSource, int paramInt, boolean paramBoolean)
  {
    source = paramBufferedSource;
    client = paramBoolean;
    continuation = new Http20Draft12.ContinuationSource(source);
    hpackReader = new HpackDraft07.Reader(paramInt, continuation);
  }
  
  private void readAlternateService(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    long l = source.readInt();
    paramByte = source.readShort();
    source.readByte();
    int i = source.readByte() & 0xFF;
    ByteString localByteString = source.readByteString(i);
    int j = source.readByte() & 0xFF;
    String str = source.readUtf8(j);
    paramHandler.alternateService(paramInt, source.readUtf8(paramShort - 9 - i - j), localByteString, str, paramByte & 0xFFFF, l & 0xFFFFFFFF);
  }
  
  private void readData(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    int i = 1;
    boolean bool;
    if ((paramByte & 0x1) != 0)
    {
      bool = true;
      if ((paramByte & 0x20) == 0) {
        break label40;
      }
    }
    for (;;)
    {
      if (i == 0) {
        break label46;
      }
      throw Http20Draft12.access$200("PROTOCOL_ERROR: FLAG_COMPRESSED without SETTINGS_COMPRESS_DATA", new Object[0]);
      bool = false;
      break;
      label40:
      i = 0;
    }
    label46:
    short s = Http20Draft12.access$300(source, paramByte);
    i = Http20Draft12.access$400(paramShort, paramByte, s);
    paramHandler.data(bool, paramInt, source, i);
    source.skip(s);
  }
  
  private void readGoAway(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    if (paramShort < 8) {
      throw Http20Draft12.access$200("TYPE_GOAWAY length < 8: %s", new Object[] { Short.valueOf(paramShort) });
    }
    if (paramInt != 0) {
      throw Http20Draft12.access$200("TYPE_GOAWAY streamId != 0", new Object[0]);
    }
    paramByte = source.readInt();
    paramInt = source.readInt();
    int i = paramShort - 8;
    ErrorCode localErrorCode = ErrorCode.fromHttp2(paramInt);
    if (localErrorCode == null) {
      throw Http20Draft12.access$200("TYPE_GOAWAY unexpected error code: %d", new Object[] { Integer.valueOf(paramInt) });
    }
    ByteString localByteString = ByteString.EMPTY;
    if (i > 0) {
      localByteString = source.readByteString(i);
    }
    paramHandler.goAway(paramByte, localErrorCode, localByteString);
  }
  
  private List<Header> readHeaderBlock(short paramShort1, short paramShort2, byte paramByte, int paramInt)
    throws IOException
  {
    Http20Draft12.ContinuationSource localContinuationSource = continuation;
    continuation.left = paramShort1;
    length = paramShort1;
    continuation.padding = paramShort2;
    continuation.flags = paramByte;
    continuation.streamId = paramInt;
    hpackReader.readHeaders();
    hpackReader.emitReferenceSet();
    return hpackReader.getAndReset();
  }
  
  private void readHeaders(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    if (paramInt == 0) {
      throw Http20Draft12.access$200("PROTOCOL_ERROR: TYPE_HEADERS streamId == 0", new Object[0]);
    }
    if ((paramByte & 0x1) != 0) {}
    for (boolean bool = true;; bool = false)
    {
      short s2 = Http20Draft12.access$300(source, paramByte);
      short s1 = paramShort;
      if ((paramByte & 0x20) != 0)
      {
        readPriority(paramHandler, paramInt);
        s1 = (short)(paramShort - 5);
      }
      paramHandler.headers(false, bool, paramInt, -1, readHeaderBlock(Http20Draft12.access$400(s1, paramByte, s2), s2, paramByte, paramInt), HeadersMode.HTTP_20_HEADERS);
      return;
    }
  }
  
  private void readPing(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    boolean bool = true;
    if (paramShort != 8) {
      throw Http20Draft12.access$200("TYPE_PING length != 8: %s", new Object[] { Short.valueOf(paramShort) });
    }
    if (paramInt != 0) {
      throw Http20Draft12.access$200("TYPE_PING streamId != 0", new Object[0]);
    }
    paramInt = source.readInt();
    int i = source.readInt();
    if ((paramByte & 0x1) != 0) {}
    for (;;)
    {
      paramHandler.ping(bool, paramInt, i);
      return;
      bool = false;
    }
  }
  
  private void readPriority(FrameReader.Handler paramHandler, int paramInt)
    throws IOException
  {
    int i = source.readInt();
    if ((0x80000000 & i) != 0) {}
    for (boolean bool = true;; bool = false)
    {
      paramHandler.priority(paramInt, i & 0x7FFFFFFF, (source.readByte() & 0xFF) + 1, bool);
      return;
    }
  }
  
  private void readPriority(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    if (paramShort != 5) {
      throw Http20Draft12.access$200("TYPE_PRIORITY length: %d != 5", new Object[] { Short.valueOf(paramShort) });
    }
    if (paramInt == 0) {
      throw Http20Draft12.access$200("TYPE_PRIORITY streamId == 0", new Object[0]);
    }
    readPriority(paramHandler, paramInt);
  }
  
  private void readPushPromise(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    if (paramInt == 0) {
      throw Http20Draft12.access$200("PROTOCOL_ERROR: TYPE_PUSH_PROMISE streamId == 0", new Object[0]);
    }
    short s = Http20Draft12.access$300(source, paramByte);
    paramHandler.pushPromise(paramInt, source.readInt() & 0x7FFFFFFF, readHeaderBlock((short)(paramShort - 4), s, paramByte, paramInt));
  }
  
  private void readRstStream(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    if (paramShort != 4) {
      throw Http20Draft12.access$200("TYPE_RST_STREAM length: %d != 4", new Object[] { Short.valueOf(paramShort) });
    }
    if (paramInt == 0) {
      throw Http20Draft12.access$200("TYPE_RST_STREAM streamId == 0", new Object[0]);
    }
    paramByte = source.readInt();
    ErrorCode localErrorCode = ErrorCode.fromHttp2(paramByte);
    if (localErrorCode == null) {
      throw Http20Draft12.access$200("TYPE_RST_STREAM unexpected error code: %d", new Object[] { Integer.valueOf(paramByte) });
    }
    paramHandler.rstStream(paramInt, localErrorCode);
  }
  
  private void readSettings(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    if (paramInt != 0) {
      throw Http20Draft12.access$200("TYPE_SETTINGS streamId != 0", new Object[0]);
    }
    if ((paramByte & 0x1) != 0)
    {
      if (paramShort != 0) {
        throw Http20Draft12.access$200("FRAME_SIZE_ERROR ack frame should be empty!", new Object[0]);
      }
      paramHandler.ackSettings();
    }
    Settings localSettings;
    do
    {
      return;
      if (paramShort % 5 != 0) {
        throw Http20Draft12.access$200("TYPE_SETTINGS length %% 5 != 0: %s", new Object[] { Short.valueOf(paramShort) });
      }
      localSettings = new Settings();
      paramInt = 0;
      if (paramInt < paramShort)
      {
        byte b = source.readByte();
        int i = source.readInt();
        paramByte = b;
        switch (b)
        {
        default: 
          throw Http20Draft12.access$200("PROTOCOL_ERROR invalid settings id: %s", new Object[] { Integer.valueOf(b) });
        case 2: 
          paramByte = b;
          if (i != 0)
          {
            paramByte = b;
            if (i != 1) {
              throw Http20Draft12.access$200("PROTOCOL_ERROR SETTINGS_ENABLE_PUSH != 0 or 1", new Object[0]);
            }
          }
          break;
        case 3: 
          paramByte = 4;
        }
        do
        {
          localSettings.set(paramByte, 0, i);
          paramInt += 5;
          break;
          paramByte = 7;
        } while (i >= 0);
        throw Http20Draft12.access$200("PROTOCOL_ERROR SETTINGS_INITIAL_WINDOW_SIZE > 2^31 - 1", new Object[0]);
      }
      paramHandler.settings(false, localSettings);
    } while (localSettings.getHeaderTableSize() < 0);
    hpackReader.maxHeaderTableByteCountSetting(localSettings.getHeaderTableSize());
  }
  
  private void readWindowUpdate(FrameReader.Handler paramHandler, short paramShort, byte paramByte, int paramInt)
    throws IOException
  {
    if (paramShort != 4) {
      throw Http20Draft12.access$200("TYPE_WINDOW_UPDATE length !=4: %s", new Object[] { Short.valueOf(paramShort) });
    }
    long l = source.readInt() & 0x7FFFFFFF;
    if (l == 0L) {
      throw Http20Draft12.access$200("windowSizeIncrement was 0", new Object[] { Long.valueOf(l) });
    }
    paramHandler.windowUpdate(paramInt, l);
  }
  
  public void close()
    throws IOException
  {
    source.close();
  }
  
  public boolean nextFrame(FrameReader.Handler paramHandler)
    throws IOException
  {
    boolean bool = true;
    short s;
    do
    {
      int i;
      byte b2;
      try
      {
        i = source.readInt();
        int j = source.readInt();
        s = (short)((0x3FFF0000 & i) >> 16);
        byte b1 = (byte)((0xFF00 & i) >> 8);
        b2 = (byte)(i & 0xFF);
        i = j & 0x7FFFFFFF;
        if (Http20Draft12.access$100().isLoggable(Level.FINE)) {
          Http20Draft12.access$100().fine(Http20Draft12.FrameLogger.formatHeader(true, i, s, b1, b2));
        }
        switch (b1)
        {
        case 9: 
        default: 
          throw Http20Draft12.access$200("PROTOCOL_ERROR: unknown frame type %s", new Object[] { Byte.valueOf(b1) });
        }
      }
      catch (IOException paramHandler)
      {
        bool = false;
        return bool;
      }
      readData(paramHandler, s, b2, i);
      return true;
      readHeaders(paramHandler, s, b2, i);
      return true;
      readPriority(paramHandler, s, b2, i);
      return true;
      readRstStream(paramHandler, s, b2, i);
      return true;
      readSettings(paramHandler, s, b2, i);
      return true;
      readPushPromise(paramHandler, s, b2, i);
      return true;
      readPing(paramHandler, s, b2, i);
      return true;
      readGoAway(paramHandler, s, b2, i);
      return true;
      readWindowUpdate(paramHandler, s, b2, i);
      return true;
      readAlternateService(paramHandler, s, b2, i);
      return true;
    } while (s == 0);
    throw Http20Draft12.access$200("TYPE_BLOCKED length != 0: %s", new Object[] { Short.valueOf(s) });
  }
  
  public void readConnectionPreface()
    throws IOException
  {
    if (client) {}
    ByteString localByteString;
    do
    {
      return;
      localByteString = source.readByteString(Http20Draft12.access$000().size());
      if (Http20Draft12.access$100().isLoggable(Level.FINE)) {
        Http20Draft12.access$100().fine(String.format("<< CONNECTION %s", new Object[] { localByteString.hex() }));
      }
    } while (Http20Draft12.access$000().equals(localByteString));
    throw Http20Draft12.access$200("Expected a connection header but was %s", new Object[] { localByteString.utf8() });
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.Http20Draft12.Reader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */