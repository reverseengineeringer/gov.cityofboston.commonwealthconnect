package com.google.common.reflect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

final class Types$TypeVariableImpl<D extends GenericDeclaration>
  implements TypeVariable<D>
{
  private final ImmutableList<Type> bounds;
  private final D genericDeclaration;
  private final String name;
  
  Types$TypeVariableImpl(D paramD, String paramString, Type[] paramArrayOfType)
  {
    Types.access$200(paramArrayOfType, "bound for type variable");
    genericDeclaration = ((GenericDeclaration)Preconditions.checkNotNull(paramD));
    name = ((String)Preconditions.checkNotNull(paramString));
    bounds = ImmutableList.copyOf(paramArrayOfType);
  }
  
  public boolean equals(Object paramObject)
  {
    if (Types.NativeTypeVariableEquals.NATIVE_TYPE_VARIABLE_ONLY) {
      if ((paramObject instanceof TypeVariableImpl))
      {
        paramObject = (TypeVariableImpl)paramObject;
        if ((!name.equals(((TypeVariableImpl)paramObject).getName())) || (!genericDeclaration.equals(((TypeVariableImpl)paramObject).getGenericDeclaration())) || (!bounds.equals(bounds))) {}
      }
    }
    do
    {
      return true;
      return false;
      return false;
      if (!(paramObject instanceof TypeVariable)) {
        break;
      }
      paramObject = (TypeVariable)paramObject;
    } while ((name.equals(((TypeVariable)paramObject).getName())) && (genericDeclaration.equals(((TypeVariable)paramObject).getGenericDeclaration())));
    return false;
    return false;
  }
  
  public Type[] getBounds()
  {
    return Types.access$300(bounds);
  }
  
  public D getGenericDeclaration()
  {
    return genericDeclaration;
  }
  
  public String getName()
  {
    return name;
  }
  
  public int hashCode()
  {
    return genericDeclaration.hashCode() ^ name.hashCode();
  }
  
  public String toString()
  {
    return name;
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.TypeVariableImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */