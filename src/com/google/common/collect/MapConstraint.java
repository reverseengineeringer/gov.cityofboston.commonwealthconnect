package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public abstract interface MapConstraint<K, V>
{
  public abstract void checkKeyValue(@Nullable K paramK, @Nullable V paramV);
  
  public abstract String toString();
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraint
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */