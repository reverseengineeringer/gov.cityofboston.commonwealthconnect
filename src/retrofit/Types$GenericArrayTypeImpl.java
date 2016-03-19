package retrofit;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

final class Types$GenericArrayTypeImpl
  implements GenericArrayType
{
  private final Type componentType;
  
  public Types$GenericArrayTypeImpl(Type paramType)
  {
    componentType = paramType;
  }
  
  public boolean equals(Object paramObject)
  {
    return ((paramObject instanceof GenericArrayType)) && (Types.equals(this, (GenericArrayType)paramObject));
  }
  
  public Type getGenericComponentType()
  {
    return componentType;
  }
  
  public int hashCode()
  {
    return componentType.hashCode();
  }
  
  public String toString()
  {
    return Types.typeToString(componentType) + "[]";
  }
}

/* Location:
 * Qualified Name:     retrofit.Types.GenericArrayTypeImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */