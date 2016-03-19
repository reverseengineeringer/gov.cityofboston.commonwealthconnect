.class public Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IssueActionReceipt"
.end annotation


# instance fields
.field public createdAt:Ljava/util/Date;

.field public follow:I

.field public issue:Lcom/seeclickfix/ma/android/api/SCFService$IssueStub;

.field public metadata:Lcom/seeclickfix/ma/android/api/SCFService$Metadata;

.field public moderated:Z

.field public vote:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;->issue:Lcom/seeclickfix/ma/android/api/SCFService$IssueStub;

    iget-object v0, v0, Lcom/seeclickfix/ma/android/api/SCFService$IssueStub;->status:Ljava/lang/String;

    return-object v0
.end method

.method public isModerated()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 261
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;->moderated:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;->metadata:Lcom/seeclickfix/ma/android/api/SCFService$Metadata;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;->metadata:Lcom/seeclickfix/ma/android/api/SCFService$Metadata;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/api/SCFService$Metadata;->isModerated()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
