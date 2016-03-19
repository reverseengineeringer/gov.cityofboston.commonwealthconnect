.class Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$1;
.super Ljava/lang/Object;
.source "BaseFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->restyleReportButton(Lcom/actionbarsherlock/view/Menu;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;)V
    .locals 0

    .prologue
    .line 305
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 308
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->showReportFrag()V

    .line 309
    return-void
.end method
