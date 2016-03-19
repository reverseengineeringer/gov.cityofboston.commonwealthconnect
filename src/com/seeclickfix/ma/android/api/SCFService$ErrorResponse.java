package com.seeclickfix.ma.android.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

public class SCFService$ErrorResponse
{
  public HashMap<String, String[]> errors;
  
  public List<String> errorList()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = errors.entrySet().iterator();
    while (localIterator.hasNext())
    {
      String[] arrayOfString = (String[])((Map.Entry)localIterator.next()).getValue();
      int j = arrayOfString.length;
      int i = 0;
      while (i < j)
      {
        localArrayList.add(arrayOfString[i]);
        i += 1;
      }
    }
    return localArrayList;
  }
  
  public String toUL()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("<ul>\n");
    Iterator localIterator = errorList().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localStringBuilder.append("<li>");
      localStringBuilder.append(str);
      localStringBuilder.append("\n");
    }
    localStringBuilder.append("</ul>\n");
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.ErrorResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */