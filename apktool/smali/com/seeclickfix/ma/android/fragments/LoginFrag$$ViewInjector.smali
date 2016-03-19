.class public Lcom/seeclickfix/ma/android/fragments/LoginFrag$$ViewInjector;
.super Ljava/lang/Object;
.source "LoginFrag$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/seeclickfix/ma/android/fragments/LoginFrag;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/seeclickfix/ma/android/fragments/LoginFrag;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0a00b1

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Required view with id \'2131361969\' for field \'skipButton\' and method \'skipLogin\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    move-object v1, v0

    .line 14
    check-cast v1, Landroid/widget/Button;

    iput-object v1, p1, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->skipButton:Landroid/widget/Button;

    .line 15
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/LoginFrag$$ViewInjector$1;

    invoke-direct {v1, p1}, Lcom/seeclickfix/ma/android/fragments/LoginFrag$$ViewInjector$1;-><init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    return-void
.end method

.method public static reset(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V
    .locals 1
    .param p0, "target"    # Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    .prologue
    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->skipButton:Landroid/widget/Button;

    .line 27
    return-void
.end method
