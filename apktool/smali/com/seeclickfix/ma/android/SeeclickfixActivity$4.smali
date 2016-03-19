.class Lcom/seeclickfix/ma/android/SeeclickfixActivity$4;
.super Ljava/lang/Object;
.source "SeeclickfixActivity.java"

# interfaces
.implements Lretrofit/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/SeeclickfixActivity;->onFlagContentEvent(Lcom/seeclickfix/ma/android/events/FlagContentEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lretrofit/Callback",
        "<",
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0

    .prologue
    .line 1055
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$4;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lretrofit/RetrofitError;)V
    .locals 2
    .param p1, "retrofitError"    # Lretrofit/RetrofitError;

    .prologue
    .line 1064
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$4;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    const v1, 0x7f0c0081

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->notifyUser(I)V

    .line 1065
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;Lretrofit/client/Response;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lretrofit/client/Response;

    .prologue
    .line 1055
    check-cast p1, Ljava/util/HashMap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$4;->success(Ljava/util/HashMap;Lretrofit/client/Response;)V

    return-void
.end method

.method public success(Ljava/util/HashMap;Lretrofit/client/Response;)V
    .locals 2
    .param p2, "response"    # Lretrofit/client/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lretrofit/client/Response;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1059
    .local p1, "stringStringHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$4;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    const v1, 0x7f0c007f

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->notifyUser(I)V

    .line 1060
    return-void
.end method
