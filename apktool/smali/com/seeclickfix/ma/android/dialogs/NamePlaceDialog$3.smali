.class Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;
.super Ljava/lang/Object;
.source "NamePlaceDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;)V
    .locals 0

    .prologue
    .line 135
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;->this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 139
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    .line 140
    .local v2, "viewID":I
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;->this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-virtual {v3, v2}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getNameIdByButtonId(I)I

    move-result v1

    .line 141
    .local v1, "nameId":I
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;->this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-virtual {v3, v1}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 143
    .local v0, "name":Ljava/lang/String;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;->this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    # invokes: Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->save(Ljava/lang/String;)V
    invoke-static {v3, v0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->access$000(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;Ljava/lang/String;)V

    .line 144
    iget-object v3, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;->this$0:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->dismiss()V

    .line 145
    return-void
.end method
