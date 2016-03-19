.class Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$1;
.super Ljava/lang/Object;
.source "ZoneBtnAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;)V
    .locals 0

    .prologue
    .line 168
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 173
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->zoneBtnListener:Landroid/view/View$OnClickListener;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->zoneBtnListener:Landroid/view/View$OnClickListener;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/ZoneBtnAdapter;)Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 178
    :cond_0
    return-void
.end method
