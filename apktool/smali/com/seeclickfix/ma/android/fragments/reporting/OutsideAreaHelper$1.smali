.class Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper$1;
.super Ljava/lang/Object;
.source "OutsideAreaHelper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->getButtonClickListener()Landroid/view/View$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;)V
    .locals 0

    .prologue
    .line 75
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper$1;->this$0:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 78
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 79
    .local v0, "c":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 80
    .local v1, "webViewIntent":Landroid/content/Intent;
    const-string/jumbo v2, "webview_uri"

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper$1;->this$0:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->getAlertButtonUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    const-class v2, Lcom/seeclickfix/ma/android/activities/WebviewActivity;

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 82
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 83
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 84
    return-void
.end method
