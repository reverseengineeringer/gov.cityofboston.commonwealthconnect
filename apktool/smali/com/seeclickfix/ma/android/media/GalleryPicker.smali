.class public Lcom/seeclickfix/ma/android/media/GalleryPicker;
.super Ljava/lang/Object;
.source "GalleryPicker.java"


# static fields
.field public static final MIME_TYPE:Ljava/lang/String; = "image/*"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static launchGalleryForCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;)V
    .locals 2
    .param p0, "callback"    # Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;
    .param p1, "launchingActivity"    # Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;

    .prologue
    .line 19
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 20
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    const-string/jumbo v1, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 22
    invoke-interface {p1, p0, v0}, Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;->launchGalleryForCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Landroid/content/Intent;)V

    .line 23
    return-void
.end method
