.class public Lcom/seeclickfix/ma/android/objects/user/UserError;
.super Ljava/lang/Object;
.source "UserError.java"


# instance fields
.field private acceptTerms:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "accept_terms"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private email:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private emailsBase:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "emails.base"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private password:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private passwordConfirmation:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation

    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "password_confirmation"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->acceptTerms:Ljava/util/List;

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->password:Ljava/util/List;

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->passwordConfirmation:Ljava/util/List;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->email:Ljava/util/List;

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->name:Ljava/util/List;

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->emailsBase:Ljava/util/List;

    return-void
.end method

.method private appendArrayToStringBuilder(Ljava/lang/String;Ljava/util/List;Ljava/lang/StringBuilder;)V
    .locals 3
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p3, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 206
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p2, :cond_1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 207
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 209
    .local v1, "str":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 210
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    const-string/jumbo v2, " "

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    :cond_0
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    const-string/jumbo v2, "\n"

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 219
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "str":Ljava/lang/String;
    :cond_1
    return-void
.end method


# virtual methods
.method public getAcceptTerms()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->acceptTerms:Ljava/util/List;

    return-object v0
.end method

.method public getAllErrors(Ljava/lang/String;Landroid/content/res/Resources;)Ljava/lang/String;
    .locals 9
    .param p1, "defaultError"    # Ljava/lang/String;
    .param p2, "res"    # Landroid/content/res/Resources;

    .prologue
    const v8, 0x7f0c00a9

    .line 179
    const v7, 0x7f0c00e5

    invoke-virtual {p2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 180
    .local v6, "termsString":Ljava/lang/String;
    invoke-virtual {p2, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 181
    .local v3, "pwdString":Ljava/lang/String;
    invoke-virtual {p2, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 182
    .local v2, "pwdConfirmString":Ljava/lang/String;
    const v7, 0x7f0c00a3

    invoke-virtual {p2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "emailString":Ljava/lang/String;
    const v7, 0x7f0c009d

    invoke-virtual {p2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 185
    .local v1, "nameString":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    .local v5, "sb":Ljava/lang/StringBuilder;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->acceptTerms:Ljava/util/List;

    invoke-direct {p0, v6, v7, v5}, Lcom/seeclickfix/ma/android/objects/user/UserError;->appendArrayToStringBuilder(Ljava/lang/String;Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 188
    iget-object v7, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->password:Ljava/util/List;

    invoke-direct {p0, v3, v7, v5}, Lcom/seeclickfix/ma/android/objects/user/UserError;->appendArrayToStringBuilder(Ljava/lang/String;Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 189
    iget-object v7, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->passwordConfirmation:Ljava/util/List;

    invoke-direct {p0, v2, v7, v5}, Lcom/seeclickfix/ma/android/objects/user/UserError;->appendArrayToStringBuilder(Ljava/lang/String;Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 190
    iget-object v7, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->email:Ljava/util/List;

    invoke-direct {p0, v0, v7, v5}, Lcom/seeclickfix/ma/android/objects/user/UserError;->appendArrayToStringBuilder(Ljava/lang/String;Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 191
    iget-object v7, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->name:Ljava/util/List;

    invoke-direct {p0, v1, v7, v5}, Lcom/seeclickfix/ma/android/objects/user/UserError;->appendArrayToStringBuilder(Ljava/lang/String;Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 192
    const/4 v7, 0x0

    iget-object v8, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->emailsBase:Ljava/util/List;

    invoke-direct {p0, v7, v8, v5}, Lcom/seeclickfix/ma/android/objects/user/UserError;->appendArrayToStringBuilder(Ljava/lang/String;Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 195
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 197
    .local v4, "returnStr":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 200
    .end local v4    # "returnStr":Ljava/lang/String;
    :goto_0
    return-object v4

    .restart local v4    # "returnStr":Ljava/lang/String;
    :cond_0
    move-object v4, p1

    goto :goto_0
.end method

.method public getEmail()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->email:Ljava/util/List;

    return-object v0
.end method

.method public getEmailsBase()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->emailsBase:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->name:Ljava/util/List;

    return-object v0
.end method

.method public getPassword()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->password:Ljava/util/List;

    return-object v0
.end method

.method public getPasswordConfirmation()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->passwordConfirmation:Ljava/util/List;

    return-object v0
.end method

.method public setAcceptTerms(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, "acceptTerms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->acceptTerms:Ljava/util/List;

    .line 84
    return-void
.end method

.method public setEmail(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p1, "email":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->email:Ljava/util/List;

    .line 138
    return-void
.end method

.method public setEmailsBase(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p1, "emailsBase":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->emailsBase:Ljava/util/List;

    .line 174
    return-void
.end method

.method public setName(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p1, "name":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->name:Ljava/util/List;

    .line 156
    return-void
.end method

.method public setPassword(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "password":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->password:Ljava/util/List;

    .line 102
    return-void
.end method

.method public setPasswordConfirmation(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "passwordConfirmation":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/user/UserError;->passwordConfirmation:Ljava/util/List;

    .line 120
    return-void
.end method
