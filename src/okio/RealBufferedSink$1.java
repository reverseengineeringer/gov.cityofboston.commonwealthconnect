package okio;

import java.io.IOException;
import java.io.OutputStream;

class RealBufferedSink$1
  extends OutputStream
{
  RealBufferedSink$1(RealBufferedSink paramRealBufferedSink) {}
  
  public void close()
    throws IOException
  {
    this$0.close();
  }
  
  public void flush()
    throws IOException
  {
    if (!RealBufferedSink.access$000(this$0)) {
      this$0.flush();
    }
  }
  
  public String toString()
  {
    return this$0 + ".outputStream()";
  }
  
  public void write(int paramInt)
    throws IOException
  {
    if (RealBufferedSink.access$000(this$0)) {
      throw new IOException("closed");
    }
    this$0.buffer.writeByte((byte)paramInt);
    this$0.emitCompleteSegments();
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (RealBufferedSink.access$000(this$0)) {
      throw new IOException("closed");
    }
    this$0.buffer.write(paramArrayOfByte, paramInt1, paramInt2);
    this$0.emitCompleteSegments();
  }
}

/* Location:
 * Qualified Name:     okio.RealBufferedSink.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */