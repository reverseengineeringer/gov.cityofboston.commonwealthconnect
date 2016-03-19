.class public Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "IssueDetailsMapFrag.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IssueDetailsMapFrag"


# instance fields
.field private c:Landroid/content/Context;

.field private headerText:Landroid/widget/TextView;

.field private headerText2:Landroid/widget/TextView;

.field private issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

.field private mMap:Lcom/google/android/gms/maps/GoogleMap;

.field private mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

.field public mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private topBar:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    return-void
.end method

.method private getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 74
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getStandardOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v0

    .line 75
    .local v0, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 76
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 77
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 79
    return-object v0
.end method

.method private initMap()V
    .locals 3

    .prologue
    .line 69
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    const v1, 0x7f0a00a4

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;->initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    .line 70
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00a2

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->headerText:Landroid/widget/TextView;

    .line 106
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00a3

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->headerText2:Landroid/widget/TextView;

    .line 107
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00a1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->topBar:Landroid/view/View;

    .line 109
    return-void
.end method

.method private setUpMapIfNeeded()V
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 163
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 167
    :cond_0
    return-void
.end method

.method private showContent()V
    .locals 4

    .prologue
    .line 116
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, "issueSummary":Ljava/lang/String;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "issueAddress":Ljava/lang/String;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->headerText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->headerText2:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->topBar:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 123
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->showMarker()V

    .line 125
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->updateMapCamera()V

    .line 127
    return-void
.end method

.method private showMarker()V
    .locals 10

    .prologue
    .line 142
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLat()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 143
    .local v0, "issueLat":Ljava/lang/Double;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLng()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 144
    .local v1, "issueLng":Ljava/lang/Double;
    new-instance v3, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v6

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    invoke-direct {v3, v6, v7, v8, v9}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 145
    .local v3, "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    new-instance v4, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v4}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 147
    .local v4, "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    invoke-virtual {v4, v3}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 148
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 149
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->c:Landroid/content/Context;

    invoke-static {v5, v6}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 150
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v5, v4}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v2

    .line 151
    .local v2, "marker":Lcom/google/android/gms/maps/model/Marker;
    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/Marker;->showInfoWindow()V

    .line 154
    return-void
.end method

.method private updateMapCamera()V
    .locals 6

    .prologue
    .line 131
    const/4 v0, 0x0

    .line 133
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLat()D

    move-result-wide v2

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLng()D

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 135
    .local v1, "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v1, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 137
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v3, 0x1f4

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 138
    return-void
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 55
    if-nez p2, :cond_0

    .line 56
    const/4 v0, 0x0

    .line 64
    :goto_0
    return-object v0

    .line 58
    :cond_0
    const v0, 0x7f03002c

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 60
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->initMap()V

    .line 64
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 90
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 93
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->c:Landroid/content/Context;

    .line 94
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->setReferences()V

    .line 96
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->setUpMapIfNeeded()V

    .line 98
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "issue_bundle"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 100
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsMapFrag;->showContent()V

    .line 101
    return-void
.end method
