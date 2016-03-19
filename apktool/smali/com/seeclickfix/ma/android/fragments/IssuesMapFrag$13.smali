.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$13;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 0

    .prologue
    .line 702
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$13;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    .prologue
    .line 711
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$13;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setCamListener(I)V

    .line 712
    return-void
.end method

.method public onFinish()V
    .locals 2

    .prologue
    .line 706
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$13;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setCamListener(I)V

    .line 707
    return-void
.end method
