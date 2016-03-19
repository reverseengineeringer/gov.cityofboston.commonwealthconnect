.class public Lcom/seeclickfix/ma/android/adapters/MarkerAdapterView;
.super Landroid/widget/AdapterView;
.source "MarkerAdapterView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/AdapterView",
        "<",
        "Landroid/widget/CursorAdapter;",
        ">;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "MarkerAdapterView"


# instance fields
.field private cursorAdapter:Landroid/widget/CursorAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    return-void
.end method


# virtual methods
.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/MarkerAdapterView;->getAdapter()Landroid/widget/CursorAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/CursorAdapter;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/seeclickfix/ma/android/adapters/MarkerAdapterView;->cursorAdapter:Landroid/widget/CursorAdapter;

    return-object v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 2

    .prologue
    .line 46
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .param p1, "x0"    # Landroid/widget/Adapter;

    .prologue
    .line 12
    check-cast p1, Landroid/widget/CursorAdapter;

    .end local p1    # "x0":Landroid/widget/Adapter;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/adapters/MarkerAdapterView;->setAdapter(Landroid/widget/CursorAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/CursorAdapter;)V
    .locals 0
    .param p1, "adapter"    # Landroid/widget/CursorAdapter;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/MarkerAdapterView;->cursorAdapter:Landroid/widget/CursorAdapter;

    .line 29
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/MarkerAdapterView;->removeAllViewsInLayout()V

    .line 30
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/adapters/MarkerAdapterView;->requestLayout()V

    .line 31
    return-void
.end method

.method public setSelection(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 42
    return-void
.end method
