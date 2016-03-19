.class public Lcom/seeclickfix/ma/android/views/MarkerOverlay;
.super Landroid/widget/AdapterView;
.source "MarkerOverlay.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/AdapterView",
        "<",
        "Landroid/widget/BaseAdapter;",
        ">;"
    }
.end annotation


# instance fields
.field private adapter:Landroid/widget/BaseAdapter;

.field private selectedPosition:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;)V

    .line 12
    return-void
.end method


# virtual methods
.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .prologue
    .line 8
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/MarkerOverlay;->getAdapter()Landroid/widget/BaseAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/BaseAdapter;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/seeclickfix/ma/android/views/MarkerOverlay;->adapter:Landroid/widget/BaseAdapter;

    return-object v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .param p1, "x0"    # Landroid/widget/Adapter;

    .prologue
    .line 8
    check-cast p1, Landroid/widget/BaseAdapter;

    .end local p1    # "x0":Landroid/widget/Adapter;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/views/MarkerOverlay;->setAdapter(Landroid/widget/BaseAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/BaseAdapter;)V
    .locals 0
    .param p1, "adapter"    # Landroid/widget/BaseAdapter;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/MarkerOverlay;->adapter:Landroid/widget/BaseAdapter;

    .line 33
    return-void
.end method

.method public setSelection(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 37
    iput p1, p0, Lcom/seeclickfix/ma/android/views/MarkerOverlay;->selectedPosition:I

    .line 40
    return-void
.end method
