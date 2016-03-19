.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$3;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
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
    .line 346
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
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
    .line 352
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/City;

    .line 354
    .local v0, "city":Lcom/seeclickfix/ma/android/objects/loc/City;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 356
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lcom/seeclickfix/ma/android/objects/loc/City;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/seeclickfix/ma/android/objects/loc/City;->state:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->search(Ljava/lang/String;)V

    .line 358
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lcom/seeclickfix/ma/android/objects/loc/City;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/seeclickfix/ma/android/objects/loc/City;->state:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 359
    return-void
.end method
