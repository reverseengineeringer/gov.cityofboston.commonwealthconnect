.class Ldagger/internal/Linker$SingletonBinding;
.super Ldagger/internal/Binding;
.source "Linker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ldagger/internal/Linker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SingletonBinding"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ldagger/internal/Binding",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final binding:Ldagger/internal/Binding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ldagger/internal/Binding",
            "<TT;>;"
        }
    .end annotation
.end field

.field private volatile onlyInstance:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ldagger/internal/Binding;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ldagger/internal/Binding",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 352
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    .local p1, "binding":Ldagger/internal/Binding;, "Ldagger/internal/Binding<TT;>;"
    iget-object v0, p1, Ldagger/internal/Binding;->provideKey:Ljava/lang/String;

    iget-object v1, p1, Ldagger/internal/Binding;->membersKey:Ljava/lang/String;

    const/4 v2, 0x1

    iget-object v3, p1, Ldagger/internal/Binding;->requiredBy:Ljava/lang/Object;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 349
    # getter for: Ldagger/internal/Linker;->UNINITIALIZED:Ljava/lang/Object;
    invoke-static {}, Ldagger/internal/Linker;->access$200()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->onlyInstance:Ljava/lang/Object;

    .line 353
    iput-object p1, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    .line 354
    return-void
.end method

.method synthetic constructor <init>(Ldagger/internal/Binding;Ldagger/internal/Linker$1;)V
    .locals 0
    .param p1, "x0"    # Ldagger/internal/Binding;
    .param p2, "x1"    # Ldagger/internal/Linker$1;

    .prologue
    .line 347
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    invoke-direct {p0, p1}, Ldagger/internal/Linker$SingletonBinding;-><init>(Ldagger/internal/Binding;)V

    return-void
.end method


# virtual methods
.method public attach(Ldagger/internal/Linker;)V
    .locals 1
    .param p1, "linker"    # Ldagger/internal/Linker;

    .prologue
    .line 357
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->attach(Ldagger/internal/Linker;)V

    .line 358
    return-void
.end method

.method public dependedOn()Z
    .locals 1

    .prologue
    .line 397
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->dependedOn()Z

    move-result v0

    return v0
.end method

.method public get()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 366
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->onlyInstance:Ljava/lang/Object;

    # getter for: Ldagger/internal/Linker;->UNINITIALIZED:Ljava/lang/Object;
    invoke-static {}, Ldagger/internal/Linker;->access$200()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 367
    monitor-enter p0

    .line 368
    :try_start_0
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->onlyInstance:Ljava/lang/Object;

    # getter for: Ldagger/internal/Linker;->UNINITIALIZED:Ljava/lang/Object;
    invoke-static {}, Ldagger/internal/Linker;->access$200()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 369
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->get()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->onlyInstance:Ljava/lang/Object;

    .line 371
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 373
    :cond_1
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->onlyInstance:Ljava/lang/Object;

    return-object v0

    .line 371
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public getDependencies(Ljava/util/Set;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ldagger/internal/Binding",
            "<*>;>;",
            "Ljava/util/Set",
            "<",
            "Ldagger/internal/Binding",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 377
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    .local p1, "get":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    .local p2, "injectMembers":Ljava/util/Set;, "Ljava/util/Set<Ldagger/internal/Binding<*>;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0, p1, p2}, Ldagger/internal/Binding;->getDependencies(Ljava/util/Set;Ljava/util/Set;)V

    .line 378
    return-void
.end method

.method public injectMembers(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 361
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->injectMembers(Ljava/lang/Object;)V

    .line 362
    return-void
.end method

.method public isCycleFree()Z
    .locals 1

    .prologue
    .line 381
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->isCycleFree()Z

    move-result v0

    return v0
.end method

.method public isLinked()Z
    .locals 1

    .prologue
    .line 385
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->isLinked()Z

    move-result v0

    return v0
.end method

.method protected isSingleton()Z
    .locals 1

    .prologue
    .line 417
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public isVisiting()Z
    .locals 1

    .prologue
    .line 389
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->isVisiting()Z

    move-result v0

    return v0
.end method

.method public library()Z
    .locals 1

    .prologue
    .line 393
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->library()Z

    move-result v0

    return v0
.end method

.method public setCycleFree(Z)V
    .locals 1
    .param p1, "cycleFree"    # Z

    .prologue
    .line 401
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->setCycleFree(Z)V

    .line 402
    return-void
.end method

.method public setDependedOn(Z)V
    .locals 1
    .param p1, "dependedOn"    # Z

    .prologue
    .line 413
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->setDependedOn(Z)V

    .line 414
    return-void
.end method

.method public setLibrary(Z)V
    .locals 2
    .param p1, "library"    # Z

    .prologue
    .line 409
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ldagger/internal/Binding;->setLibrary(Z)V

    .line 410
    return-void
.end method

.method protected setLinked()V
    .locals 1

    .prologue
    .line 421
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0}, Ldagger/internal/Binding;->setLinked()V

    .line 422
    return-void
.end method

.method public setVisiting(Z)V
    .locals 1
    .param p1, "visiting"    # Z

    .prologue
    .line 405
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    iget-object v0, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v0, p1}, Ldagger/internal/Binding;->setVisiting(Z)V

    .line 406
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 425
    .local p0, "this":Ldagger/internal/Linker$SingletonBinding;, "Ldagger/internal/Linker$SingletonBinding<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "@Singleton/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ldagger/internal/Linker$SingletonBinding;->binding:Ldagger/internal/Binding;

    invoke-virtual {v1}, Ldagger/internal/Binding;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
