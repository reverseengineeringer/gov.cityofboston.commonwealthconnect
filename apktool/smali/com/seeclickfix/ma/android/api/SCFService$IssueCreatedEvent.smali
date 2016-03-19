.class public Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IssueCreatedEvent"
.end annotation


# instance fields
.field private issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

.field private response:Lretrofit/client/Response;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;Lretrofit/client/Response;)V
    .locals 1
    .param p1, "issueV2"    # Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;
    .param p2, "response"    # Lretrofit/client/Response;

    .prologue
    .line 270
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 271
    iput-object p2, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->response:Lretrofit/client/Response;

    .line 273
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 274
    invoke-static {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->fromIssue2(Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 278
    :goto_0
    return-void

    .line 276
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    goto :goto_0
.end method


# virtual methods
.method public getIssue()Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    return-object v0
.end method

.method public getNoticeItem()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 2

    .prologue
    .line 291
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->isAccepted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 292
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->ACCEPTED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    .line 296
    .local v0, "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :goto_0
    return-object v0

    .line 294
    .end local v0    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :cond_0
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->CREATED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    .restart local v0    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    goto :goto_0
.end method

.method public getResponse()Lretrofit/client/Response;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->response:Lretrofit/client/Response;

    return-object v0
.end method

.method public isAccepted()Z
    .locals 2

    .prologue
    .line 300
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getResponse()Lretrofit/client/Response;

    move-result-object v0

    invoke-virtual {v0}, Lretrofit/client/Response;->getStatus()I

    move-result v0

    const/16 v1, 0xca

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCreated()Z
    .locals 2

    .prologue
    .line 304
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getResponse()Lretrofit/client/Response;

    move-result-object v0

    invoke-virtual {v0}, Lretrofit/client/Response;->getStatus()I

    move-result v0

    const/16 v1, 0xc9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
