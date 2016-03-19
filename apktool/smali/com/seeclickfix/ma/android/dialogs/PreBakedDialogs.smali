.class public Lcom/seeclickfix/ma/android/dialogs/PreBakedDialogs;
.super Ljava/lang/Object;
.source "PreBakedDialogs.java"


# static fields
.field public static final LOCATION_OFF:Ljava/lang/String; = "PreBakedDialogs::LOCATION_OFF"

.field public static final NO_NETWORK:Ljava/lang/String; = "PreBakedDialogs::NO_NETWORK"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDialogOptions(Ljava/lang/String;)Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    .locals 2
    .param p0, "optionName"    # Ljava/lang/String;

    .prologue
    .line 19
    const/4 v0, -0x1

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 27
    const-string/jumbo v0, "PreBakedDialogs"

    const-string/jumbo v1, "getDialogOptions called for unknown dialog type"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    const/4 v0, 0x0

    :goto_1
    return-object v0

    .line 19
    :sswitch_0
    const-string/jumbo v1, "PreBakedDialogs::NO_NETWORK"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v1, "PreBakedDialogs::LOCATION_OFF"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 21
    :pswitch_0
    invoke-static {}, Lcom/seeclickfix/ma/android/dialogs/PreBakedDialogs;->getNoNetwork()Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    move-result-object v0

    goto :goto_1

    .line 24
    :pswitch_1
    invoke-static {}, Lcom/seeclickfix/ma/android/dialogs/PreBakedDialogs;->getNoLocation()Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    move-result-object v0

    goto :goto_1

    .line 19
    :sswitch_data_0
    .sparse-switch
        -0x7b80fa18 -> :sswitch_1
        0x6ad6ea73 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static getNoLocation()Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    .locals 2

    .prologue
    .line 46
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;-><init>()V

    .line 48
    .local v0, "opts":Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    const v1, 0x7f0c006a

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->titleTextId:I

    .line 49
    const v1, 0x7f0c0069

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->msgTextId:I

    .line 50
    const v1, 0x7f0c00cf

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->positiveButtonTextId:I

    .line 51
    const v1, 0x7f0c0015

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->negativeButtonTextId:I

    .line 52
    const-string/jumbo v1, "FragmentTags:DIALOG_WARN_LOC_DISABLED"

    iput-object v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->fragmentTag:Ljava/lang/String;

    .line 53
    return-object v0
.end method

.method static getNoNetwork()Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    .locals 2

    .prologue
    .line 34
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;-><init>()V

    .line 36
    .local v0, "opts":Lcom/seeclickfix/ma/android/dialogs/DialogOptions;
    const v1, 0x7f0c004d

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->msgTextId:I

    .line 37
    const v1, 0x7f0c004f

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->titleTextId:I

    .line 38
    const v1, 0x7f0c004e

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->positiveButtonTextId:I

    .line 39
    const v1, 0x7f0c0015

    iput v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->negativeButtonTextId:I

    .line 40
    const-string/jumbo v1, "FragmentTags:DIALOG_WARN_NO_NETWORK"

    iput-object v1, v0, Lcom/seeclickfix/ma/android/dialogs/DialogOptions;->fragmentTag:Ljava/lang/String;

    .line 41
    return-object v0
.end method
