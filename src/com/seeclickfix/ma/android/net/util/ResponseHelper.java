package com.seeclickfix.ma.android.net.util;

import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;

public class ResponseHelper
{
  public static boolean wasSuccessful(HttpResponse paramHttpResponse)
  {
    int i = paramHttpResponse.getStatusLine().getStatusCode();
    return (i >= 200) && (i < 300);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.util.ResponseHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */