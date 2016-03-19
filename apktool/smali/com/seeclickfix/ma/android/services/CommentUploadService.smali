.class public Lcom/seeclickfix/ma/android/services/CommentUploadService;
.super Landroid/app/IntentService;
.source "CommentUploadService.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "CommentUploadService"


# instance fields
.field private bus:Lcom/squareup/otto/Bus;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    const-string/jumbo v0, "commentUpload"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 35
    return-void
.end method


# virtual methods
.method buildCommentCallback(Lcom/seeclickfix/ma/android/objects/issue/Comment;)Lretrofit/Callback;
    .locals 1
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
            ")",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    new-instance v0, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/services/CommentUploadService$2;-><init>(Lcom/seeclickfix/ma/android/services/CommentUploadService;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    return-object v0
.end method

.method buildIssueCallback(Lcom/seeclickfix/ma/android/objects/issue/Comment;)Lretrofit/Callback;
    .locals 1
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
            ")",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    new-instance v0, Lcom/seeclickfix/ma/android/services/CommentUploadService$3;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/services/CommentUploadService$3;-><init>(Lcom/seeclickfix/ma/android/services/CommentUploadService;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    return-object v0
.end method

.method buildStatusChangeCallback(Lcom/seeclickfix/ma/android/objects/issue/Transition;)Lretrofit/Callback;
    .locals 1
    .param p1, "transition"    # Lcom/seeclickfix/ma/android/objects/issue/Transition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/objects/issue/Transition;",
            ")",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Lcom/seeclickfix/ma/android/services/CommentUploadService$1;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/services/CommentUploadService$1;-><init>(Lcom/seeclickfix/ma/android/services/CommentUploadService;Lcom/seeclickfix/ma/android/objects/issue/Transition;)V

    return-object v0
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 46
    if-nez p1, :cond_1

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 50
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/MyApplication;

    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getEventBus()Lcom/squareup/otto/Bus;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->setBus(Lcom/squareup/otto/Bus;)V

    .line 52
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    .line 54
    .local v7, "action":Ljava/lang/String;
    const-string/jumbo v0, "com.seeclickfix.actions.UPLOAD_COMMENT"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    const-string/jumbo v0, "comment_bundle"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .line 58
    .local v8, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCommentType()Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_2
    :goto_1
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 60
    :pswitch_0
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v1

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->partMap()Ljava/util/Map;

    move-result-object v2

    check-cast v8, Lcom/seeclickfix/ma/android/objects/issue/Transition;

    .end local v8    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildStatusChangeCallback(Lcom/seeclickfix/ma/android/objects/issue/Transition;)Lretrofit/Callback;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->openIssue(ILjava/util/Map;Lretrofit/Callback;)V

    goto :goto_0

    .line 58
    .restart local v8    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    :sswitch_0
    const-string/jumbo v2, "Issue Reopened"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v2, "Issue Acknowledged"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :sswitch_2
    const-string/jumbo v2, "Issue Closed"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_3
    const-string/jumbo v2, "Issue Voted For"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_4
    const-string/jumbo v2, "Issue Revoked Vote For"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_5
    const-string/jumbo v2, "Watcher Added"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_6
    const-string/jumbo v2, "Comment"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x6

    goto :goto_1

    .line 66
    :pswitch_1
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v1

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->partMap()Ljava/util/Map;

    move-result-object v2

    check-cast v8, Lcom/seeclickfix/ma/android/objects/issue/Transition;

    .end local v8    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildStatusChangeCallback(Lcom/seeclickfix/ma/android/objects/issue/Transition;)Lretrofit/Callback;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->acknowledgeIssue(ILjava/util/Map;Lretrofit/Callback;)V

    goto/16 :goto_0

    .line 72
    .restart local v8    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    :pswitch_2
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v1

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->partMap()Ljava/util/Map;

    move-result-object v2

    check-cast v8, Lcom/seeclickfix/ma/android/objects/issue/Transition;

    .end local v8    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildStatusChangeCallback(Lcom/seeclickfix/ma/android/objects/issue/Transition;)Lretrofit/Callback;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->closeIssue(ILjava/util/Map;Lretrofit/Callback;)V

    goto/16 :goto_0

    .line 78
    .restart local v8    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    :pswitch_3
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v1

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildIssueCallback(Lcom/seeclickfix/ma/android/objects/issue/Comment;)Lretrofit/Callback;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->voteForIssue(ILretrofit/Callback;)V

    goto/16 :goto_0

    .line 83
    :pswitch_4
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v1

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildIssueCallback(Lcom/seeclickfix/ma/android/objects/issue/Comment;)Lretrofit/Callback;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->revokeVoteForIssue(ILretrofit/Callback;)V

    goto/16 :goto_0

    .line 88
    :pswitch_5
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v1

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildIssueCallback(Lcom/seeclickfix/ma/android/objects/issue/Comment;)Lretrofit/Callback;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->followIssue(ILretrofit/Callback;)V

    goto/16 :goto_0

    .line 93
    :pswitch_6
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV2:Lcom/seeclickfix/ma/android/api/SCFService$APIv2;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueId()I

    move-result v1

    new-instance v2, Lretrofit/mime/TypedString;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lretrofit/mime/TypedString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->typedImageFile()Lretrofit/mime/TypedFile;

    move-result-object v3

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->typedVideoFile()Lretrofit/mime/TypedFile;

    move-result-object v4

    new-instance v5, Lretrofit/mime/TypedString;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getYoutubeUrl()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lretrofit/mime/TypedString;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/services/CommentUploadService;->buildCommentCallback(Lcom/seeclickfix/ma/android/objects/issue/Comment;)Lretrofit/Callback;

    move-result-object v6

    invoke-interface/range {v0 .. v6}, Lcom/seeclickfix/ma/android/api/SCFService$APIv2;->commentOnIssue(ILretrofit/mime/TypedString;Lretrofit/mime/TypedFile;Lretrofit/mime/TypedFile;Lretrofit/mime/TypedString;Lretrofit/Callback;)V

    goto/16 :goto_0

    .line 58
    nop

    :sswitch_data_0
    .sparse-switch
        -0x757b1884 -> :sswitch_3
        -0x642179c1 -> :sswitch_6
        -0x5a3e152d -> :sswitch_2
        -0x1f518ffd -> :sswitch_0
        -0x16992ea4 -> :sswitch_5
        0x54ef916f -> :sswitch_1
        0x7b4bb67c -> :sswitch_4
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public postEvent(Ljava/lang/Object;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/Object;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService;->bus:Lcom/squareup/otto/Bus;

    invoke-virtual {v0, p1}, Lcom/squareup/otto/Bus;->post(Ljava/lang/Object;)V

    .line 43
    return-void
.end method

.method public setBus(Lcom/squareup/otto/Bus;)V
    .locals 0
    .param p1, "bus"    # Lcom/squareup/otto/Bus;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/seeclickfix/ma/android/services/CommentUploadService;->bus:Lcom/squareup/otto/Bus;

    .line 39
    return-void
.end method
