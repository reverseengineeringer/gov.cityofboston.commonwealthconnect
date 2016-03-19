package okio;

import java.io.OutputStream;

class Buffer$1
  extends OutputStream
{
  Buffer$1(Buffer paramBuffer) {}
  
  public void close() {}
  
  public void flush() {}
  
  public String toString()
  {
    return this + ".outputStream()";
  }
  
  public void write(int paramInt)
  {
    this$0.writeByte((byte)paramInt);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    this$0.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     okio.Buffer.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */