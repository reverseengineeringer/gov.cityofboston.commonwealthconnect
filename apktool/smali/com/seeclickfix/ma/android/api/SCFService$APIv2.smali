.class public interface abstract Lcom/seeclickfix/ma/android/api/SCFService$APIv2;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "APIv2"
.end annotation


# virtual methods
.method public abstract acknowledgeIssue(ILjava/util/Map;Lretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation runtime Lretrofit/http/PartMap;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lretrofit/mime/TypedOutput;",
            ">;",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/Multipart;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues/{issue_id}/acknowledge"
    .end annotation
.end method

.method public abstract closeIssue(ILjava/util/Map;Lretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation runtime Lretrofit/http/PartMap;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lretrofit/mime/TypedOutput;",
            ">;",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/Multipart;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues/{issue_id}/close"
    .end annotation
.end method

.method public abstract commentOnIssue(ILretrofit/mime/TypedString;Lretrofit/mime/TypedFile;Lretrofit/mime/TypedFile;Lretrofit/mime/TypedString;Lretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .param p2    # Lretrofit/mime/TypedString;
        .annotation runtime Lretrofit/http/Part;
            value = "comment"
        .end annotation
    .end param
    .param p3    # Lretrofit/mime/TypedFile;
        .annotation runtime Lretrofit/http/Part;
            value = "image"
        .end annotation
    .end param
    .param p4    # Lretrofit/mime/TypedFile;
        .annotation runtime Lretrofit/http/Part;
            value = "video"
        .end annotation
    .end param
    .param p5    # Lretrofit/mime/TypedString;
        .annotation runtime Lretrofit/http/Part;
            value = "youtube_url"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lretrofit/mime/TypedString;",
            "Lretrofit/mime/TypedFile;",
            "Lretrofit/mime/TypedFile;",
            "Lretrofit/mime/TypedString;",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/Multipart;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues/{issue_id}/comments"
    .end annotation
.end method

.method public abstract createIssue(Lretrofit/mime/TypedFile;Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;Lretrofit/Callback;)V
    .param p1    # Lretrofit/mime/TypedFile;
        .annotation runtime Lretrofit/http/Part;
            value = "answers[issue_image]"
        .end annotation
    .end param
    .param p2    # Lcom/seeclickfix/ma/android/objects/SimpleMultiMap;
        .annotation runtime Lretrofit/http/PartMap;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lretrofit/mime/TypedFile;",
            "Lcom/seeclickfix/ma/android/objects/SimpleMultiMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/Multipart;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues"
    .end annotation
.end method

.method public abstract flagComment(Ljava/lang/String;Ljava/lang/String;Lretrofit/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Path;
            value = "comment_id"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "message"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lretrofit/Callback",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/FormUrlEncoded;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/comments/{comment_id}/flag"
    .end annotation
.end method

.method public abstract flagIssue(Ljava/lang/String;Ljava/lang/String;Lretrofit/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Field;
            value = "message"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lretrofit/Callback",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/FormUrlEncoded;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues/{issue_id}/flag"
    .end annotation
.end method

.method public abstract followIssue(ILretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues/{issue_id}/follow"
    .end annotation
.end method

.method public abstract issue(ILretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/api/v2/issues/{id}"
    .end annotation
.end method

.method public abstract issueDetails(ILretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/objects/apiv2/IssueV2;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/api/v2/issues/{id}?details=true"
    .end annotation
.end method

.method public abstract openIssue(ILjava/util/Map;Lretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation runtime Lretrofit/http/PartMap;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lretrofit/mime/TypedOutput;",
            ">;",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/Multipart;
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues/{issue_id}/open"
    .end annotation
.end method

.method public abstract requestType(Ljava/lang/String;Lretrofit/Callback;)V
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Path;
            value = "request_type_id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestType;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/api/v2/request_types/{request_type_id}"
    .end annotation
.end method

.method public abstract revokeVoteForIssue(ILretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/DELETE;
        value = "/api/v2/issues/{issue_id}/vote"
    .end annotation
.end method

.method public abstract voteForIssue(ILretrofit/Callback;)V
    .param p1    # I
        .annotation runtime Lretrofit/http/Path;
            value = "issue_id"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lretrofit/Callback",
            "<",
            "Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/api/v2/issues/{issue_id}/vote"
    .end annotation
.end method
