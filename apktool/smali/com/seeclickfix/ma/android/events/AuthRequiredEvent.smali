.class public Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;
.super Ljava/lang/Object;
.source "AuthRequiredEvent.java"


# instance fields
.field private params:Lcom/seeclickfix/ma/android/objects/PageParams;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 0
    .param p1, "params"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;->params:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 11
    return-void
.end method


# virtual methods
.method public getParams()Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;->params:Lcom/seeclickfix/ma/android/objects/PageParams;

    return-object v0
.end method
