.class final Lcom/seeclickfix/ma/android/fragments/LoginFrag$$ViewInjector$1;
.super Ljava/lang/Object;
.source "LoginFrag$$ViewInjector.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/LoginFrag$$ViewInjector;->inject(Lbutterknife/ButterKnife$Finder;Lcom/seeclickfix/ma/android/fragments/LoginFrag;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$target:Lcom/seeclickfix/ma/android/fragments/LoginFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/LoginFrag;)V
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$$ViewInjector$1;->val$target:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "p0"    # Landroid/view/View;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/LoginFrag$$ViewInjector$1;->val$target:Lcom/seeclickfix/ma/android/fragments/LoginFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/LoginFrag;->skipLogin()V

    .line 21
    return-void
.end method
