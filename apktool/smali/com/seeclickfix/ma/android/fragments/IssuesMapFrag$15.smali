.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$InfoWindowAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 0

    .prologue
    .line 816
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInfoContents(Lcom/google/android/gms/maps/model/Marker;)Landroid/view/View;
    .locals 8
    .param p1, "marker"    # Lcom/google/android/gms/maps/model/Marker;

    .prologue
    const/4 v5, 0x0

    .line 828
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    if-nez v6, :cond_1

    move-object v4, v5

    .line 866
    :cond_0
    :goto_0
    return-object v4

    .line 832
    :cond_1
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v6

    const v7, 0x7f030044

    invoke-virtual {v6, v7, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 836
    .local v4, "v":Landroid/view/View;
    const v6, 0x7f0a0127

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 838
    .local v3, "note":Landroid/widget/TextView;
    invoke-virtual {p1}, Lcom/google/android/gms/maps/model/Marker;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 842
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1600(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Ljava/util/Map;

    move-result-object v6

    invoke-virtual {p1}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 845
    .local v0, "i":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    const v6, 0x7f0a0126

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 847
    .local v2, "imgView":Landroid/widget/ImageView;
    invoke-virtual {v2}, Landroid/widget/ImageView;->bringToFront()V

    .line 849
    invoke-static {v0, v5}, Lcom/seeclickfix/ma/android/media/icons/ImageUrl;->getSmallUrlForIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 855
    .local v1, "iconUrl":Ljava/lang/String;
    const-string/jumbo v5, "no-image"

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 859
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    invoke-static {v5}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1700(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 860
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    invoke-static {v5}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1700(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 862
    :cond_2
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->c:Landroid/content/Context;
    invoke-static {v6}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1800(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Landroid/content/Context;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getBackground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 864
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->loadIconForView(Ljava/lang/String;Landroid/widget/ImageView;)V
    invoke-static {v5, v1, v2}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1900(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Ljava/lang/String;Landroid/widget/ImageView;)V

    goto :goto_0
.end method

.method public getInfoWindow(Lcom/google/android/gms/maps/model/Marker;)Landroid/view/View;
    .locals 1
    .param p1, "marker"    # Lcom/google/android/gms/maps/model/Marker;

    .prologue
    .line 821
    const/4 v0, 0x0

    return-object v0
.end method
