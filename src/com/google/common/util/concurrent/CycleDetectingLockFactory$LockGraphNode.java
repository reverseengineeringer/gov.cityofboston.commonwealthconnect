package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.MapMaker;
import com.google.common.collect.Sets;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class CycleDetectingLockFactory$LockGraphNode
{
  final Map<LockGraphNode, CycleDetectingLockFactory.ExampleStackTrace> allowedPriorLocks = new MapMaker().weakKeys().makeMap();
  final Map<LockGraphNode, CycleDetectingLockFactory.PotentialDeadlockException> disallowedPriorLocks = new MapMaker().weakKeys().makeMap();
  final String lockName;
  
  CycleDetectingLockFactory$LockGraphNode(String paramString)
  {
    lockName = ((String)Preconditions.checkNotNull(paramString));
  }
  
  @Nullable
  private CycleDetectingLockFactory.ExampleStackTrace findPathTo(LockGraphNode paramLockGraphNode, Set<LockGraphNode> paramSet)
  {
    Object localObject;
    if (!paramSet.add(this)) {
      localObject = null;
    }
    CycleDetectingLockFactory.ExampleStackTrace localExampleStackTrace;
    do
    {
      return (CycleDetectingLockFactory.ExampleStackTrace)localObject;
      localExampleStackTrace = (CycleDetectingLockFactory.ExampleStackTrace)allowedPriorLocks.get(paramLockGraphNode);
      localObject = localExampleStackTrace;
    } while (localExampleStackTrace != null);
    Iterator localIterator = allowedPriorLocks.entrySet().iterator();
    while (localIterator.hasNext())
    {
      localObject = (Map.Entry)localIterator.next();
      LockGraphNode localLockGraphNode = (LockGraphNode)((Map.Entry)localObject).getKey();
      localExampleStackTrace = localLockGraphNode.findPathTo(paramLockGraphNode, paramSet);
      if (localExampleStackTrace != null)
      {
        paramLockGraphNode = new CycleDetectingLockFactory.ExampleStackTrace(localLockGraphNode, this);
        paramLockGraphNode.setStackTrace(((CycleDetectingLockFactory.ExampleStackTrace)((Map.Entry)localObject).getValue()).getStackTrace());
        paramLockGraphNode.initCause(localExampleStackTrace);
        return paramLockGraphNode;
      }
    }
    return null;
  }
  
  void checkAcquiredLock(CycleDetectingLockFactory.Policy paramPolicy, LockGraphNode paramLockGraphNode)
  {
    if (this != paramLockGraphNode) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "Attempted to acquire multiple locks with the same rank " + paramLockGraphNode.getLockName());
      if (!allowedPriorLocks.containsKey(paramLockGraphNode)) {
        break;
      }
      return;
    }
    Object localObject = (CycleDetectingLockFactory.PotentialDeadlockException)disallowedPriorLocks.get(paramLockGraphNode);
    if (localObject != null)
    {
      paramPolicy.handlePotentialDeadlock(new CycleDetectingLockFactory.PotentialDeadlockException(paramLockGraphNode, this, ((CycleDetectingLockFactory.PotentialDeadlockException)localObject).getConflictingStackTrace(), null));
      return;
    }
    localObject = paramLockGraphNode.findPathTo(this, Sets.newIdentityHashSet());
    if (localObject == null)
    {
      allowedPriorLocks.put(paramLockGraphNode, new CycleDetectingLockFactory.ExampleStackTrace(paramLockGraphNode, this));
      return;
    }
    localObject = new CycleDetectingLockFactory.PotentialDeadlockException(paramLockGraphNode, this, (CycleDetectingLockFactory.ExampleStackTrace)localObject, null);
    disallowedPriorLocks.put(paramLockGraphNode, localObject);
    paramPolicy.handlePotentialDeadlock((CycleDetectingLockFactory.PotentialDeadlockException)localObject);
  }
  
  void checkAcquiredLocks(CycleDetectingLockFactory.Policy paramPolicy, List<LockGraphNode> paramList)
  {
    int i = 0;
    int j = paramList.size();
    while (i < j)
    {
      checkAcquiredLock(paramPolicy, (LockGraphNode)paramList.get(i));
      i += 1;
    }
  }
  
  String getLockName()
  {
    return lockName;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.CycleDetectingLockFactory.LockGraphNode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */