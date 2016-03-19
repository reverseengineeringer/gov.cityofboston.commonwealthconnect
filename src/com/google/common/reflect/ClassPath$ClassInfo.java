package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.base.CharMatcher;

@Beta
public final class ClassPath$ClassInfo
  extends ClassPath.ResourceInfo
{
  private final String className;
  
  ClassPath$ClassInfo(String paramString, ClassLoader paramClassLoader)
  {
    super(paramString, paramClassLoader);
    className = ClassPath.getClassName(paramString);
  }
  
  public String getName()
  {
    return className;
  }
  
  public String getPackageName()
  {
    return Reflection.getPackageName(className);
  }
  
  public String getSimpleName()
  {
    int i = className.lastIndexOf('$');
    if (i != -1)
    {
      str = className.substring(i + 1);
      return CharMatcher.DIGIT.trimLeadingFrom(str);
    }
    String str = getPackageName();
    if (str.isEmpty()) {
      return className;
    }
    return className.substring(str.length() + 1);
  }
  
  public Class<?> load()
  {
    try
    {
      Class localClass = loader.loadClass(className);
      return localClass;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new IllegalStateException(localClassNotFoundException);
    }
  }
  
  public String toString()
  {
    return className;
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.ClassPath.ClassInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */