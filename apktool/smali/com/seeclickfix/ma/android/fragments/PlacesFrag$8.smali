.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$8;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V
    .locals 0

    .prologue
    .line 627
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 631
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$8;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->updatePlacePositions()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->access$700(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V

    .line 632
    return-void
.end method
