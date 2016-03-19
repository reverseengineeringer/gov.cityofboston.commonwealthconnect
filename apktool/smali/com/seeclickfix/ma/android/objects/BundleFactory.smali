.class public Lcom/seeclickfix/ma/android/objects/BundleFactory;
.super Ljava/lang/Object;
.source "BundleFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFromParcel(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/os/Bundle;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "p"    # Landroid/os/Parcelable;

    .prologue
    .line 8
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 9
    .local v0, "b":Landroid/os/Bundle;
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 10
    return-object v0
.end method
