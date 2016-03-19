.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;
.super Landroid/os/AsyncTask;
.source "PlacesFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->search(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/seeclickfix/ma/android/objects/loc/Place;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 504
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/loc/Place;
    .locals 8
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 513
    new-instance v1, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;
    invoke-static {v4}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->lastKnownLocation:Landroid/location/Location;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$400(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/location/Location;

    move-result-object v6

    aget-object v7, p1, v7

    invoke-direct {v1, v4, v5, v6, v7}, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/tasks/ShouldRun;Landroid/location/Location;Ljava/lang/String;)V

    .line 515
    .local v1, "netTask":Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/tasks/GetPlaceBySearchTask;->call()Ljava/util/List;

    move-result-object v3

    .line 517
    .local v3, "placesList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    const/4 v2, 0x0

    .line 519
    .local v2, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    const/4 v4, 0x0

    :try_start_0
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-object v2, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 525
    :goto_0
    return-object v2

    .line 520
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 504
    check-cast p1, [Ljava/lang/String;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->doInBackground([Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/loc/Place;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 6
    .param p1, "result"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    const/4 v5, 0x0

    .line 530
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 547
    :goto_0
    return-void

    .line 534
    :cond_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 535
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->hideProgressWheelDialog()V

    .line 537
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 538
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    # setter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;
    invoke-static {v2, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$502(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Ljava/util/List;)Ljava/util/List;

    .line 539
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v5, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 540
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/AutoCompleteTextView;->setText(Ljava/lang/CharSequence;)V

    .line 542
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showSinglePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    invoke-static {v1, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$600(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    goto :goto_0

    .line 538
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$500(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Ljava/util/List;

    move-result-object v1

    goto :goto_1

    .line 544
    :cond_2
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    const v2, 0x7f0c0138

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->val$name:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 545
    .local v0, "searchingText":Ljava/lang/String;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 504
    check-cast p1, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->onPostExecute(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    .prologue
    .line 507
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 508
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showProgressWheelDialog()V

    .line 509
    return-void
.end method
