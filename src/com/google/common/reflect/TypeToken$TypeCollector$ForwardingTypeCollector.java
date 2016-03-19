package com.google.common.reflect;

class TypeToken$TypeCollector$ForwardingTypeCollector<K>
  extends TypeToken.TypeCollector<K>
{
  private final TypeToken.TypeCollector<K> delegate;
  
  TypeToken$TypeCollector$ForwardingTypeCollector(TypeToken.TypeCollector<K> paramTypeCollector)
  {
    super(null);
    delegate = paramTypeCollector;
  }
  
  Iterable<? extends K> getInterfaces(K paramK)
  {
    return delegate.getInterfaces(paramK);
  }
  
  Class<?> getRawType(K paramK)
  {
    return delegate.getRawType(paramK);
  }
  
  K getSuperclass(K paramK)
  {
    return (K)delegate.getSuperclass(paramK);
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.TypeCollector.ForwardingTypeCollector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */