.class public Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IssueFailureEvent"
.end annotation


# instance fields
.field private retrofitError:Lretrofit/RetrofitError;


# direct methods
.method public constructor <init>(Lretrofit/RetrofitError;)V
    .locals 0
    .param p1, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 316
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 317
    iput-object p1, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;->retrofitError:Lretrofit/RetrofitError;

    .line 318
    return-void
.end method


# virtual methods
.method public getNoticeItem(Landroid/content/Context;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 322
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v3

    const-class v4, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    invoke-virtual {v3, v4}, Lretrofit/RetrofitError;->getBodyAs(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    .line 323
    .local v2, "response":Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;
    sget-object v3, Lcom/seeclickfix/ma/android/api/SCFService$2;->$SwitchMap$retrofit$RetrofitError$Kind:[I

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v4

    invoke-virtual {v4}, Lretrofit/RetrofitError;->getKind()Lretrofit/RetrofitError$Kind;

    move-result-object v4

    invoke-virtual {v4}, Lretrofit/RetrofitError$Kind;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 343
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->APP_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .line 346
    .local v1, "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :goto_0
    return-object v1

    .line 325
    .end local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :pswitch_0
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->NETWORK_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .line 326
    .restart local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    goto :goto_0

    .line 328
    .end local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :pswitch_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v3

    invoke-virtual {v3}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v3

    invoke-virtual {v3}, Lretrofit/client/Response;->getStatus()I

    move-result v3

    const/16 v4, 0x1a6

    if-ne v3, v4, :cond_1

    .line 329
    iget-object v3, v2, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;->errors:Ljava/util/HashMap;

    const-string/jumbo v4, "duplicate"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 330
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->DUPLICATE()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .restart local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    goto :goto_0

    .line 332
    .end local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :cond_0
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;->toUL()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->DECLINED(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .restart local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    goto :goto_0

    .line 335
    .end local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :cond_1
    const v3, 0x7f0c0118

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v6

    invoke-virtual {v6}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v6

    invoke-virtual {v6}, Lretrofit/client/Response;->getStatus()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "extra":Ljava/lang/String;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->HTTP_ERROR(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .line 338
    .restart local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    goto :goto_0

    .line 340
    .end local v0    # "extra":Ljava/lang/String;
    .end local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    :pswitch_2
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->PROTOCOL_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .line 341
    .restart local v1    # "notice":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    goto :goto_0

    .line 323
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getRetrofitError()Lretrofit/RetrofitError;
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$IssueFailureEvent;->retrofitError:Lretrofit/RetrofitError;

    return-object v0
.end method
