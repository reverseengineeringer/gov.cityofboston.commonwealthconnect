.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$6;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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
    .line 471
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 477
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0a00d3

    if-ne v1, v2, :cond_0

    if-eqz p2, :cond_0

    .line 478
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/view/ViewGroup;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 479
    .local v0, "sv":Landroid/widget/ScrollView;
    const/4 v2, 0x0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 482
    .end local v0    # "sv":Landroid/widget/ScrollView;
    :cond_0
    return-void
.end method
