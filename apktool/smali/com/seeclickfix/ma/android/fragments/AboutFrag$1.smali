.class Lcom/seeclickfix/ma/android/fragments/AboutFrag$1;
.super Ljava/lang/Object;
.source "AboutFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/AboutFrag;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 0

    .prologue
    .line 117
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 121
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getOpenSourceSoftwareLicenseInfo(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "msg":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/seeclickfix/ma/android/SimpleAlertDialog;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "legal"

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/SimpleAlertDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 123
    return-void
.end method
