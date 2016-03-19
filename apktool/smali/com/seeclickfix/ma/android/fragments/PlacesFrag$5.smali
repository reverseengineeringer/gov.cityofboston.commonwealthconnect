.class Lcom/seeclickfix/ma/android/fragments/PlacesFrag$5;
.super Ljava/lang/Object;
.source "PlacesFrag.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->createListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/PlacesFrag;)V
    .locals 0

    .prologue
    .line 457
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 461
    const/4 v0, 0x6

    if-ne p2, v0, :cond_0

    .line 462
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/PlacesFrag$5;->this$0:Lcom/seeclickfix/ma/android/fragments/PlacesFrag;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/PlacesFrag;->doSearch()V

    .line 463
    const/4 v0, 0x1

    .line 465
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
