.class public Lcom/seeclickfix/ma/android/androidsdk/FroyoMethods;
.super Ljava/lang/Object;
.source "FroyoMethods.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/androidsdk/FroyoMethodInterface;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_FroyoMethods"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public smoothScrollToPosition(ILandroid/widget/ListView;)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "lv"    # Landroid/widget/ListView;

    .prologue
    .line 22
    :try_start_0
    invoke-virtual {p2, p1}, Landroid/widget/ListView;->smoothScrollToPosition(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :goto_0
    return-void

    .line 23
    :catch_0
    move-exception v0

    goto :goto_0
.end method
