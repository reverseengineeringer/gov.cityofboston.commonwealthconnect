package com.google.common.reflect;

import javax.annotation.Nullable;

final class TypeToken$TypeCollector$1
  extends TypeToken.TypeCollector<TypeToken<?>>
{
  TypeToken$TypeCollector$1()
  {
    super(null);
  }
  
  Iterable<? extends TypeToken<?>> getInterfaces(TypeToken<?> paramTypeToken)
  {
    return paramTypeToken.getGenericInterfaces();
  }
  
  Class<?> getRawType(TypeToken<?> paramTypeToken)
  {
    return paramTypeToken.getRawType();
  }
  
  @Nullable
  TypeToken<?> getSuperclass(TypeToken<?> paramTypeToken)
  {
    return paramTypeToken.getGenericSuperclass();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.TypeCollector.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */