package com.google.common.reflect;

import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nullable;

final class TypeResolver$WildcardCapturer
{
  private final AtomicInteger id = new AtomicInteger();
  
  private Type[] capture(Type[] paramArrayOfType)
  {
    Type[] arrayOfType = new Type[paramArrayOfType.length];
    int i = 0;
    while (i < paramArrayOfType.length)
    {
      arrayOfType[i] = capture(paramArrayOfType[i]);
      i += 1;
    }
    return arrayOfType;
  }
  
  private Type captureNullable(@Nullable Type paramType)
  {
    if (paramType == null) {
      return null;
    }
    return capture(paramType);
  }
  
  Type capture(Type paramType)
  {
    Preconditions.checkNotNull(paramType);
    if ((paramType instanceof Class)) {}
    WildcardType localWildcardType;
    do
    {
      do
      {
        return paramType;
      } while ((paramType instanceof TypeVariable));
      if ((paramType instanceof GenericArrayType)) {
        return Types.newArrayType(capture(((GenericArrayType)paramType).getGenericComponentType()));
      }
      if ((paramType instanceof ParameterizedType))
      {
        paramType = (ParameterizedType)paramType;
        return Types.newParameterizedTypeWithOwner(captureNullable(paramType.getOwnerType()), (Class)paramType.getRawType(), capture(paramType.getActualTypeArguments()));
      }
      if (!(paramType instanceof WildcardType)) {
        break;
      }
      localWildcardType = (WildcardType)paramType;
    } while (localWildcardType.getLowerBounds().length != 0);
    paramType = localWildcardType.getUpperBounds();
    return Types.newArtificialTypeVariable(WildcardCapturer.class, "capture#" + id.incrementAndGet() + "-of ? extends " + Joiner.on('&').join(paramType), localWildcardType.getUpperBounds());
    throw new AssertionError("must have been one of the known types");
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeResolver.WildcardCapturer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */