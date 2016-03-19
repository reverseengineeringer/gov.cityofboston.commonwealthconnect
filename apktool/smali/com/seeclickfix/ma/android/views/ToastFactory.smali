.class public Lcom/seeclickfix/ma/android/views/ToastFactory;
.super Ljava/lang/Object;
.source "ToastFactory.java"


# static fields
.field private static lastToast:Landroid/widget/Toast;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput-object v0, Lcom/seeclickfix/ma/android/views/ToastFactory;->lastToast:Landroid/widget/Toast;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showBottomShortToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 93
    const/4 v0, 0x0

    const/16 v1, 0x50

    invoke-static {p0, p1, v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showToast(Landroid/content/Context;Ljava/lang/String;II)V

    .line 94
    return-void
.end method

.method public static showCenteredLong(Landroid/content/Context;I)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "resID"    # I

    .prologue
    .line 85
    const/4 v0, 0x1

    const/16 v1, 0x11

    invoke-static {p0, p1, v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showToast(Landroid/content/Context;III)V

    .line 86
    return-void
.end method

.method public static showCenteredShortToast(Landroid/content/Context;I)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "resID"    # I

    .prologue
    .line 81
    const/4 v0, 0x0

    const/16 v1, 0x11

    invoke-static {p0, p1, v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showToast(Landroid/content/Context;III)V

    .line 82
    return-void
.end method

.method public static showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 71
    const/4 v0, 0x0

    const/16 v1, 0x11

    invoke-static {p0, p1, v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showToast(Landroid/content/Context;Ljava/lang/String;II)V

    .line 72
    return-void
.end method

.method public static showHint(Landroid/content/Context;I)V
    .locals 7
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "resID"    # I

    .prologue
    const/4 v6, 0x0

    .line 19
    sget-object v4, Lcom/seeclickfix/ma/android/views/ToastFactory;->lastToast:Landroid/widget/Toast;

    if-eqz v4, :cond_0

    .line 20
    sget-object v4, Lcom/seeclickfix/ma/android/views/ToastFactory;->lastToast:Landroid/widget/Toast;

    invoke-virtual {v4}, Landroid/widget/Toast;->cancel()V

    .line 23
    :cond_0
    new-instance v2, Landroid/widget/Toast;

    invoke-direct {v2, p0}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    .line 25
    .local v2, "toast":Landroid/widget/Toast;
    const-string/jumbo v4, "layout_inflater"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 27
    .local v0, "li":Landroid/view/LayoutInflater;
    const v4, 0x7f03006e

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 29
    .local v3, "toastView":Landroid/view/View;
    const v4, 0x7f0a0182

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 30
    .local v1, "text":Landroid/widget/TextView;
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 31
    invoke-virtual {v2, v3}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 32
    invoke-virtual {v2, v6}, Landroid/widget/Toast;->setDuration(I)V

    .line 33
    const/16 v4, 0x11

    invoke-virtual {v2, v4, v6, v6}, Landroid/widget/Toast;->setGravity(III)V

    .line 34
    const v4, 0x7f0200af

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 37
    sput-object v2, Lcom/seeclickfix/ma/android/views/ToastFactory;->lastToast:Landroid/widget/Toast;

    .line 38
    return-void
.end method

.method public static showToast(Landroid/content/Context;III)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "resID"    # I
    .param p2, "length"    # I
    .param p3, "gravity"    # I

    .prologue
    .line 101
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "toastString":Ljava/lang/String;
    invoke-static {p0, v0, p2, p3}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showToast(Landroid/content/Context;Ljava/lang/String;II)V

    .line 104
    return-void
.end method

.method public static showToast(Landroid/content/Context;Ljava/lang/String;II)V
    .locals 7
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "length"    # I
    .param p3, "gravity"    # I

    .prologue
    const/4 v6, 0x0

    .line 42
    sget-object v4, Lcom/seeclickfix/ma/android/views/ToastFactory;->lastToast:Landroid/widget/Toast;

    if-eqz v4, :cond_0

    .line 43
    sget-object v4, Lcom/seeclickfix/ma/android/views/ToastFactory;->lastToast:Landroid/widget/Toast;

    invoke-virtual {v4}, Landroid/widget/Toast;->cancel()V

    .line 46
    :cond_0
    const-string/jumbo v4, ""

    invoke-static {p0, v4, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 50
    .local v2, "toast":Landroid/widget/Toast;
    const-string/jumbo v4, "layout_inflater"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 52
    .local v0, "li":Landroid/view/LayoutInflater;
    const v4, 0x7f03006e

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 54
    .local v3, "toastView":Landroid/view/View;
    const v4, 0x7f0a0182

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 56
    .local v1, "textView":Landroid/widget/TextView;
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    invoke-virtual {v2, p3, v6, v6}, Landroid/widget/Toast;->setGravity(III)V

    .line 59
    const v4, 0x7f0200af

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 60
    invoke-virtual {v2, v3}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 61
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 62
    sput-object v2, Lcom/seeclickfix/ma/android/views/ToastFactory;->lastToast:Landroid/widget/Toast;

    .line 63
    return-void
.end method

.method public static showTopShortToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 89
    const/4 v0, 0x0

    const/16 v1, 0x30

    invoke-static {p0, p1, v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showToast(Landroid/content/Context;Ljava/lang/String;II)V

    .line 90
    return-void
.end method
