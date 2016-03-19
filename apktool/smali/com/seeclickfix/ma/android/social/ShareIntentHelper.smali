.class public Lcom/seeclickfix/ma/android/social/ShareIntentHelper;
.super Ljava/lang/Object;
.source "ShareIntentHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static shareIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Landroid/content/Context;)V
    .locals 9
    .param p0, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 16
    .local v3, "res":Landroid/content/res/Resources;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_0

    const-string/jumbo v4, ""

    .line 17
    .local v4, "subject":Ljava/lang/String;
    :goto_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/UrlConfig;->getIssueShareUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 18
    .local v2, "link":Ljava/lang/String;
    const v6, 0x7f0c0137

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 19
    .local v5, "tag":Ljava/lang/String;
    const v6, 0x7f0c0136

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 21
    .local v0, "dialogTitle":Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v6, "android.intent.action.SEND"

    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 22
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v6, "text/plain"

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    const/high16 v6, 0x10000000

    invoke-virtual {v1, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 24
    const-string/jumbo v6, "android.intent.extra.TEXT"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\n\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 25
    const-string/jumbo v6, "android.intent.extra.SUBJECT"

    invoke-virtual {v1, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    invoke-static {v1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    return-void

    .line 16
    .end local v0    # "dialogTitle":Ljava/lang/String;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "link":Ljava/lang/String;
    .end local v4    # "subject":Ljava/lang/String;
    .end local v5    # "tag":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method
