.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$9;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


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
    .line 548
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$9;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 554
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$9;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    const/4 v1, 0x0

    # setter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->isReloading:Z
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1302(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Z)Z

    .line 556
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$9;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    const/16 v1, 0x14

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setCamListener(I)V

    .line 557
    return-void
.end method
