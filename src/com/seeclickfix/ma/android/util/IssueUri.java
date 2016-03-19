package com.seeclickfix.ma.android.util;

import java.net.URI;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

public class IssueUri
{
  public int getId(String paramString)
  {
    int j = -1;
    if (paramString == null) {
      return -1;
    }
    paramString = StringUtils.substringAfterLast(StringUtils.substringBefore(StringUtils.substringBefore(paramString, "-"), "?"), "/issues/");
    int i = j;
    if (StringUtils.isNotEmpty(paramString))
    {
      i = j;
      if (StringUtils.isNumeric(paramString)) {
        i = Integer.valueOf(paramString).intValue();
      }
    }
    return i;
  }
  
  public HashMap<String, String> getUrlParams(String paramString)
  {
    HashMap localHashMap = new HashMap();
    if (paramString == null) {}
    for (;;)
    {
      return localHashMap;
      paramString = URLEncodedUtils.parse(URI.create(paramString), "UTF-8").iterator();
      while (paramString.hasNext())
      {
        NameValuePair localNameValuePair = (NameValuePair)paramString.next();
        localHashMap.put(localNameValuePair.getName(), localNameValuePair.getValue());
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.util.IssueUri
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */