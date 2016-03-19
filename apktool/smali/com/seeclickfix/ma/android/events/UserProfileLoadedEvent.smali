.class public Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;
.super Ljava/lang/Object;
.source "UserProfileLoadedEvent.java"


# instance fields
.field private user:Lcom/seeclickfix/ma/android/objects/user/User;


# direct methods
.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/user/User;)V
    .locals 0
    .param p1, "user"    # Lcom/seeclickfix/ma/android/objects/user/User;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    .line 12
    return-void
.end method


# virtual methods
.method public getUser()Lcom/seeclickfix/ma/android/objects/user/User;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "UserProfileLoadedEvent [user="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/events/UserProfileLoadedEvent;->user:Lcom/seeclickfix/ma/android/objects/user/User;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
