.class public Lcom/seeclickfix/ma/android/objects/modules/ContextModule;
.super Ljava/lang/Object;
.source "ContextModule.java"


# annotations
.annotation runtime Ldagger/Module;
    library = true
.end annotation


# instance fields
.field context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/modules/ContextModule;->context:Landroid/content/Context;

    .line 19
    return-void
.end method


# virtual methods
.method provideContext()Landroid/content/Context;
    .locals 1
    .annotation runtime Ldagger/Provides;
    .end annotation

    .annotation runtime Ljavax/inject/Singleton;
    .end annotation

    .prologue
    .line 25
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/modules/ContextModule;->context:Landroid/content/Context;

    return-object v0
.end method
