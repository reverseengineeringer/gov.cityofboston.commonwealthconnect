.class public Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "PlacesFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "HandlerLeak"
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
        "Lcom/google/android/gms/maps/LocationSource$OnLocationChangedListener;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/seeclickfix/ma/android/objects/loc/Place;",
        ">;>;",
        "Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;"
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "PlacesFrag"

.field private static autoCompLoaderId:I

.field private static loaderID:I


# instance fields
.field autoCompleteListener:Landroid/widget/AdapterView$OnItemClickListener;

.field autocompleteLoaderCallbacks:Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation
.end field

.field private btnListener:Landroid/view/View$OnClickListener;

.field private c:Landroid/content/Context;

.field private cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

.field delayedUpdatePositions:Ljava/lang/Runnable;

.field private focusListener:Landroid/view/View$OnFocusChangeListener;

.field handler:Landroid/os/Handler;

.field private homePlaceLabel:Landroid/widget/TextView;

.field private lastKnownLocation:Landroid/location/Location;

.field locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mMap:Lcom/google/android/gms/maps/GoogleMap;

.field private mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

.field private mSearchBtn:Landroid/widget/ImageButton;

.field private mapBtnCard:Landroid/view/View;

.field mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private markerSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/maps/model/Marker;",
            ">;"
        }
    .end annotation
.end field

.field private onDimissCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;

.field private placeContainer:Landroid/view/ViewGroup;

.field placeRowClickListener:Landroid/view/View$OnClickListener;

.field private placeSearchTask:Landroid/os/AsyncTask;
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
.end field

.field private progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

.field private progressWheel:Landroid/widget/ProgressBar;

.field private searchAutoTextView:Landroid/widget/AutoCompleteTextView;

.field private selectedPlacesSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation
.end field

.field private serachListener:Landroid/widget/TextView$OnEditorActionListener;

.field private sortedPlaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 129
    const/16 v0, 0x258

    sput v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    .line 131
    const/16 v0, 0x320

    sput v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->autoCompLoaderId:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 286
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->handler:Landroid/os/Handler;

    .line 289
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->autocompleteLoaderCallbacks:Landroid/support/v4/app/LoaderManager$LoaderCallbacks;

    .line 346
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->autoCompleteListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 627
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$8;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$8;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->delayedUpdatePositions:Ljava/lang/Runnable;

    .line 860
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$11;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$11;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->onDimissCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;

    .line 1009
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$15;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$15;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeRowClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    return-object v0
.end method

.method static synthetic access$002(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;)Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->cityAdapter:Lcom/seeclickfix/ma/android/adapters/CityCursorAdapter;

    return-object p1
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/widget/AutoCompleteTextView;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Lcom/google/android/gms/maps/GoogleMap;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/location/Location;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->lastKnownLocation:Landroid/location/Location;

    return-object v0
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$502(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showSinglePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    return-void
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updatePlacePositions()V

    return-void
.end method

.method static synthetic access$800(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->performDismiss(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$900(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    return-object v0
.end method

.method private addSwipeListener(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "container"    # Landroid/view/ViewGroup;

    .prologue
    .line 852
    new-instance v0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->onDimissCallback:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;

    invoke-direct {v0, p1, v1, v2}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener;-><init>(Landroid/view/View;Ljava/lang/Object;Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissTouchListener$OnDismissCallback;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 857
    return-void
.end method

.method private animateMap(Landroid/location/Location;)V
    .locals 6
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 1191
    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 1192
    .local v1, "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    const/high16 v2, 0x41400000    # 12.0f

    invoke-static {v1, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 1194
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v3, 0x1f4

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 1195
    return-void
.end method

.method private clearGmapObject()V
    .locals 1

    .prologue
    .line 1174
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 1175
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/GoogleMap;->stopAnimation()V

    .line 1176
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 1177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 1179
    :cond_0
    return-void
.end method

.method private clearReferences()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1158
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    if-eqz v0, :cond_0

    .line 1159
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removeAllMarkers()V

    .line 1160
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1161
    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    .line 1164
    :cond_0
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->clearGmapObject()V

    .line 1166
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    if-eqz v0, :cond_1

    .line 1167
    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    .line 1170
    :cond_1
    return-void
.end method

.method private createListeners()V
    .locals 1

    .prologue
    .line 442
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->btnListener:Landroid/view/View$OnClickListener;

    .line 457
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->serachListener:Landroid/widget/TextView$OnEditorActionListener;

    .line 471
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$6;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->focusListener:Landroid/view/View$OnFocusChangeListener;

    .line 485
    return-void
.end method

.method private getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 370
    const/4 v1, 0x0

    .line 371
    .local v1, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLastLocationIfAvailable()Landroid/location/Location;

    move-result-object v0

    .line 373
    .local v0, "lastLocation":Landroid/location/Location;
    if-eqz v0, :cond_0

    .line 374
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getMiniMapOptions(Landroid/location/Location;)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    .line 379
    :goto_0
    invoke-virtual {v1, v3}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 380
    invoke-virtual {v1, v3}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 381
    invoke-virtual {v1, v3}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 383
    return-object v1

    .line 376
    :cond_0
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getStandardOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    goto :goto_0
.end method

.method private initMap()V
    .locals 3

    .prologue
    .line 366
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    const v1, 0x7f0a00ce

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;->initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    .line 367
    return-void
.end method

.method private performDismiss(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    .line 880
    if-nez p1, :cond_0

    .line 919
    :goto_0
    return-void

    .line 884
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 885
    .local v1, "lp":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 887
    .local v2, "originalHeight":I
    const/4 v3, 0x2

    new-array v3, v3, [I

    const/4 v4, 0x0

    aput v2, v3, v4

    aput v5, v3, v5

    invoke-static {v3}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v3

    const-wide/16 v4, 0x12c

    invoke-virtual {v3, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 889
    .local v0, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;

    invoke-direct {v3, p0, p1, v1, v2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$12;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;I)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 910
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$13;

    invoke-direct {v3, p0, v1, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$13;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Landroid/view/ViewGroup$LayoutParams;Landroid/view/View;)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 918
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    goto :goto_0
.end method

.method private processLocation(Landroid/location/Location;)V
    .locals 1
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 259
    if-eqz p1, :cond_0

    .line 260
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->lastKnownLocation:Landroid/location/Location;

    .line 261
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->stopActiveLocationUpdates()V

    .line 262
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->setupLoader()V

    .line 264
    :cond_0
    return-void
.end method

.method private removeAllMarkers()V
    .locals 3

    .prologue
    .line 1183
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    if-eqz v2, :cond_0

    .line 1184
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/maps/model/Marker;

    .line 1185
    .local v1, "m":Lcom/google/android/gms/maps/model/Marker;
    invoke-virtual {v1}, Lcom/google/android/gms/maps/model/Marker;->remove()V

    goto :goto_0

    .line 1188
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "m":Lcom/google/android/gms/maps/model/Marker;
    :cond_0
    return-void
.end method

.method private removeMapListeners()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 614
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_1

    .line 616
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 618
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 619
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setLocationSource(Lcom/google/android/gms/maps/LocationSource;)V

    .line 625
    :cond_0
    :goto_0
    return-void

    .line 622
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setLocationSource(Lcom/google/android/gms/maps/LocationSource;)V

    goto :goto_0
.end method

.method private setListeners()V
    .locals 2

    .prologue
    .line 584
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->serachListener:Landroid/widget/TextView$OnEditorActionListener;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 585
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->focusListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 587
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mSearchBtn:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->btnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 589
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mapBtnCard:Landroid/view/View;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->btnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 590
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 430
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00d7

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->progressWheel:Landroid/widget/ProgressBar;

    .line 431
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00d6

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->homePlaceLabel:Landroid/widget/TextView;

    .line 433
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00d8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    .line 434
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00cd

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mapBtnCard:Landroid/view/View;

    .line 435
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00d3

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->searchAutoTextView:Landroid/widget/AutoCompleteTextView;

    .line 437
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00d2

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mSearchBtn:Landroid/widget/ImageButton;

    .line 439
    return-void
.end method

.method private setUpMapIfNeeded()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 595
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_1

    .line 598
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 600
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 601
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 602
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setLocationSource(Lcom/google/android/gms/maps/LocationSource;)V

    .line 611
    :cond_0
    :goto_0
    return-void

    .line 605
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 606
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setLocationSource(Lcom/google/android/gms/maps/LocationSource;)V

    goto :goto_0
.end method

.method private setupLoader()V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 391
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    invoke-virtual {v1, v2}, Landroid/support/v4/app/LoaderManager;->getLoader(I)Landroid/support/v4/content/Loader;

    move-result-object v0

    .line 395
    .local v0, "curloader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;>;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/config/locale/LocaleManager;->getIsUS(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 396
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->autoCompLoaderId:I

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->autocompleteLoaderCallbacks:Landroid/support/v4/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v1, v2, v4, v3}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/content/Loader;->startLoading()V

    .line 403
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 405
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showPlaces(Ljava/util/List;)V

    .line 425
    :goto_0
    return-void

    .line 409
    :cond_1
    if-nez v0, :cond_2

    .line 411
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    invoke-virtual {v1, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/content/Loader;->forceLoad()V

    goto :goto_0

    .line 412
    :cond_2
    invoke-virtual {v0}, Landroid/support/v4/content/Loader;->isReset()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 414
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    invoke-virtual {v1, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/content/Loader;->forceLoad()V

    goto :goto_0

    .line 415
    :cond_3
    invoke-virtual {v0}, Landroid/support/v4/content/Loader;->isAbandoned()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 417
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    invoke-virtual {v1, v2}, Landroid/support/v4/app/LoaderManager;->getLoader(I)Landroid/support/v4/content/Loader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/content/Loader;->reset()V

    .line 418
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    invoke-virtual {v1, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/content/Loader;->forceLoad()V

    goto :goto_0

    .line 419
    :cond_4
    invoke-virtual {v0}, Landroid/support/v4/content/Loader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 421
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    invoke-virtual {v1, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/content/Loader;->forceLoad()V

    goto :goto_0

    .line 423
    :cond_5
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    sget v2, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->loaderID:I

    invoke-virtual {v1, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/content/Loader;->forceLoad()V

    goto :goto_0
.end method

.method private showPlaces(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 639
    .local p1, "sortedPlaces":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    .line 640
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 642
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    if-eqz v6, :cond_0

    .line 643
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removeAllMarkers()V

    .line 644
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    invoke-interface {v6}, Ljava/util/Set;->clear()V

    .line 645
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    iput-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    .line 648
    :cond_0
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v6, :cond_1

    .line 696
    :goto_0
    return-void

    .line 653
    :cond_1
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v6}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 655
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    iput-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    .line 657
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 659
    .local v3, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getApiId()I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_2

    .line 664
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    const v7, 0x7f03005a

    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-static {v6, v7, v8}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 665
    .local v4, "placeViewTile":Landroid/view/ViewGroup;
    const v6, 0x7f0a016b

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 666
    .local v2, "locationTextView":Landroid/widget/TextView;
    const v6, 0x7f0a016c

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 667
    .local v5, "stateTextView":Landroid/widget/TextView;
    const v6, 0x7f0a016a

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 669
    .local v0, "checkBox":Landroid/widget/CheckBox;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 670
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 671
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    if-nez v6, :cond_3

    .line 672
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    iput-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    .line 674
    :cond_3
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    invoke-interface {v6, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 676
    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addMarkerForPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 679
    :cond_4
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getState()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 680
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 681
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 683
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeRowClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 684
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-direct {p0, v4, v6}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addSwipeListener(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 685
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_1

    .line 690
    .end local v0    # "checkBox":Landroid/widget/CheckBox;
    .end local v2    # "locationTextView":Landroid/widget/TextView;
    .end local v3    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    .end local v4    # "placeViewTile":Landroid/view/ViewGroup;
    .end local v5    # "stateTextView":Landroid/widget/TextView;
    :cond_5
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->progressWheel:Landroid/widget/ProgressBar;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 691
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->homePlaceLabel:Landroid/widget/TextView;

    const v7, 0x7f0c008e

    invoke-virtual {p0, v7}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 693
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    invoke-direct {p0, v6}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updateCameraForPlaces(Ljava/util/Collection;)V

    .line 695
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->delayedUpdatePositions:Ljava/lang/Runnable;

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0
.end method

.method private showSinglePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 848
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showSinglePlaceAt(Lcom/seeclickfix/ma/android/objects/loc/Place;I)V

    .line 849
    return-void
.end method

.method private showSinglePlaceAt(Lcom/seeclickfix/ma/android/objects/loc/Place;I)V
    .locals 16
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p2, "position"    # I

    .prologue
    .line 700
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getApiId()I

    move-result v11

    const/4 v12, -0x1

    if-ne v11, v12, :cond_0

    .line 788
    :goto_0
    return-void

    .line 705
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getIgnored()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 706
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    const v12, 0x7f030065

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-static {v11, v12, v13}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 707
    .local v6, "placeViewTile":Landroid/view/ViewGroup;
    const v11, 0x7f0a016b

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 708
    .local v5, "nameTextView":Landroid/widget/TextView;
    const v11, 0x7f0a016c

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 709
    .local v8, "subTextView":Landroid/widget/TextView;
    const v11, 0x7f0a0174

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/Button;

    .line 711
    .local v10, "undoButton":Landroid/widget/Button;
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 712
    const v11, 0x7f0c00d3

    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setText(I)V

    .line 714
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 715
    new-instance v11, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$9;

    move-object/from16 v0, p0

    invoke-direct {v11, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$9;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    invoke-virtual {v10, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 725
    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 727
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getListPosition()I

    move-result v12

    invoke-virtual {v11, v6, v12}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 728
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->delayedUpdatePositions:Ljava/lang/Runnable;

    invoke-virtual {v11, v12}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 730
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->handler:Landroid/os/Handler;

    new-instance v12, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v12, v0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$10;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    const-wide/16 v14, 0x1388

    invoke-virtual {v11, v12, v14, v15}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 751
    .end local v5    # "nameTextView":Landroid/widget/TextView;
    .end local v6    # "placeViewTile":Landroid/view/ViewGroup;
    .end local v8    # "subTextView":Landroid/widget/TextView;
    .end local v10    # "undoButton":Landroid/widget/Button;
    :cond_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    const v12, 0x7f03005a

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-static {v11, v12, v13}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 752
    .restart local v6    # "placeViewTile":Landroid/view/ViewGroup;
    const v11, 0x7f0a016b

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 753
    .local v4, "locationTextView":Landroid/widget/TextView;
    const v11, 0x7f0a016c

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 754
    .local v7, "stateTextView":Landroid/widget/TextView;
    const v11, 0x7f0a016a

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    .line 756
    .local v2, "checkBox":Landroid/widget/CheckBox;
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isSelected()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 757
    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 758
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    if-nez v11, :cond_2

    .line 759
    new-instance v11, Ljava/util/HashSet;

    invoke-direct {v11}, Ljava/util/HashSet;-><init>()V

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    .line 761
    :cond_2
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    move-object/from16 v0, p1

    invoke-interface {v11, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 763
    invoke-virtual/range {p0 .. p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addMarkerForPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 766
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getState()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 767
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 769
    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 770
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeRowClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 772
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 774
    .local v3, "firstChild":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    move/from16 v0, p2

    invoke-virtual {v11, v6, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 776
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    invoke-direct {v0, v6, v11}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addSwipeListener(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 778
    if-eqz v3, :cond_4

    .line 779
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v9

    .line 780
    .local v9, "targetHeight":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    const/4 v12, 0x1

    invoke-static {v11, v6, v9, v12}, Lcom/seeclickfix/ma/android/anim/Transitions;->dropDown(Landroid/content/Context;Landroid/view/View;IZ)Landroid/view/animation/Animation;

    move-result-object v11

    invoke-virtual {v6, v11}, Landroid/view/ViewGroup;->setAnimation(Landroid/view/animation/Animation;)V

    .line 783
    .end local v9    # "targetHeight":I
    :cond_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updateCameraForPlaces(Ljava/util/Collection;)V

    .line 785
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->delayedUpdatePositions:Ljava/lang/Runnable;

    invoke-virtual {v11, v12}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0
.end method

.method private updateCameraForPlaces(Ljava/util/Collection;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "placesSet":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    const/4 v10, 0x1

    .line 926
    if-nez p1, :cond_1

    .line 973
    :cond_0
    :goto_0
    return-void

    .line 930
    :cond_1
    iget-object v9, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v9, :cond_2

    .line 935
    :cond_2
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v9

    if-ne v9, v10, :cond_3

    .line 936
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 938
    .local v8, "singlePlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    new-instance v7, Landroid/location/Location;

    const-string/jumbo v9, "Manual Place Code"

    invoke-direct {v7, v9}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 940
    .local v7, "singleLocation":Landroid/location/Location;
    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Landroid/location/Location;->setLatitude(D)V

    .line 941
    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Landroid/location/Location;->setLongitude(D)V

    .line 943
    invoke-direct {p0, v7}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->animateMap(Landroid/location/Location;)V

    goto :goto_0

    .line 945
    .end local v7    # "singleLocation":Landroid/location/Location;
    .end local v8    # "singlePlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :cond_3
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v9

    if-lt v9, v10, :cond_0

    .line 950
    new-instance v3, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;

    invoke-direct {v3}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;-><init>()V

    .line 952
    .local v3, "llBoundBuilder":Lcom/google/android/gms/maps/model/LatLngBounds$Builder;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 954
    .local v5, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getApiId()I

    move-result v9

    const/4 v10, -0x1

    if-eq v9, v10, :cond_4

    .line 958
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 959
    .local v1, "issueLat":Ljava/lang/Double;
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 960
    .local v2, "issueLng":Ljava/lang/Double;
    new-instance v6, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    invoke-direct {v6, v10, v11, v12, v13}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 962
    .local v6, "placeLatLng":Lcom/google/android/gms/maps/model/LatLng;
    invoke-virtual {v3, v6}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;->include(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLngBounds$Builder;

    goto :goto_1

    .line 966
    .end local v1    # "issueLat":Ljava/lang/Double;
    .end local v2    # "issueLng":Ljava/lang/Double;
    .end local v5    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    .end local v6    # "placeLatLng":Lcom/google/android/gms/maps/model/LatLng;
    :cond_5
    :try_start_0
    invoke-virtual {v3}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;->build()Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object v4

    .line 968
    .local v4, "llBounds":Lcom/google/android/gms/maps/model/LatLngBounds;
    invoke-direct {p0, v4}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updateMapCamera(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 969
    .end local v4    # "llBounds":Lcom/google/android/gms/maps/model/LatLngBounds;
    :catch_0
    move-exception v9

    goto :goto_0
.end method

.method private updateMapCamera(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 4
    .param p1, "llBounds"    # Lcom/google/android/gms/maps/model/LatLngBounds;

    .prologue
    .line 985
    const/4 v0, 0x0

    .line 987
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    if-nez p1, :cond_0

    .line 1006
    :goto_0
    return-void

    .line 990
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b000b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    invoke-static {p1, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngBounds(Lcom/google/android/gms/maps/model/LatLngBounds;I)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 996
    move-object v1, v0

    .line 998
    .local v1, "cameUpdateFinal":Lcom/google/android/gms/maps/CameraUpdate;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->handler:Landroid/os/Handler;

    new-instance v3, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$14;

    invoke-direct {v3, p0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$14;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/google/android/gms/maps/CameraUpdate;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private updatePlacePositions()V
    .locals 3

    .prologue
    .line 822
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 823
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 826
    .local v1, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setListPosition(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 822
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 827
    :catch_0
    move-exception v2

    goto :goto_1

    .line 832
    .end local v1    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :cond_0
    return-void
.end method


# virtual methods
.method protected addMarkerForPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 8
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1072
    new-instance v2, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v4

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v6

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 1073
    .local v2, "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    new-instance v3, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v3}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 1075
    .local v3, "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    invoke-virtual {v3, v2}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 1076
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 1077
    const-string/jumbo v4, "Closed"

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    invoke-static {v4, v5}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 1080
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v4, v3}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v0

    .line 1081
    .local v0, "marker":Lcom/google/android/gms/maps/model/Marker;
    invoke-virtual {v0}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v1

    .line 1086
    .local v1, "markerId":Ljava/lang/String;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    if-nez v4, :cond_0

    .line 1087
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    iput-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    .line 1090
    :cond_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1092
    return-void
.end method

.method addPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1049
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addPlaceAt(Lcom/seeclickfix/ma/android/objects/loc/Place;I)V

    .line 1050
    return-void
.end method

.method addPlaceAt(Lcom/seeclickfix/ma/android/objects/loc/Place;I)V
    .locals 5
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;
    .param p2, "position"    # I

    .prologue
    .line 1037
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addPlaceToSet(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1038
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addMarkerForPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1039
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->addPlaceToNav(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1040
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updateCameraForPlaces(Ljava/util/Collection;)V

    .line 1042
    const v1, 0x7f0c00d7

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1044
    .local v0, "placeToastString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 1045
    return-void
.end method

.method protected addPlaceToNav(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 2
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1117
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$17;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$17;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1132
    .local v0, "addPlaceRunnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1134
    return-void
.end method

.method addPlaceToSet(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 2
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 1139
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    .line 1141
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setSelected(Z)V

    .line 1142
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1144
    return-void
.end method

.method protected doSearch()V
    .locals 4

    .prologue
    .line 489
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a00d3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 490
    .local v0, "et":Landroid/widget/EditText;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/util/FormUtil;->hideKeyboard(Landroid/view/View;)V

    .line 492
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 494
    .local v1, "text":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 495
    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->search(Ljava/lang/String;)V

    .line 501
    :cond_0
    return-void
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 197
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getPlaceRowByTag(Lcom/seeclickfix/ma/android/objects/loc/Place;)Landroid/view/View;
    .locals 4
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 795
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 797
    :try_start_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 798
    .local v0, "currentView":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 801
    .local v2, "tagPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {p1, v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 814
    .end local v0    # "currentView":Landroid/view/View;
    .end local v2    # "tagPlace":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :goto_1
    return-object v0

    .line 806
    :catch_0
    move-exception v3

    .line 795
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 814
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method protected hideProgressWheelDialog()V
    .locals 1

    .prologue
    .line 556
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    if-eqz v0, :cond_0

    .line 557
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->dismiss()V

    .line 559
    :cond_0
    return-void
.end method

.method protected ignorePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p1, "p"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 977
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setIgnored(Z)V

    .line 979
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 981
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getListPosition()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showSinglePlaceAt(Lcom/seeclickfix/ma/android/objects/loc/Place;I)V

    .line 982
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 224
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 227
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    .line 229
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->setReferences()V

    .line 230
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->createListeners()V

    .line 231
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->setListeners()V

    .line 232
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->initMap()V

    .line 234
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->setHasOptionsMenu(Z)V

    .line 236
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 217
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onAttach(Landroid/app/Activity;)V

    .line 220
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 5
    .param p1, "id"    # I
    .param p2, "args"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 1230
    new-instance v1, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->lastKnownLocation:Landroid/location/Location;

    invoke-direct {v1, v2, v3, v4}, Lcom/seeclickfix/ma/android/tasks/GetPlacesTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/tasks/ShouldRun;Landroid/location/Location;)V

    .line 1232
    .local v1, "task":Lcom/seeclickfix/ma/android/tasks/CancellableTask;, "Lcom/seeclickfix/ma/android/tasks/CancellableTask<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;>;"
    new-instance v0, Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->c:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/tasks/CancellableTask;)V

    .line 1234
    .local v0, "placeLoader":Lcom/seeclickfix/ma/android/loaders/PlaceAsyncLoader;
    return-object v0
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 240
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 241
    const v0, 0x7f0e0002

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 242
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 243
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 151
    if-nez p2, :cond_0

    .line 152
    const/4 v0, 0x0

    .line 160
    :goto_0
    return-object v0

    .line 154
    :cond_0
    const v0, 0x7f030032

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 156
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I

    .line 160
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 1201
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDestroy()V

    .line 1203
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->clearReferences()V

    .line 1204
    return-void
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 165
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDestroyView()V

    .line 169
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->clearReferences()V

    .line 171
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->unSubscribeFromEventBus()V

    .line 172
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Landroid/support/v4/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 103
    check-cast p2, Ljava/util/List;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->onLoadFinished(Landroid/support/v4/content/Loader;Ljava/util/List;)V

    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;>;",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1242
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;>;"
    .local p2, "data":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 1257
    :cond_0
    :goto_0
    return-void

    .line 1247
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1249
    :try_start_0
    invoke-direct {p0, p2}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showPlaces(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1250
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/loc/Place;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 1264
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Ljava/util/List<Lcom/seeclickfix/ma/android/objects/loc/Place;>;>;"
    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 1211
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removeMapListeners()V

    .line 1223
    return-void
.end method

.method public onLocationConnectedEvent(Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;)V
    .locals 3
    .param p1, "connectedEvent"    # Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 271
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 272
    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->CLOSE_AND_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/location/LocationValidator;->isPrecise(Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;Landroid/location/Location;)Z

    move-result v0

    .line 276
    .local v0, "isPrecise":Z
    if-eqz v0, :cond_1

    .line 278
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationConnectedEvent;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->processLocation(Landroid/location/Location;)V

    .line 283
    .end local v0    # "isPrecise":Z
    :cond_0
    :goto_0
    return-void

    .line 280
    .restart local v0    # "isPrecise":Z
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    goto :goto_0
.end method

.method public onLocationTimeoutEvent(Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;)V
    .locals 1
    .param p1, "locationEvent"    # Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 252
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;->getLocation()Landroid/location/Location;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->processLocation(Landroid/location/Location;)V

    .line 256
    return-void
.end method

.method public onLocationUpdate(Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;)V
    .locals 1
    .param p1, "locationEvent"    # Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 247
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LocationUpdateEvent;->getLocation()Landroid/location/Location;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->processLocation(Landroid/location/Location;)V

    .line 248
    return-void
.end method

.method public onMapPlaceCancel()V
    .locals 0

    .prologue
    .line 1288
    return-void
.end method

.method public onMapPlaceSaved(Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 3
    .param p1, "pageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 1270
    :try_start_0
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/PageParams;->getParcel()Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 1272
    .local v0, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    .line 1273
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 1274
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showSinglePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1282
    .end local v0    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :goto_1
    return-void

    .line 1272
    .restart local v0    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->sortedPlaces:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1276
    .end local v0    # "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 202
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 206
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->setUpMapIfNeeded()V

    .line 207
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->subscribeToEventBus()V

    .line 208
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    .line 212
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 177
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 179
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeSearchTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeSearchTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 184
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :goto_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->unSubscribeFromEventBus()V

    .line 192
    return-void

    .line 185
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method removeMarkerForPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 4
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1055
    if-eqz p1, :cond_1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    if-eqz v2, :cond_1

    .line 1057
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->markerSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/maps/model/Marker;

    .line 1058
    .local v1, "marker":Lcom/google/android/gms/maps/model/Marker;
    invoke-virtual {v1}, Lcom/google/android/gms/maps/model/Marker;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1059
    invoke-virtual {v1}, Lcom/google/android/gms/maps/model/Marker;->remove()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1068
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "marker":Lcom/google/android/gms/maps/model/Marker;
    :cond_1
    :goto_0
    return-void

    .line 1063
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method removePlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1029
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removeMarkerForPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1030
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removePlaceFromSet(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1031
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->removePlaceFromNav(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1032
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updateCameraForPlaces(Ljava/util/Collection;)V

    .line 1034
    return-void
.end method

.method protected removePlaceFromNav(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 2
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1096
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$16;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 1111
    .local v0, "removePlaceRunnable":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1112
    return-void
.end method

.method removePlaceFromSet(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 1
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 1147
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setSelected(Z)V

    .line 1149
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    if-eqz v0, :cond_0

    .line 1150
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->selectedPlacesSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1154
    :cond_0
    return-void
.end method

.method protected search(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 504
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$7;-><init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeSearchTask:Landroid/os/AsyncTask;

    .line 551
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeSearchTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 552
    return-void
.end method

.method protected showMapFull()V
    .locals 3

    .prologue
    .line 572
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getPlacesParams(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 574
    .local v1, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->lastKnownLocation:Landroid/location/Location;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 576
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/PlaceMapLauncher;

    .line 578
    .local v0, "btnInterface":Lcom/seeclickfix/ma/android/fragments/interfaces/PlaceMapLauncher;
    invoke-interface {v0, p0, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/PlaceMapLauncher;->launchPlacesMap(Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;Lcom/seeclickfix/ma/android/objects/PageParams;)V

    .line 580
    return-void
.end method

.method protected showProgressWheelDialog()V
    .locals 4

    .prologue
    .line 563
    const v1, 0x7f0c0139

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 564
    .local v0, "searchingText":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    .line 565
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->setMessage(Ljava/lang/String;)V

    .line 566
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 567
    return-void
.end method

.method protected undo(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 2
    .param p1, "undoPlace"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 836
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1, v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setIgnored(Z)V

    .line 837
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->placeContainer:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getListPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 838
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getListPosition()I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->showSinglePlaceAt(Lcom/seeclickfix/ma/android/objects/loc/Place;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 845
    :goto_0
    return-void

    .line 839
    :catch_0
    move-exception v0

    goto :goto_0
.end method
