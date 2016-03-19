.class public Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;
.super Landroid/support/v4/content/AsyncTaskLoader;
.source "PlaceAsyncLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/content/AsyncTaskLoader",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/seeclickfix/ma/android/objects/loc/Place;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "PlaceAsyncLoader"


# instance fields
.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation
.end field

.field private task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/tasks/CancellableTask",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/tasks/CancellableTask;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/seeclickfix/ma/android/tasks/CancellableTask",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "task":Lcom/seeclickfix/ma/android/tasks/CancellableTask;, "Lcom/seeclickfix/ma/android/tasks/CancellableTask<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;>;"
    invoke-direct {p0, p1}, Landroid/support/v4/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    .line 26
    iput-object p2, p0, Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    .line 27
    return-void
.end method


# virtual methods
.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;->loadInBackground()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public loadInBackground()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation

    .prologue
    .line 34
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/tasks/CancellableTask;->call()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;->list:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :goto_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;->list:Ljava/util/List;

    return-object v0

    .line 35
    :catch_0
    move-exception v0

    goto :goto_0
.end method
