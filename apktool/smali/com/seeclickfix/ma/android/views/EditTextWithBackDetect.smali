.class public Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;
.super Landroid/widget/EditText;
.source "EditTextWithBackDetect.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;
    }
.end annotation


# instance fields
.field private mOnImeBack:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    return-void
.end method


# virtual methods
.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 26
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 27
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->mOnImeBack:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->mOnImeBack:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;->onImeBack(Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;Ljava/lang/String;)V

    .line 29
    :cond_0
    invoke-super {p0, p2}, Landroid/widget/EditText;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public setOnEditTextImeBackListener(Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->mOnImeBack:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;

    .line 37
    return-void
.end method
