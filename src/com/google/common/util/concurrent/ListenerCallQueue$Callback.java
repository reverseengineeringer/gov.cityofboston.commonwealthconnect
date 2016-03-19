package com.google.common.util.concurrent;

import java.util.Iterator;

abstract class ListenerCallQueue$Callback<L>
{
  private final String methodCall;
  
  ListenerCallQueue$Callback(String paramString)
  {
    methodCall = paramString;
  }
  
  abstract void call(L paramL);
  
  void enqueueOn(Iterable<ListenerCallQueue<L>> paramIterable)
  {
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext()) {
      ((ListenerCallQueue)paramIterable.next()).add(this);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ListenerCallQueue.Callback
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */