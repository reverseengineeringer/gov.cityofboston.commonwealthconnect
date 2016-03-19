.class public Lcom/seeclickfix/ma/android/config/FolderNames;
.super Ljava/lang/Object;
.source "FolderNames.java"


# static fields
.field public static ISSUE_CACHE_FOLDER:Ljava/lang/String;

.field public static ZONE_BTN_CACHE_FOLDER:Ljava/lang/String;

.field public static ZONE_CACHE_FOLDER:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 5
    const-string/jumbo v0, "issue_image_cache"

    sput-object v0, Lcom/seeclickfix/ma/android/config/FolderNames;->ISSUE_CACHE_FOLDER:Ljava/lang/String;

    .line 6
    const-string/jumbo v0, "zone_image_cache"

    sput-object v0, Lcom/seeclickfix/ma/android/config/FolderNames;->ZONE_CACHE_FOLDER:Ljava/lang/String;

    .line 7
    const-string/jumbo v0, "zone_btn_cache"

    sput-object v0, Lcom/seeclickfix/ma/android/config/FolderNames;->ZONE_BTN_CACHE_FOLDER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
