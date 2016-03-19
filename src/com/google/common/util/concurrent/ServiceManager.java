package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Objects.ToStringHelper;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicates;
import com.google.common.base.Stopwatch;
import com.google.common.base.Supplier;
import com.google.common.collect.Collections2;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.google.common.collect.ImmutableMultimap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.ImmutableSetMultimap;
import com.google.common.collect.ImmutableSetMultimap.Builder;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimaps;
import com.google.common.collect.Multiset;
import com.google.common.collect.Ordering;
import com.google.common.collect.SetMultimap;
import com.google.common.collect.Sets;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.concurrent.GuardedBy;

@Beta
public final class ServiceManager
{
  private static final ListenerCallQueue.Callback<Listener> HEALTHY_CALLBACK = new ListenerCallQueue.Callback("healthy()")
  {
    void call(ServiceManager.Listener paramAnonymousListener)
    {
      paramAnonymousListener.healthy();
    }
  };
  private static final ListenerCallQueue.Callback<Listener> STOPPED_CALLBACK = new ListenerCallQueue.Callback("stopped()")
  {
    void call(ServiceManager.Listener paramAnonymousListener)
    {
      paramAnonymousListener.stopped();
    }
  };
  private static final Logger logger = Logger.getLogger(ServiceManager.class.getName());
  private final ImmutableList<Service> services;
  private final ServiceManagerState state;
  
  public ServiceManager(Iterable<? extends Service> paramIterable)
  {
    Object localObject = ImmutableList.copyOf(paramIterable);
    paramIterable = (Iterable<? extends Service>)localObject;
    if (((ImmutableList)localObject).isEmpty())
    {
      logger.log(Level.WARNING, "ServiceManager configured with no services.  Is your application configured properly?", new EmptyServiceManagerWarning(null));
      paramIterable = ImmutableList.of(new NoOpService(null));
    }
    state = new ServiceManagerState(paramIterable);
    services = paramIterable;
    localObject = new WeakReference(state);
    ListeningExecutorService localListeningExecutorService = MoreExecutors.sameThreadExecutor();
    paramIterable = paramIterable.iterator();
    if (paramIterable.hasNext())
    {
      Service localService = (Service)paramIterable.next();
      localService.addListener(new ServiceListener(localService, (WeakReference)localObject), localListeningExecutorService);
      if (localService.state() == Service.State.NEW) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "Can only manage NEW services, %s", new Object[] { localService });
        break;
      }
    }
    state.markReady();
  }
  
  public void addListener(Listener paramListener)
  {
    state.addListener(paramListener, MoreExecutors.sameThreadExecutor());
  }
  
  public void addListener(Listener paramListener, Executor paramExecutor)
  {
    state.addListener(paramListener, paramExecutor);
  }
  
  public void awaitHealthy()
  {
    state.awaitHealthy();
  }
  
  public void awaitHealthy(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    state.awaitHealthy(paramLong, paramTimeUnit);
  }
  
  public void awaitStopped()
  {
    state.awaitStopped();
  }
  
  public void awaitStopped(long paramLong, TimeUnit paramTimeUnit)
    throws TimeoutException
  {
    state.awaitStopped(paramLong, paramTimeUnit);
  }
  
  public boolean isHealthy()
  {
    Iterator localIterator = services.iterator();
    while (localIterator.hasNext()) {
      if (!((Service)localIterator.next()).isRunning()) {
        return false;
      }
    }
    return true;
  }
  
  public ImmutableMultimap<Service.State, Service> servicesByState()
  {
    return state.servicesByState();
  }
  
  public ServiceManager startAsync()
  {
    Iterator localIterator = services.iterator();
    Service localService;
    if (localIterator.hasNext())
    {
      localService = (Service)localIterator.next();
      Service.State localState = localService.state();
      if (localState == Service.State.NEW) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkState(bool, "Service %s is %s, cannot start it.", new Object[] { localService, localState });
        break;
      }
    }
    localIterator = services.iterator();
    while (localIterator.hasNext())
    {
      localService = (Service)localIterator.next();
      try
      {
        localService.startAsync();
      }
      catch (IllegalStateException localIllegalStateException)
      {
        logger.log(Level.WARNING, "Unable to start Service " + localService, localIllegalStateException);
      }
    }
    return this;
  }
  
  public ImmutableMap<Service, Long> startupTimes()
  {
    return state.startupTimes();
  }
  
  public ServiceManager stopAsync()
  {
    Iterator localIterator = services.iterator();
    while (localIterator.hasNext()) {
      ((Service)localIterator.next()).stopAsync();
    }
    return this;
  }
  
  public String toString()
  {
    return Objects.toStringHelper(ServiceManager.class).add("services", Collections2.filter(services, Predicates.not(Predicates.instanceOf(NoOpService.class)))).toString();
  }
  
  private static final class EmptyServiceManagerWarning
    extends Throwable
  {}
  
  @Beta
  public static abstract class Listener
  {
    public void failure(Service paramService) {}
    
    public void healthy() {}
    
    public void stopped() {}
  }
  
  private static final class NoOpService
    extends AbstractService
  {
    protected void doStart()
    {
      notifyStarted();
    }
    
    protected void doStop()
    {
      notifyStopped();
    }
  }
  
  private static final class ServiceListener
    extends Service.Listener
  {
    final Service service;
    final WeakReference<ServiceManager.ServiceManagerState> state;
    
    ServiceListener(Service paramService, WeakReference<ServiceManager.ServiceManagerState> paramWeakReference)
    {
      service = paramService;
      state = paramWeakReference;
    }
    
    public void failed(Service.State paramState, Throwable paramThrowable)
    {
      ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
      if (localServiceManagerState != null)
      {
        if (!(service instanceof ServiceManager.NoOpService)) {
          ServiceManager.logger.log(Level.SEVERE, "Service " + service + " has failed in the " + paramState + " state.", paramThrowable);
        }
        localServiceManagerState.transitionService(service, paramState, Service.State.FAILED);
      }
    }
    
    public void running()
    {
      ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
      if (localServiceManagerState != null) {
        localServiceManagerState.transitionService(service, Service.State.STARTING, Service.State.RUNNING);
      }
    }
    
    public void starting()
    {
      ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
      if (localServiceManagerState != null)
      {
        localServiceManagerState.transitionService(service, Service.State.NEW, Service.State.STARTING);
        if (!(service instanceof ServiceManager.NoOpService)) {
          ServiceManager.logger.log(Level.FINE, "Starting {0}.", service);
        }
      }
    }
    
    public void stopping(Service.State paramState)
    {
      ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
      if (localServiceManagerState != null) {
        localServiceManagerState.transitionService(service, paramState, Service.State.STOPPING);
      }
    }
    
    public void terminated(Service.State paramState)
    {
      ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
      if (localServiceManagerState != null)
      {
        if (!(service instanceof ServiceManager.NoOpService)) {
          ServiceManager.logger.log(Level.FINE, "Service {0} has terminated. Previous state was: {1}", new Object[] { service, paramState });
        }
        localServiceManagerState.transitionService(service, paramState, Service.State.TERMINATED);
      }
    }
  }
  
  private static final class ServiceManagerState
  {
    final Monitor.Guard awaitHealthGuard = new Monitor.Guard(monitor)
    {
      public boolean isSatisfied()
      {
        return (states.count(Service.State.RUNNING) == numberOfServices) || (states.contains(Service.State.STOPPING)) || (states.contains(Service.State.TERMINATED)) || (states.contains(Service.State.FAILED));
      }
    };
    @GuardedBy("monitor")
    final List<ListenerCallQueue<ServiceManager.Listener>> listeners = Collections.synchronizedList(new ArrayList());
    final Monitor monitor = new Monitor();
    final int numberOfServices;
    @GuardedBy("monitor")
    boolean ready;
    @GuardedBy("monitor")
    final SetMultimap<Service.State, Service> servicesByState = Multimaps.newSetMultimap(new EnumMap(Service.State.class), new Supplier()
    {
      public Set<Service> get()
      {
        return Sets.newLinkedHashSet();
      }
    });
    @GuardedBy("monitor")
    final Map<Service, Stopwatch> startupTimers = Maps.newIdentityHashMap();
    @GuardedBy("monitor")
    final Multiset<Service.State> states = servicesByState.keys();
    final Monitor.Guard stoppedGuard = new Monitor.Guard(monitor)
    {
      public boolean isSatisfied()
      {
        return states.count(Service.State.TERMINATED) + states.count(Service.State.FAILED) == numberOfServices;
      }
    };
    @GuardedBy("monitor")
    boolean transitioned;
    
    ServiceManagerState(ImmutableCollection<Service> paramImmutableCollection)
    {
      numberOfServices = paramImmutableCollection.size();
      servicesByState.putAll(Service.State.NEW, paramImmutableCollection);
      paramImmutableCollection = paramImmutableCollection.iterator();
      while (paramImmutableCollection.hasNext())
      {
        Service localService = (Service)paramImmutableCollection.next();
        startupTimers.put(localService, Stopwatch.createUnstarted());
      }
    }
    
    void addListener(ServiceManager.Listener paramListener, Executor paramExecutor)
    {
      Preconditions.checkNotNull(paramListener, "listener");
      Preconditions.checkNotNull(paramExecutor, "executor");
      monitor.enter();
      try
      {
        if (!stoppedGuard.isSatisfied()) {
          listeners.add(new ListenerCallQueue(paramListener, paramExecutor));
        }
        return;
      }
      finally
      {
        monitor.leave();
      }
    }
    
    void awaitHealthy()
    {
      monitor.enterWhenUninterruptibly(awaitHealthGuard);
      try
      {
        checkHealthy();
        return;
      }
      finally
      {
        monitor.leave();
      }
    }
    
    void awaitHealthy(long paramLong, TimeUnit paramTimeUnit)
      throws TimeoutException
    {
      monitor.enter();
      try
      {
        if (!monitor.waitForUninterruptibly(awaitHealthGuard, paramLong, paramTimeUnit)) {
          throw new TimeoutException("Timeout waiting for the services to become healthy. The following services have not started: " + Multimaps.filterKeys(servicesByState, Predicates.in(ImmutableSet.of(Service.State.NEW, Service.State.STARTING))));
        }
      }
      finally
      {
        monitor.leave();
      }
      checkHealthy();
      monitor.leave();
    }
    
    void awaitStopped()
    {
      monitor.enterWhenUninterruptibly(stoppedGuard);
      monitor.leave();
    }
    
    void awaitStopped(long paramLong, TimeUnit paramTimeUnit)
      throws TimeoutException
    {
      monitor.enter();
      try
      {
        if (!monitor.waitForUninterruptibly(stoppedGuard, paramLong, paramTimeUnit)) {
          throw new TimeoutException("Timeout waiting for the services to stop. The following services have not stopped: " + Multimaps.filterKeys(servicesByState, Predicates.not(Predicates.in(ImmutableSet.of(Service.State.TERMINATED, Service.State.FAILED)))));
        }
      }
      finally
      {
        monitor.leave();
      }
      monitor.leave();
    }
    
    @GuardedBy("monitor")
    void checkHealthy()
    {
      if (states.count(Service.State.RUNNING) != numberOfServices) {
        throw new IllegalStateException("Expected to be healthy after starting. The following services are not running: " + Multimaps.filterKeys(servicesByState, Predicates.not(Predicates.equalTo(Service.State.RUNNING))));
      }
    }
    
    void executeListeners()
    {
      if (!monitor.isOccupiedByCurrentThread()) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkState(bool, "It is incorrect to execute listeners with the monitor held.");
        int i = 0;
        while (i < listeners.size())
        {
          ((ListenerCallQueue)listeners.get(i)).execute();
          i += 1;
        }
      }
    }
    
    @GuardedBy("monitor")
    void fireFailedListeners(final Service paramService)
    {
      new ListenerCallQueue.Callback("failed({service=" + paramService + "})")
      {
        void call(ServiceManager.Listener paramAnonymousListener)
        {
          paramAnonymousListener.failure(paramService);
        }
      }.enqueueOn(listeners);
    }
    
    @GuardedBy("monitor")
    void fireHealthyListeners()
    {
      ServiceManager.HEALTHY_CALLBACK.enqueueOn(listeners);
    }
    
    @GuardedBy("monitor")
    void fireStoppedListeners()
    {
      ServiceManager.STOPPED_CALLBACK.enqueueOn(listeners);
    }
    
    void markReady()
    {
      monitor.enter();
      try
      {
        if (!transitioned)
        {
          ready = true;
          return;
        }
        ArrayList localArrayList = Lists.newArrayList();
        Iterator localIterator = servicesByState().values().iterator();
        while (localIterator.hasNext())
        {
          Service localService = (Service)localIterator.next();
          if (localService.state() != Service.State.NEW) {
            localArrayList.add(localService);
          }
        }
        throw new IllegalArgumentException("Services started transitioning asynchronously before the ServiceManager was constructed: " + localObject);
      }
      finally
      {
        monitor.leave();
      }
    }
    
    ImmutableMultimap<Service.State, Service> servicesByState()
    {
      ImmutableSetMultimap.Builder localBuilder = ImmutableSetMultimap.builder();
      monitor.enter();
      try
      {
        Iterator localIterator = servicesByState.entries().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          if (!(localEntry.getValue() instanceof ServiceManager.NoOpService)) {
            localBuilder.put(localEntry.getKey(), localEntry.getValue());
          }
        }
      }
      finally
      {
        monitor.leave();
      }
      return ((ImmutableSetMultimap.Builder)localObject).build();
    }
    
    ImmutableMap<Service, Long> startupTimes()
    {
      monitor.enter();
      try
      {
        ArrayList localArrayList = Lists.newArrayListWithCapacity(states.size() - states.count(Service.State.NEW) + states.count(Service.State.STARTING));
        localObject1 = startupTimers.entrySet().iterator();
        while (((Iterator)localObject1).hasNext())
        {
          Object localObject2 = (Map.Entry)((Iterator)localObject1).next();
          Service localService = (Service)((Map.Entry)localObject2).getKey();
          localObject2 = (Stopwatch)((Map.Entry)localObject2).getValue();
          if ((!((Stopwatch)localObject2).isRunning()) && (!servicesByState.containsEntry(Service.State.NEW, localService)) && (!(localService instanceof ServiceManager.NoOpService))) {
            localArrayList.add(Maps.immutableEntry(localService, Long.valueOf(((Stopwatch)localObject2).elapsed(TimeUnit.MILLISECONDS))));
          }
        }
      }
      finally
      {
        monitor.leave();
      }
      Collections.sort(localList, Ordering.natural().onResultOf(new Function()
      {
        public Long apply(Map.Entry<Service, Long> paramAnonymousEntry)
        {
          return (Long)paramAnonymousEntry.getValue();
        }
      }));
      Object localObject1 = ImmutableMap.builder();
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext()) {
        ((ImmutableMap.Builder)localObject1).put((Map.Entry)localIterator.next());
      }
      return ((ImmutableMap.Builder)localObject1).build();
    }
    
    /* Error */
    void transitionService(Service paramService, Service.State paramState1, Service.State paramState2)
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore 4
      //   3: aload_1
      //   4: invokestatic 446	com/google/common/base/Preconditions:checkNotNull	(Ljava/lang/Object;)Ljava/lang/Object;
      //   7: pop
      //   8: aload_2
      //   9: aload_3
      //   10: if_acmpeq +43 -> 53
      //   13: iload 4
      //   15: invokestatic 450	com/google/common/base/Preconditions:checkArgument	(Z)V
      //   18: aload_0
      //   19: getfield 51	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:monitor	Lcom/google/common/util/concurrent/Monitor;
      //   22: invokevirtual 165	com/google/common/util/concurrent/Monitor:enter	()V
      //   25: aload_0
      //   26: iconst_1
      //   27: putfield 316	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:transitioned	Z
      //   30: aload_0
      //   31: getfield 318	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:ready	Z
      //   34: istore 4
      //   36: iload 4
      //   38: ifne +21 -> 59
      //   41: aload_0
      //   42: getfield 51	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:monitor	Lcom/google/common/util/concurrent/Monitor;
      //   45: invokevirtual 184	com/google/common/util/concurrent/Monitor:leave	()V
      //   48: aload_0
      //   49: invokevirtual 452	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:executeListeners	()V
      //   52: return
      //   53: iconst_0
      //   54: istore 4
      //   56: goto -43 -> 13
      //   59: aload_0
      //   60: getfield 69	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:servicesByState	Lcom/google/common/collect/SetMultimap;
      //   63: aload_2
      //   64: aload_1
      //   65: invokeinterface 455 3 0
      //   70: ldc_w 457
      //   73: iconst_2
      //   74: anewarray 4	java/lang/Object
      //   77: dup
      //   78: iconst_0
      //   79: aload_1
      //   80: aastore
      //   81: dup
      //   82: iconst_1
      //   83: aload_2
      //   84: aastore
      //   85: invokestatic 460	com/google/common/base/Preconditions:checkState	(ZLjava/lang/String;[Ljava/lang/Object;)V
      //   88: aload_0
      //   89: getfield 69	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:servicesByState	Lcom/google/common/collect/SetMultimap;
      //   92: aload_3
      //   93: aload_1
      //   94: invokeinterface 462 3 0
      //   99: ldc_w 464
      //   102: iconst_2
      //   103: anewarray 4	java/lang/Object
      //   106: dup
      //   107: iconst_0
      //   108: aload_1
      //   109: aastore
      //   110: dup
      //   111: iconst_1
      //   112: aload_3
      //   113: aastore
      //   114: invokestatic 460	com/google/common/base/Preconditions:checkState	(ZLjava/lang/String;[Ljava/lang/Object;)V
      //   117: aload_0
      //   118: getfield 85	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:startupTimers	Ljava/util/Map;
      //   121: aload_1
      //   122: invokeinterface 466 2 0
      //   127: checkcast 138	com/google/common/base/Stopwatch
      //   130: astore 5
      //   132: aload_2
      //   133: getstatic 116	com/google/common/util/concurrent/Service$State:NEW	Lcom/google/common/util/concurrent/Service$State;
      //   136: if_acmpne +9 -> 145
      //   139: aload 5
      //   141: invokevirtual 469	com/google/common/base/Stopwatch:start	()Lcom/google/common/base/Stopwatch;
      //   144: pop
      //   145: aload_3
      //   146: getstatic 254	com/google/common/util/concurrent/Service$State:RUNNING	Lcom/google/common/util/concurrent/Service$State;
      //   149: invokevirtual 473	com/google/common/util/concurrent/Service$State:compareTo	(Ljava/lang/Enum;)I
      //   152: iflt +49 -> 201
      //   155: aload 5
      //   157: invokevirtual 388	com/google/common/base/Stopwatch:isRunning	()Z
      //   160: ifeq +41 -> 201
      //   163: aload 5
      //   165: invokevirtual 476	com/google/common/base/Stopwatch:stop	()Lcom/google/common/base/Stopwatch;
      //   168: pop
      //   169: aload_1
      //   170: instanceof 362
      //   173: ifne +28 -> 201
      //   176: invokestatic 480	com/google/common/util/concurrent/ServiceManager:access$200	()Ljava/util/logging/Logger;
      //   179: getstatic 486	java/util/logging/Level:FINE	Ljava/util/logging/Level;
      //   182: ldc_w 488
      //   185: iconst_2
      //   186: anewarray 4	java/lang/Object
      //   189: dup
      //   190: iconst_0
      //   191: aload_1
      //   192: aastore
      //   193: dup
      //   194: iconst_1
      //   195: aload 5
      //   197: aastore
      //   198: invokevirtual 494	java/util/logging/Logger:log	(Ljava/util/logging/Level;Ljava/lang/String;[Ljava/lang/Object;)V
      //   201: aload_3
      //   202: getstatic 247	com/google/common/util/concurrent/Service$State:FAILED	Lcom/google/common/util/concurrent/Service$State;
      //   205: if_acmpne +8 -> 213
      //   208: aload_0
      //   209: aload_1
      //   210: invokevirtual 496	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:fireFailedListeners	(Lcom/google/common/util/concurrent/Service;)V
      //   213: aload_0
      //   214: getfield 77	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:states	Lcom/google/common/collect/Multiset;
      //   217: getstatic 254	com/google/common/util/concurrent/Service$State:RUNNING	Lcom/google/common/util/concurrent/Service$State;
      //   220: invokeinterface 260 2 0
      //   225: aload_0
      //   226: getfield 112	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:numberOfServices	I
      //   229: if_icmpne +19 -> 248
      //   232: aload_0
      //   233: invokevirtual 498	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:fireHealthyListeners	()V
      //   236: aload_0
      //   237: getfield 51	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:monitor	Lcom/google/common/util/concurrent/Monitor;
      //   240: invokevirtual 184	com/google/common/util/concurrent/Monitor:leave	()V
      //   243: aload_0
      //   244: invokevirtual 452	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:executeListeners	()V
      //   247: return
      //   248: aload_0
      //   249: getfield 77	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:states	Lcom/google/common/collect/Multiset;
      //   252: getstatic 244	com/google/common/util/concurrent/Service$State:TERMINATED	Lcom/google/common/util/concurrent/Service$State;
      //   255: invokeinterface 260 2 0
      //   260: aload_0
      //   261: getfield 77	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:states	Lcom/google/common/collect/Multiset;
      //   264: getstatic 247	com/google/common/util/concurrent/Service$State:FAILED	Lcom/google/common/util/concurrent/Service$State;
      //   267: invokeinterface 260 2 0
      //   272: iadd
      //   273: aload_0
      //   274: getfield 112	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:numberOfServices	I
      //   277: if_icmpne -41 -> 236
      //   280: aload_0
      //   281: invokevirtual 500	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:fireStoppedListeners	()V
      //   284: goto -48 -> 236
      //   287: astore_1
      //   288: aload_0
      //   289: getfield 51	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:monitor	Lcom/google/common/util/concurrent/Monitor;
      //   292: invokevirtual 184	com/google/common/util/concurrent/Monitor:leave	()V
      //   295: aload_0
      //   296: invokevirtual 452	com/google/common/util/concurrent/ServiceManager$ServiceManagerState:executeListeners	()V
      //   299: aload_1
      //   300: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	301	0	this	ServiceManagerState
      //   0	301	1	paramService	Service
      //   0	301	2	paramState1	Service.State
      //   0	301	3	paramState2	Service.State
      //   1	54	4	bool	boolean
      //   130	66	5	localStopwatch	Stopwatch
      // Exception table:
      //   from	to	target	type
      //   25	36	287	finally
      //   59	145	287	finally
      //   145	201	287	finally
      //   201	213	287	finally
      //   213	236	287	finally
      //   248	284	287	finally
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */