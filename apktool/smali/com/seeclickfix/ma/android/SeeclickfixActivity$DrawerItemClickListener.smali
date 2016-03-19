.class Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;
.super Ljava/lang/Object;
.source "SeeclickfixActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/SeeclickfixActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DrawerItemClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;


# direct methods
.method private constructor <init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0

    .prologue
    .line 259
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity;
    .param p2, "x1"    # Lcom/seeclickfix/ma/android/SeeclickfixActivity$1;

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;-><init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 9
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 266
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 268
    .local v4, "sideMenuClickParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v3

    .line 269
    .local v3, "sherlockbBar":Lcom/actionbarsherlock/app/ActionBar;
    invoke-virtual {v3}, Lcom/actionbarsherlock/app/ActionBar;->show()V

    .line 271
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 273
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 274
    .local v2, "b":Landroid/os/Bundle;
    const-string/jumbo v5, "page_params"

    invoke-virtual {v2, v5, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 277
    :try_start_0
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v5

    const-string/jumbo v6, "action_bar_title"

    const-string/jumbo v7, "id"

    const-string/jumbo v8, "android"

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 278
    .local v1, "actionBarTitleId":I
    iget-object v5, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-virtual {v5, v1}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 279
    .local v0, "actionBarSubTextView":Landroid/widget/TextView;
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getDisplayName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v5, v0, v6}, Lcom/seeclickfix/ma/android/style/StyleUtil;->setActionBarSubBasic(Ljava/lang/String;Landroid/widget/TextView;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    .end local v0    # "actionBarSubTextView":Landroid/widget/TextView;
    .end local v1    # "actionBarTitleId":I
    :goto_0
    iget-object v5, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    # invokes: Lcom/seeclickfix/ma/android/SeeclickfixActivity;->clearBackKeyRefs()V
    invoke-static {v5}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->access$000(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    .line 288
    iget-object v5, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/PageParams;->getFragClass()Ljava/lang/Class;

    move-result-object v7

    # invokes: Lcom/seeclickfix/ma/android/SeeclickfixActivity;->showFrag(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;
    invoke-static {v5, v6, v7, v2}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->access$100(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    .line 290
    iget-object v5, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    # invokes: Lcom/seeclickfix/ma/android/SeeclickfixActivity;->isTabletLayout()Z
    invoke-static {v5}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->access$200(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 291
    iget-object v5, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$DrawerItemClickListener;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    # invokes: Lcom/seeclickfix/ma/android/SeeclickfixActivity;->closeDrawer()V
    invoke-static {v5}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->access$300(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    .line 293
    :cond_0
    return-void

    .line 280
    :catch_0
    move-exception v5

    goto :goto_0
.end method
