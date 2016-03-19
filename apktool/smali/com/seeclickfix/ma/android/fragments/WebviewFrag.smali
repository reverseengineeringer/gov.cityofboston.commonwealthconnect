.class public Lcom/seeclickfix/ma/android/fragments/WebviewFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "WebviewFrag.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "WebviewFrag"


# instance fields
.field private c:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    return-void
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 43
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/WebviewFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/WebviewFrag;->c:Landroid/content/Context;

    .line 47
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onAttach(Landroid/app/Activity;)V

    .line 54
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 28
    if-nez p2, :cond_0

    .line 30
    const/4 v0, 0x0

    .line 33
    :goto_0
    return-object v0

    .line 32
    :cond_0
    const v0, 0x7f03003f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/WebviewFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 33
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/WebviewFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 89
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDestroy()V

    .line 91
    return-void
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 95
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDestroyView()V

    .line 97
    return-void
.end method

.method public onDetach()V
    .locals 0

    .prologue
    .line 82
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDetach()V

    .line 84
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 70
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 72
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 59
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStart()V

    .line 61
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 76
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 78
    return-void
.end method
