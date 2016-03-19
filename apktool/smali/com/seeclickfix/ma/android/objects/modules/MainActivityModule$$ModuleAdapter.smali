.class public final Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;
.super Ldagger/internal/ModuleAdapter;
.source "MainActivityModule$$ModuleAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/ModuleAdapter",
        "<",
        "Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;",
        ">;"
    }
.end annotation


# static fields
.field private static final INCLUDES:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private static final INJECTS:[Ljava/lang/String;

.field private static final STATIC_INJECTIONS:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 11
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.SeeclickfixActivity"

    aput-object v1, v0, v2

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    .line 12
    new-array v0, v2, [Ljava/lang/Class;

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    .line 13
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/seeclickfix/ma/android/objects/modules/LocationAdapterModule;

    aput-object v1, v0, v2

    const-class v1, Lcom/seeclickfix/ma/android/dagger/LoginOnStartupModule;

    aput-object v1, v0, v3

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const/4 v6, 0x1

    .line 16
    const-class v1, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;

    sget-object v2, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    sget-object v3, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    move-object v0, p0

    move v7, v6

    invoke-direct/range {v0 .. v7}, Ldagger/internal/ModuleAdapter;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;Z[Ljava/lang/Class;ZZ)V

    .line 17
    return-void
.end method


# virtual methods
.method public newModule()Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;-><init>()V

    return-object v0
.end method

.method public bridge synthetic newModule()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule$$ModuleAdapter;->newModule()Lcom/seeclickfix/ma/android/objects/modules/MainActivityModule;

    move-result-object v0

    return-object v0
.end method
