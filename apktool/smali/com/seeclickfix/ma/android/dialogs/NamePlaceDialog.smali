.class public Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;
.super Landroid/support/v4/app/DialogFragment;
.source "NamePlaceDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "NamePlaceDialog"


# instance fields
.field btnListener:Landroid/view/View$OnClickListener;

.field private editText:Landroid/widget/EditText;

.field private listener:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;

.field private mHomeBtn:Landroid/widget/Button;

.field private mPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private mSchoolBtn:Landroid/widget/Button;

.field private mWorkBtn:Landroid/widget/Button;

.field private markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

.field private msgResId:I

.field private titleResId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 135
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$3;-><init>(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->btnListener:Landroid/view/View$OnClickListener;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->save(Ljava/lang/String;)V

    return-void
.end method

.method public static newInstance(IIILcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/objects/PageParams;)Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;
    .locals 3
    .param p0, "titleResId"    # I
    .param p1, "msgResId"    # I
    .param p2, "iconResId"    # I
    .param p3, "markerLatLng"    # Lcom/google/android/gms/maps/model/LatLng;
    .param p4, "pageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 63
    new-instance v1, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;-><init>()V

    .line 64
    .local v1, "dlg":Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 65
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "title"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 66
    const-string/jumbo v2, "message"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 67
    const-string/jumbo v2, "icon"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 68
    const-string/jumbo v2, "marker_latlng"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 69
    const-string/jumbo v2, "page_params"

    invoke-virtual {v0, v2, p4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 70
    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->setArguments(Landroid/os/Bundle;)V

    .line 72
    return-object v1
.end method

.method private save(Ljava/lang/String;)V
    .locals 9
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 187
    new-instance v2, Lcom/seeclickfix/ma/android/objects/loc/Place;

    invoke-direct {v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;-><init>()V

    .line 188
    .local v2, "p":Lcom/seeclickfix/ma/android/objects/loc/Place;
    invoke-virtual {v2, p1}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setName(Ljava/lang/String;)V

    .line 189
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    iget-wide v6, v5, Lcom/google/android/gms/maps/model/LatLng;->latitude:D

    invoke-virtual {v2, v6, v7}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLat(D)V

    .line 190
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    iget-wide v6, v5, Lcom/google/android/gms/maps/model/LatLng;->longitude:D

    invoke-virtual {v2, v6, v7}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setPlaceLng(D)V

    .line 191
    invoke-virtual {v2, v8}, Lcom/seeclickfix/ma/android/objects/loc/Place;->setSelected(Z)V

    .line 193
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getPlaceDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 196
    .local v0, "dao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/loc/Place;Ljava/lang/Integer;>;"
    :try_start_0
    invoke-interface {v0, v2}, Lcom/j256/ormlite/dao/Dao;->createOrUpdate(Ljava/lang/Object;)Lcom/j256/ormlite/dao/Dao$CreateOrUpdateStatus;

    .line 198
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;

    .line 199
    .local v3, "placeAddedListener":Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;
    invoke-interface {v3, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;->onPlaceAdded(Lcom/seeclickfix/ma/android/objects/loc/Place;)V

    .line 201
    const v5, 0x7f0c00d7

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/loc/Place;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v5, v6}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 203
    .local v4, "placeToastString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-static {v5, v4}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 205
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v5, v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 206
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    const-string/jumbo v6, "com.seeclickfix.actions.PLACE_ADDED"

    invoke-virtual {v5, v6}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 208
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;

    .line 209
    .local v1, "mainActivity":Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-interface {v1, v5}, Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;->onMapPlaceSaved(Lcom/seeclickfix/ma/android/objects/PageParams;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    .end local v1    # "mainActivity":Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceMapListener;
    .end local v3    # "placeAddedListener":Lcom/seeclickfix/ma/android/fragments/interfaces/OnPlaceAddedListener;
    .end local v4    # "placeToastString":Ljava/lang/String;
    :goto_0
    return-void

    .line 210
    :catch_0
    move-exception v5

    goto :goto_0
.end method


# virtual methods
.method protected doNegativeClick()V
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;

    invoke-interface {v0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;->onNegativeClick()V

    .line 170
    :cond_0
    return-void
.end method

.method protected doPositiveClick()V
    .locals 4

    .prologue
    .line 175
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 176
    iget-object v1, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->editText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 177
    .local v0, "name":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->save(Ljava/lang/String;)V

    .line 183
    .end local v0    # "name":Ljava/lang/String;
    :goto_0
    return-void

    .line 180
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0c0092

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method protected getNameIdByButtonId(I)I
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 149
    const/4 v0, -0x1

    .line 151
    .local v0, "nameId":I
    const v1, 0x7f0a0053

    if-ne p1, v1, :cond_1

    .line 152
    const v0, 0x7f0c0094

    .line 159
    :cond_0
    :goto_0
    return v0

    .line 153
    :cond_1
    const v1, 0x7f0a0054

    if-ne p1, v1, :cond_2

    .line 154
    const v0, 0x7f0c0098

    goto :goto_0

    .line 155
    :cond_2
    const v1, 0x7f0a0055

    if-ne p1, v1, :cond_0

    .line 156
    const v0, 0x7f0c0096

    goto :goto_0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "title"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->titleResId:I

    .line 80
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "message"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->msgResId:I

    .line 81
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "marker_latlng"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/maps/model/LatLng;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->markerLatLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 82
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "page_params"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/seeclickfix/ma/android/objects/PageParams;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 84
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 85
    .local v2, "frameView":Landroid/widget/FrameLayout;
    new-instance v5, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget v6, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->titleResId:I

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f0c00cf

    new-instance v7, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$2;

    invoke-direct {v7, p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$2;-><init>(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f0c0015

    new-instance v7, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$1;

    invoke-direct {v7, p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$1;-><init>(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 105
    .local v0, "ad":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 107
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v5, 0x7f03001d

    invoke-virtual {v3, v5, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 109
    .local v1, "dialoglayout":Landroid/view/ViewGroup;
    const v5, 0x7f0a0052

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 110
    .local v4, "msgTextView":Landroid/widget/TextView;
    const v5, 0x7f0a0056

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->editText:Landroid/widget/EditText;

    .line 113
    const v5, 0x7f0a0053

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mHomeBtn:Landroid/widget/Button;

    .line 114
    const v5, 0x7f0a0054

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mWorkBtn:Landroid/widget/Button;

    .line 115
    const v5, 0x7f0a0055

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    iput-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mSchoolBtn:Landroid/widget/Button;

    .line 117
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mHomeBtn:Landroid/widget/Button;

    const v6, 0x7f0c0094

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(I)V

    .line 118
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mWorkBtn:Landroid/widget/Button;

    const v6, 0x7f0c0098

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(I)V

    .line 119
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mSchoolBtn:Landroid/widget/Button;

    const v6, 0x7f0c0096

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(I)V

    .line 121
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mHomeBtn:Landroid/widget/Button;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->btnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mWorkBtn:Landroid/widget/Button;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->btnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->mSchoolBtn:Landroid/widget/Button;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->btnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    iget v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->msgResId:I

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 126
    iget-object v5, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->editText:Landroid/widget/EditText;

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 131
    return-object v0
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 218
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getRetainInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setDismissMessage(Landroid/os/Message;)V

    .line 220
    :cond_0
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 221
    return-void
.end method

.method public setClickListener(Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;

    .prologue
    .line 231
    iput-object p1, p0, Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog;->listener:Lcom/seeclickfix/ma/android/dialogs/NamePlaceDialog$ClickListener;

    .line 232
    return-void
.end method
