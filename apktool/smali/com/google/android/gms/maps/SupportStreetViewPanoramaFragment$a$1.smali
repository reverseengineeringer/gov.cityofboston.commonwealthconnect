.class Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a$1;
.super Lcom/google/android/gms/maps/internal/u$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a;->getStreetViewPanoramaAsync(Lcom/google/android/gms/maps/OnStreetViewPanoramaReadyCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic alG:Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a;

.field final synthetic alo:Lcom/google/android/gms/maps/OnStreetViewPanoramaReadyCallback;


# direct methods
.method constructor <init>(Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a;Lcom/google/android/gms/maps/OnStreetViewPanoramaReadyCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a$1;->alG:Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a;

    iput-object p2, p0, Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a$1;->alo:Lcom/google/android/gms/maps/OnStreetViewPanoramaReadyCallback;

    invoke-direct {p0}, Lcom/google/android/gms/maps/internal/u$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/maps/internal/IStreetViewPanoramaDelegate;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/maps/SupportStreetViewPanoramaFragment$a$1;->alo:Lcom/google/android/gms/maps/OnStreetViewPanoramaReadyCallback;

    new-instance v1, Lcom/google/android/gms/maps/StreetViewPanorama;

    invoke-direct {v1, p1}, Lcom/google/android/gms/maps/StreetViewPanorama;-><init>(Lcom/google/android/gms/maps/internal/IStreetViewPanoramaDelegate;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/maps/OnStreetViewPanoramaReadyCallback;->onStreetViewPanoramaReady(Lcom/google/android/gms/maps/StreetViewPanorama;)V

    return-void
.end method
