.class public final Lcom/seeclickfix/ma/android/objects/modules/ContextModule$$ModuleAdapter$ProvideContextProvidesAdapter;
.super Ldagger/internal/ProvidesBinding;
.source "ContextModule$$ModuleAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/objects/modules/ContextModule$$ModuleAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProvideContextProvidesAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/ProvidesBinding",
        "<",
        "Landroid/content/Context;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Landroid/content/Context;",
        ">;"
    }
.end annotation


# instance fields
.field private final module:Lcom/seeclickfix/ma/android/objects/modules/ContextModule;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/modules/ContextModule;)V
    .locals 4
    .param p1, "module"    # Lcom/seeclickfix/ma/android/objects/modules/ContextModule;

    .prologue
    const/4 v3, 0x1

    .line 43
    const-string/jumbo v0, "android.content.Context"

    const-string/jumbo v1, "com.seeclickfix.ma.android.objects.modules.ContextModule"

    const-string/jumbo v2, "provideContext"

    invoke-direct {p0, v0, v3, v1, v2}, Ldagger/internal/ProvidesBinding;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 44
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/modules/ContextModule$$ModuleAdapter$ProvideContextProvidesAdapter;->module:Lcom/seeclickfix/ma/android/objects/modules/ContextModule;

    .line 45
    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/objects/modules/ContextModule$$ModuleAdapter$ProvideContextProvidesAdapter;->setLibrary(Z)V

    .line 46
    return-void
.end method


# virtual methods
.method public get()Landroid/content/Context;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/modules/ContextModule$$ModuleAdapter$ProvideContextProvidesAdapter;->module:Lcom/seeclickfix/ma/android/objects/modules/ContextModule;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/modules/ContextModule;->provideContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/modules/ContextModule$$ModuleAdapter$ProvideContextProvidesAdapter;->get()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method
