.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private newStatusState:Ljava/lang/String;

.field final synthetic this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V
    .locals 0

    .prologue
    .line 1164
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 1170
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;

    .line 1172
    .local v0, "adapter":Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;
    invoke-virtual {v0, p3}, Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;->getItemState(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;->newStatusState:Ljava/lang/String;

    .line 1174
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 1178
    .local v1, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;->newStatusState:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1188
    :cond_0
    :goto_0
    return-void

    .line 1182
    :cond_1
    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->statusListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$800(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 1183
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 1185
    .local v2, "spinnerContainer":Landroid/view/ViewGroup;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->statusListener:Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;
    invoke-static {v3}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$800(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;

    move-result-object v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$9;->newStatusState:Ljava/lang/String;

    invoke-interface {v3, v1, v4}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnStatusChangeListener;->onStatusChange(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1193
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
