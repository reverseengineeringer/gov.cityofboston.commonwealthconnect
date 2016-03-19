package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.internal.BitArray;
import com.squareup.okhttp.internal.BitArray.FixedCapacity;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import okio.BufferedSource;
import okio.ByteString;
import okio.Okio;
import okio.Source;

final class HpackDraft07$Reader
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
  
  HpackDraft07$Reader(int paramInt, Source paramSource)
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
      return access$000headerCount)].name;
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
      if (paramInt > HpackDraft07.access$000().length - 1) {
        throw new IOException("Header index too large " + (paramInt + 1));
      }
      Header localHeader = HpackDraft07.access$000()[paramInt];
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
    insertIntoHeaderTable(-1, new Header(HpackDraft07.access$100(readByteString()), readByteString()));
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
    ByteString localByteString1 = HpackDraft07.access$100(readByteString());
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

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.HpackDraft07.Reader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */