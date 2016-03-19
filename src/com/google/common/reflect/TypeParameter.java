package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import javax.annotation.Nullable;

@Beta
public abstract class TypeParameter<T>
  extends TypeCapture<T>
{
  final TypeVariable<?> typeVariable;
  
  protected TypeParameter()
  {
    Type localType = capture();
    Preconditions.checkArgument(localType instanceof TypeVariable, "%s should be a type variable.", new Object[] { localType });
    typeVariable = ((TypeVariable)localType);
  }
  
  public final boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof TypeParameter))
    {
      paramObject = (TypeParameter)paramObject;
      return typeVariable.equals(typeVariable);
    }
    return false;
  }
  
  public final int hashCode()
  {
    return typeVariable.hashCode();
  }
  
  public String toString()
  {
    return typeVariable.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeParameter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */