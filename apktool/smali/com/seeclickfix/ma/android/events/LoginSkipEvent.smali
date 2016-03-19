.class public Lcom/seeclickfix/ma/android/events/LoginSkipEvent;
.super Ljava/lang/Object;
.source "LoginSkipEvent.java"


# instance fields
.field private onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 0
    .param p1, "onAuthCompleteParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/LoginSkipEvent;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 12
    return-void
.end method


# virtual methods
.method public getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/LoginSkipEvent;->onAuthCompleteParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    return-object v0
.end method
