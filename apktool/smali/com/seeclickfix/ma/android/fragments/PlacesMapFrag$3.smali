.class Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$3;
.super Ljava/lang/Object;
.source "PlacesMapFrag.java"

# interfaces
.implements Lcom/google/android/gms/maps/GoogleMap$OnMapLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;)V
    .locals 0

    .prologue
    .line 210
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMapLongClick(Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 1
    .param p1, "ll"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag$3;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->handleClick(Lcom/google/android/gms/maps/model/LatLng;)V
    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;->access$000(Lcom/seeclickfix/ma/android/fragments/PlacesMapFrag;Lcom/google/android/gms/maps/model/LatLng;)V

    .line 216
    return-void
.end method
