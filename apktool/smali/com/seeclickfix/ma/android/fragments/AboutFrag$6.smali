.class Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;
.super Ljava/lang/Object;
.source "AboutFrag.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/AboutFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V
    .locals 0

    .prologue
    .line 437
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
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
    .line 441
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/seeclickfix/ma/android/location/TestLocationList;->getPresetLocations(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 442
    .local v1, "presetLocationList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/location/PresetLocation;>;"
    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/location/PresetLocation;

    .line 444
    .local v0, "presetLocation":Lcom/seeclickfix/ma/android/location/PresetLocation;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/PresetLocation;->name()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "(No location selected)"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 446
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    iget-object v2, v2, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->mLocationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->forceMockLocation(Lcom/seeclickfix/ma/android/location/PresetLocation;)V

    .line 447
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/AboutFrag;->clearAllVolleyCache()V
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->access$200(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)V

    .line 448
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/AboutFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/AboutFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/AboutFrag;->c:Landroid/content/Context;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/fragments/AboutFrag;->access$100(Lcom/seeclickfix/ma/android/fragments/AboutFrag;)Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Location set to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/PresetLocation;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "Volley cache cleared."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 455
    :cond_0
    return-void
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
    .line 458
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
