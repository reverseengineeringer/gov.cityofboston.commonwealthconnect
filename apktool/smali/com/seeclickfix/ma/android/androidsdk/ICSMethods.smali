.class public Lcom/seeclickfix/ma/android/androidsdk/ICSMethods;
.super Ljava/lang/Object;
.source "ICSMethods.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/androidsdk/ICSMethodInterface;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_ICSMethods"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setHomeButtonEnabled(Ljava/lang/Object;Z)V
    .locals 3
    .param p1, "actionBar"    # Ljava/lang/Object;
    .param p2, "enable"    # Z

    .prologue
    .line 21
    :try_start_0
    move-object v0, p1

    check-cast v0, Landroid/app/ActionBar;

    move-object v1, v0

    .line 22
    .local v1, "ab":Landroid/app/ActionBar;
    invoke-virtual {v1, p2}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .end local v1    # "ab":Landroid/app/ActionBar;
    :goto_0
    return-void

    .line 23
    :catch_0
    move-exception v2

    goto :goto_0
.end method
