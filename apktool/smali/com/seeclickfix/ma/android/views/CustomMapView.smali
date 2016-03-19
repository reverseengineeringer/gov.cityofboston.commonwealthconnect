.class public Lcom/seeclickfix/ma/android/views/CustomMapView;
.super Lcom/google/android/gms/maps/MapView;
.source "CustomMapView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/maps/MapView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/maps/MapView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V
    .locals 0
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "arg1"    # Lcom/google/android/gms/maps/GoogleMapOptions;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/maps/MapView;-><init>(Landroid/content/Context;Lcom/google/android/gms/maps/GoogleMapOptions;)V

    .line 26
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x0

    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 40
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 53
    :goto_0
    invoke-super {p0, p1}, Lcom/google/android/gms/maps/MapView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 54
    return v3

    .line 43
    :pswitch_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomMapView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_0

    .line 48
    :pswitch_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/CustomMapView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_0

    .line 40
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
