.class public Lcom/seeclickfix/ma/android/activities/SortingContextMenu;
.super Landroid/app/ListActivity;
.source "SortingContextMenu.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 13
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 15
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x1090003

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/activities/SortingContextMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f060001

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/activities/SortingContextMenu;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 19
    return-void
.end method
