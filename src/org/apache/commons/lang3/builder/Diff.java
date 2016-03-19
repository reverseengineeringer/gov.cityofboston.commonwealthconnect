package org.apache.commons.lang3.builder;

import java.lang.reflect.Type;
import java.util.Map;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.reflect.TypeUtils;
import org.apache.commons.lang3.tuple.Pair;

public abstract class Diff<T>
  extends Pair<T, T>
{
  private static final long serialVersionUID = 1L;
  private final String fieldName;
  private final Type type = (Type)ObjectUtils.defaultIfNull(TypeUtils.getTypeArguments(getClass(), Diff.class).get(Diff.class.getTypeParameters()[0]), Object.class);
  
  protected Diff(String paramString)
  {
    fieldName = paramString;
  }
  
  public final String getFieldName()
  {
    return fieldName;
  }
  
  public final Type getType()
  {
    return type;
  }
  
  public final T setValue(T paramT)
  {
    throw new UnsupportedOperationException("Cannot alter Diff object.");
  }
  
  public final String toString()
  {
    return String.format("[%s: %s, %s]", new Object[] { fieldName, getLeft(), getRight() });
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.builder.Diff
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */