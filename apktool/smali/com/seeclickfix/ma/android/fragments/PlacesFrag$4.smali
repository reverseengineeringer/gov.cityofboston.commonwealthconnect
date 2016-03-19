.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$4;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->createListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V
    .locals 0

    .prologue
    .line 442
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 445
    const v0, 0x7f0a00cd

    .line 447
    .local v0, "MAP_ID":I
    const v1, 0x7f0a00d2

    .line 449
    .local v1, "SEARCH_ID":I
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const v3, 0x7f0a00cd

    if-ne v2, v3, :cond_1

    .line 450
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showMapFull()V

    .line 454
    :cond_0
    :goto_0
    return-void

    .line 451
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    const v3, 0x7f0a00d2

    if-ne v2, v3, :cond_0

    .line 452
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$4;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->doSearch()V

    goto :goto_0
.end method
