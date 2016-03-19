.class public Lcom/seeclickfix/ma/android/util/VU;
.super Ljava/lang/Object;
.source "VU.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inflate(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .param p1, "resourceID"    # I

    .prologue
    .line 17
    invoke-static {p0}, Lcom/seeclickfix/ma/android/util/VU;->inflater(Landroid/view/ViewGroup;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public static inflater(Landroid/view/ViewGroup;)Landroid/view/LayoutInflater;
    .locals 2
    .param p0, "vg"    # Landroid/view/ViewGroup;

    .prologue
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    return-object v0
.end method

.method public static setText(Landroid/view/View;II)Landroid/widget/TextView;
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "resourceID"    # I
    .param p2, "textId"    # I

    .prologue
    .line 31
    invoke-static {p0, p1}, Lcom/seeclickfix/ma/android/util/VU;->text(Landroid/view/View;I)Landroid/widget/TextView;

    move-result-object v0

    .line 32
    .local v0, "tv":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(I)V

    .line 33
    return-object v0
.end method

.method public static setText(Landroid/view/View;ILjava/lang/String;)Landroid/widget/TextView;
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "resourceID"    # I
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p0, p1}, Lcom/seeclickfix/ma/android/util/VU;->text(Landroid/view/View;I)Landroid/widget/TextView;

    move-result-object v0

    .line 26
    .local v0, "tv":Landroid/widget/TextView;
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    return-object v0
.end method

.method public static text(Landroid/view/View;I)Landroid/widget/TextView;
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "resourceID"    # I

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    return-object v0
.end method
