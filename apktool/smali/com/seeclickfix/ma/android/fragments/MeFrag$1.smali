.class Lcom/seeclickfix/ma/android/fragments/MeFrag$1;
.super Ljava/lang/Object;
.source "MeFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/MeFrag;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/MeFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/MeFrag;)V
    .locals 0

    .prologue
    .line 198
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/MeFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 201
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/MeFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/MeFrag;->isLoggedIn:Z
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/MeFrag;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/MeFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/MeFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/MeFrag;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    const-string/jumbo v1, "com.seeclickfix.actions.SHOW_ME_FRAG"

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 205
    new-instance v0, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/MeFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/MeFrag;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/MeFrag;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;-><init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    # invokes: Lcom/seeclickfix/ma/android/fragments/MeFrag;->postEvent(Ljava/lang/Object;)V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->access$200(Ljava/lang/Object;)V

    .line 209
    :goto_0
    return-void

    .line 207
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/MeFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/MeFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/MeFrag;->logout()V

    goto :goto_0
.end method
