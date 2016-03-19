.class public abstract Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.super Ljava/lang/Object;
.source "SimpleListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;,
        Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method


# virtual methods
.method public abstract onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
.end method

.method public onStateChange(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;Z)V
    .locals 0
    .param p1, "state"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;
    .param p2, "successful"    # Z

    .prologue
    .line 6
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener<TT;>;"
    return-void
.end method

.method public abstract onSuccess(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
