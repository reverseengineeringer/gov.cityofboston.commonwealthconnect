.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$14;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    .line 716
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 720
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$1100(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$14;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    iget-object v1, v1, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->camChangeListener:Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMap;->setOnCameraChangeListener(Lcom/google/android/gms/maps/GoogleMap$OnCameraChangeListener;)V

    .line 721
    return-void
.end method
