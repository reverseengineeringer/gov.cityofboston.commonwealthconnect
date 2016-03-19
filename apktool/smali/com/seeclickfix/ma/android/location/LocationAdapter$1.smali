.class Lcom/seeclickfix/ma/android/location/LocationAdapter$1;
.super Ljava/lang/Object;
.source "LocationAdapter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/location/LocationAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/location/LocationAdapter;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/location/LocationAdapter;)V
    .locals 0

    .prologue
    .line 256
    iput-object p1, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter$1;->this$0:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 259
    iget-object v0, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter$1;->this$0:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    new-instance v1, Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/location/LocationAdapter$1;->this$0:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    # getter for: Lcom/seeclickfix/ma/android/location/LocationAdapter;->mCurrentLocation:Landroid/location/Location;
    invoke-static {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->access$000(Lcom/seeclickfix/ma/android/location/LocationAdapter;)Landroid/location/Location;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/seeclickfix/ma/android/events/LocationTimeoutEvent;-><init>(Landroid/location/Location;)V

    # invokes: Lcom/seeclickfix/ma/android/location/LocationAdapter;->postEvent(Ljava/lang/Object;)V
    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->access$100(Lcom/seeclickfix/ma/android/location/LocationAdapter;Ljava/lang/Object;)V

    .line 260
    return-void
.end method
