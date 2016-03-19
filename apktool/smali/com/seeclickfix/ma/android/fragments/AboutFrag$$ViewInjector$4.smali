.class final Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$4;
.super Ljava/lang/Object;
.source "AboutFrag$$ViewInjector.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector;->inject(Lbutterknife/ButterKnife$Finder;Lcom/seeclickfix/ma/android/fragments/AboutFrag;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$target:Lcom/seeclickfix/ma/android/fragments/AboutFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$4;->val$target:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "p0"    # Landroid/view/View;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$$ViewInjector$4;->val$target:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->stopFakingLocation()V

    .line 120
    return-void
.end method
