.class Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;
.super Ljava/lang/Object;
.source "SwipeDismissListViewTouchListener.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PendingDismissData"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;",
        ">;"
    }
.end annotation


# instance fields
.field public position:I

.field final synthetic this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

.field public view:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;ILandroid/view/View;)V
    .locals 0
    .param p2, "position"    # I
    .param p3, "view"    # Landroid/view/View;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;->this$0:Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 298
    iput p2, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;->position:I

    .line 299
    iput-object p3, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    .line 300
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;)I
    .locals 2
    .param p1, "other"    # Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;

    .prologue
    .line 305
    iget v0, p1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;->position:I

    iget v1, p0, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 293
    check-cast p1, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;->compareTo(Lcom/seeclickfix/ma/android/views/swipe/SwipeDismissListViewTouchListener$PendingDismissData;)I

    move-result v0

    return v0
.end method
