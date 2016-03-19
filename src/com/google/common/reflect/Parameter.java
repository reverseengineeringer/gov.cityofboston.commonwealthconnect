package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.util.Iterator;
import javax.annotation.Nullable;

@Beta
public final class Parameter
  implements AnnotatedElement
{
  private final ImmutableList<Annotation> annotations;
  private final Invokable<?, ?> declaration;
  private final int position;
  private final TypeToken<?> type;
  
  Parameter(Invokable<?, ?> paramInvokable, int paramInt, TypeToken<?> paramTypeToken, Annotation[] paramArrayOfAnnotation)
  {
    declaration = paramInvokable;
    position = paramInt;
    type = paramTypeToken;
    annotations = ImmutableList.copyOf(paramArrayOfAnnotation);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Parameter))
    {
      paramObject = (Parameter)paramObject;
      bool1 = bool2;
      if (position == position)
      {
        bool1 = bool2;
        if (declaration.equals(declaration)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  @Nullable
  public <A extends Annotation> A getAnnotation(Class<A> paramClass)
  {
    Preconditions.checkNotNull(paramClass);
    Iterator localIterator = annotations.iterator();
    while (localIterator.hasNext())
    {
      Annotation localAnnotation = (Annotation)localIterator.next();
      if (paramClass.isInstance(localAnnotation)) {
        return (Annotation)paramClass.cast(localAnnotation);
      }
    }
    return null;
  }
  
  public Annotation[] getAnnotations()
  {
    return getDeclaredAnnotations();
  }
  
  public Annotation[] getDeclaredAnnotations()
  {
    return (Annotation[])annotations.toArray(new Annotation[annotations.size()]);
  }
  
  public Invokable<?, ?> getDeclaringInvokable()
  {
    return declaration;
  }
  
  public TypeToken<?> getType()
  {
    return type;
  }
  
  public int hashCode()
  {
    return position;
  }
  
  public boolean isAnnotationPresent(Class<? extends Annotation> paramClass)
  {
    return getAnnotation(paramClass) != null;
  }
  
  public String toString()
  {
    return type + " arg" + position;
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Parameter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */