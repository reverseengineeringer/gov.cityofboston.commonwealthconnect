.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$16;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->onInfoWindowClick(Lcom/google/android/gms/maps/model/Marker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

.field final synthetic val$issueClicked:Lcom/seeclickfix/ma/android/objects/issue/Issue;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 0

    .prologue
    .line 943
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$16;->val$issueClicked:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 947
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$16;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;

    .line 949
    .local v0, "homeBtnsInterface":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    const/4 v1, 0x4

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$16;->val$issueClicked:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;->onClickButton(ILjava/lang/Object;)V

    .line 950
    return-void
.end method
