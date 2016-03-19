package com.google.common.reflect;

import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;

 enum TypeToken$TypeFilter$1
{
  TypeToken$TypeFilter$1()
  {
    super(paramString, paramInt, null);
  }
  
  public boolean apply(TypeToken<?> paramTypeToken)
  {
    return (!(TypeToken.access$400(paramTypeToken) instanceof TypeVariable)) && (!(TypeToken.access$400(paramTypeToken) instanceof WildcardType));
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.TypeFilter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */