.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$12;
.super Landroid/os/Handler;
.source "IssuesMapFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setupHandler()V
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
    .line 661
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 664
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 672
    :goto_0
    return-void

    .line 666
    :pswitch_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handleListLoaded()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1000(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    goto :goto_0

    .line 664
    :pswitch_data_0
    .packed-switch 0x1f4
        :pswitch_0
    .end packed-switch
.end method
