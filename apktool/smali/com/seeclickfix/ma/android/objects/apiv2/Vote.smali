.class public Lcom/seeclickfix/ma/android/objects/apiv2/Vote;
.super Ljava/lang/Object;
.source "Vote.java"


# instance fields
.field private createdAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation
.end field

.field private vote:Lcom/seeclickfix/ma/android/objects/apiv2/User;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
