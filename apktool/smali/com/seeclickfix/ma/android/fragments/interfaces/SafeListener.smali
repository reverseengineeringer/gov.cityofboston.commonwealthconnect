.class public Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;
.super Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.source "SafeListener.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

.field private unsafeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V
    .locals 0
    .param p1, "fragment"    # Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;",
            "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 10
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<TT;>;"
    .local p2, "unsafeListener":Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener<TT;>;"
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    .line 12
    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->unsafeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    .line 13
    return-void
.end method


# virtual methods
.method public getFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
    .locals 1

    .prologue
    .line 16
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<TT;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    return-object v0
.end method

.method public isAttached()Z
    .locals 1

    .prologue
    .line 20
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<TT;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->fragment:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V
    .locals 1
    .param p1, "status"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .prologue
    .line 30
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<TT;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->unsafeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;->onFailure(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;)V

    .line 33
    :cond_0
    return-void
.end method

.method public onStateChange(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;Z)V
    .locals 2
    .param p1, "state"    # Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;
    .param p2, "successful"    # Z

    .prologue
    .line 36
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<TT;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->unsafeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    invoke-virtual {v0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;->onStateChange(Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;Z)V

    .line 39
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->STARTED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    if-ne p1, v0, :cond_1

    .line 40
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->getFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    move-result-object v0

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 49
    :cond_0
    :goto_0
    return-void

    .line 41
    :cond_1
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->FINISHED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    if-ne p1, v0, :cond_0

    .line 42
    if-eqz p2, :cond_2

    .line 43
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->getFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    move-result-object v0

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->getFragment()Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;

    move-result-object v0

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    goto :goto_0
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;, "Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->isAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 25
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;->unsafeListener:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;->onSuccess(Ljava/lang/Object;)V

    .line 27
    :cond_0
    return-void
.end method
