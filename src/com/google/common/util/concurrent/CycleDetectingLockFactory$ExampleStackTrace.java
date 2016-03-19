package com.google.common.util.concurrent;

import com.google.common.collect.ImmutableSet;
import java.util.Arrays;
import java.util.Set;

class CycleDetectingLockFactory$ExampleStackTrace
  extends IllegalStateException
{
  static final StackTraceElement[] EMPTY_STACK_TRACE = new StackTraceElement[0];
  static Set<String> EXCLUDED_CLASS_NAMES = ImmutableSet.of(CycleDetectingLockFactory.class.getName(), ExampleStackTrace.class.getName(), CycleDetectingLockFactory.LockGraphNode.class.getName());
  
  CycleDetectingLockFactory$ExampleStackTrace(CycleDetectingLockFactory.LockGraphNode paramLockGraphNode1, CycleDetectingLockFactory.LockGraphNode paramLockGraphNode2)
  {
    super(paramLockGraphNode1.getLockName() + " -> " + paramLockGraphNode2.getLockName());
    paramLockGraphNode1 = getStackTrace();
    int i = 0;
    int j = paramLockGraphNode1.length;
    for (;;)
    {
      if (i < j)
      {
        if (CycleDetectingLockFactory.WithExplicitOrdering.class.getName().equals(paramLockGraphNode1[i].getClassName())) {
          setStackTrace(EMPTY_STACK_TRACE);
        }
      }
      else {
        return;
      }
      if (!EXCLUDED_CLASS_NAMES.contains(paramLockGraphNode1[i].getClassName()))
      {
        setStackTrace((StackTraceElement[])Arrays.copyOfRange(paramLockGraphNode1, i, j));
        return;
      }
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.ExampleStackTrace
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */