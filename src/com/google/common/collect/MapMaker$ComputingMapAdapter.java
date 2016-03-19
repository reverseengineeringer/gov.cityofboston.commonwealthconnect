package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Throwables;
import java.io.Serializable;
import java.util.concurrent.ExecutionException;

final class MapMaker$ComputingMapAdapter<K, V>
  extends ComputingConcurrentHashMap<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  
  MapMaker$ComputingMapAdapter(MapMaker paramMapMaker, Function<? super K, ? extends V> paramFunction)
  {
    super(paramMapMaker, paramFunction);
  }
  
  public V get(Object paramObject)
  {
    Object localObject;
    try
    {
      localObject = getOrCompute(paramObject);
      if (localObject == null) {
        throw new NullPointerException(computingFunction + " returned null for key " + paramObject + ".");
      }
    }
    catch (ExecutionException paramObject)
    {
      paramObject = ((ExecutionException)paramObject).getCause();
      Throwables.propagateIfInstanceOf((Throwable)paramObject, ComputationException.class);
      throw new ComputationException((Throwable)paramObject);
    }
    return (V)localObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapMaker.ComputingMapAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */