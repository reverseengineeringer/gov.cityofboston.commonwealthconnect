.class Lcom/seeclickfix/ma/android/fragments/RegisterFrag$1;
.super Ljava/lang/Object;
.source "RegisterFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/RegisterFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)V
    .locals 0

    .prologue
    .line 114
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->validate()Z
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 120
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->sendRegistration()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/RegisterFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/RegisterFrag;)V

    .line 122
    :cond_0
    return-void
.end method
