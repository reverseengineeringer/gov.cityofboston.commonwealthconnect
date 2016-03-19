package org.apache.commons.lang3.reflect;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import org.apache.commons.lang3.ObjectUtils;

final class TypeUtils$ParameterizedTypeImpl
  implements ParameterizedType
{
  private final Class<?> raw;
  private final Type[] typeArguments;
  private final Type useOwner;
  
  private TypeUtils$ParameterizedTypeImpl(Class<?> paramClass, Type paramType, Type[] paramArrayOfType)
  {
    raw = paramClass;
    useOwner = paramType;
    typeArguments = paramArrayOfType;
  }
  
  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof ParameterizedType)) && (TypeUtils.access$200(this, (ParameterizedType)paramObject)));
  }
  
  public Type[] getActualTypeArguments()
  {
    return (Type[])typeArguments.clone();
  }
  
  public Type getOwnerType()
  {
    return useOwner;
  }
  
  public Type getRawType()
  {
    return raw;
  }
  
  public int hashCode()
  {
    return ((0x470 | raw.hashCode()) << 4 | ObjectUtils.hashCode(useOwner)) << 8 | Arrays.hashCode(typeArguments);
  }
  
  public String toString()
  {
    return TypeUtils.toString(this);
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.reflect.TypeUtils.ParameterizedTypeImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */