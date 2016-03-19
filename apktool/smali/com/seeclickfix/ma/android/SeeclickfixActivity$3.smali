.class Lcom/seeclickfix/ma/android/SeeclickfixActivity$3;
.super Lcom/actionbarsherlock/app/ActionBarDrawerToggle;
.source "SeeclickfixActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/SeeclickfixActivity;->setupSideDrawer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;Landroid/app/Activity;Lcom/actionbarsherlock/app/ActionBar;Landroid/support/v4/widget/DrawerLayout;III)V
    .locals 7
    .param p2, "x0"    # Landroid/app/Activity;
    .param p3, "x1"    # Lcom/actionbarsherlock/app/ActionBar;
    .param p4, "x2"    # Landroid/support/v4/widget/DrawerLayout;
    .param p5, "x3"    # I
    .param p6, "x4"    # I
    .param p7, "x5"    # I

    .prologue
    .line 501
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$3;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move v4, p5

    move v5, p6

    move v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;-><init>(Landroid/app/Activity;Lcom/actionbarsherlock/app/ActionBar;Landroid/support/v4/widget/DrawerLayout;III)V

    return-void
.end method


# virtual methods
.method public onDrawerClosed(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 504
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->onDrawerClosed(Landroid/view/View;)V

    .line 505
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .locals 0
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 510
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/ActionBarDrawerToggle;->onDrawerOpened(Landroid/view/View;)V

    .line 511
    return-void
.end method
