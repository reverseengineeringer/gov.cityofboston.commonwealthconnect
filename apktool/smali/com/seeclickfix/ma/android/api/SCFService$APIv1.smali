.class public interface abstract Lcom/seeclickfix/ma/android/api/SCFService$APIv1;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "APIv1"
.end annotation


# virtual methods
.method public abstract requestTypeQuestions(Ljava/lang/String;Lretrofit/Callback;)V
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
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;>;)V"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/api/request_types/{request_type_id}/request_type_questions"
    .end annotation
.end method
