.class public final Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;
.super Ldagger/internal/ModuleAdapter;
.source "LocationUsingFragModule$$ModuleAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/ModuleAdapter",
        "<",
        "Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;",
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
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 11
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.FeedFrag"

    aput-object v1, v0, v3

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.PlacesFrag"

    aput-object v1, v0, v4

    const/4 v1, 0x2

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.PlacesMapFrag"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.ReportFragment"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.ReportMapFrag"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.AboutFrag"

    aput-object v2, v0, v1

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    .line 12
    new-array v0, v3, [Ljava/lang/Class;

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    .line 13
    new-array v0, v4, [Ljava/lang/Class;

    const-class v1, Lcom/seeclickfix/ma/android/objects/modules/LocationAdapterModule;

    aput-object v1, v0, v3

    sput-object v0, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 16
    const-class v1, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;

    sget-object v2, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    sget-object v3, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    sget-object v5, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    move-object v0, p0

    move v6, v4

    move v7, v4

    invoke-direct/range {v0 .. v7}, Ldagger/internal/ModuleAdapter;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;Z[Ljava/lang/Class;ZZ)V

    .line 17
    return-void
.end method


# virtual methods
.method public newModule()Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;-><init>()V

    return-object v0
.end method

.method public bridge synthetic newModule()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule$$ModuleAdapter;->newModule()Lcom/seeclickfix/ma/android/objects/modules/LocationUsingFragModule;

    move-result-object v0

    return-object v0
.end method
