package com.google.common.reflect;

import com.google.common.base.Joiner;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Iterables;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import javax.annotation.Nullable;

final class Types$ParameterizedTypeImpl
  implements ParameterizedType, Serializable
{
  private static final long serialVersionUID = 0L;
  private final ImmutableList<Type> argumentsList;
  private final Type ownerType;
  private final Class<?> rawType;
  
  Types$ParameterizedTypeImpl(@Nullable Type paramType, Class<?> paramClass, Type[] paramArrayOfType)
  {
    Preconditions.checkNotNull(paramClass);
    if (paramArrayOfType.length == paramClass.getTypeParameters().length) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      Types.access$200(paramArrayOfType, "type parameter");
      ownerType = paramType;
      rawType = paramClass;
      argumentsList = Types.JavaVersion.CURRENT.usedInGenericType(paramArrayOfType);
      return;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ParameterizedType)) {}
    do
    {
      return false;
      paramObject = (ParameterizedType)paramObject;
    } while ((!getRawType().equals(((ParameterizedType)paramObject).getRawType())) || (!Objects.equal(getOwnerType(), ((ParameterizedType)paramObject).getOwnerType())) || (!Arrays.equals(getActualTypeArguments(), ((ParameterizedType)paramObject).getActualTypeArguments())));
    return true;
  }
  
  public Type[] getActualTypeArguments()
  {
    return Types.access$300(argumentsList);
  }
  
  public Type getOwnerType()
  {
    return ownerType;
  }
  
  public Type getRawType()
  {
    return rawType;
  }
  
  public int hashCode()
  {
    if (ownerType == null) {}
    for (int i = 0;; i = ownerType.hashCode()) {
      return i ^ argumentsList.hashCode() ^ rawType.hashCode();
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    if (ownerType != null) {
      localStringBuilder.append(Types.toString(ownerType)).append('.');
    }
    localStringBuilder.append(rawType.getName()).append('<').append(Types.access$500().join(Iterables.transform(argumentsList, Types.access$400()))).append('>');
    return localStringBuilder.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.ParameterizedTypeImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */