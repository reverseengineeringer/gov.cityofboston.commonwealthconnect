package com.seeclickfix.ma.android.cache;

import android.support.v4.util.LruCache;
import com.seeclickfix.ma.android.objects.issue.Comment;

public class CommentLruObjectCache
  extends LruCache<Integer, Comment>
{
  private static CommentLruObjectCache singletonInstance;
  
  private CommentLruObjectCache()
  {
    super(300);
  }
  
  public static CommentLruObjectCache getInstance()
  {
    if (singletonInstance == null) {
      singletonInstance = new CommentLruObjectCache();
    }
    return singletonInstance;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.cache.CommentLruObjectCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */