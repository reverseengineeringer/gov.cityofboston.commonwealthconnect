.class public Lcom/squareup/otto/Bus;
.super Ljava/lang/Object;
.source "Bus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/otto/Bus$EventWithHandler;
    }
.end annotation


# static fields
.field public static final DEFAULT_IDENTIFIER:Ljava/lang/String; = "default"


# instance fields
.field private final enforcer:Lcom/squareup/otto/ThreadEnforcer;

.field private final eventsToDispatch:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/squareup/otto/Bus$EventWithHandler;",
            ">;>;"
        }
    .end annotation
.end field

.field private final flattenHierarchyCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;>;"
        }
    .end annotation
.end field

.field private final handlerFinder:Lcom/squareup/otto/HandlerFinder;

.field private final handlersByType:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/squareup/otto/EventHandler;",
            ">;>;"
        }
    .end annotation
.end field

.field private final identifier:Ljava/lang/String;

.field private final isDispatching:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final producersByType:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/squareup/otto/EventProducer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 125
    const-string/jumbo v0, "default"

    invoke-direct {p0, v0}, Lcom/squareup/otto/Bus;-><init>(Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public constructor <init>(Lcom/squareup/otto/ThreadEnforcer;)V
    .locals 1
    .param p1, "enforcer"    # Lcom/squareup/otto/ThreadEnforcer;

    .prologue
    .line 143
    const-string/jumbo v0, "default"

    invoke-direct {p0, p1, v0}, Lcom/squareup/otto/Bus;-><init>(Lcom/squareup/otto/ThreadEnforcer;Ljava/lang/String;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Lcom/squareup/otto/ThreadEnforcer;Ljava/lang/String;)V
    .locals 1
    .param p1, "enforcer"    # Lcom/squareup/otto/ThreadEnforcer;
    .param p2, "identifier"    # Ljava/lang/String;

    .prologue
    .line 153
    sget-object v0, Lcom/squareup/otto/HandlerFinder;->ANNOTATED:Lcom/squareup/otto/HandlerFinder;

    invoke-direct {p0, p1, p2, v0}, Lcom/squareup/otto/Bus;-><init>(Lcom/squareup/otto/ThreadEnforcer;Ljava/lang/String;Lcom/squareup/otto/HandlerFinder;)V

    .line 154
    return-void
.end method

.method constructor <init>(Lcom/squareup/otto/ThreadEnforcer;Ljava/lang/String;Lcom/squareup/otto/HandlerFinder;)V
    .locals 1
    .param p1, "enforcer"    # Lcom/squareup/otto/ThreadEnforcer;
    .param p2, "identifier"    # Ljava/lang/String;
    .param p3, "handlerFinder"    # Lcom/squareup/otto/HandlerFinder;

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/squareup/otto/Bus;->handlersByType:Ljava/util/concurrent/ConcurrentMap;

    .line 96
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/squareup/otto/Bus;->producersByType:Ljava/util/concurrent/ConcurrentMap;

    .line 109
    new-instance v0, Lcom/squareup/otto/Bus$1;

    invoke-direct {v0, p0}, Lcom/squareup/otto/Bus$1;-><init>(Lcom/squareup/otto/Bus;)V

    iput-object v0, p0, Lcom/squareup/otto/Bus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    .line 117
    new-instance v0, Lcom/squareup/otto/Bus$2;

    invoke-direct {v0, p0}, Lcom/squareup/otto/Bus$2;-><init>(Lcom/squareup/otto/Bus;)V

    iput-object v0, p0, Lcom/squareup/otto/Bus;->isDispatching:Ljava/lang/ThreadLocal;

    .line 462
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/squareup/otto/Bus;->flattenHierarchyCache:Ljava/util/Map;

    .line 164
    iput-object p1, p0, Lcom/squareup/otto/Bus;->enforcer:Lcom/squareup/otto/ThreadEnforcer;

    .line 165
    iput-object p2, p0, Lcom/squareup/otto/Bus;->identifier:Ljava/lang/String;

    .line 166
    iput-object p3, p0, Lcom/squareup/otto/Bus;->handlerFinder:Lcom/squareup/otto/HandlerFinder;

    .line 167
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 134
    sget-object v0, Lcom/squareup/otto/ThreadEnforcer;->MAIN:Lcom/squareup/otto/ThreadEnforcer;

    invoke-direct {p0, v0, p1}, Lcom/squareup/otto/Bus;-><init>(Lcom/squareup/otto/ThreadEnforcer;Ljava/lang/String;)V

    .line 135
    return-void
.end method

.method private dispatchProducerResultToHandler(Lcom/squareup/otto/EventHandler;Lcom/squareup/otto/EventProducer;)V
    .locals 4
    .param p1, "handler"    # Lcom/squareup/otto/EventHandler;
    .param p2, "producer"    # Lcom/squareup/otto/EventProducer;

    .prologue
    .line 243
    const/4 v1, 0x0

    .line 245
    .local v1, "event":Ljava/lang/Object;
    :try_start_0
    invoke-virtual {p2}, Lcom/squareup/otto/EventProducer;->produceEvent()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 249
    .end local v1    # "event":Ljava/lang/Object;
    :goto_0
    if-nez v1, :cond_0

    .line 253
    :goto_1
    return-void

    .line 246
    .restart local v1    # "event":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 247
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Producer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " threw an exception."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/squareup/otto/Bus;->throwRuntimeException(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V

    goto :goto_0

    .line 252
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v1    # "event":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0, v1, p1}, Lcom/squareup/otto/Bus;->dispatch(Ljava/lang/Object;Lcom/squareup/otto/EventHandler;)V

    goto :goto_1
.end method

.method private getClassesFor(Ljava/lang/Class;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 431
    .local p1, "concreteClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 432
    .local v3, "parents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 434
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 436
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 437
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 438
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 440
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    .line 441
    .local v2, "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v2, :cond_0

    .line 442
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 445
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "parent":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    return-object v0
.end method

.method private static throwRuntimeException(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V
    .locals 2
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/reflect/InvocationTargetException;

    .prologue
    .line 454
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 455
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    .line 456
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 458
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected dispatch(Ljava/lang/Object;Lcom/squareup/otto/EventHandler;)V
    .locals 3
    .param p1, "event"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lcom/squareup/otto/EventHandler;

    .prologue
    .line 384
    :try_start_0
    invoke-virtual {p2, p1}, Lcom/squareup/otto/EventHandler;->handleEvent(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 389
    :goto_0
    return-void

    .line 385
    :catch_0
    move-exception v0

    .line 386
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Could not dispatch event: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " to handler "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/squareup/otto/Bus;->throwRuntimeException(Ljava/lang/String;Ljava/lang/reflect/InvocationTargetException;)V

    goto :goto_0
.end method

.method protected dispatchQueuedEvents()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 354
    iget-object v1, p0, Lcom/squareup/otto/Bus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 373
    :goto_0
    return-void

    .line 358
    :cond_0
    iget-object v1, p0, Lcom/squareup/otto/Bus;->isDispatching:Ljava/lang/ThreadLocal;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 361
    :cond_1
    :goto_1
    :try_start_0
    iget-object v1, p0, Lcom/squareup/otto/Bus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/otto/Bus$EventWithHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 362
    .local v0, "eventWithHandler":Lcom/squareup/otto/Bus$EventWithHandler;
    if-nez v0, :cond_2

    .line 371
    iget-object v1, p0, Lcom/squareup/otto/Bus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_0

    .line 366
    :cond_2
    :try_start_1
    iget-object v1, v0, Lcom/squareup/otto/Bus$EventWithHandler;->handler:Lcom/squareup/otto/EventHandler;

    invoke-virtual {v1}, Lcom/squareup/otto/EventHandler;->isValid()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 367
    iget-object v1, v0, Lcom/squareup/otto/Bus$EventWithHandler;->event:Ljava/lang/Object;

    iget-object v2, v0, Lcom/squareup/otto/Bus$EventWithHandler;->handler:Lcom/squareup/otto/EventHandler;

    invoke-virtual {p0, v1, v2}, Lcom/squareup/otto/Bus;->dispatch(Ljava/lang/Object;Lcom/squareup/otto/EventHandler;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 371
    .end local v0    # "eventWithHandler":Lcom/squareup/otto/Bus$EventWithHandler;
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/squareup/otto/Bus;->isDispatching:Ljava/lang/ThreadLocal;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v1
.end method

.method protected enqueueEvent(Ljava/lang/Object;Lcom/squareup/otto/EventHandler;)V
    .locals 2
    .param p1, "event"    # Ljava/lang/Object;
    .param p2, "handler"    # Lcom/squareup/otto/EventHandler;

    .prologue
    .line 344
    iget-object v0, p0, Lcom/squareup/otto/Bus;->eventsToDispatch:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v1, Lcom/squareup/otto/Bus$EventWithHandler;

    invoke-direct {v1, p1, p2}, Lcom/squareup/otto/Bus$EventWithHandler;-><init>(Ljava/lang/Object;Lcom/squareup/otto/EventHandler;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 345
    return-void
.end method

.method flattenHierarchy(Ljava/lang/Class;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 421
    .local p1, "concreteClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Lcom/squareup/otto/Bus;->flattenHierarchyCache:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 422
    .local v0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    if-nez v0, :cond_0

    .line 423
    invoke-direct {p0, p1}, Lcom/squareup/otto/Bus;->getClassesFor(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    .line 424
    iget-object v1, p0, Lcom/squareup/otto/Bus;->flattenHierarchyCache:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    :cond_0
    return-object v0
.end method

.method getHandlersForEventType(Ljava/lang/Class;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Set",
            "<",
            "Lcom/squareup/otto/EventHandler;",
            ">;"
        }
    .end annotation

    .prologue
    .line 410
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/squareup/otto/Bus;->handlersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method getProducerForEventType(Ljava/lang/Class;)Lcom/squareup/otto/EventProducer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/squareup/otto/EventProducer;"
        }
    .end annotation

    .prologue
    .line 399
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/squareup/otto/Bus;->producersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/otto/EventProducer;

    return-object v0
.end method

.method public post(Ljava/lang/Object;)V
    .locals 9
    .param p1, "event"    # Ljava/lang/Object;

    .prologue
    .line 313
    if-nez p1, :cond_0

    .line 314
    new-instance v7, Ljava/lang/NullPointerException;

    const-string/jumbo v8, "Event to post must not be null."

    invoke-direct {v7, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 316
    :cond_0
    iget-object v7, p0, Lcom/squareup/otto/Bus;->enforcer:Lcom/squareup/otto/ThreadEnforcer;

    invoke-interface {v7, p0}, Lcom/squareup/otto/ThreadEnforcer;->enforce(Lcom/squareup/otto/Bus;)V

    .line 318
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/squareup/otto/Bus;->flattenHierarchy(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    .line 320
    .local v0, "dispatchTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    const/4 v1, 0x0

    .line 321
    .local v1, "dispatched":Z
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 322
    .local v2, "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, v2}, Lcom/squareup/otto/Bus;->getHandlersForEventType(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v6

    .line 324
    .local v6, "wrappers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    if-eqz v6, :cond_1

    invoke-interface {v6}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 325
    const/4 v1, 0x1

    .line 326
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/squareup/otto/EventHandler;

    .line 327
    .local v5, "wrapper":Lcom/squareup/otto/EventHandler;
    invoke-virtual {p0, p1, v5}, Lcom/squareup/otto/Bus;->enqueueEvent(Ljava/lang/Object;Lcom/squareup/otto/EventHandler;)V

    goto :goto_0

    .line 332
    .end local v2    # "eventType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "wrapper":Lcom/squareup/otto/EventHandler;
    .end local v6    # "wrappers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    :cond_2
    if-nez v1, :cond_3

    instance-of v7, p1, Lcom/squareup/otto/DeadEvent;

    if-nez v7, :cond_3

    .line 333
    new-instance v7, Lcom/squareup/otto/DeadEvent;

    invoke-direct {v7, p0, p1}, Lcom/squareup/otto/DeadEvent;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v7}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 336
    :cond_3
    invoke-virtual {p0}, Lcom/squareup/otto/Bus;->dispatchQueuedEvents()V

    .line 337
    return-void
.end method

.method public register(Ljava/lang/Object;)V
    .locals 17
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 186
    if-nez p1, :cond_0

    .line 187
    new-instance v14, Ljava/lang/NullPointerException;

    const-string/jumbo v15, "Object to register must not be null."

    invoke-direct {v14, v15}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 189
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->enforcer:Lcom/squareup/otto/ThreadEnforcer;

    move-object/from16 v0, p0

    invoke-interface {v14, v0}, Lcom/squareup/otto/ThreadEnforcer;->enforce(Lcom/squareup/otto/Bus;)V

    .line 191
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->handlerFinder:Lcom/squareup/otto/HandlerFinder;

    move-object/from16 v0, p1

    invoke-interface {v14, v0}, Lcom/squareup/otto/HandlerFinder;->findAllProducers(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    .line 192
    .local v5, "foundProducers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lcom/squareup/otto/EventProducer;>;"
    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Class;

    .line 194
    .local v13, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v5, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/squareup/otto/EventProducer;

    .line 195
    .local v12, "producer":Lcom/squareup/otto/EventProducer;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->producersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v14, v13, v12}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/squareup/otto/EventProducer;

    .line 197
    .local v11, "previousProducer":Lcom/squareup/otto/EventProducer;
    if-eqz v11, :cond_2

    .line 198
    new-instance v14, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Producer method for type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " found on type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    iget-object v0, v12, Lcom/squareup/otto/EventProducer;->target:Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ", but already registered by type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    iget-object v0, v11, Lcom/squareup/otto/EventProducer;->target:Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 202
    :cond_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->handlersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v14, v13}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Set;

    .line 203
    .local v7, "handlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    if-eqz v7, :cond_1

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_1

    .line 204
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/squareup/otto/EventHandler;

    .line 205
    .local v6, "handler":Lcom/squareup/otto/EventHandler;
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v12}, Lcom/squareup/otto/Bus;->dispatchProducerResultToHandler(Lcom/squareup/otto/EventHandler;Lcom/squareup/otto/EventProducer;)V

    goto :goto_0

    .line 210
    .end local v6    # "handler":Lcom/squareup/otto/EventHandler;
    .end local v7    # "handlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "previousProducer":Lcom/squareup/otto/EventProducer;
    .end local v12    # "producer":Lcom/squareup/otto/EventProducer;
    .end local v13    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->handlerFinder:Lcom/squareup/otto/HandlerFinder;

    move-object/from16 v0, p1

    invoke-interface {v14, v0}, Lcom/squareup/otto/HandlerFinder;->findAllSubscribers(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v4

    .line 211
    .local v4, "foundHandlersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;>;"
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Class;

    .line 212
    .restart local v13    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->handlersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v14, v13}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Set;

    .line 213
    .restart local v7    # "handlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    if-nez v7, :cond_4

    .line 215
    new-instance v8, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v8}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 216
    .local v8, "handlersCreation":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->handlersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v14, v13, v8}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "handlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    check-cast v7, Ljava/util/Set;

    .line 217
    .restart local v7    # "handlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    if-nez v7, :cond_4

    .line 218
    move-object v7, v8

    .line 221
    .end local v8    # "handlersCreation":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    :cond_4
    invoke-interface {v4, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 222
    .local v3, "foundHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    invoke-interface {v7, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 225
    .end local v3    # "foundHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    .end local v7    # "handlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    .end local v13    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_5
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .end local v9    # "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 226
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Class;

    .line 227
    .restart local v13    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/squareup/otto/Bus;->producersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v14, v13}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/squareup/otto/EventProducer;

    .line 228
    .restart local v12    # "producer":Lcom/squareup/otto/EventProducer;
    if-eqz v12, :cond_6

    invoke-virtual {v12}, Lcom/squareup/otto/EventProducer;->isValid()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 229
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 230
    .restart local v3    # "foundHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_7
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/otto/EventHandler;

    .line 231
    .local v2, "foundHandler":Lcom/squareup/otto/EventHandler;
    invoke-virtual {v12}, Lcom/squareup/otto/EventProducer;->isValid()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 234
    invoke-virtual {v2}, Lcom/squareup/otto/EventHandler;->isValid()Z

    move-result v14

    if-eqz v14, :cond_7

    .line 235
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v12}, Lcom/squareup/otto/Bus;->dispatchProducerResultToHandler(Lcom/squareup/otto/EventHandler;Lcom/squareup/otto/EventProducer;)V

    goto :goto_2

    .line 240
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;>;"
    .end local v2    # "foundHandler":Lcom/squareup/otto/EventHandler;
    .end local v3    # "foundHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v12    # "producer":Lcom/squareup/otto/EventProducer;
    .end local v13    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_8
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 170
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[Bus \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/otto/Bus;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\"]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unregister(Ljava/lang/Object;)V
    .locals 16
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 263
    if-nez p1, :cond_0

    .line 264
    new-instance v13, Ljava/lang/NullPointerException;

    const-string/jumbo v14, "Object to unregister must not be null."

    invoke-direct {v13, v14}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 266
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/squareup/otto/Bus;->enforcer:Lcom/squareup/otto/ThreadEnforcer;

    move-object/from16 v0, p0

    invoke-interface {v13, v0}, Lcom/squareup/otto/ThreadEnforcer;->enforce(Lcom/squareup/otto/Bus;)V

    .line 268
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/squareup/otto/Bus;->handlerFinder:Lcom/squareup/otto/HandlerFinder;

    move-object/from16 v0, p1

    invoke-interface {v13, v0}, Lcom/squareup/otto/HandlerFinder;->findAllProducers(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v11

    .line 269
    .local v11, "producersInListener":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Lcom/squareup/otto/EventProducer;>;"
    invoke-interface {v11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 270
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Lcom/squareup/otto/EventProducer;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Class;

    .line 271
    .local v9, "key":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/squareup/otto/Bus;->getProducerForEventType(Ljava/lang/Class;)Lcom/squareup/otto/EventProducer;

    move-result-object v10

    .line 272
    .local v10, "producer":Lcom/squareup/otto/EventProducer;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/squareup/otto/EventProducer;

    .line 274
    .local v12, "value":Lcom/squareup/otto/EventProducer;
    if-eqz v12, :cond_1

    invoke-virtual {v12, v10}, Lcom/squareup/otto/EventProducer;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 275
    :cond_1
    new-instance v13, Ljava/lang/IllegalArgumentException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Missing event producer for an annotated method. Is "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, " registered?"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 279
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/squareup/otto/Bus;->producersByType:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v13, v9}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/squareup/otto/EventProducer;

    invoke-virtual {v13}, Lcom/squareup/otto/EventProducer;->invalidate()V

    goto :goto_0

    .line 282
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Lcom/squareup/otto/EventProducer;>;"
    .end local v9    # "key":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "producer":Lcom/squareup/otto/EventProducer;
    .end local v12    # "value":Lcom/squareup/otto/EventProducer;
    :cond_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/squareup/otto/Bus;->handlerFinder:Lcom/squareup/otto/HandlerFinder;

    move-object/from16 v0, p1

    invoke-interface {v13, v0}, Lcom/squareup/otto/HandlerFinder;->findAllSubscribers(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v6

    .line 283
    .local v6, "handlersInListener":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;>;"
    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .end local v7    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 284
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Class;

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/squareup/otto/Bus;->getHandlersForEventType(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v1

    .line 285
    .local v1, "currentHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    .line 287
    .local v4, "eventMethodsInListener":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/squareup/otto/EventHandler;>;"
    if-eqz v1, :cond_4

    invoke-interface {v1, v4}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 288
    :cond_4
    new-instance v13, Ljava/lang/IllegalArgumentException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Missing event handler for an annotated method. Is "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, " registered?"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 293
    :cond_5
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/squareup/otto/EventHandler;

    .line 294
    .local v5, "handler":Lcom/squareup/otto/EventHandler;
    invoke-interface {v4, v5}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 295
    invoke-virtual {v5}, Lcom/squareup/otto/EventHandler;->invalidate()V

    goto :goto_2

    .line 298
    .end local v5    # "handler":Lcom/squareup/otto/EventHandler;
    :cond_7
    invoke-interface {v1, v4}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 300
    .end local v1    # "currentHandlers":Ljava/util/Set;, "Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;"
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/util/Set<Lcom/squareup/otto/EventHandler;>;>;"
    .end local v4    # "eventMethodsInListener":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/squareup/otto/EventHandler;>;"
    .end local v8    # "i$":Ljava/util/Iterator;
    :cond_8
    return-void
.end method
