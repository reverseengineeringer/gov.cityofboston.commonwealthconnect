.class public final Lcom/seeclickfix/ma/android/fragments/map/MapHelper$$InjectAdapter;
.super Ldagger/internal/Binding;
.source "MapHelper$$InjectAdapter.java"

# interfaces
.implements Ljavax/inject/Provider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/Binding",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/map/MapHelper;",
        ">;",
        "Ljavax/inject/Provider",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/map/MapHelper;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 18
    const-string/jumbo v0, "com.seeclickfix.ma.android.fragments.map.MapHelper"

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.map.MapHelper"

    const/4 v2, 0x0

    const-class v3, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    invoke-direct {p0, v0, v1, v2, v3}, Ldagger/internal/Binding;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Object;)V

    .line 19
    return-void
.end method


# virtual methods
.method public get()Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    .locals 1

    .prologue
    .line 27
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;-><init>()V

    .line 28
    .local v0, "result":Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper$$InjectAdapter;->get()Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    move-result-object v0

    return-object v0
.end method
