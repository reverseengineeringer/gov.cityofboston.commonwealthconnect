.class public Lcom/seeclickfix/ma/android/fragments/ReportFragment;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "ReportFragment.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;


# static fields
.field private static final D:Z = false

.field private static final DRAFT_QUIET_TIME:J = 0x1d4c0L

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "SCFAPP_ReportFragment"


# instance fields
.field accuracyContainerView:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a00f2
    .end annotation
.end field

.field accuracyWarning:Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private addressEditBtn:Landroid/widget/ImageButton;

.field private addressEditBtnListener:Landroid/view/View$OnClickListener;

.field private addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

.field private addressEditTextListener:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;

.field alertContainerView:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a00f3
    .end annotation
.end field

.field private camBtnListener:Landroid/view/View$OnClickListener;

.field private cancelBtnListener:Landroid/view/View$OnClickListener;

.field private catSpinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private categoryParentRow:Landroid/view/ViewGroup;

.field private categoryRow:Landroid/view/ViewGroup;

.field private categorySpinnerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/Spinner;",
            ">;"
        }
    .end annotation
.end field

.field private descriptionEditText:Landroid/widget/EditText;

.field descriptionLabel:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0a00fe
    .end annotation
.end field

.field private errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

.field private focusListener:Landroid/view/View$OnFocusChangeListener;

.field private followupRow:Landroid/view/ViewGroup;

.field private galleryBtnListener:Landroid/view/View$OnClickListener;

.field private hasSavedInstance:Z

.field private imageIntent:Landroid/content/Intent;

.field private isEditingAddress:Z

.field private latLng:Lcom/google/android/gms/maps/model/LatLng;

.field locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mAddressIsGenerated:Z

.field private mAnonymousReportCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private mCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private mCurrentPhotoPath:Ljava/lang/String;

.field mDefaultOtherZone:Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mKeepAnonymousCheckBox:Landroid/widget/CheckBox;

.field private mLastDraftNotice:J

.field private mMap:Lcom/google/android/gms/maps/GoogleMap;

.field private mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

.field mNonDedicatedReqTypes:Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field mReportProvider:Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mRootOnTouchListener:Landroid/view/View$OnTouchListener;

.field private mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

.field private mainTable:Landroid/view/ViewGroup;

.field private mapBtnListener:Landroid/view/View$OnClickListener;

.field private mapContainer:Landroid/view/ViewGroup;

.field mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mediaClearBtnListener:Landroid/view/View$OnClickListener;

.field private mediaClearButton:Landroid/widget/Button;

.field private mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

.field outsideAreaHelper:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private photoRow:Landroid/view/ViewGroup;

.field private progWheelDiag:Lcom/seeclickfix/ma/android/dialogs/ProgressWheelDialog;

.field questionCallback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

.field private report:Lcom/seeclickfix/ma/android/objects/report/Report;

.field private reportBtnListener:Landroid/view/View$OnClickListener;

.field private scrollView:Lcom/seeclickfix/ma/android/views/CustomScrollView;

.field private selectableRows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

.field private setMapOnResume:Z

.field private setPicOnResume:Z

.field private shouldSaveDraft:Z

.field private startCameraBtn:Landroid/widget/Button;

.field private startGalleryBtn:Landroid/widget/Button;

.field private submitBtn:Landroid/widget/Button;

.field private summaryEditText:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 138
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 182
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPicOnResume:Z

    .line 183
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->shouldSaveDraft:Z

    .line 184
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isEditingAddress:Z

    .line 206
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categorySpinnerList:Ljava/util/List;

    .line 209
    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    .line 242
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mLastDraftNotice:J

    .line 1258
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$17;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->questionCallback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    .line 1381
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$18;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->catSpinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 1480
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$19;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$19;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->focusListener:Landroid/view/View$OnFocusChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hasLocation()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isEditingAddress:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    return-object v0
.end method

.method static synthetic access$1002(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    return-object p1
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    return-object v0
.end method

.method static synthetic access$302(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/LatLng;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .param p1, "x1"    # Lcom/google/android/gms/maps/model/LatLng;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    return-object p1
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/google/android/gms/maps/GoogleMap;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    return-object v0
.end method

.method static synthetic access$502(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 138
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    return p1
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks()V

    return-void
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 138
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getRequestTypes(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$800(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 138
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->reverseGeocode(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$900(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/ReportFragment;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    return-object v0
.end method

.method private attachListeners()V
    .locals 3

    .prologue
    .line 1921
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->startCameraBtn:Landroid/widget/Button;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->camBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1922
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->startGalleryBtn:Landroid/widget/Button;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->galleryBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1924
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v2, 0x7f0a00ea

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1925
    .local v0, "mapCard":Landroid/view/View;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mapBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1928
    return-void
.end method

.method private buildReport()V
    .locals 7

    .prologue
    const/4 v2, 0x1

    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 798
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const-string/jumbo v5, "ReportState:DRAFT"

    invoke-virtual {v4, v5}, Lcom/seeclickfix/ma/android/objects/report/Report;->setState(Ljava/lang/String;)V

    .line 799
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getReportDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/seeclickfix/ma/android/objects/report/Report;->setDao(Lcom/j256/ormlite/dao/Dao;)V

    .line 800
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->perhapsShowDraftIndicator()V

    .line 802
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Report;->getWatchAreas()Ljava/util/List;

    move-result-object v0

    .line 804
    .local v0, "cachedWatchAreas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    move v1, v2

    .line 807
    .local v1, "hasCachedWatchAreas":Z
    :goto_0
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v4, v6}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 809
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/Report;->getIsUsingCurrentLocation()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 811
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 813
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mKeepAnonymousCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v4, v6}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 814
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mKeepAnonymousCheckBox:Landroid/widget/CheckBox;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAnonymizeReporter()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 815
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mKeepAnonymousCheckBox:Landroid/widget/CheckBox;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAnonymousReportCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 817
    iget-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPicOnResume:Z

    if-ne v4, v2, :cond_3

    .line 819
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPic()V

    .line 820
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPicOnResume:Z

    .line 829
    :cond_0
    :goto_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLngModified()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 831
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setMapOnResume:Z

    .line 832
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setAddressString(Ljava/lang/String;)V

    .line 834
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks()V

    .line 863
    :goto_2
    if-eqz v1, :cond_1

    .line 866
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showZones(Ljava/util/List;)V

    .line 870
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    .line 872
    :goto_3
    return-void

    .end local v1    # "hasCachedWatchAreas":Z
    :cond_2
    move v1, v3

    .line 804
    goto :goto_0

    .line 821
    .restart local v1    # "hasCachedWatchAreas":Z
    :cond_3
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 824
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    .line 825
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPic()V

    .line 826
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPicOnResume:Z

    goto :goto_1

    .line 835
    :cond_4
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAddress()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 837
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    .line 838
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setAddressString(Ljava/lang/String;)V

    .line 840
    if-eqz v1, :cond_5

    .line 843
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showZones(Ljava/util/List;)V

    goto :goto_3

    .line 846
    :cond_5
    invoke-direct {p0, v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getRequestTypes(Ljava/lang/Runnable;)V

    goto :goto_2

    .line 848
    :cond_6
    iget-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setMapOnResume:Z

    if-eqz v2, :cond_7

    .line 850
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setMapOnResume:Z

    .line 851
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    .line 852
    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks(Z)V

    goto :goto_2

    .line 853
    :cond_7
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 855
    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setMapOnResume:Z

    .line 856
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    .line 857
    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks(Z)V

    goto :goto_2

    .line 859
    :cond_8
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    goto :goto_2
.end method

.method private checkAddressModified()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1520
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    if-nez v4, :cond_1

    .line 1546
    :cond_0
    :goto_0
    return v2

    .line 1524
    :cond_1
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Report;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 1526
    .local v0, "reportAddress":Ljava/lang/String;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1528
    .local v1, "userEnteredAddress":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1530
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1535
    if-nez v0, :cond_2

    if-eqz v1, :cond_2

    move v2, v3

    .line 1536
    goto :goto_0

    .line 1537
    :cond_2
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    .line 1538
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    move v2, v3

    .line 1541
    goto :goto_0

    .line 1543
    :cond_3
    if-eqz v0, :cond_0

    if-nez v1, :cond_0

    goto :goto_0
.end method

.method private constructReport(Landroid/os/Bundle;)Lcom/seeclickfix/ma/android/objects/report/Report;
    .locals 3
    .param p1, "args"    # Landroid/os/Bundle;

    .prologue
    .line 288
    const/4 v0, 0x0

    .line 289
    .local v0, "resultReport":Lcom/seeclickfix/ma/android/objects/report/Report;
    if-eqz p1, :cond_0

    .line 290
    const-string/jumbo v1, "page_params"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/PageParams;

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 292
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    if-eqz v1, :cond_0

    .line 296
    const-string/jumbo v1, "com.seeclickfix.actions.NEW_REPORT"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 298
    new-instance v1, Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 299
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getReportDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->setDao(Lcom/j256/ormlite/dao/Dao;)V

    .line 300
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 301
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->resetReportView()V

    .line 302
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    .line 303
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 308
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mReportProvider:Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;->load()Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v1

    goto :goto_0
.end method

.method private displayWatchArea(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Landroid/view/ViewGroup;Z)V
    .locals 15
    .param p1, "area"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .param p2, "categoryContainer"    # Landroid/view/ViewGroup;
    .param p3, "isDefaultOnly"    # Z

    .prologue
    .line 1134
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 1136
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getRequestTypes()Ljava/util/List;

    move-result-object v11

    .line 1138
    .local v11, "types":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestType;>;"
    if-eqz p3, :cond_1

    .line 1139
    move-object/from16 v0, p1

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1140
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v14, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v14}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v14

    invoke-virtual {v13, v14}, Lcom/seeclickfix/ma/android/objects/report/Report;->setSelectedWatchAreaApiId(I)V

    .line 1141
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hideCategoryRow()V

    .line 1142
    const/4 v13, 0x0

    invoke-interface {v11, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    move-object/from16 v0, p1

    invoke-direct {p0, v13, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setRequestType(Lcom/seeclickfix/ma/android/objects/report/RequestType;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    .line 1144
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v13}, Lcom/seeclickfix/ma/android/objects/report/Report;->getIsUsingCurrentLocation()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 1145
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 1211
    :cond_0
    :goto_0
    return-void

    .line 1148
    :cond_1
    new-instance v5, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v13

    invoke-virtual {v13}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->getParent()Landroid/app/Activity;

    move-result-object v13

    invoke-direct {v5, v13}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;-><init>(Landroid/content/Context;)V

    .line 1151
    .local v5, "categoryAdapter":Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/reporting/BlankReqType;

    invoke-direct {v3}, Lcom/seeclickfix/ma/android/fragments/reporting/BlankReqType;-><init>()V

    .line 1152
    .local v3, "blankReqType":Lcom/seeclickfix/ma/android/fragments/reporting/BlankReqType;
    invoke-virtual {v3, v11}, Lcom/seeclickfix/ma/android/fragments/reporting/BlankReqType;->addIfNeeded(Ljava/util/List;)V

    .line 1155
    new-instance v1, Lcom/seeclickfix/ma/android/fragments/reporting/ActionableReqType;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/fragments/reporting/ActionableReqType;-><init>()V

    .line 1156
    .local v1, "actionableReqType":Lcom/seeclickfix/ma/android/fragments/reporting/ActionableReqType;
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v13

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v1, v11, v13, v14}, Lcom/seeclickfix/ma/android/fragments/reporting/ActionableReqType;->add311IfNeeded(Ljava/util/List;ILandroid/content/Context;)V

    .line 1158
    invoke-virtual {v5, v11}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->setList(Ljava/util/List;)V

    .line 1163
    new-instance v4, Landroid/widget/Spinner;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v13

    invoke-direct {v4, v13}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 1165
    .local v4, "catSpinner":Landroid/widget/Spinner;
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categorySpinnerList:Ljava/util/List;

    invoke-interface {v13, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1167
    new-instance v12, Landroid/view/ViewGroup$LayoutParams;

    const/4 v13, -0x1

    const/4 v14, -0x2

    invoke-direct {v12, v13, v14}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 1170
    .local v12, "vglp":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v4, v12}, Landroid/widget/Spinner;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1171
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getTitle()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v13}, Landroid/widget/Spinner;->setPrompt(Ljava/lang/CharSequence;)V

    .line 1173
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v13

    const v14, 0x7f03005f

    move-object/from16 v0, p2

    invoke-static {v13, v14, v0}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup;

    .line 1177
    .local v7, "categoryZone":Landroid/view/ViewGroup;
    const v13, 0x7f0a0170

    invoke-virtual {v7, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    .line 1178
    .local v10, "spinnerContainer":Landroid/view/ViewGroup;
    const v13, 0x7f0a016f

    invoke-virtual {v7, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 1180
    .local v6, "categoryTitle":Landroid/widget/TextView;
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getTitle()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1182
    invoke-virtual {v10, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1183
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1185
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->catSpinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v4, v13}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 1186
    invoke-virtual {v4, v5}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 1188
    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/widget/Spinner;->setTag(Ljava/lang/Object;)V

    .line 1191
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v13}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSelectedWatchAreaApiId()I

    move-result v9

    .line 1195
    .local v9, "previousSelectedAreaId":I
    invoke-virtual/range {p1 .. p1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v2

    .line 1197
    .local v2, "areaId":I
    if-ne v2, v9, :cond_0

    .line 1201
    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v13}, Lcom/seeclickfix/ma/android/objects/report/Report;->getRequestTypeId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->getSelectionById(Ljava/lang/String;)I

    move-result v8

    .line 1203
    .local v8, "position":I
    const/4 v13, 0x1

    invoke-virtual {v4, v8, v13}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 1205
    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/adapters/CategorySpinnerAdapter;->notifyDataSetChanged()V

    .line 1206
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setSelectedPosition(I)V

    goto/16 :goto_0
.end method

.method private geocode()V
    .locals 4

    .prologue
    .line 921
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLastLocationIfAvailable()Landroid/location/Location;

    move-result-object v0

    .line 922
    .local v0, "currentLocation":Landroid/location/Location;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 924
    .local v1, "userEnteredAddress":Ljava/lang/String;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setAddress(Ljava/lang/String;)V

    .line 926
    sget-object v2, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 927
    new-instance v2, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    new-instance v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;

    invoke-direct {v3, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$14;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    invoke-direct {v2, p0, v3}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V

    invoke-static {v1, v0, v2}, Lcom/seeclickfix/ma/android/net/GoogleGeocodeRequest;->geocode(Ljava/lang/String;Landroid/location/Location;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 943
    return-void
.end method

.method private getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 3

    .prologue
    .line 432
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLastLocationIfAvailable()Landroid/location/Location;

    move-result-object v0

    .line 434
    .local v0, "lastLocation":Landroid/location/Location;
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getMiniMapOptions(Landroid/location/Location;)Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v1

    .line 436
    .local v1, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 438
    return-object v1
.end method

.method private getRequestTypes(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "runner"    # Ljava/lang/Runnable;

    .prologue
    .line 973
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showCategoryRow()V

    .line 975
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    new-instance v2, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;

    invoke-direct {v2, p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$15;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V

    invoke-direct {v1, p0, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->launch(Lcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    .line 998
    return-void
.end method

.method private handleAlertMessage(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1111
    .local p1, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->outsideAreaHelper:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->shouldShowWarning(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1112
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->outsideAreaHelper:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->alertContainerView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->showAlert(Landroid/view/ViewGroup;)V

    .line 1116
    :goto_0
    return-void

    .line 1114
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->outsideAreaHelper:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->alertContainerView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->hideAlert(Landroid/view/ViewGroup;)V

    goto :goto_0
.end method

.method private handleArgs(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "args"    # Landroid/os/Bundle;

    .prologue
    .line 275
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->constructReport(Landroid/os/Bundle;)Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 276
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->buildReport()V

    .line 277
    return-void
.end method

.method private hasLocation()Z
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    .line 1800
    const/4 v0, 0x0

    .line 1804
    .local v0, "hasData":Z
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    if-nez v1, :cond_0

    .line 1805
    new-instance v1, Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;-><init>()V

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 1808
    :cond_0
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    if-eqz v1, :cond_2

    .line 1809
    const/4 v0, 0x0

    .line 1814
    :cond_1
    :goto_0
    return v0

    .line 1810
    :cond_2
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLngModified()Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLat()D

    move-result-wide v2

    cmpl-double v1, v2, v4

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLng()D

    move-result-wide v2

    cmpl-double v1, v2, v4

    if-eqz v1, :cond_1

    .line 1811
    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private hideCategoryRow()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 1683
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryParentRow:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1684
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryRow:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1685
    return-void
.end method

.method private hideDraftIndicator()V
    .locals 3

    .prologue
    .line 750
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v2, 0x7f0a00e8

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 752
    .local v0, "draftIndicator":Landroid/view/View;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 753
    return-void
.end method

.method private hideView(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1902
    if-eqz p1, :cond_0

    .line 1903
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1905
    :cond_0
    return-void
.end method

.method private initMapFragAndServices()V
    .locals 3

    .prologue
    .line 427
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    const v1, 0x7f0a00eb

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;->initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    .line 428
    return-void
.end method

.method private isAuth()Z
    .locals 1

    .prologue
    .line 1779
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    return v0
.end method

.method private isValidReport()Z
    .locals 12

    .prologue
    const v11, 0x7f0c00f8

    const/4 v10, 0x1

    const-wide/16 v8, 0x0

    .line 1731
    const/4 v5, 0x1

    .line 1733
    .local v5, "valid":Z
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->gatherReportData()V

    .line 1736
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLat()D

    move-result-wide v6

    cmpl-double v6, v6, v8

    if-nez v6, :cond_3

    .line 1737
    const/4 v5, 0x0

    .line 1738
    invoke-virtual {p0, v11}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUser(I)V

    .line 1751
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v3

    .line 1753
    .local v3, "questions":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    invoke-static {v3}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNotNullOrEmpty(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1754
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 1755
    .local v2, "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->isRequired()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1756
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v0

    .line 1758
    .local v0, "a":Lcom/seeclickfix/ma/android/objects/report/Answer;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Answer;->getAnswer()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v6, v10, :cond_1

    .line 1759
    :cond_2
    const/4 v5, 0x0

    .line 1760
    const v6, 0x7f0c00f7

    new-array v7, v10, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionText()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1761
    .local v4, "toastText":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUser(Ljava/lang/String;)V

    goto :goto_1

    .line 1739
    .end local v0    # "a":Lcom/seeclickfix/ma/android/objects/report/Answer;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    .end local v3    # "questions":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    .end local v4    # "toastText":Ljava/lang/String;
    :cond_3
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLng()D

    move-result-wide v6

    cmpl-double v6, v6, v8

    if-nez v6, :cond_4

    .line 1740
    const/4 v5, 0x0

    .line 1741
    invoke-virtual {p0, v11}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUser(I)V

    goto :goto_0

    .line 1742
    :cond_4
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getRequestType()Lcom/seeclickfix/ma/android/objects/report/RequestType;

    move-result-object v6

    if-nez v6, :cond_5

    .line 1743
    const/4 v5, 0x0

    .line 1744
    const v6, 0x7f0c00f6

    invoke-virtual {p0, v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUser(I)V

    goto :goto_0

    .line 1745
    :cond_5
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSummary()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1747
    const/4 v5, 0x0

    .line 1748
    const v6, 0x7f0c00f9

    invoke-virtual {p0, v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUser(I)V

    goto :goto_0

    .line 1767
    .restart local v3    # "questions":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    :cond_6
    return v5
.end method

.method private killAsyncTasks()V
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->cancel()V

    .line 422
    :cond_0
    const-string/jumbo v0, "SCFAPP_ReportFragment"

    invoke-static {v0}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->cancel(Ljava/lang/String;)V

    .line 423
    const-string/jumbo v0, "SCFAPP_ReportFragment"

    invoke-static {v0}, Lcom/seeclickfix/ma/android/tasks/RequestTypesTask;->cancel(Ljava/lang/String;)V

    .line 424
    return-void
.end method

.method private launchLoginFrag()V
    .locals 3

    .prologue
    .line 1772
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    const-string/jumbo v2, "com.seeclickfix.actions.SEND_REPORT_ON_RETURN"

    invoke-static {v1, v2}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getReportParamsWithAction(Landroid/content/Context;Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 1774
    .local v0, "returnParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    new-instance v1, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;

    invoke-direct {v1, v0}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;-><init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    invoke-static {v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->postEvent(Ljava/lang/Object;)V

    .line 1776
    return-void
.end method

.method private performLocationTasks()V
    .locals 1

    .prologue
    .line 875
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks(Z)V

    .line 876
    return-void
.end method

.method private performLocationTasks(Z)V
    .locals 1
    .param p1, "hasCachedWatchAreas"    # Z

    .prologue
    .line 880
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;

    invoke-direct {v0, p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$12;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Z)V

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->reverseGeocode(Ljava/lang/Runnable;)V

    .line 888
    return-void
.end method

.method private perhapsShowDraftIndicator()V
    .locals 8

    .prologue
    .line 719
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v6, 0x7f0a00e8

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 720
    .local v1, "draftIndicator":Landroid/view/View;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v6, 0x7f0a00e9

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 721
    .local v4, "lastEditedTextView":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLastEdited()J

    move-result-wide v2

    .line 723
    .local v2, "lastEditedMs":J
    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-lez v5, :cond_0

    .line 724
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 725
    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/date/DateUtil;->getDateTimeDisplayStringFromMSEpoch(J)Ljava/lang/String;

    move-result-object v0

    .line 726
    .local v0, "draftDateString":Ljava/lang/String;
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 727
    new-instance v5, Lcom/seeclickfix/ma/android/fragments/ReportFragment$11;

    invoke-direct {v5, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$11;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    invoke-direct {p0, v2, v3, v5}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->runWhenDraftNoticeIsStale(JLjava/lang/Runnable;)V

    .line 736
    .end local v0    # "draftDateString":Ljava/lang/String;
    :goto_0
    return-void

    .line 734
    :cond_0
    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private resetReportView()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1841
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getReportModel()Lcom/seeclickfix/ma/android/ReportModel;

    move-result-object v2

    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->emptyNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/ReportModel;->setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    .line 1842
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->processNotice()V

    .line 1844
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->scrollView:Lcom/seeclickfix/ma/android/views/CustomScrollView;

    invoke-virtual {v2, v4, v4}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->scrollTo(II)V

    .line 1846
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->outsideAreaHelper:Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->alertContainerView:Landroid/view/ViewGroup;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/fragments/reporting/OutsideAreaHelper;->hideAlert(Landroid/view/ViewGroup;)V

    .line 1848
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->summaryEditText:Landroid/widget/EditText;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1849
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionEditText:Landroid/widget/EditText;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1851
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->setText(Ljava/lang/CharSequence;)V

    .line 1853
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    if-eqz v2, :cond_0

    .line 1854
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->cancel()V

    .line 1855
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->hidePic()V

    .line 1858
    :cond_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    if-eqz v2, :cond_1

    .line 1859
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v2, v5}, Lcom/seeclickfix/ma/android/objects/PageParams;->setDataParcel(Landroid/os/Parcelable;)V

    .line 1860
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v2, v5}, Lcom/seeclickfix/ma/android/objects/PageParams;->setParcel(Landroid/os/Parcelable;)V

    .line 1861
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v2, v5}, Lcom/seeclickfix/ma/android/objects/PageParams;->setActionExtra(Ljava/lang/String;)V

    .line 1864
    :cond_1
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setMapOnResume:Z

    .line 1865
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPicOnResume:Z

    .line 1866
    iput-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 1867
    iput-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    .line 1868
    iput-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1869
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hasSavedInstance:Z

    .line 1871
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    .line 1872
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1874
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mKeepAnonymousCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1876
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v2, :cond_2

    .line 1877
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 1881
    :cond_2
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a0100

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 1882
    .local v1, "followupContainer":Landroid/view/ViewGroup;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a00fa

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1884
    .local v0, "followupBody":Landroid/widget/TextView;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1885
    const-string/jumbo v2, "\n "

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1886
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1894
    .end local v0    # "followupBody":Landroid/widget/TextView;
    .end local v1    # "followupContainer":Landroid/view/ViewGroup;
    :goto_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryRow:Landroid/view/ViewGroup;

    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hideView(Landroid/view/View;)V

    .line 1895
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->followupRow:Landroid/view/ViewGroup;

    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hideView(Landroid/view/View;)V

    .line 1896
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryParentRow:Landroid/view/ViewGroup;

    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hideView(Landroid/view/View;)V

    .line 1899
    return-void

    .line 1888
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private reverseGeocode(Ljava/lang/Runnable;)V
    .locals 4
    .param p1, "callback"    # Ljava/lang/Runnable;

    .prologue
    .line 891
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLngModified(Z)V

    .line 893
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    if-nez v0, :cond_0

    .line 917
    :goto_0
    return-void

    .line 897
    :cond_0
    const-string/jumbo v0, "SCFAPP_ReportFragment"

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    new-instance v2, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;

    new-instance v3, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;

    invoke-direct {v3, p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$13;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Ljava/lang/Runnable;)V

    invoke-direct {v2, p0, v3}, Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;-><init>(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;)V

    invoke-static {v0, v1, p0, v2}, Lcom/seeclickfix/ma/android/tasks/ReverseGeocodeTask;->launch(Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLng;Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;Lcom/seeclickfix/ma/android/fragments/interfaces/SafeListener;)V

    goto :goto_0
.end method

.method private runWhenDraftNoticeIsStale(JLjava/lang/Runnable;)V
    .locals 7
    .param p1, "lastEditedMs"    # J
    .param p3, "block"    # Ljava/lang/Runnable;

    .prologue
    const-wide/32 v4, 0x1d4c0

    .line 739
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 743
    .local v0, "currentTime":J
    add-long v2, p1, v4

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    iget-wide v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mLastDraftNotice:J

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 744
    iput-wide v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mLastDraftNotice:J

    .line 745
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    .line 747
    :cond_0
    return-void
.end method

.method private saveDraft()V
    .locals 3

    .prologue
    .line 760
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->shouldSaveDraft:Z

    if-nez v1, :cond_1

    .line 761
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->shouldSaveDraft:Z

    .line 791
    :cond_0
    :goto_0
    return-void

    .line 766
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->gatherReportData()V

    .line 768
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->isModified()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 774
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const-string/jumbo v2, "ReportState:DRAFT"

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->setState(Ljava/lang/String;)V

    .line 776
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->clearReport()V

    .line 778
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-static {v1}, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->putReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 780
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.seeclickfix.actions.SAVE_DRAFT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 781
    .local v0, "draftIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/seeclickfix/ma/android/services/DraftSaveService;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 784
    const-string/jumbo v1, "report_bundle"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 786
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0
.end method

.method private scrollToDetails()V
    .locals 4

    .prologue
    .line 1643
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->scrollView:Lcom/seeclickfix/ma/android/views/CustomScrollView;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a00ff

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    add-int/lit8 v2, v2, 0x64

    invoke-virtual {v0, v1, v2}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->scrollTo(II)V

    .line 1644
    return-void
.end method

.method private send()V
    .locals 5

    .prologue
    .line 1708
    sget-object v3, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v3}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 1710
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->currentUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v2

    .line 1712
    .local v2, "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v3, v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->setUserInfo(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    .line 1716
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "com.seeclickfix.actions.UPLOAD_REPORT"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1718
    .local v1, "reportUploadIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/seeclickfix/ma/android/services/ReportUploadService;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1721
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->shouldSaveDraft:Z

    .line 1724
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-direct {v0, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;-><init>(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 1725
    .local v0, "reportCopy":Lcom/seeclickfix/ma/android/objects/report/Report;
    const-string/jumbo v3, "ReportState:SENDING"

    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setState(Ljava/lang/String;)V

    .line 1726
    const-string/jumbo v3, "report_bundle"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1727
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/support/v4/app/FragmentActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1728
    return-void
.end method

.method private setMarkerAndAnimate()V
    .locals 8

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x1f4

    const/high16 v3, 0x41800000    # 16.0f

    const/4 v6, 0x0

    .line 1962
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    if-eqz v2, :cond_0

    .line 1964
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-static {v2, v3}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 1965
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v2, v0, v4, v5}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 1966
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 1968
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v3, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v3}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v3

    const-string/jumbo v4, "Open"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    .line 1974
    iput-boolean v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    .line 2016
    .end local v0    # "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    :goto_0
    return-void

    .line 1978
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v2

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 1980
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    if-nez v2, :cond_2

    .line 1981
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->getLastLocationIfAvailable()Landroid/location/Location;

    move-result-object v1

    .line 1983
    .local v1, "lastLocation":Landroid/location/Location;
    if-eqz v1, :cond_1

    .line 1984
    new-instance v2, Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 1989
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    .line 1990
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLng(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 1991
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 1996
    .end local v1    # "lastLocation":Landroid/location/Location;
    :goto_2
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v2, v3}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 1997
    .restart local v0    # "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v3, 0x1f4

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 1998
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/GoogleMap;->clear()V

    .line 2000
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v3, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v3}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v3

    const-string/jumbo v4, "Open"

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getPinByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    .line 2005
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->performLocationTasks()V

    goto :goto_0

    .line 2006
    .end local v0    # "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    :catch_0
    move-exception v2

    goto :goto_0

    .line 1986
    .restart local v1    # "lastLocation":Landroid/location/Location;
    :cond_1
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v2}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/maps/model/CameraPosition;->target:Lcom/google/android/gms/maps/model/LatLng;

    iput-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    goto :goto_1

    .line 1993
    .end local v1    # "lastLocation":Landroid/location/Location;
    :cond_2
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2
.end method

.method private setPic()V
    .locals 9

    .prologue
    .line 2022
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 2025
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLocalImagePath(Ljava/lang/String;)V

    .line 2040
    :cond_0
    :goto_0
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v7, 0x7f0a0105

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 2042
    .local v2, "imgView":Landroid/widget/ImageView;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v7, 0x7f0a0108

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 2043
    .local v3, "noImageContainer":Landroid/view/View;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v7, 0x7f0a0104

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 2045
    .local v1, "imageContainer":Landroid/view/View;
    new-instance v0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;-><init>()V

    .line 2048
    .local v0, "builder":Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->activity(Landroid/app/Activity;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 2049
    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imageView(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 2050
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->imageIntent:Landroid/content/Intent;

    invoke-virtual {v0, v6}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imgIntent(Landroid/content/Intent;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 2051
    invoke-virtual {v0, v3}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToHide(Landroid/view/View;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 2052
    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToShow(Landroid/view/View;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 2053
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v0, v6}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->photoPath(Ljava/lang/String;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 2055
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->build()Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    move-result-object v6

    iput-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .line 2057
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->setPic()V

    .line 2062
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLocalImagePath(Ljava/lang/String;)V

    .line 2064
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->scrollView:Lcom/seeclickfix/ma/android/views/CustomScrollView;

    const/4 v7, 0x0

    invoke-virtual {v2}, Landroid/widget/ImageView;->getTop()I

    move-result v8

    add-int/lit8 v8, v8, -0x32

    invoke-virtual {v6, v7, v8}, Lcom/seeclickfix/ma/android/views/CustomScrollView;->scrollTo(II)V

    .line 2066
    return-void

    .line 2026
    .end local v0    # "builder":Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    .end local v1    # "imageContainer":Landroid/view/View;
    .end local v2    # "imgView":Landroid/widget/ImageView;
    .end local v3    # "noImageContainer":Landroid/view/View;
    :cond_1
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->imageIntent:Landroid/content/Intent;

    if-eqz v6, :cond_2

    .line 2027
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->imageIntent:Landroid/content/Intent;

    invoke-virtual {v6}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    .line 2028
    .local v5, "selectedImageUri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-static {v6, v5}, Lcom/seeclickfix/ma/android/media/GalleryPathHelper;->getPath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    .line 2029
    .local v4, "path":Ljava/lang/String;
    iput-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    .line 2030
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLocalImagePath(Ljava/lang/String;)V

    goto :goto_0

    .line 2033
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "selectedImageUri":Landroid/net/Uri;
    :cond_2
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 2034
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLocalImagePath()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 446
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00e6

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/views/CustomScrollView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->scrollView:Lcom/seeclickfix/ma/android/views/CustomScrollView;

    .line 448
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a010a

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->startCameraBtn:Landroid/widget/Button;

    .line 449
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a010b

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->startGalleryBtn:Landroid/widget/Button;

    .line 450
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00ee

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditBtn:Landroid/widget/ImageButton;

    .line 451
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a0112

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->submitBtn:Landroid/widget/Button;

    .line 453
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00f0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    .line 455
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00fd

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->summaryEditText:Landroid/widget/EditText;

    .line 456
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00ff

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionEditText:Landroid/widget/EditText;

    .line 458
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00e7

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mainTable:Landroid/view/ViewGroup;

    .line 461
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00f6

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryRow:Landroid/view/ViewGroup;

    .line 462
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00f8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->followupRow:Landroid/view/ViewGroup;

    .line 463
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00f4

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryParentRow:Landroid/view/ViewGroup;

    .line 464
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a0101

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->photoRow:Landroid/view/ViewGroup;

    .line 466
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00eb

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mapContainer:Landroid/view/ViewGroup;

    .line 468
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a0107

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaClearButton:Landroid/widget/Button;

    .line 469
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a00f1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    .line 471
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v1, 0x7f0a010f

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mKeepAnonymousCheckBox:Landroid/widget/CheckBox;

    .line 473
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectableRows:Ljava/util/List;

    .line 475
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectableRows:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryRow:Landroid/view/ViewGroup;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 476
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectableRows:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->followupRow:Landroid/view/ViewGroup;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 477
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectableRows:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryParentRow:Landroid/view/ViewGroup;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 478
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectableRows:Ljava/util/List;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->photoRow:Landroid/view/ViewGroup;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 480
    return-void
.end method

.method private setRequestType(Lcom/seeclickfix/ma/android/objects/report/RequestType;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V
    .locals 11
    .param p1, "requestType"    # Lcom/seeclickfix/ma/android/objects/report/RequestType;
    .param p2, "area"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .prologue
    const/4 v10, 0x0

    .line 1554
    iput-object p2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1557
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getApiId()Ljava/lang/String;

    move-result-object v7

    .line 1562
    .local v7, "reqTypeId":Ljava/lang/String;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    iget-object v9, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8, v9}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 1570
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getIsFromDraft()Z

    move-result v3

    .line 1572
    .local v3, "isAreaFromDraft":Z
    if-eqz v3, :cond_0

    .line 1574
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v8, v10}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setIsFromDraft(Z)V

    .line 1577
    :cond_0
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getNumQuestions()I

    move-result v8

    if-lez v8, :cond_5

    .line 1580
    if-nez v3, :cond_1

    .line 1582
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupRow(Z)V

    .line 1583
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setRequestType(Lcom/seeclickfix/ma/android/objects/report/RequestType;)V

    .line 1584
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v9, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v9}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/seeclickfix/ma/android/objects/report/Report;->setSelectedWatchAreaApiId(I)V

    .line 1585
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v7, v9}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getFollowupQuestions(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 1640
    :goto_0
    return-void

    .line 1586
    :cond_1
    invoke-static {}, Lcom/seeclickfix/ma/android/cache/GlobalReportCache;->getReport()Lcom/seeclickfix/ma/android/objects/report/Report;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 1590
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v8

    iget-object v9, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {p0, v8, v9}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupQuestions(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    goto :goto_0

    .line 1591
    :cond_2
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestionsDb()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v8

    if-eqz v8, :cond_4

    .line 1592
    invoke-virtual {p0, v10}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupRow(Z)V

    .line 1596
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestionsDb()Lcom/j256/ormlite/dao/ForeignCollection;

    move-result-object v1

    .line 1597
    .local v1, "dbQuestions":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    invoke-interface {v1}, Lcom/j256/ormlite/dao/ForeignCollection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 1600
    .local v5, "qsFromDb":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1602
    .local v6, "questionsFromDb":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getAnswerDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v0

    .line 1604
    .local v0, "answerDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1605
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 1608
    .local v4, "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    :try_start_0
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getSelectedAnswer()Lcom/seeclickfix/ma/android/objects/report/Answer;

    move-result-object v8

    invoke-interface {v0, v8}, Lcom/j256/ormlite/dao/Dao;->refresh(Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1613
    :goto_2
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1609
    :catch_0
    move-exception v2

    .line 1610
    .local v2, "e":Ljava/sql/SQLException;
    invoke-virtual {v2}, Ljava/sql/SQLException;->printStackTrace()V

    goto :goto_2

    .line 1617
    .end local v2    # "e":Ljava/sql/SQLException;
    .end local v4    # "q":Lcom/seeclickfix/ma/android/objects/report/Question;
    :cond_3
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8, v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->setQuestions(Ljava/util/List;)V

    .line 1621
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Report;->getQuestions()Ljava/util/List;

    move-result-object v8

    iget-object v9, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {p0, v8, v9}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupQuestions(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    goto :goto_0

    .line 1623
    .end local v0    # "answerDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<Lcom/seeclickfix/ma/android/objects/report/Answer;Ljava/lang/Integer;>;"
    .end local v1    # "dbQuestions":Lcom/j256/ormlite/dao/ForeignCollection;, "Lcom/j256/ormlite/dao/ForeignCollection<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    .end local v5    # "qsFromDb":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    .end local v6    # "questionsFromDb":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    :cond_4
    const-string/jumbo v8, "SCFAPP_ReportFragment"

    const-string/jumbo v9, "we have a req type with follow up q\'s but are unable to find them in db or memory??"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1628
    :cond_5
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Report;->clearSecondaryData()V

    .line 1629
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setRequestType(Lcom/seeclickfix/ma/android/objects/report/RequestType;)V

    .line 1631
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showDescriptionAndSummary()V

    .line 1632
    invoke-virtual {p0, v10}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupRow(Z)V

    .line 1633
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showSubmitButtonRow()V

    .line 1635
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupHeaders()V

    .line 1636
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->scrollToDetails()V

    goto/16 :goto_0
.end method

.method private setUpMapIfNeeded()V
    .locals 1

    .prologue
    .line 1932
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showAccuracyWarning()V

    .line 1934
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1935
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 1938
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_1

    .line 1939
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 1942
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_2

    .line 1943
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setMarkerAndAnimate()V

    .line 1945
    :cond_2
    return-void
.end method

.method private setupListeners()V
    .locals 2

    .prologue
    .line 488
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$1;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->camBtnListener:Landroid/view/View$OnClickListener;

    .line 499
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$2;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mapBtnListener:Landroid/view/View$OnClickListener;

    .line 531
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$3;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->reportBtnListener:Landroid/view/View$OnClickListener;

    .line 539
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$4;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->galleryBtnListener:Landroid/view/View$OnClickListener;

    .line 545
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$5;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaClearBtnListener:Landroid/view/View$OnClickListener;

    .line 552
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$6;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mRootOnTouchListener:Landroid/view/View$OnTouchListener;

    .line 566
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mRootOnTouchListener:Landroid/view/View$OnTouchListener;

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/util/FormUtil;->setupUI(Landroid/view/View;Landroid/view/View$OnTouchListener;)V

    .line 568
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$7;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$7;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditBtnListener:Landroid/view/View$OnClickListener;

    .line 581
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$8;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$8;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditTextListener:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;

    .line 589
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$9;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 630
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/ReportFragment$10;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$10;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAnonymousReportCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 640
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditBtn:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 641
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->focusListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 642
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditTextListener:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->setOnEditTextImeBackListener(Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect$EditTextImeBackListener;)V

    .line 643
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaClearButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mediaClearBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 644
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->submitBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->reportBtnListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 646
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 647
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mKeepAnonymousCheckBox:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAnonymousReportCheckBoxListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 648
    return-void
.end method

.method private showAccuracyWarning()V
    .locals 2

    .prologue
    .line 1949
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyWarning:Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->shouldShowWarning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1950
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyWarning:Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyContainerView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->showAlert(Landroid/view/ViewGroup;)V

    .line 1956
    :goto_0
    return-void

    .line 1952
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyWarning:Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->accuracyContainerView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/fragments/reporting/AccuracyWarn;->hideAlert(Landroid/view/ViewGroup;)V

    goto :goto_0
.end method

.method private showCategoryRow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1688
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryParentRow:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1689
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryRow:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1690
    return-void
.end method

.method private showFollowupHeaders()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1668
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a0100

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 1669
    .local v2, "followupContainer":Landroid/view/ViewGroup;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00fa

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1670
    .local v0, "followupBody":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v5, 0x7f0a00fb

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1672
    .local v1, "followupBody2":Landroid/widget/TextView;
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1674
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getRequestTypes()Ljava/util/List;

    move-result-object v4

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getSelectedPosition()I

    move-result v5

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 1676
    .local v3, "rt":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1677
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1678
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1679
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1680
    return-void
.end method


# virtual methods
.method protected cancelReport()V
    .locals 2

    .prologue
    .line 1823
    new-instance v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/report/Report;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 1824
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/db/util/DaoUtil;->getReportDao(Landroid/content/Context;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setDao(Lcom/j256/ormlite/dao/Dao;)V

    .line 1825
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setModified(Z)V

    .line 1827
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->resetReportView()V

    .line 1828
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hideDraftIndicator()V

    .line 1829
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    .line 1831
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->clearDraft()V

    .line 1832
    return-void
.end method

.method protected clearMedia()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 651
    iput-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    .line 652
    iput-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->imageIntent:Landroid/content/Intent;

    .line 654
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a0108

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 655
    .local v1, "noImageContainer":Landroid/view/View;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v3, 0x7f0a0104

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 657
    .local v0, "imageContainer":Landroid/view/View;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 658
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 660
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v4}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLocalImagePath(Ljava/lang/String;)V

    .line 663
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "page_params"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/PageParams;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/PageParams;->setIntent(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 668
    :goto_0
    return-void

    .line 664
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method protected editAddress()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 700
    iput-boolean v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isEditingAddress:Z

    .line 702
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->hasFocus()Z

    move-result v1

    if-nez v1, :cond_0

    .line 703
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->requestFocus()Z

    .line 705
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->selectAll()V

    .line 706
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditBtn:Landroid/widget/ImageButton;

    const v2, 0x7f0200e2

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 708
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 709
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v0, v1, v4}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 711
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setFocusable(Z)V

    .line 712
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setFocusableInTouchMode(Z)V

    .line 713
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 715
    return-void
.end method

.method protected gatherReportData()V
    .locals 3

    .prologue
    .line 1909
    :try_start_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->summaryEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1910
    .local v1, "summary":Ljava/lang/String;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1912
    .local v0, "description":Ljava/lang/String;
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setSummary(Ljava/lang/String;)V

    .line 1913
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setDescription(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1918
    .end local v0    # "description":Ljava/lang/String;
    .end local v1    # "summary":Ljava/lang/String;
    :goto_0
    return-void

    .line 1914
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method protected getFollowupQuestions(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "watchArea"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .param p2, "reqId"    # Ljava/lang/String;
    .param p3, "runner"    # Ljava/lang/Runnable;

    .prologue
    .line 1002
    sget-object v0, Lcom/seeclickfix/ma/android/MyApplication;->scfV1:Lcom/seeclickfix/ma/android/api/SCFService$APIv1;

    new-instance v1, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;

    invoke-direct {v1, p0, p1, p3, p2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment$16;-><init>(Lcom/seeclickfix/ma/android/fragments/ReportFragment;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-interface {v0, p2, v1}, Lcom/seeclickfix/ma/android/api/SCFService$APIv1;->requestTypeQuestions(Ljava/lang/String;Lretrofit/Callback;)V

    .line 1029
    return-void
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 284
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getReportModel()Lcom/seeclickfix/ma/android/ReportModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/ReportModel;->getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    return-object v0
.end method

.method public getReportModel()Lcom/seeclickfix/ma/android/ReportModel;
    .locals 1

    .prologue
    .line 280
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getReportModel()Lcom/seeclickfix/ma/android/ReportModel;

    move-result-object v0

    return-object v0
.end method

.method protected handleAddressEdit()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 672
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isEditingAddress:Z

    .line 674
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->checkAddressModified()Z

    move-result v0

    .line 676
    .local v0, "modified":Z
    if-eqz v0, :cond_1

    .line 677
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->geocode()V

    .line 679
    iput-boolean v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    .line 681
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    if-eqz v1, :cond_0

    .line 682
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 685
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/report/Report;->setIsUsingCurrentLocation(Z)V

    .line 688
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 689
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setFocusable(Z)V

    .line 690
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mUseCurrentLocationCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v1, v3}, Landroid/widget/CheckBox;->setFocusableInTouchMode(Z)V

    .line 692
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->clearFocus()V

    .line 694
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditBtn:Landroid/widget/ImageButton;

    const v2, 0x7f0200e3

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 696
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditBtn:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->requestFocus()Z

    .line 697
    return-void
.end method

.method protected hideFollowupRow()V
    .locals 3

    .prologue
    .line 1369
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v2, 0x7f0a0100

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 1371
    .local v0, "followupContainer":Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1372
    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    .line 1373
    invoke-virtual {v0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 1375
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->followupRow:Landroid/view/ViewGroup;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1377
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->followupRow:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->invalidate()V

    .line 1378
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->followupRow:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 1379
    return-void
.end method

.method protected isRequestTypeSwitch(Landroid/view/View;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)Z
    .locals 5
    .param p1, "v"    # Landroid/view/View;
    .param p2, "newArea"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .prologue
    const/4 v2, 0x1

    .line 1501
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 1502
    .local v0, "data":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getApiId()Ljava/lang/String;

    move-result-object v1

    .line 1504
    .local v1, "reqTypeId":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->selectedWatchArea:Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v4

    if-eq v3, v4, :cond_1

    .line 1511
    :cond_0
    :goto_0
    return v2

    .line 1507
    :cond_1
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->getRequestTypeId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1511
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected launchCameraIntent()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 2106
    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->imageIntent:Landroid/content/Intent;

    .line 2109
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "page_params"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setIntent(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2115
    :goto_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;

    invoke-static {p0, v0}, Lcom/seeclickfix/ma/android/media/PhotoTaker;->launchCameraWithCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    .line 2119
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLocalImagePath(Ljava/lang/String;)V

    .line 2120
    return-void

    .line 2110
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected launchGalleryIntent()V
    .locals 2

    .prologue
    .line 2124
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLocalImagePath(Ljava/lang/String;)V

    .line 2126
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;

    invoke-static {p0, v0}, Lcom/seeclickfix/ma/android/media/GalleryPicker;->launchGalleryForCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;)V

    .line 2129
    return-void
.end method

.method public notifyUser(I)V
    .locals 1
    .param p1, "message"    # I

    .prologue
    .line 960
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;I)V

    .line 961
    return-void
.end method

.method public notifyUser(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 968
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;Ljava/lang/String;)V

    .line 969
    return-void
.end method

.method public notifyUserLong(I)V
    .locals 1
    .param p1, "message"    # I

    .prologue
    .line 964
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredLong(Landroid/content/Context;I)V

    .line 965
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 313
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 315
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->subscribeToEventBus()V

    .line 316
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setHasOptionsMenu(Z)V

    .line 318
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 395
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 399
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 246
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreate(Landroid/os/Bundle;)V

    .line 247
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 322
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 324
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 326
    const v0, 0x7f0e0005

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 327
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 251
    if-nez p2, :cond_0

    .line 252
    const/4 v0, 0x0

    .line 270
    :goto_0
    return-object v0

    .line 255
    :cond_0
    const v0, 0x7f030035

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    .line 256
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v2, 0x7f0a0078

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->errorDialog:Lcom/seeclickfix/ma/android/dialogs/ErrorDialog;

    .line 258
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    invoke-static {p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Landroid/view/View;)V

    .line 262
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->initMapFragAndServices()V

    .line 266
    if-nez p3, :cond_1

    .line 267
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setFragState(Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;)V

    .line 270
    :cond_1
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    goto :goto_0
.end method

.method public onDetach()V
    .locals 0

    .prologue
    .line 413
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDetach()V

    .line 414
    return-void
.end method

.method public onImageCallback(Landroid/content/Intent;)V
    .locals 2
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 2077
    if-eqz p1, :cond_0

    .line 2079
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->imageIntent:Landroid/content/Intent;

    .line 2083
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setPicOnResume:Z

    .line 2085
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "page_params"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/PageParams;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->imageIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/PageParams;->setIntent(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2090
    :goto_0
    return-void

    .line 2086
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onIssueCreatedEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 368
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getResponse()Lretrofit/client/Response;

    move-result-object v0

    invoke-virtual {v0}, Lretrofit/client/Response;->getStatus()I

    move-result v0

    const/16 v1, 0xc9

    if-ne v0, v1, :cond_0

    .line 369
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->cancelReport()V

    .line 370
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getReportModel()Lcom/seeclickfix/ma/android/ReportModel;

    move-result-object v0

    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->emptyNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/ReportModel;->setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    .line 374
    :goto_0
    return-void

    .line 372
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getReportModel()Lcom/seeclickfix/ma/android/ReportModel;

    move-result-object v0

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueCreatedEvent;->getNoticeItem()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/ReportModel;->setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    goto :goto_0
.end method

.method public onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V
    .locals 4
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 378
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getUser()Lcom/seeclickfix/ma/android/objects/user/AuthUser;

    move-result-object v1

    .line 380
    .local v1, "user":Lcom/seeclickfix/ma/android/objects/user/AuthUser;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    .line 382
    .local v0, "pageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 383
    const-string/jumbo v2, "com.seeclickfix.actions.SEND_REPORT_ON_RETURN"

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getActionExtra()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 384
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setUserInfo(Lcom/seeclickfix/ma/android/objects/user/AuthUser;)V

    .line 385
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->prepareAndSendReport()V

    .line 387
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->clearAuthCompleteParams()V

    .line 391
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 331
    invoke-interface {p1}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a0187

    if-ne v1, v2, :cond_0

    .line 332
    const v1, 0x7f0c00f5

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUserLong(I)V

    .line 333
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->cancelReport()V

    .line 339
    :goto_0
    return v0

    .line 335
    :cond_0
    invoke-interface {p1}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f0a0188

    if-ne v1, v2, :cond_1

    .line 336
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->prepareAndSendReport()V

    goto :goto_0

    .line 339
    :cond_1
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onReportLocationSet(Lcom/seeclickfix/ma/android/objects/PageParams;)V
    .locals 1
    .param p1, "returnPageParams"    # Lcom/seeclickfix/ma/android/objects/PageParams;

    .prologue
    .line 2140
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    .line 2142
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    .line 2143
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->pageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/PageParams;->getParcel()Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/objects/report/Report;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    .line 2144
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->latLng:Lcom/google/android/gms/maps/model/LatLng;

    .line 2146
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->buildReport()V

    .line 2147
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    const v2, 0x7f0a0110

    .line 345
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 351
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setReferences()V

    .line 352
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setupListeners()V

    .line 353
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->attachListeners()V

    .line 355
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->processNotice()V

    .line 356
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->handleArgs(Landroid/os/Bundle;)V

    .line 358
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->subscribeToEventBus()V

    .line 359
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->locationAdapter:Lcom/seeclickfix/ma/android/location/LocationAdapter;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/LocationAdapter;->startHighAccuracyLocationUpdates()V

    .line 362
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 363
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c00eb

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 364
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 405
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->unSubscribeFromEventBus()V

    .line 406
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->killAsyncTasks()V

    .line 407
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->saveDraft()V

    .line 408
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 409
    return-void
.end method

.method protected prepareAndSendReport()V
    .locals 1

    .prologue
    .line 1694
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->gatherReportData()V

    .line 1696
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isValidReport()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1697
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->isAuth()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1698
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->send()V

    .line 1703
    :cond_0
    :goto_0
    return-void

    .line 1700
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->launchLoginFrag()V

    goto :goto_0
.end method

.method public processSimpleLocations(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/location/SimpleLocation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 948
    .local p1, "locations":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/location/SimpleLocation;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 949
    const v0, 0x7f0c00e9

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->notifyUser(I)V

    .line 957
    :goto_0
    return-void

    .line 951
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/location/SimpleLocation;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/location/SimpleLocation;->latLng()Lcom/google/android/gms/maps/model/LatLng;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLng(Lcom/google/android/gms/maps/model/LatLng;)V

    .line 952
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setLatLngModified(Z)V

    .line 954
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setUpMapIfNeeded()V

    .line 955
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getRequestTypes(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method protected setAddressString(Ljava/lang/String;)V
    .locals 1
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 1294
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->addressEditText:Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;

    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/views/EditTextWithBackDetect;->setText(Ljava/lang/CharSequence;)V

    .line 1295
    return-void
.end method

.method protected setRequestTypeByView(Landroid/view/View;Landroid/widget/AdapterView;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1650
    .local p2, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categorySpinnerList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    .line 1651
    .local v3, "spinner":Landroid/widget/Spinner;
    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1652
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setSelection(I)V

    goto :goto_0

    .line 1656
    .end local v3    # "spinner":Landroid/widget/Spinner;
    :cond_1
    invoke-virtual {p2}, Landroid/widget/AdapterView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1658
    .local v2, "selectedArea":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 1659
    .local v1, "requestType":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v2, v4}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setReport(Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 1660
    invoke-virtual {p2}, Landroid/widget/AdapterView;->getSelectedItemPosition()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->setSelectedPosition(I)V

    .line 1662
    invoke-direct {p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setRequestType(Lcom/seeclickfix/ma/android/objects/report/RequestType;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V

    .line 1664
    return-void
.end method

.method protected shouldShowDialog(Ljava/lang/String;)Z
    .locals 3
    .param p1, "prefName"    # Ljava/lang/String;

    .prologue
    .line 1794
    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/alostpacket/pajamalib/utils/PrefsUtil;->getBoolean(Ljava/lang/String;ZLandroid/content/Context;)Z

    move-result v0

    .line 1795
    .local v0, "shouldShow":Z
    return v0
.end method

.method protected showDescriptionAndSummary()V
    .locals 9

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x0

    .line 1303
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSummary()Ljava/lang/String;

    move-result-object v5

    .line 1305
    .local v5, "summaryTxt":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 1306
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->summaryEditText:Landroid/widget/EditText;

    invoke-virtual {v6, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1310
    :cond_0
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getWatchAreas()Ljava/util/List;

    move-result-object v2

    .line 1312
    .local v2, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-static {v2}, Lcom/seeclickfix/ma/android/util/CollectionUtil;->isNotNullOrEmpty(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1313
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 1314
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v1

    .line 1316
    .local v1, "appOptions":Lcom/seeclickfix/ma/android/objects/app/AppOptions;
    iget-boolean v6, v1, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->suppressDescriptionField:Z

    invoke-static {v6, v2, v0}, Lcom/seeclickfix/ma/android/fragments/reporting/FeatureFlagHelper;->hasEnabledZone(ZLjava/util/List;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)Z

    move-result v4

    .line 1321
    .local v4, "hideDescription":Z
    if-eqz v4, :cond_2

    .line 1322
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionEditText:Landroid/widget/EditText;

    invoke-virtual {v6, v8}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1323
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionLabel:Landroid/widget/TextView;

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1337
    .end local v0    # "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    .end local v1    # "appOptions":Lcom/seeclickfix/ma/android/objects/app/AppOptions;
    .end local v4    # "hideDescription":Z
    :cond_1
    :goto_0
    return-void

    .line 1328
    :cond_2
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/Report;->getDescription()Ljava/lang/String;

    move-result-object v3

    .line 1330
    .local v3, "descrTxt":Ljava/lang/String;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionEditText:Landroid/widget/EditText;

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1331
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionLabel:Landroid/widget/TextView;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1333
    if-eqz v3, :cond_1

    .line 1334
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->descriptionEditText:Landroid/widget/EditText;

    invoke-virtual {v6, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected showFollowupQuestions(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;)V
    .locals 11
    .param p2, "watchArea"    # Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/Question;",
            ">;",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/Question;>;"
    const/4 v10, 0x0

    .line 1219
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showFollowupRow(Z)V

    .line 1221
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v9, 0x7f0a0100

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 1222
    .local v2, "followupContainer":Landroid/view/ViewGroup;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v9, 0x7f0a00fa

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1223
    .local v0, "followupBody":Landroid/widget/TextView;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v9, 0x7f0a00fb

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1225
    .local v1, "followupBody2":Landroid/widget/TextView;
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1227
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getRequestTypes()Ljava/util/List;

    move-result-object v8

    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getSelectedPosition()I

    move-result v9

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/seeclickfix/ma/android/objects/report/RequestType;

    .line 1229
    .local v6, "rt":Lcom/seeclickfix/ma/android/objects/report/RequestType;
    invoke-virtual {p2}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getTitle()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1230
    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/objects/report/RequestType;->getTitle()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1231
    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1232
    invoke-virtual {v1, v10}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1233
    invoke-virtual {v0}, Landroid/widget/TextView;->invalidate()V

    .line 1234
    invoke-virtual {v0}, Landroid/widget/TextView;->requestLayout()V

    .line 1235
    invoke-virtual {v1}, Landroid/widget/TextView;->invalidate()V

    .line 1236
    invoke-virtual {v1}, Landroid/widget/TextView;->requestLayout()V

    .line 1238
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/seeclickfix/ma/android/objects/report/Question;

    .line 1241
    .local v4, "question":Lcom/seeclickfix/ma/android/objects/report/Question;
    invoke-virtual {v4}, Lcom/seeclickfix/ma/android/objects/report/Question;->getQuestionType()Ljava/lang/String;

    move-result-object v7

    .line 1242
    .local v7, "type":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v8

    invoke-static {v4, v2, v8}, Lcom/seeclickfix/ma/android/views/questions/QuestionFactory;->getQuestionWidget(Lcom/seeclickfix/ma/android/objects/report/Question;Landroid/view/ViewGroup;Landroid/support/v4/app/FragmentActivity;)Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;

    move-result-object v5

    .line 1246
    .local v5, "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    if-eqz v5, :cond_0

    .line 1247
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->questionCallback:Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;

    invoke-interface {v5, v8}, Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;->setOnAnswerCallback(Lcom/seeclickfix/ma/android/views/questions/QuestionInterface$OnAnswerSetCallback;)V

    goto :goto_0

    .line 1252
    .end local v4    # "question":Lcom/seeclickfix/ma/android/objects/report/Question;
    .end local v5    # "questionWidget":Lcom/seeclickfix/ma/android/views/questions/QuestionInterface;
    .end local v7    # "type":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showDescriptionAndSummary()V

    .line 1254
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showSubmitButtonRow()V

    .line 1256
    return-void
.end method

.method protected showFollowupRow(Z)V
    .locals 7
    .param p1, "showSpinner"    # Z

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x0

    .line 1346
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->followupRow:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1348
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a0100

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 1349
    .local v2, "followupContainer":Landroid/view/ViewGroup;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00fa

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1350
    .local v0, "followupBody":Landroid/widget/TextView;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->rootFrag:Landroid/view/ViewGroup;

    const v4, 0x7f0a00fb

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1352
    .local v1, "followupBody2":Landroid/widget/TextView;
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 1354
    if-eqz p1, :cond_0

    .line 1355
    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1356
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1357
    invoke-static {v2}, Lcom/seeclickfix/ma/android/views/ProgressWheelFactory;->addPorgreesWheel(Landroid/view/ViewGroup;)V

    .line 1362
    :goto_0
    invoke-virtual {v2}, Landroid/view/ViewGroup;->invalidate()V

    .line 1363
    invoke-virtual {v2}, Landroid/view/ViewGroup;->requestLayout()V

    .line 1365
    return-void

    .line 1359
    :cond_0
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method protected showGeocodedAddress(Landroid/location/Address;)V
    .locals 2
    .param p1, "address"    # Landroid/location/Address;

    .prologue
    .line 1278
    if-nez p1, :cond_0

    .line 1290
    :goto_0
    return-void

    .line 1282
    :cond_0
    invoke-static {p1}, Lcom/seeclickfix/ma/android/location/AddressLocalizer;->getAddressString(Landroid/location/Address;)Ljava/lang/String;

    move-result-object v0

    .line 1285
    .local v0, "addrString":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mAddressIsGenerated:Z

    if-nez v1, :cond_1

    .line 1286
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1, v0}, Lcom/seeclickfix/ma/android/objects/report/Report;->setAddress(Ljava/lang/String;)V

    .line 1289
    :cond_1
    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->setAddressString(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected showMapFrag()V
    .locals 4

    .prologue
    .line 1783
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v2, :cond_0

    .line 1784
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    invoke-virtual {v3}, Lcom/google/android/gms/maps/GoogleMap;->getCameraPosition()Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/seeclickfix/ma/android/objects/report/Report;->setCamPosition(Lcom/google/android/gms/maps/model/CameraPosition;)V

    .line 1787
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/ReportMapLaunchActivity;

    .line 1789
    .local v0, "reportMapLauncherActivity":Lcom/seeclickfix/ma/android/fragments/interfaces/ReportMapLaunchActivity;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-static {v2, v3}, Lcom/seeclickfix/ma/android/objects/PageParamsFactory;->getReportParamsWithParcel(Landroid/content/Context;Landroid/os/Parcelable;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    .line 1790
    .local v1, "returnPageParams":Lcom/seeclickfix/ma/android/objects/PageParams;
    invoke-interface {v0, p0, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/ReportMapLaunchActivity;->launchReportMap(Lcom/seeclickfix/ma/android/fragments/interfaces/OnReportLocationListener;Lcom/seeclickfix/ma/android/objects/PageParams;)V

    .line 1791
    return-void
.end method

.method protected showSubmitButtonRow()V
    .locals 0

    .prologue
    .line 1343
    return-void
.end method

.method protected showView(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1298
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 1299
    return-void
.end method

.method protected showZones(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    const/4 v7, 0x1

    .line 1041
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->handleAlertMessage(Ljava/util/List;)V

    .line 1044
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->showCategoryRow()V

    .line 1045
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categoryRow:Landroid/view/ViewGroup;

    const v9, 0x7f0a00f7

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 1046
    .local v3, "categoryContainer":Landroid/widget/LinearLayout;
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 1047
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->categorySpinnerList:Ljava/util/List;

    .line 1049
    if-nez p1, :cond_0

    .line 1050
    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1053
    .restart local p1    # "areas":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;>;"
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->getAppContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 1055
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mNonDedicatedReqTypes:Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;

    invoke-virtual {v8, p1, v0}, Lcom/seeclickfix/ma/android/fragments/reporting/NonDedicatedReqTypes;->filterIfNeeded(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/DedicatedApp;)Ljava/util/List;

    move-result-object p1

    .line 1057
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->mDefaultOtherZone:Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;

    iget-object v9, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8, p1, v9}, Lcom/seeclickfix/ma/android/fragments/reporting/DefaultOtherZone;->addOtherIfNeeded(Ljava/util/List;Lcom/seeclickfix/ma/android/objects/report/Report;)V

    .line 1059
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8, p1}, Lcom/seeclickfix/ma/android/objects/report/Report;->setWatchAreas(Ljava/util/List;)V

    .line 1061
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_1

    .line 1062
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hideCategoryRow()V

    .line 1065
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1066
    .local v1, "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->isDefault()Z

    move-result v2

    .line 1067
    .local v2, "areaIsDefault":Z
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v8

    if-ne v8, v7, :cond_3

    if-eqz v2, :cond_3

    move v6, v7

    .line 1069
    .local v6, "isDefaultAreaOnly":Z
    :goto_1
    if-eqz v6, :cond_2

    .line 1070
    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v9

    invoke-virtual {v8, v9}, Lcom/seeclickfix/ma/android/objects/report/Report;->setSelectedWatchAreaApiId(I)V

    .line 1073
    :cond_2
    invoke-direct {p0, v1, v3, v6}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->displayWatchArea(Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;Landroid/view/ViewGroup;Z)V

    goto :goto_0

    .line 1067
    .end local v6    # "isDefaultAreaOnly":Z
    :cond_3
    const/4 v6, 0x0

    goto :goto_1

    .line 1081
    .end local v1    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    .end local v2    # "areaIsDefault":Z
    :cond_4
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSelectedWatchAreaApiId()I

    move-result v7

    if-nez v7, :cond_5

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->getLatLngModified()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 1082
    :cond_5
    const/4 v4, 0x0

    .line 1084
    .local v4, "hasMatchingWatchArea":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;

    .line 1085
    .restart local v1    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;->getId()I

    move-result v7

    iget-object v8, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v8}, Lcom/seeclickfix/ma/android/objects/report/Report;->getSelectedWatchAreaApiId()I

    move-result v8

    if-ne v7, v8, :cond_6

    .line 1089
    const/4 v4, 0x1

    .line 1095
    .end local v1    # "area":Lcom/seeclickfix/ma/android/objects/report/RequestWatchArea;
    :cond_7
    if-nez v4, :cond_8

    .line 1097
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->hideFollowupRow()V

    .line 1098
    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/ReportFragment;->report:Lcom/seeclickfix/ma/android/objects/report/Report;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/report/Report;->clearWatchAreaAndReqTypes()V

    .line 1107
    .end local v4    # "hasMatchingWatchArea":Z
    :cond_8
    return-void
.end method
