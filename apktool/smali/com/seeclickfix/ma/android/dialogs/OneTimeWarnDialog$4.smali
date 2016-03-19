.class final Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$4;
.super Ljava/lang/Object;
.source "OneTimeWarnDialog.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->warning(Ljava/lang/String;IIIILandroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$negative:Ljava/lang/Runnable;

.field final synthetic val$positive:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .prologue
    .line 214
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$4;->val$positive:Ljava/lang/Runnable;

    iput-object p2, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$4;->val$negative:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNegativeClick()V
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$4;->val$negative:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 224
    return-void
.end method

.method public onPositiveClick()V
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$4;->val$positive:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 219
    return-void
.end method
