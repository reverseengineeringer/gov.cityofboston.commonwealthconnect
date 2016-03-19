.class Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$6;
.super Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;
.source "ReportMapFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handleClick(Lcom/google/android/gms/maps/model/LatLng;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener",
        "<",
        "Landroid/location/Address;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V
    .locals 0
    .param p2, "x0"    # Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    .prologue
    .line 285
    .local p3, "x1":Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener<Landroid/location/Address;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    invoke-direct {p0, p2, p3}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V

    return-void
.end method


# virtual methods
.method public onStateChange(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;Z)V
    .locals 2
    .param p1, "state"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;
    .param p2, "success"    # Z

    .prologue
    .line 289
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->FINISHED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    if-ne p1, v0, :cond_0

    .line 290
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->handler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->access$400(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;

    # getter for: Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->exposeSearch:Ljava/lang/Runnable;
    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;->access$300(Lcom/seeclickfix/ma/android/fragments/ReportMapFrag;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 292
    :cond_0
    return-void
.end method
