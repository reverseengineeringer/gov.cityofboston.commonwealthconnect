.class public interface abstract Lcom/seeclickfix/ma/android/dialogs/DialogInstance;
.super Ljava/lang/Object;
.source "DialogInstance.java"

# interfaces
.implements Landroid/content/DialogInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/content/DialogInterface;"
    }
.end annotation


# virtual methods
.method public abstract onNegativeClick()V
.end method

.method public abstract onPositiveClick()V
.end method

.method public abstract setClickListener(Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/seeclickfix/ma/android/dialogs/DialogInstance$ClickListener",
            "<TT;>;)V"
        }
    .end annotation
.end method
