.class public Lcom/seeclickfix/ma/android/activities/BaseFragActivity;
.super Lcom/actionbarsherlock/app/SherlockFragmentActivity;
.source "BaseFragActivity.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_BaseFragActivity"


# instance fields
.field protected fm:Landroid/support/v4/app/FragmentManager;

.field protected myFrag:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

.field protected useMultiplePanes:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;-><init>()V

    .line 24
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/activities/BaseFragActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/activities/BaseFragActivity;->fm:Landroid/support/v4/app/FragmentManager;

    return-void
.end method


# virtual methods
.method protected checkIfUseMultiplePanes()Z
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x0

    .line 103
    .local v0, "shouldUseMultiple":Z
    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstance"    # Landroid/os/Bundle;

    .prologue
    .line 30
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/activities/BaseFragActivity;->setupWindowFeatures()V

    .line 33
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/activities/BaseFragActivity;->setupActionBar()V

    .line 35
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 88
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onDestroy()V

    .line 90
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 44
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 74
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onStart()V

    .line 78
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 82
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onStop()V

    .line 83
    return-void
.end method

.method protected setupActionBar()V
    .locals 1

    .prologue
    .line 48
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->isHoneycombOrAbove()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    invoke-static {p0}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->setupActionBar(Landroid/app/Activity;)V

    .line 51
    :cond_0
    return-void
.end method

.method protected setupHCSearch(Landroid/view/Menu;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 62
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->isHoneycombOrAbove()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    invoke-static {p0, p1}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->setupHoneycombSearch(Landroid/app/Activity;Landroid/view/Menu;)V

    .line 65
    :cond_0
    return-void
.end method

.method protected setupSingleFragment()V
    .locals 0

    .prologue
    .line 69
    return-void
.end method

.method protected setupWindowFeatures()V
    .locals 1

    .prologue
    .line 54
    invoke-static {}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->isHoneycombOrAbove()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    invoke-static {p0}, Lcom/seeclickfix/ma/android/androidsdk/SDKManager;->requestActionBar(Landroid/app/Activity;)V

    .line 59
    :goto_0
    return-void

    .line 57
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/activities/BaseFragActivity;->requestWindowFeature(I)Z

    goto :goto_0
.end method
