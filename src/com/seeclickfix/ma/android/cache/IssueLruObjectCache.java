package com.seeclickfix.ma.android.cache;

import android.support.v4.util.LruCache;
import com.seeclickfix.ma.android.objects.issue.Issue;

public class IssueLruObjectCache
  extends LruCache<Integer, Issue>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IssueLruObjectCache";
  private static IssueLruObjectCache singletonInstance;
  private String cacheTag;
  
  private IssueLruObjectCache()
  {
    super(300);
  }
  
  public static IssueLruObjectCache getInstance(String paramString)
  {
    if (singletonInstance == null)
    {
      singletonInstance = new IssueLruObjectCache();
      singletonInstancecacheTag = paramString;
    }
    return singletonInstance;
  }
  
  public String getCacheTag()
  {
    return cacheTag;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.cache.IssueLruObjectCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */