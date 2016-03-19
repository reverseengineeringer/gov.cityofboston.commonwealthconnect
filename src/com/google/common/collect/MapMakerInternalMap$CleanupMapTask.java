package com.google.common.collect;

import java.lang.ref.WeakReference;
import java.util.concurrent.CancellationException;

final class MapMakerInternalMap$CleanupMapTask
  implements Runnable
{
  final WeakReference<MapMakerInternalMap<?, ?>> mapReference;
  
  public MapMakerInternalMap$CleanupMapTask(MapMakerInternalMap<?, ?> paramMapMakerInternalMap)
  {
    mapReference = new WeakReference(paramMapMakerInternalMap);
  }
  
  public void run()
  {
    Object localObject = (MapMakerInternalMap)mapReference.get();
    if (localObject == null) {
      throw new CancellationException();
    }
    localObject = segments;
    int j = localObject.length;
    int i = 0;
    while (i < j)
    {
      localObject[i].runCleanup();
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapMakerInternalMap.CleanupMapTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */