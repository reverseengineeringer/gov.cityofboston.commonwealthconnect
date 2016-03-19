.class public Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;
.super Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;
.source "MultiTaskCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$1;,
        Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "MultiTaskCursorLoader"


# instance fields
.field private context:Landroid/content/Context;

.field private task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/tasks/CancellableTask",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)V
    .locals 4
    .param p1, "builder"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;

    .prologue
    .line 34
    # getter for: Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->c:Landroid/content/Context;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->access$000(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Landroid/content/Context;

    move-result-object v0

    # getter for: Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->db:Landroid/database/sqlite/SQLiteOpenHelper;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->access$100(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Landroid/database/sqlite/SQLiteOpenHelper;

    move-result-object v1

    # getter for: Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->rawQuery:Ljava/lang/String;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->access$200(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Ljava/lang/String;

    move-result-object v2

    # getter for: Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->sqlArgs:[Ljava/lang/String;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->access$300(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)[Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;-><init>(Landroid/content/Context;Landroid/database/sqlite/SQLiteOpenHelper;Ljava/lang/String;[Ljava/lang/String;)V

    .line 36
    # getter for: Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;
    invoke-static {p1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->access$400(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    .line 39
    return-void
.end method

.method synthetic constructor <init>(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$1;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;-><init>(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)V

    return-void
.end method

.method private cancelAllTasks()V
    .locals 1

    .prologue
    .line 44
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/tasks/CancellableTask;->cancel()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public loadInBackground()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    if-eqz v0, :cond_0

    .line 68
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/tasks/CancellableTask;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v0

    return-object v0

    .line 69
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public onCanceled(Landroid/database/Cursor;)V
    .locals 0
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 55
    invoke-super {p0, p1}, Lcom/commonsware/cwac/loaderex/acl/SQLiteCursorLoader;->onCanceled(Landroid/database/Cursor;)V

    .line 57
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;->cancelAllTasks()V

    .line 58
    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 12
    check-cast p1, Landroid/database/Cursor;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;->onCanceled(Landroid/database/Cursor;)V

    return-void
.end method
