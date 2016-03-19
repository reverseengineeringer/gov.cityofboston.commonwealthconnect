package com.google.common.reflect;

import com.google.common.base.Predicate;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.ImmutableSet;
import java.util.Set;

final class TypeToken$InterfaceSet
  extends TypeToken<T>.TypeSet
{
  private static final long serialVersionUID = 0L;
  private final transient TypeToken<T>.TypeSet allTypes;
  private transient ImmutableSet<TypeToken<? super T>> interfaces;
  
  TypeToken$InterfaceSet(TypeToken<T>.TypeSet paramTypeToken)
  {
    super(paramTypeToken);
    TypeToken.TypeSet localTypeSet;
    allTypes = localTypeSet;
  }
  
  private Object readResolve()
  {
    return this$0.getTypes().interfaces();
  }
  
  public TypeToken<T>.TypeSet classes()
  {
    throw new UnsupportedOperationException("interfaces().classes() not supported.");
  }
  
  protected Set<TypeToken<? super T>> delegate()
  {
    ImmutableSet localImmutableSet2 = interfaces;
    ImmutableSet localImmutableSet1 = localImmutableSet2;
    if (localImmutableSet2 == null)
    {
      localImmutableSet1 = FluentIterable.from(allTypes).filter(TypeToken.TypeFilter.INTERFACE_ONLY).toSet();
      interfaces = localImmutableSet1;
    }
    return localImmutableSet1;
  }
  
  public TypeToken<T>.TypeSet interfaces()
  {
    return this;
  }
  
  public Set<Class<? super T>> rawTypes()
  {
    FluentIterable.from(TypeToken.TypeCollector.FOR_RAW_TYPE.collectTypes(TypeToken.access$200(this$0))).filter(new Predicate()
    {
      public boolean apply(Class<?> paramAnonymousClass)
      {
        return paramAnonymousClass.isInterface();
      }
    }).toSet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.InterfaceSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */