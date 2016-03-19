.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V
    .locals 0

    .prologue
    .line 1010
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1020
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;

    .line 1022
    .local v1, "btnParams":Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1023
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/zone/MobileButtonsWithDefaults;->getUri()Ljava/lang/String;

    move-result-object v6

    .line 1027
    .local v6, "uriString":Ljava/lang/String;
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    .line 1029
    .local v3, "i":Landroid/content/Intent;
    :try_start_0
    const-string/jumbo v7, "Web View"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1030
    const-string/jumbo v7, "android.intent.action.VIEW"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1031
    const-string/jumbo v7, "webview_uri"

    invoke-virtual {v3, v7, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1032
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v7

    const-class v8, Lcom/seeclickfix/ma/android/activities/WebviewActivity;

    invoke-virtual {v3, v7, v8}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1033
    const/high16 v7, 0x10000000

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1034
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 1076
    :cond_0
    :goto_0
    return-void

    .line 1035
    :cond_1
    const-string/jumbo v7, "Content Handler"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1038
    const-string/jumbo v7, "android.intent.action.DIAL"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1039
    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1040
    const/high16 v7, 0x10000000

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1041
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1052
    :catch_0
    move-exception v4

    .line 1055
    .local v4, "notFound":Landroid/content/ActivityNotFoundException;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->activity:Landroid/app/Activity;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$200(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v2, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1056
    .local v2, "builder":Landroid/app/AlertDialog$Builder;
    const v7, 0x7f0c00cf

    new-instance v8, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1$1;

    invoke-direct {v8, p0}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1$1;-><init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;)V

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1062
    const-string/jumbo v7, "Content Handler"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 1063
    const-string/jumbo v7, "tel:"

    const-string/jumbo v8, ""

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1064
    .local v5, "phone":Ljava/lang/String;
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f0c0049

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f0c004a

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1072
    .end local v5    # "phone":Ljava/lang/String;
    :goto_1
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 1042
    .end local v2    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v4    # "notFound":Landroid/content/ActivityNotFoundException;
    :cond_2
    :try_start_1
    const-string/jumbo v7, "Browser"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1043
    const-string/jumbo v7, "android.intent.action.VIEW"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1044
    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1045
    const/high16 v7, 0x10000000

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1046
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1047
    :cond_3
    const-string/jumbo v7, "Local Window Login"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1048
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # invokes: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->dispatchReportUriEvent(Ljava/lang/String;Landroid/view/View;)V
    invoke-static {v7, v6, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$100(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;Ljava/lang/String;Landroid/view/View;)V

    goto/16 :goto_0

    .line 1049
    :cond_4
    const-string/jumbo v7, "Local Window"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1050
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # invokes: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->dispatchReportUriEvent(Ljava/lang/String;Landroid/view/View;)V
    invoke-static {v7, v6, p1}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$100(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;Ljava/lang/String;Landroid/view/View;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 1068
    .restart local v2    # "builder":Landroid/app/AlertDialog$Builder;
    .restart local v4    # "notFound":Landroid/content/ActivityNotFoundException;
    :cond_5
    iget-object v7, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v7

    const v8, 0x7f0c0047

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    # getter for: Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->applicationContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/seeclickfix/ma/android/adapters/FeedAdapter;->access$000(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f0c0048

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_1
.end method
