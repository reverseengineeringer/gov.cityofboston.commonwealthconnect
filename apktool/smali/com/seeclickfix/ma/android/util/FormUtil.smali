.class public Lcom/seeclickfix/ma/android/util/FormUtil;
.super Ljava/lang/Object;
.source "FormUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getListener()Landroid/view/View$OnTouchListener;
    .locals 1

    .prologue
    .line 49
    new-instance v0, Lcom/seeclickfix/ma/android/util/FormUtil$1;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/util/FormUtil$1;-><init>()V

    return-object v0
.end method

.method public static hideKeyboard(Landroid/view/View;)V
    .locals 3
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 14
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 15
    return-void
.end method

.method public static setupUI(Landroid/view/View;Landroid/view/View$OnTouchListener;)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "listener"    # Landroid/view/View$OnTouchListener;

    .prologue
    .line 28
    if-nez p1, :cond_0

    invoke-static {}, Lcom/seeclickfix/ma/android/util/FormUtil;->getListener()Landroid/view/View$OnTouchListener;

    move-result-object p1

    .line 30
    :cond_0
    instance-of v2, p0, Landroid/widget/EditText;

    if-nez v2, :cond_1

    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 36
    :cond_1
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_2

    .line 38
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    move-object v2, p0

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_2

    move-object v2, p0

    .line 40
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 42
    .local v1, "innerView":Landroid/view/View;
    invoke-static {v1, p1}, Lcom/seeclickfix/ma/android/util/FormUtil;->setupUI(Landroid/view/View;Landroid/view/View$OnTouchListener;)V

    .line 38
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    .end local v0    # "i":I
    .end local v1    # "innerView":Landroid/view/View;
    :cond_2
    return-void
.end method
