.class public Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "OneTimeWarnDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "OneTimeWarnDialog"


# instance fields
.field private cb:Landroid/widget/CheckBox;

.field private iconResId:I

.field private listener:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;

.field private msgResId:I

.field private prefLabelResId:I

.field private prefName:Ljava/lang/String;

.field private titleResId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 43
    return-void
.end method

.method public static followWarning(Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z
    .locals 8
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "positive"    # Ljava/lang/Runnable;
    .param p2, "negative"    # Ljava/lang/Runnable;

    .prologue
    .line 199
    const-string/jumbo v0, "Pref:WARN_FOLLOW"

    const v1, 0x7f0c0084

    const v2, 0x7f0c0083

    const v3, 0x7f0c0050

    const v4, 0x7f0200df

    move-object v5, p0

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v0 .. v7}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->warning(Ljava/lang/String;IIIILandroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method

.method public static newInstance(Ljava/lang/String;IIII)Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    .locals 3
    .param p0, "prefName"    # Ljava/lang/String;
    .param p1, "titleResId"    # I
    .param p2, "msgResId"    # I
    .param p3, "prefLabelResId"    # I
    .param p4, "iconResId"    # I

    .prologue
    .line 68
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;-><init>()V

    .line 69
    .local v1, "dlg":Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 71
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "pref_name"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    const-string/jumbo v2, "PREF_LABEL_TEXT_ID"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 73
    const-string/jumbo v2, "title"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 74
    const-string/jumbo v2, "message"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 75
    const-string/jumbo v2, "icon"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 77
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->setArguments(Landroid/os/Bundle;)V

    .line 79
    return-object v1
.end method

.method protected static shouldShowDialog(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 1
    .param p0, "prefName"    # Ljava/lang/String;
    .param p1, "activity"    # Landroid/content/Context;

    .prologue
    .line 236
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static statusChangeWarning(Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z
    .locals 8
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "positive"    # Ljava/lang/Runnable;
    .param p2, "negative"    # Ljava/lang/Runnable;

    .prologue
    .line 188
    const-string/jumbo v0, "Pref:WARN_STATUS_CHANGE"

    const v1, 0x7f0c013c

    const v2, 0x7f0c013b

    const v3, 0x7f0c0050

    const v4, 0x7f0200df

    move-object v5, p0

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v0 .. v7}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->warning(Ljava/lang/String;IIIILandroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method

.method private updatePref()V
    .locals 3

    .prologue
    .line 160
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->cb:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->prefName:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V

    .line 165
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->prefName:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->putBoolean(Ljava/lang/String;ZLandroid/content/Context;)V

    goto :goto_0
.end method

.method static warning(Ljava/lang/String;IIIILandroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z
    .locals 3
    .param p0, "prefName"    # Ljava/lang/String;
    .param p1, "titleResId"    # I
    .param p2, "msgResId"    # I
    .param p3, "prefLabelResId"    # I
    .param p4, "iconResId"    # I
    .param p5, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p6, "positive"    # Ljava/lang/Runnable;
    .param p7, "negative"    # Ljava/lang/Runnable;

    .prologue
    .line 211
    invoke-virtual {p5}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->shouldShowDialog(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 212
    invoke-static {p0, p1, p2, p3, p4}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->newInstance(Ljava/lang/String;IIII)Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;

    move-result-object v0

    .line 214
    .local v0, "dialog":Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$4;

    invoke-direct {v1, p6, p7}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$4;-><init>(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->setClickListener(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;)V

    .line 227
    invoke-virtual {p5}, Landroid/support/v4/app/Fragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 228
    const/4 v1, 0x0

    .line 231
    .end local v0    # "dialog":Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;
    :goto_0
    return v1

    .line 230
    :cond_0
    invoke-interface {p6}, Ljava/lang/Runnable;->run()V

    .line 231
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static watchAreaWarning(Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z
    .locals 8
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "positive"    # Ljava/lang/Runnable;
    .param p2, "negative"    # Ljava/lang/Runnable;

    .prologue
    .line 180
    const-string/jumbo v0, "Pref:warn_watch_area"

    const v1, 0x7f0c00f0

    const v2, 0x7f0c00ef

    const v3, 0x7f0c0050

    const v4, 0x7f0200df

    move-object v5, p0

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v0 .. v7}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->warning(Ljava/lang/String;IIIILandroid/support/v4/app/Fragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method protected doNegativeClick()V
    .locals 1

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->updatePref()V

    .line 143
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;

    if-eqz v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;->onNegativeClick()V

    .line 146
    :cond_0
    return-void
.end method

.method protected doPositiveClick()V
    .locals 1

    .prologue
    .line 151
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->updatePref()V

    .line 153
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;->onPositiveClick()V

    .line 156
    :cond_0
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 135
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->doNegativeClick()V

    .line 136
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 86
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "title"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->titleResId:I

    .line 87
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "message"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->msgResId:I

    .line 88
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "icon"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->iconResId:I

    .line 89
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "pref_name"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->prefName:Ljava/lang/String;

    .line 90
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "PREF_LABEL_TEXT_ID"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->prefLabelResId:I

    .line 92
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 93
    .local v2, "frameView":Landroid/widget/FrameLayout;
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget v6, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->titleResId:I

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f0c00cf

    new-instance v7, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$3;

    invoke-direct {v7, p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$3;-><init>(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f0c0015

    new-instance v7, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$2;

    invoke-direct {v7, p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$2;-><init>(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$1;

    invoke-direct {v6, p0}, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$1;-><init>(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;)V

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 120
    .local v0, "ad":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 122
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v5, 0x7f030022

    invoke-virtual {v3, v5, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 124
    .local v1, "dialoglayout":Landroid/view/ViewGroup;
    const v5, 0x7f0a005a

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/CheckBox;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->cb:Landroid/widget/CheckBox;

    .line 125
    const v5, 0x7f0a0058

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 127
    .local v4, "msgTextView":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->cb:Landroid/widget/CheckBox;

    iget v6, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->prefLabelResId:I

    invoke-virtual {v5, v6}, Landroid/widget/CheckBox;->setText(I)V

    .line 128
    iget v5, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->msgResId:I

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 131
    return-object v0
.end method

.method public setClickListener(Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;

    .prologue
    .line 175
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/OneTimeWarnDialog$ClickListener;

    .line 176
    return-void
.end method
