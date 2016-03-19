.class public Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethods;
.super Ljava/lang/Object;
.source "HoneycombMethods.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/androidsdk/HoneycombMethodInterface;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_HoneycombMethods"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleOptionClick(Landroid/view/MenuItem;Landroid/app/Activity;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;
    .param p2, "a"    # Landroid/app/Activity;

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public hideActionBar(Landroid/app/Activity;)V
    .locals 1
    .param p1, "a"    # Landroid/app/Activity;

    .prologue
    .line 43
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 44
    .local v0, "ab":Landroid/app/ActionBar;
    invoke-virtual {v0}, Landroid/app/ActionBar;->hide()V

    .line 45
    return-void
.end method

.method public requestActionBar(Landroid/app/Activity;)V
    .locals 1
    .param p1, "a"    # Landroid/app/Activity;

    .prologue
    .line 39
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/app/Activity;->requestWindowFeature(I)Z

    .line 40
    return-void
.end method

.method public setupActionBar(Landroid/app/Activity;)Ljava/lang/Object;
    .locals 2
    .param p1, "a"    # Landroid/app/Activity;

    .prologue
    .line 48
    invoke-virtual {p1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 50
    .local v0, "ab":Landroid/app/ActionBar;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayUseLogoEnabled(Z)V

    .line 51
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 53
    return-object v0
.end method

.method public setupHoneycombSearch(Landroid/app/Activity;Landroid/view/Menu;)V
    .locals 0
    .param p1, "a"    # Landroid/app/Activity;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 70
    return-void
.end method
