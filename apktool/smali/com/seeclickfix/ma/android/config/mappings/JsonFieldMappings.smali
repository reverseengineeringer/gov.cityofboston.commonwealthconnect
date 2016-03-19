.class public Lcom/seeclickfix/ma/android/config/mappings/JsonFieldMappings;
.super Ljava/lang/Object;
.source "JsonFieldMappings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/config/mappings/JsonFieldMappings$PlaceJson;
    }
.end annotation


# static fields
.field public static final API_KEY:Ljava/lang/String; = "api_key"

.field public static final EMAIL:Ljava/lang/String; = "login"

.field public static final ERRORS:Ljava/lang/String; = "errors"

.field public static final FORGOT_PASSWORD:Ljava/lang/String; = "user[login]"

.field public static final PASSWORD:Ljava/lang/String; = "password"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method
