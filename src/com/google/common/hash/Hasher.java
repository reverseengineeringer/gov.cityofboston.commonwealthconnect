package com.google.common.hash;

import com.google.common.annotations.Beta;
import java.nio.charset.Charset;

@Beta
public abstract interface Hasher
  extends PrimitiveSink
{
  public abstract HashCode hash();
  
  public abstract Hasher putBoolean(boolean paramBoolean);
  
  public abstract Hasher putByte(byte paramByte);
  
  public abstract Hasher putBytes(byte[] paramArrayOfByte);
  
  public abstract Hasher putBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2);
  
  public abstract Hasher putChar(char paramChar);
  
  public abstract Hasher putDouble(double paramDouble);
  
  public abstract Hasher putFloat(float paramFloat);
  
  public abstract Hasher putInt(int paramInt);
  
  public abstract Hasher putLong(long paramLong);
  
  public abstract <T> Hasher putObject(T paramT, Funnel<? super T> paramFunnel);
  
  public abstract Hasher putShort(short paramShort);
  
  public abstract Hasher putString(CharSequence paramCharSequence, Charset paramCharset);
  
  public abstract Hasher putUnencodedChars(CharSequence paramCharSequence);
}

/* Location:
 * Qualified Name:     com.google.common.hash.Hasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */