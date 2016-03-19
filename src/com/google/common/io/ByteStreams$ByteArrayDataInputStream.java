package com.google.common.io;

import java.io.ByteArrayInputStream;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;

class ByteStreams$ByteArrayDataInputStream
  implements ByteArrayDataInput
{
  final DataInput input;
  
  ByteStreams$ByteArrayDataInputStream(ByteArrayInputStream paramByteArrayInputStream)
  {
    input = new DataInputStream(paramByteArrayInputStream);
  }
  
  public boolean readBoolean()
  {
    try
    {
      boolean bool = input.readBoolean();
      return bool;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public byte readByte()
  {
    try
    {
      byte b = input.readByte();
      return b;
    }
    catch (EOFException localEOFException)
    {
      throw new IllegalStateException(localEOFException);
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public char readChar()
  {
    try
    {
      char c = input.readChar();
      return c;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public double readDouble()
  {
    try
    {
      double d = input.readDouble();
      return d;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public float readFloat()
  {
    try
    {
      float f = input.readFloat();
      return f;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public void readFully(byte[] paramArrayOfByte)
  {
    try
    {
      input.readFully(paramArrayOfByte);
      return;
    }
    catch (IOException paramArrayOfByte)
    {
      throw new IllegalStateException(paramArrayOfByte);
    }
  }
  
  public void readFully(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      input.readFully(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    catch (IOException paramArrayOfByte)
    {
      throw new IllegalStateException(paramArrayOfByte);
    }
  }
  
  public int readInt()
  {
    try
    {
      int i = input.readInt();
      return i;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public String readLine()
  {
    try
    {
      String str = input.readLine();
      return str;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public long readLong()
  {
    try
    {
      long l = input.readLong();
      return l;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public short readShort()
  {
    try
    {
      short s = input.readShort();
      return s;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public String readUTF()
  {
    try
    {
      String str = input.readUTF();
      return str;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public int readUnsignedByte()
  {
    try
    {
      int i = input.readUnsignedByte();
      return i;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public int readUnsignedShort()
  {
    try
    {
      int i = input.readUnsignedShort();
      return i;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
  
  public int skipBytes(int paramInt)
  {
    try
    {
      paramInt = input.skipBytes(paramInt);
      return paramInt;
    }
    catch (IOException localIOException)
    {
      throw new IllegalStateException(localIOException);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.ByteArrayDataInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */