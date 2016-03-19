package com.google.common.reflect;

import com.google.common.collect.FluentIterable;
import com.google.common.collect.ForwardingSet;
import com.google.common.collect.ImmutableSet;
import java.io.Serializable;
import java.util.Set;

public class TypeToken$TypeSet
  extends ForwardingSet<TypeToken<? super T>>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private transient ImmutableSet<TypeToken<? super T>> types;
  
  TypeToken$TypeSet(TypeToken paramTypeToken) {}
  
  public TypeToken<T>.TypeSet classes()
  {
    return new TypeToken.ClassSet(this$0, null);
  }
  
  protected Set<TypeToken<? super T>> delegate()
  {
    ImmutableSet localImmutableSet2 = types;
    ImmutableSet localImmutableSet1 = localImmutableSet2;
    if (localImmutableSet2 == null)
    {
      localImmutableSet1 = FluentIterable.from(TypeToken.TypeCollector.FOR_GENERIC_TYPE.collectTypes(this$0)).filter(TypeToken.TypeFilter.IGNORE_TYPE_VARIABLE_OR_WILDCARD).toSet();
      types = localImmutableSet1;
    }
    return localImmutableSet1;
  }
  
  public TypeToken<T>.TypeSet interfaces()
  {
    return new TypeToken.InterfaceSet(this$0, this);
  }
  
  public Set<Class<? super T>> rawTypes()
  {
    return ImmutableSet.copyOf(TypeToken.TypeCollector.FOR_RAW_TYPE.collectTypes(TypeToken.access$200(this$0)));
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.TypeSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */