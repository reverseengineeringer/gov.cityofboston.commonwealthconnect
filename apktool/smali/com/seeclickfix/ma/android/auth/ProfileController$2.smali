.class Lcom/seeclickfix/ma/android/auth/ProfileController$2;
.super Ljava/lang/Object;
.source "ProfileController.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/auth/ProfileController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/auth/ProfileController;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/auth/ProfileController;)V
    .locals 0

    .prologue
    .line 97
    iput-object p1, p0, Lcom/seeclickfix/ma/android/auth/ProfileController$2;->this$0:Lcom/seeclickfix/ma/android/auth/ProfileController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 0
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 103
    return-void
.end method
