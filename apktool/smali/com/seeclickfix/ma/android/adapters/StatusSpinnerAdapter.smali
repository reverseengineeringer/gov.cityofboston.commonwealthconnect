.class public Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;
.super Landroid/widget/BaseAdapter;
.source "StatusSpinnerAdapter.java"

# interfaces
.implements Landroid/widget/SpinnerAdapter;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "StatusSpinnerAdapter"


# instance fields
.field private displayList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private keyList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->displayList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->displayList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 99
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 100
    .local v0, "displayStatus":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->getItemState(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 102
    .local v1, "statusState":Ljava/lang/String;
    const v2, 0x7f030064

    invoke-static {p3, v2}, Lcom/seeclickfix/ma/android/util/VU;->inflate(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 103
    const/4 v2, 0x1

    invoke-virtual {p2, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 105
    const v2, 0x7f0a0173

    invoke-static {p2, v2, v0}, Lcom/seeclickfix/ma/android/util/VU;->setText(Landroid/view/View;ILjava/lang/String;)Landroid/widget/TextView;

    .line 107
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 108
    return-object p2
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 41
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->displayList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->displayList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 50
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemState(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 45
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->keyList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->keyList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 55
    const/4 v0, 0x1

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 86
    if-nez p2, :cond_0

    .line 87
    const v0, 0x7f030062

    invoke-static {p3, v0}, Lcom/seeclickfix/ma/android/util/VU;->inflate(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p2

    .line 90
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 92
    const v1, 0x7f0a0173

    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p2, v1, v0}, Lcom/seeclickfix/ma/android/util/VU;->setText(Landroid/view/View;ILjava/lang/String;)Landroid/widget/TextView;

    .line 93
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->getItemState(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 95
    return-object p2
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x1

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x1

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->displayList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->displayList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 72
    const/4 v0, 0x0

    .line 74
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setDisplayList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p1, "displayList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->displayList:Ljava/util/List;

    .line 28
    return-void
.end method

.method public setKeyList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "keyList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->keyList:Ljava/util/List;

    .line 32
    return-void
.end method
