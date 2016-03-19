package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
abstract class ImmutableMapEntrySet<K, V>
  extends ImmutableSet<Map.Entry<K, V>>
{
  public boolean contains(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      Object localObject = map().get(((Map.Entry)paramObject).getKey());
      bool1 = bool2;
      if (localObject != null)
      {
        bool1 = bool2;
        if (localObject.equals(((Map.Entry)paramObject).getValue())) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  boolean isPartialView()
  {
    return map().isPartialView();
  }
  
  abstract ImmutableMap<K, V> map();
  
  public int size()
  {
    return map().size();
  }
  
  @GwtIncompatible("serialization")
  Object writeReplace()
  {
    return new EntrySetSerializedForm(map());
  }
  
  @GwtIncompatible("serialization")
  private static class EntrySetSerializedForm<K, V>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final ImmutableMap<K, V> map;
    
    EntrySetSerializedForm(ImmutableMap<K, V> paramImmutableMap)
    {
      map = paramImmutableMap;
    }
    
    Object readResolve()
    {
      return map.entrySet();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapEntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */