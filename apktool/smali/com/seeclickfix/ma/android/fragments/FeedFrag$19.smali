.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0

    .prologue
    .line 1040
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 6
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 1047
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1078
    :goto_0
    return-void

    .line 1054
    :cond_0
    instance-of v0, p1, Lcom/android/volley/TimeoutError;

    if-eqz v0, :cond_1

    .line 1055
    const v1, 0x7f0c0074

    .line 1056
    .local v1, "title":I
    const v2, 0x7f0c0067

    .line 1069
    .local v2, "message":I
    :goto_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    sget-object v3, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 1070
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$600(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    move-result-object v0

    const v3, 0x7f020112

    const v4, 0x7f0c0072

    new-instance v5, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19$1;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag$19$1;-><init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag$19;)V

    invoke-virtual/range {v0 .. v5}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;->showErrorPanel(IIIILjava/lang/Runnable;)V

    goto :goto_0

    .line 1057
    .end local v1    # "title":I
    .end local v2    # "message":I
    :cond_1
    instance-of v0, p1, Lcom/android/volley/NoConnectionError;

    if-eqz v0, :cond_2

    .line 1058
    const v1, 0x7f0c006c

    .line 1059
    .restart local v1    # "title":I
    const v2, 0x7f0c006c

    .restart local v2    # "message":I
    goto :goto_1

    .line 1066
    .end local v1    # "title":I
    .end local v2    # "message":I
    :cond_2
    const v1, 0x7f0c0045

    .line 1067
    .restart local v1    # "title":I
    const v2, 0x7f0c0044

    .restart local v2    # "message":I
    goto :goto_1
.end method
