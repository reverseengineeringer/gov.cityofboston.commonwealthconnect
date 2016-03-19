.class Lcom/seeclickfix/ma/android/fragments/RegisterFrag$3;
.super Ljava/lang/Object;
.source "RegisterFrag.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
    .line 262
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/RegisterFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/RegisterFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 265
    const/4 v0, 0x6

    if-eq p2, v0, :cond_0

    const/4 v0, 0x5

    if-ne p2, v0, :cond_1

    .line 266
    :cond_0
    invoke-static {p1}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 267
    const/4 v0, 0x1

    .line 269
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
