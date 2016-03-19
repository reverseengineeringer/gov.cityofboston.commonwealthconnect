.class public Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "IssuesMapFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/Titled;
.implements Lcom/google/android/gms/maps/GoogleMap$OnMarkerClickListener;
.implements Lcom/google/android/gms/maps/GoogleMap$OnInfoWindowClickListener;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IssuesMapFrag"

.field private static markerSelected:Lcom/google/android/gms/maps/model/Marker;


# instance fields
.field private adapter:Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;

.field private c:Landroid/content/Context;

.field camChangeListener:Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;

.field errorListener:Lcom/android/volley/Response$ErrorListener;

.field private getIssueMapTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

.field private getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

.field private getIssueTask2:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

.field private getIssueTask3:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

.field private getIssueTask4:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

.field private getIssueTask5:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

.field private handler:Landroid/os/Handler;

.field private imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field private infowWinAdapter:Lcom/google/android/gms/maps/GoogleMap$InfoWindowAdapter;

.field private isReloading:Z

.field listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mMap:Lcom/google/android/gms/maps/GoogleMap;

.field private mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

.field mapAnimationCallback:Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;

.field mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

.field private mapContainer:Landroid/view/ViewGroup;

.field mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private markerHashMap:Ljava/util/Map;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/gms/maps/model/Marker;",
            ">;"
        }
    .end annotation
.end field

.field private markersMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;"
        }
    .end annotation
.end field

.field private newCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

.field private page:I

.field private place:Lcom/seeclickfix/ma/android/objects/loc/Place;

.field private previousCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

.field private previousIssueId:I

.field reload1:Ljava/lang/Runnable;

.field reload2:Ljava/lang/Runnable;

.field reload3:Ljava/lang/Runnable;

.field reload4:Ljava/lang/Runnable;

.field reload5:Ljava/lang/Runnable;

.field reloadDelay:Ljava/lang/Runnable;

.field reloadListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field removeMapDelayed:Ljava/lang/Runnable;

.field private selectedIssueId:I

.field setCamListener:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    .line 94
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->isReloading:Z

    .line 95
    iput v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->page:I

    .line 114
    const/4 v0, -0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->selectedIssueId:I

    .line 337
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload1:Ljava/lang/Runnable;

    .line 361
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload2:Ljava/lang/Runnable;

    .line 386
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload3:Ljava/lang/Runnable;

    .line 411
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload4:Ljava/lang/Runnable;

    .line 436
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload5:Ljava/lang/Runnable;

    .line 461
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$6;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reloadDelay:Ljava/lang/Runnable;

    .line 493
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$7;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->listener:Lcom/android/volley/Response$Listener;

    .line 517
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$8;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$8;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reloadListener:Lcom/android/volley/Response$Listener;

    .line 548
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$9;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$9;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 561
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$10;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->camChangeListener:Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;

    .line 575
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$11;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$11;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

    .line 702
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$13;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$13;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapAnimationCallback:Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;

    .line 716
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$14;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$14;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setCamListener:Ljava/lang/Runnable;

    .line 816
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$15;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->infowWinAdapter:Lcom/google/android/gms/maps/GoogleMap$InfoWindowAdapter;

    .line 958
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$17;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$17;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->removeMapDelayed:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->newCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    return-object v0
.end method

.method static synthetic access$002(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/CameraPosition;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->newCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    return-object p1
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)I
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->page:I

    return v0
.end method

.method static synthetic access$1000(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handleListLoaded()V

    return-void
.end method

.method static synthetic access$102(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;I)I
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # I

    .prologue
    .line 70
    iput p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->page:I

    return p1
.end method

.method static synthetic access$1100(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/google/android/gms/maps/GoogleMap;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/LatLngBounds;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->pruneByBounds(Lcom/google/android/gms/maps/model/LatLngBounds;)V

    return-void
.end method

.method static synthetic access$1302(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->isReloading:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1500()Lcom/google/android/gms/maps/model/Marker;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerSelected:Lcom/google/android/gms/maps/model/Marker;

    return-object v0
.end method

.method static synthetic access$1502(Lcom/google/android/gms/maps/model/Marker;)Lcom/google/android/gms/maps/model/Marker;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/gms/maps/model/Marker;

    .prologue
    .line 70
    sput-object p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerSelected:Lcom/google/android/gms/maps/model/Marker;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Landroid/widget/ImageView;

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->loadIconForView(Ljava/lang/String;Landroid/widget/ImageView;)V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueMapTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object v0
.end method

.method static synthetic access$202(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueMapTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object p1
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/objects/loc/Place;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask2:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object v0
.end method

.method static synthetic access$402(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask2:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object p1
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask3:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object v0
.end method

.method static synthetic access$502(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask3:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object p1
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask4:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object v0
.end method

.method static synthetic access$602(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask4:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object p1
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask5:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object v0
.end method

.method static synthetic access$702(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;)Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask5:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    return-object p1
.end method

.method static synthetic access$800(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload()V

    return-void
.end method

.method static synthetic access$900(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;

    return-object v0
.end method

.method private clearMarkers()V
    .locals 4

    .prologue
    .line 229
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    if-eqz v3, :cond_1

    .line 230
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 231
    .local v0, "i":Ljava/lang/Integer;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/maps/model/Marker;

    .line 232
    .local v2, "m":Lcom/google/android/gms/maps/model/Marker;
    invoke-virtual {v2}, Lcom/google/android/gms/maps/model/Marker;->remove()V

    goto :goto_0

    .line 235
    .end local v0    # "i":Ljava/lang/Integer;
    .end local v2    # "m":Lcom/google/android/gms/maps/model/Marker;
    :cond_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 236
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    .line 240
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    if-eqz v3, :cond_2

    .line 243
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 244
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    .line 247
    :cond_2
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v3, :cond_3

    .line 248
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v3}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 250
    :cond_3
    return-void
.end method

.method private extractArgs()V
    .locals 4

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "cam_position"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/maps/model/CameraPosition;

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->previousCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 195
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "place_bundle"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/loc/Place;

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 197
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "issue_id"

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 199
    .local v0, "issueId":I
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setSelectedMarker(I)V

    .line 201
    return-void
.end method

.method private getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 204
    new-instance v2, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v4

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v6

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 206
    .local v2, "target":Lcom/google/android/gms/maps/model/LatLng;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->previousCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    if-nez v3, :cond_0

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v2, v3}, Lcom/google/android/gms/maps/model/CameraPosition;->fromLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v0

    .line 210
    .local v0, "camera":Lcom/google/android/gms/maps/model/CameraPosition;
    :goto_0
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getStandardOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    .line 211
    .local v1, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    invoke-virtual {v1, v0}, Lcom/google/android/gms/maps/GoogleMapOptions;->camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 212
    invoke-virtual {v1, v8}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 213
    invoke-virtual {v1, v8}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 214
    invoke-virtual {v1, v8}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 216
    return-object v1

    .line 206
    .end local v0    # "camera":Lcom/google/android/gms/maps/model/CameraPosition;
    .end local v1    # "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->previousCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    goto :goto_0
.end method

.method private handleListLoaded()V
    .locals 3

    .prologue
    .line 644
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 645
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;->getAllAsList()Ljava/util/List;

    move-result-object v0

    .line 646
    .local v0, "issueList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->showMarkersFromList(Ljava/util/List;)V

    .line 648
    const/16 v1, 0x1f4

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setCamListener(I)V

    .line 649
    return-void
.end method

.method private initMap()V
    .locals 3

    .prologue
    .line 186
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    const v1, 0x7f0a00a9

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;->initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    .line 187
    return-void
.end method

.method private killHandler()V
    .locals 2

    .prologue
    .line 653
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 654
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 656
    :cond_0
    return-void
.end method

.method private loadIconForView(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imgView"    # Landroid/widget/ImageView;

    .prologue
    const v1, 0x7f020158

    const/16 v2, 0x30

    .line 876
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    if-eqz v0, :cond_0

    .line 879
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    invoke-virtual {v0}, Lcom/android/volley/toolbox/ImageLoader$ImageContainer;->cancelRequest()V

    .line 882
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    invoke-static {p2, v1, v1}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v1

    invoke-virtual {v0, p1, v1, v2, v2}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    .line 890
    return-void
.end method

.method private pruneByBounds(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 7
    .param p1, "bounds"    # Lcom/google/android/gms/maps/model/LatLngBounds;

    .prologue
    .line 595
    const/4 v4, 0x0

    .line 597
    .local v4, "markersRemoved":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 599
    .local v5, "pruneList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 600
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/google/android/gms/maps/model/Marker;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/maps/model/Marker;

    .line 602
    .local v3, "m":Lcom/google/android/gms/maps/model/Marker;
    invoke-virtual {v3}, Lcom/google/android/gms/maps/model/Marker;->isInfoWindowShown()Z

    move-result v6

    if-nez v6, :cond_0

    .line 607
    invoke-virtual {v3}, Lcom/google/android/gms/maps/model/Marker;->getPosition()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v6

    invoke-virtual {p1, v6}, Lcom/google/android/gms/maps/model/LatLngBounds;->contains(Lcom/google/android/gms/maps/model/LatLng;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 608
    invoke-virtual {v3}, Lcom/google/android/gms/maps/model/Marker;->remove()V

    .line 610
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 611
    add-int/lit8 v4, v4, 0x1

    .line 612
    goto :goto_0

    .line 617
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/google/android/gms/maps/model/Marker;>;"
    .end local v3    # "m":Lcom/google/android/gms/maps/model/Marker;
    :cond_1
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 618
    .local v2, "key":Ljava/lang/Integer;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-interface {v6, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 624
    .end local v2    # "key":Ljava/lang/Integer;
    :cond_2
    return-void
.end method

.method private reload()V
    .locals 4

    .prologue
    .line 471
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueMapTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    if-eqz v0, :cond_0

    .line 472
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueMapTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->cancel()V

    .line 475
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reloadDelay:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 476
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setCamListener:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 478
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload1:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 479
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload2:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 480
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload3:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 481
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload4:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 482
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload5:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 484
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload1:Ljava/lang/Runnable;

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 485
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload2:Ljava/lang/Runnable;

    const-wide/16 v2, 0x6e

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 486
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload3:Ljava/lang/Runnable;

    const-wide/16 v2, 0xd2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 487
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload4:Ljava/lang/Runnable;

    const-wide/16 v2, 0x136

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 488
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload5:Ljava/lang/Runnable;

    const-wide/16 v2, 0x19a

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 491
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 303
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00a9

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapContainer:Landroid/view/ViewGroup;

    .line 304
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapContainer:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 305
    return-void
.end method

.method private setSelectedMarker(I)V
    .locals 4
    .param p1, "issueId"    # I

    .prologue
    .line 803
    const/4 v3, -0x1

    if-eq p1, v3, :cond_1

    .line 805
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 806
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/google/android/gms/maps/model/Marker;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/maps/model/Marker;

    .line 807
    .local v2, "m":Lcom/google/android/gms/maps/model/Marker;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, p1, :cond_0

    .line 808
    sput-object v2, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerSelected:Lcom/google/android/gms/maps/model/Marker;

    goto :goto_0

    .line 813
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lcom/google/android/gms/maps/model/Marker;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "m":Lcom/google/android/gms/maps/model/Marker;
    :cond_1
    return-void
.end method

.method private setUpMapIfNeeded()V
    .locals 2

    .prologue
    .line 785
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_0

    .line 788
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 790
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_0

    .line 793
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/maps/GoogleMap;->setOnMarkerClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMarkerClickListener;)V

    .line 794
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapClickListener:Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setOnMapClickListener(Lcom/google/android/gms/maps/GoogleMap$OnMapClickListener;)V

    .line 796
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->infowWinAdapter:Lcom/google/android/gms/maps/GoogleMap$InfoWindowAdapter;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setInfoWindowAdapter(Lcom/google/android/gms/maps/GoogleMap$InfoWindowAdapter;)V

    .line 800
    :cond_0
    return-void
.end method

.method private setupAdapterAndListView()V
    .locals 2

    .prologue
    .line 636
    new-instance v0, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->adapter:Lcom/seeclickfix/ma/android/adapters/IssueListMapAdapter;

    .line 637
    return-void
.end method

.method private setupHandler()V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation

    .prologue
    .line 661
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$12;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$12;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    .line 674
    return-void
.end method

.method private showMap()V
    .locals 2

    .prologue
    .line 922
    :try_start_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapContainer:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 923
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->requestLayout()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 931
    :goto_0
    return-void

    .line 925
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private showMarkersFromList(Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 727
    .local p1, "issueList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Issue;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v10

    const-string/jumbo v11, "issue_id"

    const/4 v12, -0x1

    invoke-virtual {v10, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v10

    iput v10, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->previousIssueId:I

    .line 729
    new-instance v5, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;

    invoke-direct {v5}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;-><init>()V

    .line 731
    .local v5, "llBoundBuilder":Lcom/google/android/gms/maps/model/LatLngBounds$Builder;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 732
    .local v2, "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLat()D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 733
    .local v3, "issueLat":Ljava/lang/Double;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLng()D

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    .line 734
    .local v4, "issueLng":Ljava/lang/Double;
    new-instance v8, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v12

    invoke-direct {v8, v10, v11, v12, v13}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 735
    .local v8, "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    new-instance v9, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v9}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    .line 737
    .local v9, "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    invoke-virtual {v9, v8}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 738
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 739
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->c:Landroid/content/Context;

    invoke-static {v10, v11}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    .line 743
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 744
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v10, v9}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    move-result-object v7

    .line 746
    .local v7, "marker":Lcom/google/android/gms/maps/model/Marker;
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    invoke-virtual {v7}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 747
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerHashMap:Ljava/util/Map;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v10, v11, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 750
    iget v10, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->previousIssueId:I

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v11

    if-ne v10, v11, :cond_0

    .line 751
    invoke-virtual {v7}, Lcom/google/android/gms/maps/model/Marker;->showInfoWindow()V

    .line 758
    .end local v7    # "marker":Lcom/google/android/gms/maps/model/Marker;
    :cond_0
    invoke-virtual {v5, v8}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;->include(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLngBounds$Builder;

    goto :goto_0

    .line 764
    .end local v2    # "issue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .end local v3    # "issueLat":Ljava/lang/Double;
    .end local v4    # "issueLng":Ljava/lang/Double;
    .end local v8    # "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    .end local v9    # "markerOptions":Lcom/google/android/gms/maps/model/MarkerOptions;
    :cond_1
    :try_start_0
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v10, p0}, Lcom/google/android/gms/maps/GoogleMap;->setOnInfoWindowClickListener(Lcom/google/android/gms/maps/GoogleMap$OnInfoWindowClickListener;)V

    .line 766
    invoke-virtual {v5}, Lcom/google/android/gms/maps/model/LatLngBounds$Builder;->build()Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object v6

    .line 768
    .local v6, "llBounds":Lcom/google/android/gms/maps/model/LatLngBounds;
    invoke-direct {p0, v6}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->updateMapCamera(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 780
    .end local v6    # "llBounds":Lcom/google/android/gms/maps/model/LatLngBounds;
    :cond_2
    :goto_1
    return-void

    .line 769
    :catch_0
    move-exception v0

    .line 773
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v10

    if-eqz v10, :cond_2

    goto :goto_1
.end method

.method private startLoading()V
    .locals 6

    .prologue
    .line 314
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->previousCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    if-eqz v0, :cond_0

    .line 317
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->isReloading:Z

    .line 318
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->previousCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->newCamPosition:Lcom/google/android/gms/maps/model/CameraPosition;

    .line 319
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload()V

    .line 325
    :goto_0
    return-void

    .line 323
    :cond_0
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->listener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;-><init>(Landroid/content/Context;Lcom/seeclickfix/ma/android/objects/loc/Place;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;I)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    .line 324
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->execute()V

    goto :goto_0
.end method

.method private stopVolley()V
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesTask;->cancel()V

    .line 279
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueMapTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    if-eqz v0, :cond_1

    .line 280
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueMapTask:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->cancel()V

    .line 283
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask2:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    if-eqz v0, :cond_2

    .line 284
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask2:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->cancel()V

    .line 287
    :cond_2
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask3:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    if-eqz v0, :cond_3

    .line 288
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask3:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->cancel()V

    .line 291
    :cond_3
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask4:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    if-eqz v0, :cond_4

    .line 292
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask4:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->cancel()V

    .line 295
    :cond_4
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask5:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    if-eqz v0, :cond_5

    .line 296
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getIssueTask5:Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetIssuesMapTask;->cancel()V

    .line 298
    :cond_5
    return-void
.end method

.method private updateMapCamera(Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 6
    .param p1, "llBounds"    # Lcom/google/android/gms/maps/model/LatLngBounds;

    .prologue
    .line 679
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->isReloading:Z

    if-eqz v2, :cond_0

    .line 700
    :goto_0
    return-void

    .line 683
    :cond_0
    const/4 v0, 0x0

    .line 685
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    if-nez p1, :cond_1

    .line 686
    new-instance v1, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLat()D

    move-result-wide v2

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getPlaceLng()D

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 688
    .local v1, "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    const v2, 0x417ccccd    # 15.8f

    invoke-static {v1, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 697
    .end local v1    # "markerLatLng":Lcom/google/android/gms/maps/model/LatLng;
    :goto_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/google/android/gms/maps/GoogleMap;->setOnCameraChangeListener(Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;)V

    .line 698
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v3, 0x1f4

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mapAnimationCallback:Lcom/google/android/gms/maps/GoogleMap$CancelableCallback;

    invoke-virtual {v2, v0, v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    goto :goto_0

    .line 691
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b000a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    invoke-static {p1, v2}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngBounds(Lcom/google/android/gms/maps/model/LatLngBounds;I)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    goto :goto_1
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 915
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 895
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 162
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 163
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setHasOptionsMenu(Z)V

    .line 165
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 169
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 170
    const v0, 0x7f0e0004

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 171
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 172
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 124
    if-nez p2, :cond_0

    .line 125
    const/4 v0, 0x0

    .line 133
    :goto_0
    return-object v0

    .line 127
    :cond_0
    const v0, 0x7f03002e

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->rootFrag:Landroid/view/ViewGroup;

    .line 129
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->extractArgs()V

    .line 131
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->initMap()V

    .line 133
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 222
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDestroyView()V

    .line 223
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->clearMarkers()V

    .line 225
    return-void
.end method

.method public onInfoWindowClick(Lcom/google/android/gms/maps/model/Marker;)V
    .locals 6
    .param p1, "m"    # Lcom/google/android/gms/maps/model/Marker;

    .prologue
    .line 938
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 943
    .local v0, "issueClicked":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$16;

    invoke-direct {v1, p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$16;-><init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 953
    .local v1, "processClick":Ljava/lang/Runnable;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->removeMapDelayed:Ljava/lang/Runnable;

    const-wide/16 v4, 0x32

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 954
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    const-wide/16 v4, 0x64

    invoke-virtual {v2, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 956
    return-void
.end method

.method public onMarkerClick(Lcom/google/android/gms/maps/model/Marker;)Z
    .locals 3
    .param p1, "m"    # Lcom/google/android/gms/maps/model/Marker;

    .prologue
    .line 905
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markersMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/maps/model/Marker;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->selectedIssueId:I

    .line 906
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "issue_id"

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->selectedIssueId:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 908
    sput-object p1, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->markerSelected:Lcom/google/android/gms/maps/model/Marker;

    .line 910
    const/4 v0, 0x0

    return v0
.end method

.method public onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    .line 177
    invoke-interface {p1}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0186

    if-ne v0, v1, :cond_0

    .line 178
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 179
    const/4 v0, 0x1

    .line 181
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 255
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onPause()V

    .line 257
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "cam_position"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 259
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->clearMarkers()V

    .line 260
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 139
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 142
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->c:Landroid/content/Context;

    .line 145
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "place_bundle"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/loc/Place;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 148
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setReferences()V

    .line 149
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setupAdapterAndListView()V

    .line 151
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setUpMapIfNeeded()V

    .line 152
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setupHandler()V

    .line 154
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->startLoading()V

    .line 156
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getImageLoader()Lcom/android/volley/toolbox/ImageLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 158
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 264
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 265
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->clearMarkers()V

    .line 266
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->killHandler()V

    .line 267
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->stopVolley()V

    .line 270
    return-void
.end method

.method protected popThisFragment()V
    .locals 1

    .prologue
    .line 309
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->popBackStack()V

    .line 310
    return-void
.end method

.method protected setCamListener(I)V
    .locals 4
    .param p1, "delayMs"    # I

    .prologue
    .line 629
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/loc/Place;->isMyReports()Z

    move-result v0

    if-nez v0, :cond_0

    .line 630
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->setCamListener:Ljava/lang/Runnable;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 632
    :cond_0
    return-void
.end method

.method public setPlace(Lcom/seeclickfix/ma/android/objects/loc/Place;)V
    .locals 0
    .param p1, "place"    # Lcom/seeclickfix/ma/android/objects/loc/Place;

    .prologue
    .line 899
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->place:Lcom/seeclickfix/ma/android/objects/loc/Place;

    .line 900
    return-void
.end method
