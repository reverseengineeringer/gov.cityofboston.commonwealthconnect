.class public Lcom/seeclickfix/ma/android/objects/apiv2/IssueInfo;
.super Ljava/lang/Object;
.source "IssueInfo.java"


# instance fields
.field private rating:I

.field private status:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/objects/apiv2/IssueInfo;->rating:I

    return-void
.end method
