package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.internal.BitArray;
import com.squareup.okhttp.internal.BitArray.FixedCapacity;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;
import okio.Source;

final class HpackDraft07
{
  private static final Map<ByteString, Integer> NAME_TO_FIRST_INDEX = nameToFirstIndex();
  private static final int PREFIX_4_BITS = 15;
  private static final int PREFIX_6_BITS = 63;
  private static final int PREFIX_7_BITS = 127;
  private static final Header[] STATIC_HEADER_TABLE = { new Header(Header.TARGET_AUTHORITY, ""), new Header(Header.TARGET_METHOD, "GET"), new Header(Header.TARGET_METHOD, "POST"), new Header(Header.TARGET_PATH, "/"), new Header(Header.TARGET_PATH, "/index.html"), new Header(Header.TARGET_SCHEME, "http"), new Header(Header.TARGET_SCHEME, "https"), new Header(Header.RESPONSE_STATUS, "200"), new Header(Header.RESPONSE_STATUS, "204"), new Header(Header.RESPONSE_STATUS, "206"), new Header(Header.RESPONSE_STATUS, "304"), new Header(Header.RESPONSE_STATUS, "400"), new Header(Header.RESPONSE_STATUS, "404"), new Header(Header.RESPONSE_STATUS, "500"), new Header("accept-charset", ""), new Header("accept-encoding", ""), new Header("accept-language", ""), new Header("accept-ranges", ""), new Header("accept", ""), new Header("access-control-allow-origin", ""), new Header("age", ""), new Header("allow", ""), new Header("authorization", ""), new Header("cache-control", ""), new Header("content-disposition", ""), new Header("content-encoding", ""), new Header("content-language", ""), new Header("content-length", ""), new Header("content-location", ""), new Header("content-range", ""), new Header("content-type", ""), new Header("cookie", ""), new Header("date", ""), new Header("etag", ""), new Header("expect", ""), new Header("expires", ""), new Header("from", ""), new Header("host", ""), new Header("if-match", ""), new Header("if-modified-since", ""), new Header("if-none-match", ""), new Header("if-range", ""), new Header("if-unmodified-since", ""), new Header("last-modified", ""), new Header("link", ""), new Header("location", ""), new Header("max-forwards", ""), new Header("proxy-authenticate", ""), new Header("proxy-authorization", ""), new Header("range", ""), new Header("referer", ""), new Header("refresh", ""), new Header("retry-after", ""), new Header("server", ""), new Header("set-cookie", ""), new Header("strict-transport-security", ""), new Header("transfer-encoding", ""), new Header("user-agent", ""), new Header("vary", ""), new Header("via", ""), new Header("www-authenticate", "") };
  
  private static ByteString checkLowercase(ByteString paramByteString)
    throws IOException
  {
    int i = 0;
    int j = paramByteString.size();
    while (i < j)
    {
      int k = paramByteString.getByte(i);
      if ((k >= 65) && (k <= 90)) {
        throw new IOException("PROTOCOL_ERROR response malformed: mixed case name: " + paramByteString.utf8());
      }
      i += 1;
    }
    return paramByteString;
  }
  
  private static Map<ByteString, Integer> nameToFirstIndex()
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap(STATIC_HEADER_TABLE.length);
    int i = 0;
    while (i < STATIC_HEADER_TABLE.length)
    {
      if (!localLinkedHashMap.containsKey(STATIC_HEADER_TABLEname)) {
        localLinkedHashMap.put(STATIC_HEADER_TABLEname, Integer.valueOf(i));
      }
      i += 1;
    }
    return Collections.unmodifiableMap(localLinkedHashMap);
  }
  
  static final class Reader
  {
    private final List<Header> emittedHeaders = new ArrayList();
    BitArray emittedReferencedHeaders = new BitArray.FixedCapacity();
    int headerCount = 0;
    Header[] headerTable = new Header[8];
    int headerTableByteCount = 0;
    private int maxHeaderTableByteCount;
    private int maxHeaderTableByteCountSetting;
    int nextHeaderIndex = headerTable.length - 1;
    BitArray referencedHeaders = new BitArray.FixedCapacity();
    private final BufferedSource source;
    
    Reader(int paramInt, Source paramSource)
    {
      maxHeaderTableByteCountSetting = paramInt;
      maxHeaderTableByteCount = paramInt;
      source = Okio.buffer(paramSource);
    }
    
    private void adjustHeaderTableByteCount()
    {
      if (maxHeaderTableByteCount < headerTableByteCount)
      {
        if (maxHeaderTableByteCount == 0) {
          clearHeaderTable();
        }
      }
      else {
        return;
      }
      evictToRecoverBytes(headerTableByteCount - maxHeaderTableByteCount);
    }
    
    private void clearHeaderTable()
    {
      clearReferenceSet();
      Arrays.fill(headerTable, null);
      nextHeaderIndex = (headerTable.length - 1);
      headerCount = 0;
      headerTableByteCount = 0;
    }
    
    private void clearReferenceSet()
    {
      referencedHeaders.clear();
      emittedReferencedHeaders.clear();
    }
    
    private int evictToRecoverBytes(int paramInt)
    {
      int i = 0;
      int k = 0;
      if (paramInt > 0)
      {
        i = headerTable.length - 1;
        int j = paramInt;
        paramInt = k;
        while ((i >= nextHeaderIndex) && (j > 0))
        {
          j -= headerTable[i].hpackSize;
          headerTableByteCount -= headerTable[i].hpackSize;
          headerCount -= 1;
          paramInt += 1;
          i -= 1;
        }
        referencedHeaders.shiftLeft(paramInt);
        emittedReferencedHeaders.shiftLeft(paramInt);
        System.arraycopy(headerTable, nextHeaderIndex + 1, headerTable, nextHeaderIndex + 1 + paramInt, headerCount);
        nextHeaderIndex += paramInt;
        i = paramInt;
      }
      return i;
    }
    
    private ByteString getName(int paramInt)
    {
      if (isStaticHeader(paramInt)) {
        return STATIC_HEADER_TABLEheaderCount)].name;
      }
      return headerTable[headerTableIndex(paramInt)].name;
    }
    
    private int headerTableIndex(int paramInt)
    {
      return nextHeaderIndex + 1 + paramInt;
    }
    
    private void insertIntoHeaderTable(int paramInt, Header paramHeader)
    {
      int j = hpackSize;
      int i = j;
      if (paramInt != -1) {
        i = j - headerTable[headerTableIndex(paramInt)].hpackSize;
      }
      if (i > maxHeaderTableByteCount)
      {
        clearHeaderTable();
        emittedHeaders.add(paramHeader);
        return;
      }
      j = evictToRecoverBytes(headerTableByteCount + i - maxHeaderTableByteCount);
      if (paramInt == -1)
      {
        if (headerCount + 1 > headerTable.length)
        {
          Header[] arrayOfHeader = new Header[headerTable.length * 2];
          System.arraycopy(headerTable, 0, arrayOfHeader, headerTable.length, headerTable.length);
          if (arrayOfHeader.length == 64)
          {
            referencedHeaders = ((BitArray.FixedCapacity)referencedHeaders).toVariableCapacity();
            emittedReferencedHeaders = ((BitArray.FixedCapacity)emittedReferencedHeaders).toVariableCapacity();
          }
          referencedHeaders.shiftLeft(headerTable.length);
          emittedReferencedHeaders.shiftLeft(headerTable.length);
          nextHeaderIndex = (headerTable.length - 1);
          headerTable = arrayOfHeader;
        }
        paramInt = nextHeaderIndex;
        nextHeaderIndex = (paramInt - 1);
        referencedHeaders.set(paramInt);
        headerTable[paramInt] = paramHeader;
        headerCount += 1;
      }
      for (;;)
      {
        headerTableByteCount += i;
        return;
        paramInt += headerTableIndex(paramInt) + j;
        referencedHeaders.set(paramInt);
        headerTable[paramInt] = paramHeader;
      }
    }
    
    private boolean isStaticHeader(int paramInt)
    {
      return paramInt >= headerCount;
    }
    
    private int readByte()
      throws IOException
    {
      return source.readByte() & 0xFF;
    }
    
    private void readIndexedHeader(int paramInt)
      throws IOException
    {
      if (isStaticHeader(paramInt))
      {
        paramInt -= headerCount;
        if (paramInt > HpackDraft07.STATIC_HEADER_TABLE.length - 1) {
          throw new IOException("Header index too large " + (paramInt + 1));
        }
        Header localHeader = HpackDraft07.STATIC_HEADER_TABLE[paramInt];
        if (maxHeaderTableByteCount == 0)
        {
          emittedHeaders.add(localHeader);
          return;
        }
        insertIntoHeaderTable(-1, localHeader);
        return;
      }
      paramInt = headerTableIndex(paramInt);
      if (!referencedHeaders.get(paramInt))
      {
        emittedHeaders.add(headerTable[paramInt]);
        emittedReferencedHeaders.set(paramInt);
      }
      referencedHeaders.toggle(paramInt);
    }
    
    private void readLiteralHeaderWithIncrementalIndexingIndexedName(int paramInt)
      throws IOException
    {
      insertIntoHeaderTable(-1, new Header(getName(paramInt), readByteString()));
    }
    
    private void readLiteralHeaderWithIncrementalIndexingNewName()
      throws IOException
    {
      insertIntoHeaderTable(-1, new Header(HpackDraft07.checkLowercase(readByteString()), readByteString()));
    }
    
    private void readLiteralHeaderWithoutIndexingIndexedName(int paramInt)
      throws IOException
    {
      ByteString localByteString1 = getName(paramInt);
      ByteString localByteString2 = readByteString();
      emittedHeaders.add(new Header(localByteString1, localByteString2));
    }
    
    private void readLiteralHeaderWithoutIndexingNewName()
      throws IOException
    {
      ByteString localByteString1 = HpackDraft07.checkLowercase(readByteString());
      ByteString localByteString2 = readByteString();
      emittedHeaders.add(new Header(localByteString1, localByteString2));
    }
    
    void emitReferenceSet()
    {
      int i = headerTable.length - 1;
      while (i != nextHeaderIndex)
      {
        if ((referencedHeaders.get(i)) && (!emittedReferencedHeaders.get(i))) {
          emittedHeaders.add(headerTable[i]);
        }
        i -= 1;
      }
    }
    
    List<Header> getAndReset()
    {
      ArrayList localArrayList = new ArrayList(emittedHeaders);
      emittedHeaders.clear();
      emittedReferencedHeaders.clear();
      return localArrayList;
    }
    
    int maxHeaderTableByteCount()
    {
      return maxHeaderTableByteCount;
    }
    
    void maxHeaderTableByteCountSetting(int paramInt)
    {
      maxHeaderTableByteCountSetting = paramInt;
      maxHeaderTableByteCount = maxHeaderTableByteCountSetting;
      adjustHeaderTableByteCount();
    }
    
    ByteString readByteString()
      throws IOException
    {
      int j = readByte();
      if ((j & 0x80) == 128) {}
      for (int i = 1;; i = 0)
      {
        j = readInt(j, 127);
        if (i == 0) {
          break;
        }
        return ByteString.of(Huffman.get().decode(source.readByteArray(j)));
      }
      return source.readByteString(j);
    }
    
    void readHeaders()
      throws IOException
    {
      while (!source.exhausted())
      {
        int i = source.readByte() & 0xFF;
        if (i == 128) {
          throw new IOException("index == 0");
        }
        if ((i & 0x80) == 128) {
          readIndexedHeader(readInt(i, 127) - 1);
        } else if (i == 64) {
          readLiteralHeaderWithIncrementalIndexingNewName();
        } else if ((i & 0x40) == 64) {
          readLiteralHeaderWithIncrementalIndexingIndexedName(readInt(i, 63) - 1);
        } else if ((i & 0x20) == 32)
        {
          if ((i & 0x10) == 16)
          {
            if ((i & 0xF) != 0) {
              throw new IOException("Invalid header table state change " + i);
            }
            clearReferenceSet();
          }
          else
          {
            maxHeaderTableByteCount = readInt(i, 15);
            if ((maxHeaderTableByteCount < 0) || (maxHeaderTableByteCount > maxHeaderTableByteCountSetting)) {
              throw new IOException("Invalid header table byte count " + maxHeaderTableByteCount);
            }
            adjustHeaderTableByteCount();
          }
        }
        else if ((i == 16) || (i == 0)) {
          readLiteralHeaderWithoutIndexingNewName();
        } else {
          readLiteralHeaderWithoutIndexingIndexedName(readInt(i, 15) - 1);
        }
      }
    }
    
    int readInt(int paramInt1, int paramInt2)
      throws IOException
    {
      paramInt1 &= paramInt2;
      if (paramInt1 < paramInt2) {
        return paramInt1;
      }
      paramInt1 = 0;
      int i;
      for (;;)
      {
        i = readByte();
        if ((i & 0x80) == 0) {
          break;
        }
        paramInt2 += ((i & 0x7F) << paramInt1);
        paramInt1 += 7;
      }
      return paramInt2 + (i << paramInt1);
    }
  }
  
  static final class Writer
  {
    private final Buffer out;
    
    Writer(Buffer paramBuffer)
    {
      out = paramBuffer;
    }
    
    void writeByteString(ByteString paramByteString)
      throws IOException
    {
      writeInt(paramByteString.size(), 127, 0);
      out.write(paramByteString);
    }
    
    void writeHeaders(List<Header> paramList)
      throws IOException
    {
      int i = 0;
      int j = paramList.size();
      if (i < j)
      {
        ByteString localByteString = getname.toAsciiLowercase();
        Integer localInteger = (Integer)HpackDraft07.NAME_TO_FIRST_INDEX.get(localByteString);
        if (localInteger != null)
        {
          writeInt(localInteger.intValue() + 1, 15, 0);
          writeByteString(getvalue);
        }
        for (;;)
        {
          i += 1;
          break;
          out.writeByte(0);
          writeByteString(localByteString);
          writeByteString(getvalue);
        }
      }
    }
    
    void writeInt(int paramInt1, int paramInt2, int paramInt3)
      throws IOException
    {
      if (paramInt1 < paramInt2)
      {
        out.writeByte(paramInt3 | paramInt1);
        return;
      }
      out.writeByte(paramInt3 | paramInt2);
      paramInt1 -= paramInt2;
      while (paramInt1 >= 128)
      {
        out.writeByte(paramInt1 & 0x7F | 0x80);
        paramInt1 >>>= 7;
      }
      out.writeByte(paramInt1);
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.HpackDraft07
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */