.class public Lgov/cityofboston/commonwealthconnect/DedicatedStubActivity;
.super Lcom/seeclickfix/ma/android/SeeclickfixActivity;
.source "DedicatedStubActivity.java"


# annotations
.annotation build Lcom/seeclickfix/annotations/OttoSubclass;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;-><init>()V

    .line 15
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "This is a stub template for a generated class!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
