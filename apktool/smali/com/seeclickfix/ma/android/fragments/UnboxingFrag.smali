.class public Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;
.super Lcom/actionbarsherlock/app/SherlockFragment;
.source "UnboxingFrag.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "UnboxingFrag"


# instance fields
.field private c:Landroid/content/Context;

.field private layoutId:I

.field private rootFrag:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/actionbarsherlock/app/SherlockFragment;-><init>()V

    .line 31
    return-void
.end method

.method public static newInstance()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 97
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;-><init>()V

    return-object v0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 84
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 87
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->c:Landroid/content/Context;

    .line 93
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 72
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragment;->onAttach(Landroid/app/Activity;)V

    .line 74
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragment;->onCreate(Landroid/os/Bundle;)V

    .line 49
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "unboxing_layout_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->layoutId:I

    .line 52
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 35
    if-nez p2, :cond_0

    .line 37
    const/4 v0, 0x0

    .line 40
    :goto_0
    return-object v0

    .line 39
    :cond_0
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->layoutId:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 40
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/UnboxingFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onDetach()V
    .locals 0

    .prologue
    .line 78
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragment;->onDetach()V

    .line 80
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 64
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragment;->onResume()V

    .line 67
    return-void
.end method
