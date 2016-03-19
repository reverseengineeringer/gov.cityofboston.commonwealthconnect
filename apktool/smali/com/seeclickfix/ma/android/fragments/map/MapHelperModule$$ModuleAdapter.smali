.class public final Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;
.super Ldagger/internal/ModuleAdapter;
.source "MapHelperModule$$ModuleAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ldagger/internal/ModuleAdapter",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;",
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
    const/4 v3, 0x0

    .line 11
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "members/com.seeclickfix.ma.android.fragments.IssueDetailsFrag"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.IssueDetailsMapFrag"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.ReportFragment"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.ReportMapFrag"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.IssuesMapFrag"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.PlacesFrag"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "members/com.seeclickfix.ma.android.fragments.PlacesMapFrag"

    aput-object v2, v0, v1

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    .line 12
    new-array v0, v3, [Ljava/lang/Class;

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    .line 13
    new-array v0, v3, [Ljava/lang/Class;

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 16
    const-class v1, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;

    sget-object v2, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;->INJECTS:[Ljava/lang/String;

    sget-object v3, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;->STATIC_INJECTIONS:[Ljava/lang/Class;

    sget-object v5, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;->INCLUDES:[Ljava/lang/Class;

    move-object v0, p0

    move v6, v4

    move v7, v4

    invoke-direct/range {v0 .. v7}, Ldagger/internal/ModuleAdapter;-><init>(Ljava/lang/Class;[Ljava/lang/String;[Ljava/lang/Class;Z[Ljava/lang/Class;ZZ)V

    .line 17
    return-void
.end method


# virtual methods
.method public newModule()Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;-><init>()V

    return-object v0
.end method

.method public bridge synthetic newModule()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule$$ModuleAdapter;->newModule()Lcom/seeclickfix/ma/android/fragments/map/MapHelperModule;

    move-result-object v0

    return-object v0
.end method
