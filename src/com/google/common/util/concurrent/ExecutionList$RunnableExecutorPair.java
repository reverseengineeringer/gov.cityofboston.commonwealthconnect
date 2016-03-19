package com.google.common.util.concurrent;

import java.util.concurrent.Executor;
import javax.annotation.Nullable;

final class ExecutionList$RunnableExecutorPair
{
  final Executor executor;
  @Nullable
  RunnableExecutorPair next;
  final Runnable runnable;
  
  ExecutionList$RunnableExecutorPair(Runnable paramRunnable, Executor paramExecutor, RunnableExecutorPair paramRunnableExecutorPair)
  {
    runnable = paramRunnable;
    executor = paramExecutor;
    next = paramRunnableExecutorPair;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ExecutionList.RunnableExecutorPair
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */