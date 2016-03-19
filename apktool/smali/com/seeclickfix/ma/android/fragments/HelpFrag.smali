.class public Lcom/seeclickfix/ma/android/fragments/HelpFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "HelpFrag.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "HelpFrag"


# instance fields
.field private c:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    return-void
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 42
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 45
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/HelpFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/HelpFrag;->c:Landroid/content/Context;

    .line 47
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/HelpFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    const v1, 0x7f0c008c

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(I)V

    .line 51
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/HelpFrag;->setHasOptionsMenu(Z)V

    .line 53
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 62
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 63
    const v0, 0x7f0e0002

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 64
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 65
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 30
    if-nez p2, :cond_0

    .line 32
    const/4 v0, 0x0

    .line 35
    :goto_0
    return-object v0

    .line 34
    :cond_0
    const v0, 0x7f030029

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/HelpFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 35
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/HelpFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method
