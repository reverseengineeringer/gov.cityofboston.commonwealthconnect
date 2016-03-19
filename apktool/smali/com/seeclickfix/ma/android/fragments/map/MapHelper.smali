.class public Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
.super Ljava/lang/Object;
.source "MapHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method


# virtual methods
.method public initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;
    .locals 5
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p2, "containerId"    # I
    .param p3, "options"    # Lcom/google/android/gms/maps/GoogleMapOptions;

    .prologue
    .line 38
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/maps/MapsInitializer;->initialize(Landroid/content/Context;)I

    .line 40
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 43
    .local v0, "childFragManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0, p2}, Landroid/support/v4/app/FragmentManager;->findFragmentById(I)Landroid/support/v4/app/Fragment;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/maps/SupportMapFragment;

    .line 47
    .local v2, "mapFragment":Lcom/google/android/gms/maps/SupportMapFragment;
    if-eqz v2, :cond_0

    move-object v3, v2

    .line 58
    .end local v2    # "mapFragment":Lcom/google/android/gms/maps/SupportMapFragment;
    .local v3, "mapFragment":Lcom/google/android/gms/maps/SupportMapFragment;
    :goto_0
    return-object v3

    .line 51
    .end local v3    # "mapFragment":Lcom/google/android/gms/maps/SupportMapFragment;
    .restart local v2    # "mapFragment":Lcom/google/android/gms/maps/SupportMapFragment;
    :cond_0
    invoke-static {p3}, Lcom/google/android/gms/maps/SupportMapFragment;->newInstance(Lcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v2

    .line 52
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 53
    .local v1, "fragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {v1, p2, v2}, Landroid/support/v4/app/FragmentTransaction;->add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 54
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 56
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    move-object v3, v2

    .line 58
    .end local v2    # "mapFragment":Lcom/google/android/gms/maps/SupportMapFragment;
    .restart local v3    # "mapFragment":Lcom/google/android/gms/maps/SupportMapFragment;
    goto :goto_0
.end method
