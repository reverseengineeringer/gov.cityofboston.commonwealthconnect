.class Lcom/seeclickfix/ma/android/fragments/AboutFrag$2;
.super Ljava/lang/Object;
.source "AboutFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/AboutFrag;->setContent()V
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
    .line 186
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 190
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$2;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/AboutFrag;->setDevMode()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    .line 192
    return-void
.end method
