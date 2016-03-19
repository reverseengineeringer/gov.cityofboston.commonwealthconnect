.class final Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader$1;
.super Ljava/lang/Thread;
.source "SharedPreferencesLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader;->persist(Landroid/content/SharedPreferences$Editor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$editor:Landroid/content/SharedPreferences$Editor;


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences$Editor;)V
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader$1;->val$editor:Landroid/content/SharedPreferences$Editor;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/commonsware/cwac/loaderex/acl/SharedPreferencesLoader$1;->val$editor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 39
    return-void
.end method
