.class public Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RetrofitResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Receipt:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected _errorBody:Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

.field private _httpStatus:I

.field protected final httpResponse:Lretrofit/client/Response;

.field protected final receipt:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TReceipt;"
        }
    .end annotation
.end field

.field protected final retrofitError:Lretrofit/RetrofitError;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lretrofit/client/Response;)V
    .locals 1
    .param p2, "httpResponse"    # Lretrofit/client/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TReceipt;",
            "Lretrofit/client/Response;",
            ")V"
        }
    .end annotation

    .prologue
    .line 361
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    .local p1, "receipt":Ljava/lang/Object;, "TReceipt;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;-><init>(Ljava/lang/Object;Lretrofit/client/Response;Lretrofit/RetrofitError;)V

    .line 362
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lretrofit/client/Response;Lretrofit/RetrofitError;)V
    .locals 1
    .param p2, "httpResponse"    # Lretrofit/client/Response;
    .param p3, "retrofitError"    # Lretrofit/RetrofitError;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TReceipt;",
            "Lretrofit/client/Response;",
            "Lretrofit/RetrofitError;",
            ")V"
        }
    .end annotation

    .prologue
    .line 368
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    .local p1, "receipt":Ljava/lang/Object;, "TReceipt;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 357
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_errorBody:Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    .line 358
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_httpStatus:I

    .line 369
    iput-object p1, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->receipt:Ljava/lang/Object;

    .line 370
    iput-object p3, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->retrofitError:Lretrofit/RetrofitError;

    .line 371
    iput-object p2, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->httpResponse:Lretrofit/client/Response;

    .line 372
    return-void
.end method

.method public constructor <init>(Lretrofit/RetrofitError;)V
    .locals 1
    .param p1, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    const/4 v0, 0x0

    .line 365
    invoke-direct {p0, v0, v0, p1}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;-><init>(Ljava/lang/Object;Lretrofit/client/Response;Lretrofit/RetrofitError;)V

    .line 366
    return-void
.end method


# virtual methods
.method public errorBody()Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;
    .locals 2

    .prologue
    .line 400
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_errorBody:Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    if-nez v0, :cond_0

    .line 401
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v0

    const-class v1, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    invoke-virtual {v0, v1}, Lretrofit/RetrofitError;->getBodyAs(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_errorBody:Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    .line 404
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_errorBody:Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    return-object v0
.end method

.method public fetchNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 6

    .prologue
    .line 432
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isError()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 433
    sget-object v1, Lcom/seeclickfix/ma/android/api/SCFService$2;->$SwitchMap$retrofit$RetrofitError$Kind:[I

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v2

    invoke-virtual {v2}, Lretrofit/RetrofitError;->getKind()Lretrofit/RetrofitError$Kind;

    move-result-object v2

    invoke-virtual {v2}, Lretrofit/RetrofitError$Kind;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 441
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->APP_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    .line 463
    :goto_0
    return-object v1

    .line 437
    :pswitch_0
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->NETWORK_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 439
    :pswitch_1
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->PROTOCOL_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 445
    :cond_0
    :pswitch_2
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->httpStatus()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 461
    sget-object v1, Lcom/seeclickfix/ma/android/MyApplication;->instance:Lcom/seeclickfix/ma/android/MyApplication;

    sget-object v1, Lcom/seeclickfix/ma/android/MyApplication;->res:Landroid/content/res/Resources;

    const v2, 0x7f0c0118

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->httpStatus()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 463
    .local v0, "extra":Ljava/lang/String;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->HTTP_ERROR(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 447
    .end local v0    # "extra":Ljava/lang/String;
    :sswitch_0
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->COMMENT_ACCEPTED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 449
    :sswitch_1
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->VOTE_REVOKED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 451
    :sswitch_2
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->CREATED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 453
    :sswitch_3
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->FORBIDDEN()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 455
    :sswitch_4
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->errorBody()Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    move-result-object v1

    iget-object v1, v1, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;->errors:Ljava/util/HashMap;

    const-string/jumbo v2, "duplicate"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 456
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->DUPLICATE()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 458
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->errorBody()Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/api/SCFService$ErrorResponse;->toUL()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->DECLINED(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    goto :goto_0

    .line 433
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    .line 445
    :sswitch_data_0
    .sparse-switch
        0xc9 -> :sswitch_2
        0xca -> :sswitch_0
        0xcc -> :sswitch_1
        0x193 -> :sswitch_3
        0x1a6 -> :sswitch_4
    .end sparse-switch
.end method

.method public getHttpResponse()Lretrofit/client/Response;
    .locals 1

    .prologue
    .line 379
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->httpResponse:Lretrofit/client/Response;

    return-object v0
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 423
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isAccepted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 424
    const/4 v0, 0x0

    .line 426
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->fetchNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    goto :goto_0
.end method

.method public getReceipt()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TReceipt;"
        }
    .end annotation

    .prologue
    .line 375
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->receipt:Ljava/lang/Object;

    return-object v0
.end method

.method public getResponse()Lretrofit/client/Response;
    .locals 1

    .prologue
    .line 388
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getHttpResponse()Lretrofit/client/Response;

    move-result-object v0

    .line 391
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v0

    invoke-virtual {v0}, Lretrofit/RetrofitError;->getResponse()Lretrofit/client/Response;

    move-result-object v0

    goto :goto_0
.end method

.method public getRetrofitError()Lretrofit/RetrofitError;
    .locals 1

    .prologue
    .line 383
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->retrofitError:Lretrofit/RetrofitError;

    return-object v0
.end method

.method public hasHttpStatus(I)Z
    .locals 1
    .param p1, "result"    # I

    .prologue
    .line 408
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->httpStatus()I

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public httpStatus()I
    .locals 2

    .prologue
    .line 412
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    iget v1, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_httpStatus:I

    if-nez v1, :cond_0

    .line 413
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getResponse()Lretrofit/client/Response;

    move-result-object v0

    .line 414
    .local v0, "response":Lretrofit/client/Response;
    if-eqz v0, :cond_0

    .line 415
    invoke-virtual {v0}, Lretrofit/client/Response;->getStatus()I

    move-result v1

    iput v1, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_httpStatus:I

    .line 419
    .end local v0    # "response":Lretrofit/client/Response;
    :cond_0
    iget v1, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->_httpStatus:I

    return v1
.end method

.method public isAccepted()Z
    .locals 1

    .prologue
    .line 396
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    const/16 v0, 0xca

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->hasHttpStatus(I)Z

    move-result v0

    return v0
.end method

.method public isError()Z
    .locals 1

    .prologue
    .line 472
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSuccess()Z
    .locals 1

    .prologue
    .line 468
    .local p0, "this":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<TReceipt;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->receipt:Ljava/lang/Object;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getRetrofitError()Lretrofit/RetrofitError;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
