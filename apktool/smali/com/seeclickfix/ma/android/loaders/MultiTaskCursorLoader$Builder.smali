.class public Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;
.super Ljava/lang/Object;
.source "MultiTaskCursorLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private c:Landroid/content/Context;

.field private db:Landroid/database/sqlite/SQLiteOpenHelper;

.field private rawQuery:Ljava/lang/String;

.field private sqlArgs:[Ljava/lang/String;

.field private task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/tasks/CancellableTask",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Landroid/database/sqlite/SQLiteOpenHelper;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->rawQuery:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->sqlArgs:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;)Lcom/seeclickfix/ma/android/tasks/CancellableTask;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    return-object v0
.end method


# virtual methods
.method public build()Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;
    .locals 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->rawQuery:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->c:Landroid/content/Context;

    if-nez v0, :cond_1

    .line 107
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "sqlOpenHelper, rawQuery, and context are required parameters"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_1
    new-instance v0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader;-><init>(Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$1;)V

    return-object v0
.end method

.method public setCancellableTask(Lcom/seeclickfix/ma/android/tasks/CancellableTask;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/tasks/CancellableTask",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, "task":Lcom/seeclickfix/ma/android/tasks/CancellableTask;, "Lcom/seeclickfix/ma/android/tasks/CancellableTask<*>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->task:Lcom/seeclickfix/ma/android/tasks/CancellableTask;

    .line 103
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->c:Landroid/content/Context;

    .line 87
    return-void
.end method

.method public setRawQuery(Ljava/lang/String;)V
    .locals 0
    .param p1, "rawQuery"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->rawQuery:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public sqlArgs([Ljava/lang/String;)V
    .locals 0
    .param p1, "sqlArgs"    # [Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->sqlArgs:[Ljava/lang/String;

    .line 99
    return-void
.end method

.method public sqlOpenHelper(Landroid/database/sqlite/SQLiteOpenHelper;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteOpenHelper;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/seeclickfix/ma/android/loaders/MultiTaskCursorLoader$Builder;->db:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 95
    return-void
.end method
