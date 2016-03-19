.class Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$1;
.super Ljava/lang/Object;
.source "ReportMapFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)V
    .locals 0

    .prologue
    .line 211
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$1;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->popThisFragment(Z)V

    .line 216
    return-void
.end method
