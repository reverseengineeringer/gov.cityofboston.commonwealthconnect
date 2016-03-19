.class public Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;
.super Ljava/lang/Object;
.source "SimpleMultiMap.java"

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private contents:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<TK;",
            "Ljava/util/Set",
            "<TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    .line 22
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 76
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 77
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 81
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 86
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 92
    .local v3, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<TK;TV;>;>;"
    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 93
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ljava/util/Set<TV;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 94
    .local v4, "value":Ljava/lang/Object;, "TV;"
    new-instance v5, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 98
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;Ljava/util/Set<TV;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "value":Ljava/lang/Object;, "TV;"
    :cond_1
    return-object v3
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 104
    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 105
    .local v0, "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    invoke-interface {v0}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    .line 107
    .end local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getAll(Ljava/lang/Object;)Ljava/util/Set;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Set",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 117
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 33
    .end local p2    # "value":Ljava/lang/Object;, "TV;"
    :goto_0
    return-object p2

    .line 32
    .restart local p2    # "value":Ljava/lang/Object;, "TV;"
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    new-instance v1, Ljava/util/HashSet;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    const/4 p2, 0x0

    goto :goto_0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 70
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 72
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 42
    iget-object v1, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 43
    .local v0, "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    invoke-interface {v0}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    .line 45
    .end local v0    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;, "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap<TK;TV;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<TV;>;"
    iget-object v5, p0, Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;->contents:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Set;

    .line 59
    .local v4, "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 60
    .local v3, "value":Ljava/lang/Object;, "TV;"
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 64
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "value":Ljava/lang/Object;, "TV;"
    .end local v4    # "values":Ljava/util/Set;, "Ljava/util/Set<TV;>;"
    :cond_1
    return-object v2
.end method
