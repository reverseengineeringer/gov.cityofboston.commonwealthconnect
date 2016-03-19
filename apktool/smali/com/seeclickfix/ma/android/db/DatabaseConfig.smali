.class public Lcom/seeclickfix/ma/android/db/DatabaseConfig;
.super Ljava/lang/Object;
.source "DatabaseConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/db/DatabaseConfig$Columns;,
        Lcom/seeclickfix/ma/android/db/DatabaseConfig$Tables;
    }
.end annotation


# static fields
.field public static final DATABASE_NAME:Ljava/lang/String; = "scfcache.db"

.field public static DB_VERSION:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/16 v0, 0x21

    sput v0, Lcom/seeclickfix/ma/android/db/DatabaseConfig;->DB_VERSION:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method
