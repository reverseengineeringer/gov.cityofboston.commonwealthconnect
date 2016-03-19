.class Lcom/seeclickfix/ma/android/fragments/AboutFrag$4;
.super Ljava/lang/Object;
.source "AboutFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/AboutFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 0

    .prologue
    .line 352
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 356
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    invoke-static {v1, v2}, Lcom/j256/ormlite/android/apptools/OpenHelperManager;->getHelper(Landroid/content/Context;Ljava/lang/Class;)Lcom/j256/ormlite/android/apptools/OrmLiteSqliteOpenHelper;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/db/OrmDbHelper;

    .line 358
    .local v0, "helper":Lcom/seeclickfix/ma/android/db/OrmDbHelper;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/db/OrmDbHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    .line 360
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "Created new database."

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 361
    return-void
.end method
