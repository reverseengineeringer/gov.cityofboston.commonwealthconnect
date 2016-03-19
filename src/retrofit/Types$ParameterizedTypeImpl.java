package retrofit;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;

final class Types$ParameterizedTypeImpl
  implements ParameterizedType
{
  private final Type ownerType;
  private final Type rawType;
  private final Type[] typeArguments;
  
  public Types$ParameterizedTypeImpl(Type paramType1, Type paramType2, Type... paramVarArgs)
  {
    if ((paramType2 instanceof Class))
    {
      if (paramType1 == null)
      {
        i = 1;
        if (((Class)paramType2).getEnclosingClass() != null) {
          break label55;
        }
      }
      for (;;)
      {
        if (i == j) {
          break label61;
        }
        throw new IllegalArgumentException();
        i = 0;
        break;
        label55:
        j = 0;
      }
    }
    label61:
    ownerType = paramType1;
    rawType = paramType2;
    typeArguments = ((Type[])paramVarArgs.clone());
    paramType1 = typeArguments;
    j = paramType1.length;
    int i = k;
    while (i < j)
    {
      paramType2 = paramType1[i];
      if (paramType2 == null) {
        throw new NullPointerException();
      }
      Types.access$000(paramType2);
      i += 1;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof ParameterizedType)) && (Types.equals(this, (ParameterizedType)paramObject));
  }
  
  public Type[] getActualTypeArguments()
  {
    return (Type[])typeArguments.clone();
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
    return Arrays.hashCode(typeArguments) ^ rawType.hashCode() ^ Types.access$100(ownerType);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder((typeArguments.length + 1) * 30);
    localStringBuilder.append(Types.typeToString(rawType));
    if (typeArguments.length == 0) {
      return localStringBuilder.toString();
    }
    localStringBuilder.append("<").append(Types.typeToString(typeArguments[0]));
    int i = 1;
    while (i < typeArguments.length)
    {
      localStringBuilder.append(", ").append(Types.typeToString(typeArguments[i]));
      i += 1;
    }
    return ">";
  }
}

/* Location:
 * Qualified Name:     retrofit.Types.ParameterizedTypeImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */