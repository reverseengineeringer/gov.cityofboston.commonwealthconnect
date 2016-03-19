package com.android.volley;

import java.io.Serializable;
import java.util.Collections;
import java.util.Map;

public class NetworkResponse
  implements Serializable
{
  private static final long serialVersionUID = -20150728102000L;
  public final byte[] data;
  public final Map<String, String> headers;
  public final long networkTimeMs;
  public final boolean notModified;
  public final int statusCode;
  
  public NetworkResponse(int paramInt, byte[] paramArrayOfByte, Map<String, String> paramMap, boolean paramBoolean)
  {
    this(paramInt, paramArrayOfByte, paramMap, paramBoolean, 0L);
  }
  
  public NetworkResponse(int paramInt, byte[] paramArrayOfByte, Map<String, String> paramMap, boolean paramBoolean, long paramLong)
  {
    statusCode = paramInt;
    data = paramArrayOfByte;
    headers = paramMap;
    notModified = paramBoolean;
    networkTimeMs = paramLong;
  }
  
  public NetworkResponse(byte[] paramArrayOfByte)
  {
    this(200, paramArrayOfByte, Collections.emptyMap(), false, 0L);
  }
  
  public NetworkResponse(byte[] paramArrayOfByte, Map<String, String> paramMap)
  {
    this(200, paramArrayOfByte, paramMap, false, 0L);
  }
}

/* Location:
 * Qualified Name:     com.android.volley.NetworkResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */