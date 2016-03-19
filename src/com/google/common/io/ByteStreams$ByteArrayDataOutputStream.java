package com.google.common.io;

import java.io.ByteArrayOutputStream;
import java.io.DataOutput;
import java.io.DataOutputStream;
import java.io.IOException;

class ByteStreams$ByteArrayDataOutputStream
  implements ByteArrayDataOutput
{
  final ByteArrayOutputStream byteArrayOutputSteam;
  final DataOutput output;
  
  ByteStreams$ByteArrayDataOutputStream(ByteArrayOutputStream paramByteArrayOutputStream)
  {
    byteArrayOutputSteam = paramByteArrayOutputStream;
    output = new DataOutputStream(paramByteArrayOutputStream);
  }
  
  public byte[] toByteArray()
  {
    return byteArrayOutputSteam.toByteArray();
  }
  
  public void write(int paramInt)
  {
    try
    {
      output.write(paramInt);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void write(byte[] paramArrayOfByte)
  {
    try
    {
      output.write(paramArrayOfByte);
      return;
    }
    catch (IOException paramArrayOfByte)
    {
      throw new AssertionError(paramArrayOfByte);
    }
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      output.write(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    catch (IOException paramArrayOfByte)
    {
      throw new AssertionError(paramArrayOfByte);
    }
  }
  
  public void writeBoolean(boolean paramBoolean)
  {
    try
    {
      output.writeBoolean(paramBoolean);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeByte(int paramInt)
  {
    try
    {
      output.writeByte(paramInt);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeBytes(String paramString)
  {
    try
    {
      output.writeBytes(paramString);
      return;
    }
    catch (IOException paramString)
    {
      throw new AssertionError(paramString);
    }
  }
  
  public void writeChar(int paramInt)
  {
    try
    {
      output.writeChar(paramInt);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeChars(String paramString)
  {
    try
    {
      output.writeChars(paramString);
      return;
    }
    catch (IOException paramString)
    {
      throw new AssertionError(paramString);
    }
  }
  
  public void writeDouble(double paramDouble)
  {
    try
    {
      output.writeDouble(paramDouble);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeFloat(float paramFloat)
  {
    try
    {
      output.writeFloat(paramFloat);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeInt(int paramInt)
  {
    try
    {
      output.writeInt(paramInt);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeLong(long paramLong)
  {
    try
    {
      output.writeLong(paramLong);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeShort(int paramInt)
  {
    try
    {
      output.writeShort(paramInt);
      return;
    }
    catch (IOException localIOException)
    {
      throw new AssertionError(localIOException);
    }
  }
  
  public void writeUTF(String paramString)
  {
    try
    {
      output.writeUTF(paramString);
      return;
    }
    catch (IOException paramString)
    {
      throw new AssertionError(paramString);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.ByteArrayDataOutputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */