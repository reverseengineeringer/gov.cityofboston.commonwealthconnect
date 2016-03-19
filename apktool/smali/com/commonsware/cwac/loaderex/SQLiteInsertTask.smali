.class public Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;
.super Landroid/os/AsyncTask;
.source "SQLiteInsertTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Exception;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field db:Landroid/database/sqlite/SQLiteDatabase;

.field nullColumnHack:Ljava/lang/String;

.field table:Ljava/lang/String;

.field values:Landroid/content/ContentValues;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "nullColumnHack"    # Ljava/lang/String;
    .param p4, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 34
    iput-object p2, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->table:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->nullColumnHack:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->values:Landroid/content/ContentValues;

    .line 37
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Exception;
    .locals 5
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 42
    :try_start_0
    iget-object v1, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v2, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->table:Ljava/lang/String;

    iget-object v3, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->nullColumnHack:Ljava/lang/String;

    iget-object v4, p0, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->values:Landroid/content/ContentValues;

    invoke-virtual {v1, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 44
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 22
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/commonsware/cwac/loaderex/SQLiteInsertTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Exception;

    move-result-object v0

    return-object v0
.end method
