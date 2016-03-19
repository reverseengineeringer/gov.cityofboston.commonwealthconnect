package com.squareup.okhttp;

import java.util.ArrayList;
import java.util.List;

public class Headers$Builder
{
  private final List<String> namesAndValues = new ArrayList(20);
  
  private Builder addLenient(String paramString1, String paramString2)
  {
    namesAndValues.add(paramString1);
    namesAndValues.add(paramString2.trim());
    return this;
  }
  
  public Builder add(String paramString1, String paramString2)
  {
    if (paramString1 == null) {
      throw new IllegalArgumentException("name == null");
    }
    if (paramString2 == null) {
      throw new IllegalArgumentException("value == null");
    }
    if ((paramString1.length() == 0) || (paramString1.indexOf(0) != -1) || (paramString2.indexOf(0) != -1)) {
      throw new IllegalArgumentException("Unexpected header: " + paramString1 + ": " + paramString2);
    }
    return addLenient(paramString1, paramString2);
  }
  
  Builder addLine(String paramString)
  {
    int i = paramString.indexOf(":", 1);
    if (i != -1) {
      return addLenient(paramString.substring(0, i), paramString.substring(i + 1));
    }
    if (paramString.startsWith(":")) {
      return addLenient("", paramString.substring(1));
    }
    return addLenient("", paramString);
  }
  
  public Headers build()
  {
    return new Headers(this, null);
  }
  
  public String get(String paramString)
  {
    int i = namesAndValues.size() - 2;
    while (i >= 0)
    {
      if (paramString.equalsIgnoreCase((String)namesAndValues.get(i))) {
        return (String)namesAndValues.get(i + 1);
      }
      i -= 2;
    }
    return null;
  }
  
  public Builder removeAll(String paramString)
  {
    int j;
    for (int i = 0; i < namesAndValues.size(); i = j + 2)
    {
      j = i;
      if (paramString.equalsIgnoreCase((String)namesAndValues.get(i)))
      {
        namesAndValues.remove(i);
        namesAndValues.remove(i);
        j = i - 2;
      }
    }
    return this;
  }
  
  public Builder set(String paramString1, String paramString2)
  {
    removeAll(paramString1);
    add(paramString1, paramString2);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Headers.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */