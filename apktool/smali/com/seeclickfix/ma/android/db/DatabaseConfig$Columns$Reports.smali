.class public Lcom/seeclickfix/ma/android/db/DatabaseConfig$Columns$Reports;
.super Ljava/lang/Object;
.source "DatabaseConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/db/DatabaseConfig$Columns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Reports"
.end annotation


# static fields
.field public static final ID:Ljava/lang/String; = "id"

.field public static final REPORT_STATE:Ljava/lang/String; = "report_state"

.field public static final REQ_TYPE_ID:Ljava/lang/String; = "req_type_id"

.field public static final USING_CURRENT_LOC:Ljava/lang/String; = "using_current_loc"

.field public static final WATCH_AREAS:Ljava/lang/String; = "watch_areas"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
