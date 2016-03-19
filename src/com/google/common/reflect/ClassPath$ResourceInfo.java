package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.net.URL;

@Beta
public class ClassPath$ResourceInfo
{
  final ClassLoader loader;
  private final String resourceName;
  
  ClassPath$ResourceInfo(String paramString, ClassLoader paramClassLoader)
  {
    resourceName = ((String)Preconditions.checkNotNull(paramString));
    loader = ((ClassLoader)Preconditions.checkNotNull(paramClassLoader));
  }
  
  static ResourceInfo of(String paramString, ClassLoader paramClassLoader)
  {
    if (paramString.endsWith(".class")) {
      return new ClassPath.ClassInfo(paramString, paramClassLoader);
    }
    return new ResourceInfo(paramString, paramClassLoader);
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof ResourceInfo))
    {
      paramObject = (ResourceInfo)paramObject;
      bool1 = bool2;
      if (resourceName.equals(resourceName))
      {
        bool1 = bool2;
        if (loader == loader) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public final String getResourceName()
  {
    return resourceName;
  }
  
  public int hashCode()
  {
    return resourceName.hashCode();
  }
  
  public String toString()
  {
    return resourceName;
  }
  
  public final URL url()
  {
    return (URL)Preconditions.checkNotNull(loader.getResource(resourceName), "Failed to load resource: %s", new Object[] { resourceName });
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.ClassPath.ResourceInfo
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */