package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import javax.annotation.Nullable;

class Synchronized$SynchronizedObject
  implements Serializable
{
  @GwtIncompatible("not needed in emulated source")
  private static final long serialVersionUID = 0L;
  final Object delegate;
  final Object mutex;
  
  Synchronized$SynchronizedObject(Object paramObject1, @Nullable Object paramObject2)
  {
    delegate = Preconditions.checkNotNull(paramObject1);
    paramObject1 = paramObject2;
    if (paramObject2 == null) {
      paramObject1 = this;
    }
    mutex = paramObject1;
  }
  
  @GwtIncompatible("java.io.ObjectOutputStream")
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    synchronized (mutex)
    {
      paramObjectOutputStream.defaultWriteObject();
      return;
    }
  }
  
  Object delegate()
  {
    return delegate;
  }
  
  public String toString()
  {
    synchronized (mutex)
    {
      String str = delegate.toString();
      return str;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedObject
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */