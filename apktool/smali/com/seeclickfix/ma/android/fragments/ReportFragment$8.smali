.class Lcom/seeclickfix/ma/android/fragments/ReportFragment$8;
.super Ljava/lang/Object;
.source "ReportFragment.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 0

    .prologue
    .line 581
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$8;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImeBack(Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;Ljava/lang/String;)V
    .locals 1
    .param p1, "editTxtBack"    # Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 584
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$8;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->handleAddressEdit()V

    .line 585
    return-void
.end method
