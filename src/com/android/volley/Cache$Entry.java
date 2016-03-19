package com.android.volley;

import java.util.Collections;
import java.util.Map;

public class Cache$Entry
{
  public byte[] data;
  public String etag;
  public long lastModified;
  public Map<String, String> responseHeaders = Collections.emptyMap();
  public long serverDate;
  public long softTtl;
  public long ttl;
  
  public boolean isExpired()
  {
    return ttl < System.currentTimeMillis();
  }
  
  public boolean refreshNeeded()
  {
    return softTtl < System.currentTimeMillis();
  }
}

/* Location:
 * Qualified Name:     com.android.volley.Cache.Entry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */