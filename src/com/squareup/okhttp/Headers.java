package com.squareup.okhttp;

import com.squareup.okhttp.internal.http.HttpDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public final class Headers
{
  private final String[] namesAndValues;
  
  private Headers(Builder paramBuilder)
  {
    namesAndValues = ((String[])namesAndValues.toArray(new String[namesAndValues.size()]));
  }
  
  private Headers(String[] paramArrayOfString)
  {
    namesAndValues = paramArrayOfString;
  }
  
  private static String get(String[] paramArrayOfString, String paramString)
  {
    int i = paramArrayOfString.length - 2;
    while (i >= 0)
    {
      if (paramString.equalsIgnoreCase(paramArrayOfString[i])) {
        return paramArrayOfString[(i + 1)];
      }
      i -= 2;
    }
    return null;
  }
  
  public static Headers of(String... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length % 2 != 0)) {
      throw new IllegalArgumentException("Expected alternating header names and values");
    }
    paramVarArgs = (String[])paramVarArgs.clone();
    int i = 0;
    while (i < paramVarArgs.length)
    {
      if (paramVarArgs[i] == null) {
        throw new IllegalArgumentException("Headers cannot be null");
      }
      paramVarArgs[i] = paramVarArgs[i].trim();
      i += 1;
    }
    i = 0;
    while (i < paramVarArgs.length)
    {
      String str1 = paramVarArgs[i];
      String str2 = paramVarArgs[(i + 1)];
      if ((str1.length() == 0) || (str1.indexOf(0) != -1) || (str2.indexOf(0) != -1)) {
        throw new IllegalArgumentException("Unexpected header: " + str1 + ": " + str2);
      }
      i += 2;
    }
    return new Headers(paramVarArgs);
  }
  
  public String get(String paramString)
  {
    return get(namesAndValues, paramString);
  }
  
  public Date getDate(String paramString)
  {
    paramString = get(paramString);
    if (paramString != null) {
      return HttpDate.parse(paramString);
    }
    return null;
  }
  
  public String name(int paramInt)
  {
    paramInt *= 2;
    if ((paramInt < 0) || (paramInt >= namesAndValues.length)) {
      return null;
    }
    return namesAndValues[paramInt];
  }
  
  public Set<String> names()
  {
    TreeSet localTreeSet = new TreeSet(String.CASE_INSENSITIVE_ORDER);
    int i = 0;
    while (i < size())
    {
      localTreeSet.add(name(i));
      i += 1;
    }
    return Collections.unmodifiableSet(localTreeSet);
  }
  
  public Builder newBuilder()
  {
    Builder localBuilder = new Builder();
    namesAndValues.addAll(Arrays.asList(namesAndValues));
    return localBuilder;
  }
  
  public int size()
  {
    return namesAndValues.length / 2;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 0;
    while (i < size())
    {
      localStringBuilder.append(name(i)).append(": ").append(value(i)).append("\n");
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public String value(int paramInt)
  {
    paramInt = paramInt * 2 + 1;
    if ((paramInt < 0) || (paramInt >= namesAndValues.length)) {
      return null;
    }
    return namesAndValues[paramInt];
  }
  
  public List<String> values(String paramString)
  {
    Object localObject1 = null;
    int i = 0;
    while (i < size())
    {
      Object localObject2 = localObject1;
      if (paramString.equalsIgnoreCase(name(i)))
      {
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = new ArrayList(2);
        }
        ((List)localObject2).add(value(i));
      }
      i += 1;
      localObject1 = localObject2;
    }
    if (localObject1 != null) {
      return Collections.unmodifiableList((List)localObject1);
    }
    return Collections.emptyList();
  }
  
  public static class Builder
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
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Headers
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */