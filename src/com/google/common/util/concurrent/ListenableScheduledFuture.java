package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import java.util.concurrent.ScheduledFuture;

@Beta
public abstract interface ListenableScheduledFuture<V>
  extends ScheduledFuture<V>, ListenableFuture<V>
{}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ListenableScheduledFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */