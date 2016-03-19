package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

@Immutable
final class AbstractService$StateSnapshot
{
  @Nullable
  final Throwable failure;
  final boolean shutdownWhenStartupFinishes;
  final Service.State state;
  
  AbstractService$StateSnapshot(Service.State paramState)
  {
    this(paramState, false, null);
  }
  
  AbstractService$StateSnapshot(Service.State paramState, boolean paramBoolean, @Nullable Throwable paramThrowable)
  {
    int i;
    label40:
    int j;
    if ((!paramBoolean) || (paramState == Service.State.STARTING))
    {
      bool = true;
      Preconditions.checkArgument(bool, "shudownWhenStartupFinishes can only be set if state is STARTING. Got %s instead.", new Object[] { paramState });
      if (paramThrowable == null) {
        break label102;
      }
      i = 1;
      if (paramState != Service.State.FAILED) {
        break label108;
      }
      j = 1;
      label50:
      if ((i ^ j) != 0) {
        break label114;
      }
    }
    label102:
    label108:
    label114:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "A failure cause should be set if and only if the state is failed.  Got %s and %s instead.", new Object[] { paramState, paramThrowable });
      state = paramState;
      shutdownWhenStartupFinishes = paramBoolean;
      failure = paramThrowable;
      return;
      bool = false;
      break;
      i = 0;
      break label40;
      j = 0;
      break label50;
    }
  }
  
  Service.State externalState()
  {
    if ((shutdownWhenStartupFinishes) && (state == Service.State.STARTING)) {
      return Service.State.STOPPING;
    }
    return state;
  }
  
  Throwable failureCause()
  {
    if (state == Service.State.FAILED) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "failureCause() is only valid if the service has failed, service is %s", new Object[] { state });
      return failure;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService.StateSnapshot
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */