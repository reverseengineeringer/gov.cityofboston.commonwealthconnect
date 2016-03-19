package com.google.common.reflect;

import javax.annotation.Nullable;

 enum Types$ClassOwnership$2
{
  Types$ClassOwnership$2()
  {
    super(paramString, paramInt, null);
  }
  
  @Nullable
  Class<?> getOwnerType(Class<?> paramClass)
  {
    if (paramClass.isLocalClass()) {
      return null;
    }
    return paramClass.getEnclosingClass();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.ClassOwnership.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */