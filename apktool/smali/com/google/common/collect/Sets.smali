.class public final Lcom/google/common/collect/Sets;
.super Ljava/lang/Object;
.source "Sets.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
    emulated = true
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Sets$DescendingSet;,
        Lcom/google/common/collect/Sets$UnmodifiableNavigableSet;,
        Lcom/google/common/collect/Sets$PowerSet;,
        Lcom/google/common/collect/Sets$SubSet;,
        Lcom/google/common/collect/Sets$CartesianSet;,
        Lcom/google/common/collect/Sets$FilteredNavigableSet;,
        Lcom/google/common/collect/Sets$FilteredSortedSet;,
        Lcom/google/common/collect/Sets$FilteredSet;,
        Lcom/google/common/collect/Sets$SetView;,
        Lcom/google/common/collect/Sets$ImprovedAbstractSet;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cartesianProduct(Ljava/util/List;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<+",
            "Ljava/util/Set",
            "<+TB;>;>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/util/List",
            "<TB;>;>;"
        }
    .end annotation

    .prologue
    .line 1055
    .local p0, "sets":Ljava/util/List;, "Ljava/util/List<+Ljava/util/Set<+TB;>;>;"
    invoke-static {p0}, Lcom/google/common/collect/Sets$CartesianSet;->create(Ljava/util/List;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static varargs cartesianProduct([Ljava/util/Set;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">([",
            "Ljava/util/Set",
            "<+TB;>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/util/List",
            "<TB;>;>;"
        }
    .end annotation

    .prologue
    .line 1115
    .local p0, "sets":[Ljava/util/Set;, "[Ljava/util/Set<+TB;>;"
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Sets;->cartesianProduct(Ljava/util/List;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static complementOf(Ljava/util/Collection;)Ljava/util/EnumSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum",
            "<TE;>;>(",
            "Ljava/util/Collection",
            "<TE;>;)",
            "Ljava/util/EnumSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 447
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    instance-of v1, p0, Ljava/util/EnumSet;

    if-eqz v1, :cond_0

    .line 448
    check-cast p0, Ljava/util/EnumSet;

    .end local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    invoke-static {p0}, Ljava/util/EnumSet;->complementOf(Ljava/util/EnumSet;)Ljava/util/EnumSet;

    move-result-object v1

    .line 453
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    .restart local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    :goto_0
    return-object v1

    .line 450
    .end local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    const-string/jumbo v2, "collection is empty; use the other version of this method"

    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 452
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Enum;

    invoke-virtual {v1}, Ljava/lang/Enum;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    .line 453
    .restart local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    invoke-static {p0, v0}, Lcom/google/common/collect/Sets;->makeComplementByHand(Ljava/util/Collection;Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    goto :goto_0

    .line 450
    .end local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static complementOf(Ljava/util/Collection;Ljava/lang/Class;)Ljava/util/EnumSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum",
            "<TE;>;>(",
            "Ljava/util/Collection",
            "<TE;>;",
            "Ljava/lang/Class",
            "<TE;>;)",
            "Ljava/util/EnumSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 470
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    instance-of v0, p0, Ljava/util/EnumSet;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/util/EnumSet;

    .end local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    invoke-static {p0}, Ljava/util/EnumSet;->complementOf(Ljava/util/EnumSet;)Ljava/util/EnumSet;

    move-result-object v0

    :goto_0
    return-object v0

    .restart local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    :cond_0
    invoke-static {p0, p1}, Lcom/google/common/collect/Sets;->makeComplementByHand(Ljava/util/Collection;Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    goto :goto_0
.end method

.method public static difference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<TE;>;",
            "Ljava/util/Set",
            "<*>;)",
            "Lcom/google/common/collect/Sets$SetView",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 677
    .local p0, "set1":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    .local p1, "set2":Ljava/util/Set;, "Ljava/util/Set<*>;"
    const-string/jumbo v1, "set1"

    invoke-static {p0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 678
    const-string/jumbo v1, "set2"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    invoke-static {p1}, Lcom/google/common/base/Predicates;->in(Ljava/util/Collection;)Lcom/google/common/base/Predicate;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/base/Predicates;->not(Lcom/google/common/base/Predicate;)Lcom/google/common/base/Predicate;

    move-result-object v0

    .line 681
    .local v0, "notInSet2":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<Ljava/lang/Object;>;"
    new-instance v1, Lcom/google/common/collect/Sets$3;

    invoke-direct {v1, p0, v0, p1}, Lcom/google/common/collect/Sets$3;-><init>(Ljava/util/Set;Lcom/google/common/base/Predicate;Ljava/util/Set;)V

    return-object v1
.end method

.method static equalsImpl(Ljava/util/Set;Ljava/lang/Object;)Z
    .locals 6
    .param p1, "object"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "s":Ljava/util/Set;, "Ljava/util/Set<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1354
    if-ne p0, p1, :cond_1

    move v3, v2

    .line 1368
    :cond_0
    :goto_0
    return v3

    .line 1357
    :cond_1
    instance-of v4, p1, Ljava/util/Set;

    if-eqz v4, :cond_0

    move-object v1, p1

    .line 1358
    check-cast v1, Ljava/util/Set;

    .line 1361
    .local v1, "o":Ljava/util/Set;, "Ljava/util/Set<*>;"
    :try_start_0
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v4

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    if-ne v4, v5, :cond_2

    invoke-interface {p0, v1}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-eqz v4, :cond_2

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_2
    move v2, v3

    goto :goto_1

    .line 1362
    :catch_0
    move-exception v0

    .line 1363
    .local v0, "ignored":Ljava/lang/NullPointerException;
    goto :goto_0

    .line 1364
    .end local v0    # "ignored":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v0

    .line 1365
    .local v0, "ignored":Ljava/lang/ClassCastException;
    goto :goto_0
.end method

.method public static filter(Ljava/util/NavigableSet;Lcom/google/common/base/Predicate;)Ljava/util/NavigableSet;
    .locals 5
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "NavigableSet"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/NavigableSet",
            "<TE;>;",
            "Lcom/google/common/base/Predicate",
            "<-TE;>;)",
            "Ljava/util/NavigableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 908
    .local p0, "unfiltered":Ljava/util/NavigableSet;, "Ljava/util/NavigableSet<TE;>;"
    .local p1, "predicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<-TE;>;"
    instance-of v2, p0, Lcom/google/common/collect/Sets$FilteredSet;

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 911
    check-cast v1, Lcom/google/common/collect/Sets$FilteredSet;

    .line 912
    .local v1, "filtered":Lcom/google/common/collect/Sets$FilteredSet;, "Lcom/google/common/collect/Sets$FilteredSet<TE;>;"
    iget-object v2, v1, Lcom/google/common/collect/Sets$FilteredSet;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {v2, p1}, Lcom/google/common/base/Predicates;->and(Lcom/google/common/base/Predicate;Lcom/google/common/base/Predicate;)Lcom/google/common/base/Predicate;

    move-result-object v0

    .line 914
    .local v0, "combinedPredicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<TE;>;"
    new-instance v3, Lcom/google/common/collect/Sets$FilteredNavigableSet;

    iget-object v2, v1, Lcom/google/common/collect/Sets$FilteredSet;->unfiltered:Ljava/util/Collection;

    check-cast v2, Ljava/util/NavigableSet;

    invoke-direct {v3, v2, v0}, Lcom/google/common/collect/Sets$FilteredNavigableSet;-><init>(Ljava/util/NavigableSet;Lcom/google/common/base/Predicate;)V

    move-object v2, v3

    .line 918
    .end local v0    # "combinedPredicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<TE;>;"
    .end local v1    # "filtered":Lcom/google/common/collect/Sets$FilteredSet;, "Lcom/google/common/collect/Sets$FilteredSet<TE;>;"
    :goto_0
    return-object v2

    :cond_0
    new-instance v4, Lcom/google/common/collect/Sets$FilteredNavigableSet;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/NavigableSet;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/base/Predicate;

    invoke-direct {v4, v2, v3}, Lcom/google/common/collect/Sets$FilteredNavigableSet;-><init>(Ljava/util/NavigableSet;Lcom/google/common/base/Predicate;)V

    move-object v2, v4

    goto :goto_0
.end method

.method public static filter(Ljava/util/Set;Lcom/google/common/base/Predicate;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<TE;>;",
            "Lcom/google/common/base/Predicate",
            "<-TE;>;)",
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 747
    .local p0, "unfiltered":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    .local p1, "predicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<-TE;>;"
    instance-of v2, p0, Ljava/util/SortedSet;

    if-eqz v2, :cond_0

    .line 748
    check-cast p0, Ljava/util/SortedSet;

    .end local p0    # "unfiltered":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    invoke-static {p0, p1}, Lcom/google/common/collect/Sets;->filter(Ljava/util/SortedSet;Lcom/google/common/base/Predicate;)Ljava/util/SortedSet;

    move-result-object v2

    .line 760
    :goto_0
    return-object v2

    .line 750
    .restart local p0    # "unfiltered":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    :cond_0
    instance-of v2, p0, Lcom/google/common/collect/Sets$FilteredSet;

    if-eqz v2, :cond_1

    move-object v1, p0

    .line 753
    check-cast v1, Lcom/google/common/collect/Sets$FilteredSet;

    .line 754
    .local v1, "filtered":Lcom/google/common/collect/Sets$FilteredSet;, "Lcom/google/common/collect/Sets$FilteredSet<TE;>;"
    iget-object v2, v1, Lcom/google/common/collect/Sets$FilteredSet;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {v2, p1}, Lcom/google/common/base/Predicates;->and(Lcom/google/common/base/Predicate;Lcom/google/common/base/Predicate;)Lcom/google/common/base/Predicate;

    move-result-object v0

    .line 756
    .local v0, "combinedPredicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<TE;>;"
    new-instance v3, Lcom/google/common/collect/Sets$FilteredSet;

    iget-object v2, v1, Lcom/google/common/collect/Sets$FilteredSet;->unfiltered:Ljava/util/Collection;

    check-cast v2, Ljava/util/Set;

    invoke-direct {v3, v2, v0}, Lcom/google/common/collect/Sets$FilteredSet;-><init>(Ljava/util/Set;Lcom/google/common/base/Predicate;)V

    move-object v2, v3

    goto :goto_0

    .line 760
    .end local v0    # "combinedPredicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<TE;>;"
    .end local v1    # "filtered":Lcom/google/common/collect/Sets$FilteredSet;, "Lcom/google/common/collect/Sets$FilteredSet<TE;>;"
    :cond_1
    new-instance v4, Lcom/google/common/collect/Sets$FilteredSet;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/base/Predicate;

    invoke-direct {v4, v2, v3}, Lcom/google/common/collect/Sets$FilteredSet;-><init>(Ljava/util/Set;Lcom/google/common/base/Predicate;)V

    move-object v2, v4

    goto :goto_0
.end method

.method public static filter(Ljava/util/SortedSet;Lcom/google/common/base/Predicate;)Ljava/util/SortedSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/SortedSet",
            "<TE;>;",
            "Lcom/google/common/base/Predicate",
            "<-TE;>;)",
            "Ljava/util/SortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 810
    .local p0, "unfiltered":Ljava/util/SortedSet;, "Ljava/util/SortedSet<TE;>;"
    .local p1, "predicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<-TE;>;"
    invoke-static {p0, p1}, Lcom/google/common/collect/Platform;->setsFilterSortedSet(Ljava/util/SortedSet;Lcom/google/common/base/Predicate;)Ljava/util/SortedSet;

    move-result-object v0

    return-object v0
.end method

.method static filterSortedIgnoreNavigable(Ljava/util/SortedSet;Lcom/google/common/base/Predicate;)Ljava/util/SortedSet;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/SortedSet",
            "<TE;>;",
            "Lcom/google/common/base/Predicate",
            "<-TE;>;)",
            "Ljava/util/SortedSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 815
    .local p0, "unfiltered":Ljava/util/SortedSet;, "Ljava/util/SortedSet<TE;>;"
    .local p1, "predicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<-TE;>;"
    instance-of v2, p0, Lcom/google/common/collect/Sets$FilteredSet;

    if-eqz v2, :cond_0

    move-object v1, p0

    .line 818
    check-cast v1, Lcom/google/common/collect/Sets$FilteredSet;

    .line 819
    .local v1, "filtered":Lcom/google/common/collect/Sets$FilteredSet;, "Lcom/google/common/collect/Sets$FilteredSet<TE;>;"
    iget-object v2, v1, Lcom/google/common/collect/Sets$FilteredSet;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {v2, p1}, Lcom/google/common/base/Predicates;->and(Lcom/google/common/base/Predicate;Lcom/google/common/base/Predicate;)Lcom/google/common/base/Predicate;

    move-result-object v0

    .line 821
    .local v0, "combinedPredicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<TE;>;"
    new-instance v3, Lcom/google/common/collect/Sets$FilteredSortedSet;

    iget-object v2, v1, Lcom/google/common/collect/Sets$FilteredSet;->unfiltered:Ljava/util/Collection;

    check-cast v2, Ljava/util/SortedSet;

    invoke-direct {v3, v2, v0}, Lcom/google/common/collect/Sets$FilteredSortedSet;-><init>(Ljava/util/SortedSet;Lcom/google/common/base/Predicate;)V

    move-object v2, v3

    .line 825
    .end local v0    # "combinedPredicate":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<TE;>;"
    .end local v1    # "filtered":Lcom/google/common/collect/Sets$FilteredSet;, "Lcom/google/common/collect/Sets$FilteredSet<TE;>;"
    :goto_0
    return-object v2

    :cond_0
    new-instance v4, Lcom/google/common/collect/Sets$FilteredSortedSet;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/SortedSet;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/common/base/Predicate;

    invoke-direct {v4, v2, v3}, Lcom/google/common/collect/Sets$FilteredSortedSet;-><init>(Ljava/util/SortedSet;Lcom/google/common/base/Predicate;)V

    move-object v2, v4

    goto :goto_0
.end method

.method static hashCodeImpl(Ljava/util/Set;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 1340
    .local p0, "s":Ljava/util/Set;, "Ljava/util/Set<*>;"
    const/4 v0, 0x0

    .line 1341
    .local v0, "hashCode":I
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1342
    .local v2, "o":Ljava/lang/Object;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    .line 1344
    xor-int/lit8 v3, v0, -0x1

    xor-int/lit8 v0, v3, -0x1

    .line 1346
    goto :goto_0

    .line 1342
    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    .line 1347
    .end local v2    # "o":Ljava/lang/Object;
    :cond_1
    return v0
.end method

.method public static varargs immutableEnumSet(Ljava/lang/Enum;[Ljava/lang/Enum;)Lcom/google/common/collect/ImmutableSet;
    .locals 1
    .annotation build Lcom/google/common/annotations/GwtCompatible;
        serializable = true
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum",
            "<TE;>;>(TE;[TE;)",
            "Lcom/google/common/collect/ImmutableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "anElement":Ljava/lang/Enum;, "TE;"
    .local p1, "otherElements":[Ljava/lang/Enum;, "[TE;"
    invoke-static {p0, p1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;[Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableEnumSet;->asImmutable(Ljava/util/EnumSet;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    return-object v0
.end method

.method public static immutableEnumSet(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSet;
    .locals 4
    .annotation build Lcom/google/common/annotations/GwtCompatible;
        serializable = true
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum",
            "<TE;>;>(",
            "Ljava/lang/Iterable",
            "<TE;>;)",
            "Lcom/google/common/collect/ImmutableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    instance-of v3, p0, Lcom/google/common/collect/ImmutableEnumSet;

    if-eqz v3, :cond_0

    .line 117
    check-cast p0, Lcom/google/common/collect/ImmutableEnumSet;

    .line 132
    .end local p0    # "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    .local v2, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :goto_0
    return-object p0

    .line 118
    .end local v2    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    .restart local p0    # "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    :cond_0
    instance-of v3, p0, Ljava/util/Collection;

    if-eqz v3, :cond_2

    move-object v0, p0

    .line 119
    check-cast v0, Ljava/util/Collection;

    .line 120
    .local v0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 121
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->of()Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    goto :goto_0

    .line 123
    :cond_1
    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v3

    invoke-static {v3}, Lcom/google/common/collect/ImmutableEnumSet;->asImmutable(Ljava/util/EnumSet;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    goto :goto_0

    .line 126
    .end local v0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    :cond_2
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 127
    .restart local v2    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 128
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Enum;

    invoke-static {v3}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v1

    .line 129
    .local v1, "enumSet":Ljava/util/EnumSet;, "Ljava/util/EnumSet<TE;>;"
    invoke-static {v1, v2}, Lcom/google/common/collect/Iterators;->addAll(Ljava/util/Collection;Ljava/util/Iterator;)Z

    .line 130
    invoke-static {v1}, Lcom/google/common/collect/ImmutableEnumSet;->asImmutable(Ljava/util/EnumSet;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    goto :goto_0

    .line 132
    .end local v1    # "enumSet":Ljava/util/EnumSet;, "Ljava/util/EnumSet<TE;>;"
    :cond_3
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->of()Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    goto :goto_0
.end method

.method public static intersection(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<TE;>;",
            "Ljava/util/Set",
            "<*>;)",
            "Lcom/google/common/collect/Sets$SetView",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 640
    .local p0, "set1":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    .local p1, "set2":Ljava/util/Set;, "Ljava/util/Set<*>;"
    const-string/jumbo v1, "set1"

    invoke-static {p0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 641
    const-string/jumbo v1, "set2"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 643
    invoke-static {p1}, Lcom/google/common/base/Predicates;->in(Ljava/util/Collection;)Lcom/google/common/base/Predicate;

    move-result-object v0

    .line 644
    .local v0, "inSet2":Lcom/google/common/base/Predicate;, "Lcom/google/common/base/Predicate<Ljava/lang/Object;>;"
    new-instance v1, Lcom/google/common/collect/Sets$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/google/common/collect/Sets$2;-><init>(Ljava/util/Set;Lcom/google/common/base/Predicate;Ljava/util/Set;)V

    return-object v1
.end method

.method private static makeComplementByHand(Ljava/util/Collection;Ljava/lang/Class;)Ljava/util/EnumSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum",
            "<TE;>;>(",
            "Ljava/util/Collection",
            "<TE;>;",
            "Ljava/lang/Class",
            "<TE;>;)",
            "Ljava/util/EnumSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 478
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TE;>;"
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    invoke-static {p1}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    .line 479
    .local v0, "result":Ljava/util/EnumSet;, "Ljava/util/EnumSet<TE;>;"
    invoke-virtual {v0, p0}, Ljava/util/EnumSet;->removeAll(Ljava/util/Collection;)Z

    .line 480
    return-object v0
.end method

.method public static newConcurrentHashSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 254
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v0}, Lcom/google/common/collect/Sets;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static newConcurrentHashSet(Ljava/lang/Iterable;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TE;>;)",
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 273
    .local p0, "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TE;>;"
    invoke-static {}, Lcom/google/common/collect/Sets;->newConcurrentHashSet()Ljava/util/Set;

    move-result-object v0

    .line 274
    .local v0, "set":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 275
    return-object v0
.end method

.method public static newCopyOnWriteArraySet()Ljava/util/concurrent/CopyOnWriteArraySet;
    .locals 1
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "CopyOnWriteArraySet"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/concurrent/CopyOnWriteArraySet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 409
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    return-object v0
.end method

.method public static newCopyOnWriteArraySet(Ljava/lang/Iterable;)Ljava/util/concurrent/CopyOnWriteArraySet;
    .locals 2
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "CopyOnWriteArraySet"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TE;>;)",
            "Ljava/util/concurrent/CopyOnWriteArraySet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 424
    .local p0, "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TE;>;"
    instance-of v1, p0, Ljava/util/Collection;

    if-eqz v1, :cond_0

    invoke-static {p0}, Lcom/google/common/collect/Collections2;->cast(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v0

    .line 427
    .local v0, "elementsCollection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    :goto_0
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v1, v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>(Ljava/util/Collection;)V

    return-object v1

    .line 424
    .end local v0    # "elementsCollection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    :cond_0
    invoke-static {p0}, Lcom/google/common/collect/Lists;->newArrayList(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0
.end method

.method public static newEnumSet(Ljava/lang/Iterable;Ljava/lang/Class;)Ljava/util/EnumSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Enum",
            "<TE;>;>(",
            "Ljava/lang/Iterable",
            "<TE;>;",
            "Ljava/lang/Class",
            "<TE;>;)",
            "Ljava/util/EnumSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TE;>;"
    .local p1, "elementType":Ljava/lang/Class;, "Ljava/lang/Class<TE;>;"
    invoke-static {p1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    .line 146
    .local v0, "set":Ljava/util/EnumSet;, "Ljava/util/EnumSet<TE;>;"
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 147
    return-object v0
.end method

.method public static newHashSet()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/HashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 164
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    return-object v0
.end method

.method public static newHashSet(Ljava/lang/Iterable;)Ljava/util/HashSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TE;>;)",
            "Ljava/util/HashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TE;>;"
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/HashSet;

    invoke-static {p0}, Lcom/google/common/collect/Collections2;->cast(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Sets;->newHashSet(Ljava/util/Iterator;)Ljava/util/HashSet;

    move-result-object v0

    goto :goto_0
.end method

.method public static newHashSet(Ljava/util/Iterator;)Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Iterator",
            "<+TE;>;)",
            "Ljava/util/HashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 237
    .local p0, "elements":Ljava/util/Iterator;, "Ljava/util/Iterator<+TE;>;"
    invoke-static {}, Lcom/google/common/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v0

    .line 238
    .local v0, "set":Ljava/util/HashSet;, "Ljava/util/HashSet<TE;>;"
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterators;->addAll(Ljava/util/Collection;Ljava/util/Iterator;)Z

    .line 239
    return-object v0
.end method

.method public static varargs newHashSet([Ljava/lang/Object;)Ljava/util/HashSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">([TE;)",
            "Ljava/util/HashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 182
    .local p0, "elements":[Ljava/lang/Object;, "[TE;"
    array-length v1, p0

    invoke-static {v1}, Lcom/google/common/collect/Sets;->newHashSetWithExpectedSize(I)Ljava/util/HashSet;

    move-result-object v0

    .line 183
    .local v0, "set":Ljava/util/HashSet;, "Ljava/util/HashSet<TE;>;"
    invoke-static {v0, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 184
    return-object v0
.end method

.method public static newHashSetWithExpectedSize(I)Ljava/util/HashSet;
    .locals 2
    .param p0, "expectedSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(I)",
            "Ljava/util/HashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 201
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p0}, Lcom/google/common/collect/Maps;->capacity(I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    return-object v0
.end method

.method public static newIdentityHashSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 395
    invoke-static {}, Lcom/google/common/collect/Maps;->newIdentityHashMap()Ljava/util/IdentityHashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/Sets;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static newLinkedHashSet()Ljava/util/LinkedHashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/util/LinkedHashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 289
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    return-object v0
.end method

.method public static newLinkedHashSet(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TE;>;)",
            "Ljava/util/LinkedHashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 324
    .local p0, "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TE;>;"
    instance-of v1, p0, Ljava/util/Collection;

    if-eqz v1, :cond_0

    .line 325
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-static {p0}, Lcom/google/common/collect/Collections2;->cast(Ljava/lang/Iterable;)Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 329
    :goto_0
    return-object v0

    .line 327
    :cond_0
    invoke-static {}, Lcom/google/common/collect/Sets;->newLinkedHashSet()Ljava/util/LinkedHashSet;

    move-result-object v0

    .line 328
    .local v0, "set":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<TE;>;"
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    goto :goto_0
.end method

.method public static newLinkedHashSetWithExpectedSize(I)Ljava/util/LinkedHashSet;
    .locals 2
    .param p0, "expectedSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(I)",
            "Ljava/util/LinkedHashSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 308
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-static {p0}, Lcom/google/common/collect/Maps;->capacity(I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(I)V

    return-object v0
.end method

.method public static newSetFromMap(Ljava/util/Map;)Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<TE;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/util/Set",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 515
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<TE;Ljava/lang/Boolean;>;"
    invoke-static {p0}, Lcom/google/common/collect/Platform;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static newTreeSet()Ljava/util/TreeSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ljava/lang/Comparable;",
            ">()",
            "Ljava/util/TreeSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 344
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    return-object v0
.end method

.method public static newTreeSet(Ljava/lang/Iterable;)Ljava/util/TreeSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ljava/lang/Comparable;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TE;>;)",
            "Ljava/util/TreeSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 364
    .local p0, "elements":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TE;>;"
    invoke-static {}, Lcom/google/common/collect/Sets;->newTreeSet()Ljava/util/TreeSet;

    move-result-object v0

    .line 365
    .local v0, "set":Ljava/util/TreeSet;, "Ljava/util/TreeSet<TE;>;"
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 366
    return-object v0
.end method

.method public static newTreeSet(Ljava/util/Comparator;)Ljava/util/TreeSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator",
            "<-TE;>;)",
            "Ljava/util/TreeSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 381
    .local p0, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<-TE;>;"
    new-instance v1, Ljava/util/TreeSet;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    invoke-direct {v1, v0}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    return-object v1
.end method

.method public static powerSet(Ljava/util/Set;)Ljava/util/Set;
    .locals 1
    .annotation build Lcom/google/common/annotations/GwtCompatible;
        serializable = false
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<TE;>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Set",
            "<TE;>;>;"
        }
    .end annotation

    .prologue
    .line 1229
    .local p0, "set":Ljava/util/Set;, "Ljava/util/Set<TE;>;"
    new-instance v0, Lcom/google/common/collect/Sets$PowerSet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Sets$PowerSet;-><init>(Ljava/util/Set;)V

    return-object v0
.end method

.method static removeAllImpl(Ljava/util/Set;Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<*>;",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 1547
    .local p0, "set":Ljava/util/Set;, "Ljava/util/Set<*>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1548
    instance-of v0, p1, Lcom/google/common/collect/Multiset;

    if-eqz v0, :cond_0

    .line 1549
    check-cast p1, Lcom/google/common/collect/Multiset;

    .end local p1    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-interface {p1}, Lcom/google/common/collect/Multiset;->elementSet()Ljava/util/Set;

    move-result-object p1

    .line 1558
    .restart local p1    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    :cond_0
    instance-of v0, p1, Ljava/util/Set;

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 1559
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/common/collect/Iterators;->removeAll(Ljava/util/Iterator;Ljava/util/Collection;)Z

    move-result v0

    .line 1561
    :goto_0
    return v0

    :cond_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/common/collect/Sets;->removeAllImpl(Ljava/util/Set;Ljava/util/Iterator;)Z

    move-result v0

    goto :goto_0
.end method

.method static removeAllImpl(Ljava/util/Set;Ljava/util/Iterator;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<*>;",
            "Ljava/util/Iterator",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 1539
    .local p0, "set":Ljava/util/Set;, "Ljava/util/Set<*>;"
    .local p1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    const/4 v0, 0x0

    .line 1540
    .local v0, "changed":Z
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1541
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    goto :goto_0

    .line 1543
    :cond_0
    return v0
.end method

.method public static symmetricDifference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<+TE;>;",
            "Ljava/util/Set",
            "<+TE;>;)",
            "Lcom/google/common/collect/Sets$SetView",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 711
    .local p0, "set1":Ljava/util/Set;, "Ljava/util/Set<+TE;>;"
    .local p1, "set2":Ljava/util/Set;, "Ljava/util/Set<+TE;>;"
    const-string/jumbo v0, "set1"

    invoke-static {p0, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    const-string/jumbo v0, "set2"

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 715
    invoke-static {p0, p1}, Lcom/google/common/collect/Sets;->union(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v0

    invoke-static {p0, p1}, Lcom/google/common/collect/Sets;->intersection(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/collect/Sets;->difference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v0

    return-object v0
.end method

.method public static synchronizedNavigableSet(Ljava/util/NavigableSet;)Ljava/util/NavigableSet;
    .locals 1
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "NavigableSet"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/NavigableSet",
            "<TE;>;)",
            "Ljava/util/NavigableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 1532
    .local p0, "navigableSet":Ljava/util/NavigableSet;, "Ljava/util/NavigableSet<TE;>;"
    invoke-static {p0}, Lcom/google/common/collect/Synchronized;->navigableSet(Ljava/util/NavigableSet;)Ljava/util/NavigableSet;

    move-result-object v0

    return-object v0
.end method

.method public static union(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<+TE;>;",
            "Ljava/util/Set",
            "<+TE;>;)",
            "Lcom/google/common/collect/Sets$SetView",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 581
    .local p0, "set1":Ljava/util/Set;, "Ljava/util/Set<+TE;>;"
    .local p1, "set2":Ljava/util/Set;, "Ljava/util/Set<+TE;>;"
    const-string/jumbo v1, "set1"

    invoke-static {p0, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    const-string/jumbo v1, "set2"

    invoke-static {p1, v1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    invoke-static {p1, p0}, Lcom/google/common/collect/Sets;->difference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v0

    .line 586
    .local v0, "set2minus1":Ljava/util/Set;, "Ljava/util/Set<+TE;>;"
    new-instance v1, Lcom/google/common/collect/Sets$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/google/common/collect/Sets$1;-><init>(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;)V

    return-object v1
.end method

.method public static unmodifiableNavigableSet(Ljava/util/NavigableSet;)Ljava/util/NavigableSet;
    .locals 1
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "NavigableSet"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/NavigableSet",
            "<TE;>;)",
            "Ljava/util/NavigableSet",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 1390
    .local p0, "set":Ljava/util/NavigableSet;, "Ljava/util/NavigableSet<TE;>;"
    instance-of v0, p0, Lcom/google/common/collect/ImmutableSortedSet;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/common/collect/Sets$UnmodifiableNavigableSet;

    if-eqz v0, :cond_1

    .line 1394
    .end local p0    # "set":Ljava/util/NavigableSet;, "Ljava/util/NavigableSet<TE;>;"
    :cond_0
    :goto_0
    return-object p0

    .restart local p0    # "set":Ljava/util/NavigableSet;, "Ljava/util/NavigableSet<TE;>;"
    :cond_1
    new-instance v0, Lcom/google/common/collect/Sets$UnmodifiableNavigableSet;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Sets$UnmodifiableNavigableSet;-><init>(Ljava/util/NavigableSet;)V

    move-object p0, v0

    goto :goto_0
.end method
