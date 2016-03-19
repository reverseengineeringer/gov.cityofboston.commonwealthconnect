.class public final Lcom/seeclickfix/ma/android/objects/user/UserReg;
.super Ljava/lang/Object;
.source "UserReg.java"


# instance fields
.field private acceptedTerms:Z

.field private avatarImagePath:Ljava/lang/String;

.field private email:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user[email]"
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user[name]"
    .end annotation
.end field

.field private password:Ljava/lang/String;

.field private passwordConfirm:Ljava/lang/String;

.field private registrationSource:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "user[registration_source]"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->acceptedTerms:Z

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/objects/user/UserReg;)V
    .locals 1
    .param p1, "userRegInputObj"    # Lcom/seeclickfix/ma/android/objects/user/UserReg;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->acceptedTerms:Z

    .line 42
    iget-boolean v0, p1, Lcom/seeclickfix/ma/android/objects/user/UserReg;->acceptedTerms:Z

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->acceptedTerms:Z

    .line 43
    iget-object v0, p1, Lcom/seeclickfix/ma/android/objects/user/UserReg;->email:Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->email:Ljava/lang/String;

    .line 44
    iget-object v0, p1, Lcom/seeclickfix/ma/android/objects/user/UserReg;->password:Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->password:Ljava/lang/String;

    .line 45
    iget-object v0, p1, Lcom/seeclickfix/ma/android/objects/user/UserReg;->passwordConfirm:Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->passwordConfirm:Ljava/lang/String;

    .line 46
    iget-object v0, p1, Lcom/seeclickfix/ma/android/objects/user/UserReg;->avatarImagePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->avatarImagePath:Ljava/lang/String;

    .line 47
    iget-object v0, p1, Lcom/seeclickfix/ma/android/objects/user/UserReg;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->name:Ljava/lang/String;

    .line 48
    return-void
.end method


# virtual methods
.method public getAvatarImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->avatarImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPasswordConfirm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->passwordConfirm:Ljava/lang/String;

    return-object v0
.end method

.method public isAcceptedTerms()Z
    .locals 1

    .prologue
    .line 83
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->acceptedTerms:Z

    return v0
.end method

.method public setAcceptedTerms(Z)V
    .locals 0
    .param p1, "acceptedTerms"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->acceptedTerms:Z

    .line 88
    return-void
.end method

.method public setAvatarImagePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "avatarImagePath"    # Ljava/lang/String;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->avatarImagePath:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 0
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->email:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->name:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->password:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setPasswordConfirm(Ljava/lang/String;)V
    .locals 0
    .param p1, "passwordConfirm"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserReg;->passwordConfirm:Ljava/lang/String;

    .line 80
    return-void
.end method
