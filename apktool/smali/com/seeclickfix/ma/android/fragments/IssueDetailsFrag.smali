.class public Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;
.super Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.source "IssueDetailsFrag.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "IssueDetailsFrag"


# instance fields
.field private addCommentBtn:Landroid/widget/Button;

.field private authAction:Ljava/lang/String;

.field private commentCameraBtn:Landroid/widget/ImageButton;

.field private commentEditText:Landroid/widget/EditText;

.field private commentGalleryBtn:Landroid/widget/ImageButton;

.field private commentList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
            ">;"
        }
    .end annotation
.end field

.field private commentThumbContainer:Landroid/view/ViewGroup;

.field private commentThumbnail:Landroid/widget/ImageView;

.field private commentsBtn:Landroid/widget/CheckBox;

.field private commentsContainer:Landroid/view/ViewGroup;

.field commentsListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private currentUser:Lcom/seeclickfix/ma/android/objects/user/AuthUser;

.field private dateText:Landroid/widget/TextView;

.field private delayedCommentscroll:Z

.field private descriptionText:Landroid/widget/TextView;

.field private doneListener:Landroid/widget/TextView$OnEditorActionListener;

.field errorListener:Lcom/android/volley/Response$ErrorListener;

.field errorSingleIssueListener:Lcom/android/volley/Response$ErrorListener;

.field private flagBtn:Landroid/widget/CheckBox;

.field private getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;

.field getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private imageIntent:Landroid/content/Intent;

.field private issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

.field private issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

.field private issueId:I

.field private issueIdText:Landroid/widget/TextView;

.field private issueImageView:Landroid/widget/ImageView;

.field private locationText:Landroid/widget/TextView;

.field private mCurrentPhotoPath:Ljava/lang/String;

.field private mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

.field private mMap:Lcom/google/android/gms/maps/GoogleMap;

.field private mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

.field private mParamsMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mapButton:Landroid/view/View;

.field private mapContainer:Landroid/view/ViewGroup;

.field mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation
.end field

.field private mediaClearButton:Landroid/widget/Button;

.field private mediaEditButton:Landroid/widget/Button;

.field private mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

.field private onClickListener:Landroid/view/View$OnClickListener;

.field private returnPageParams:Lcom/seeclickfix/ma/android/objects/PageParams;

.field private setPicOnResume:Z

.field singleIssueLoadListener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field

.field private spinnerAdapter:Lcom/seeclickfix/ma/android/adapters/StatusSpinnerAdapter;

.field private spinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private starCheckbox:Landroid/widget/CheckBox;

.field private statusSpinner:Landroid/widget/Spinner;

.field private final statusSpinnerFactory:Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

.field private statusTextView:Landroid/widget/TextView;

.field private summaryText:Landroid/widget/TextView;

.field private userText:Landroid/widget/TextView;

.field private votesBtn:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;-><init>()V

    .line 161
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->delayedCommentscroll:Z

    .line 183
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentList:Ljava/util/List;

    .line 207
    const/4 v0, -0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueId:I

    .line 218
    new-instance v0, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->statusSpinnerFactory:Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

    .line 222
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mParamsMap:Ljava/util/HashMap;

    .line 457
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$1;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->singleIssueLoadListener:Lcom/android/volley/Response$Listener;

    .line 482
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$2;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$2;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->errorSingleIssueListener:Lcom/android/volley/Response$ErrorListener;

    .line 884
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$5;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$5;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsListener:Lcom/android/volley/Response$Listener;

    .line 901
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$6;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$6;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 1072
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$8;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->spinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-void
.end method

.method static synthetic access$000(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    return-object v0
.end method

.method static synthetic access$002(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    return-object p1
.end method

.method static synthetic access$100(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setupContent()V

    return-void
.end method

.method static synthetic access$200(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    .prologue
    .line 140
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 0
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;
    .param p1, "x1"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 140
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    return-void
.end method

.method static synthetic access$600(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    return-object v0
.end method

.method static synthetic access$700(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->starCheckbox:Landroid/widget/CheckBox;

    return-object v0
.end method

.method private attachClickListeners()V
    .locals 2

    .prologue
    .line 529
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 530
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->flagBtn:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 531
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->addCommentBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 532
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsBtn:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 534
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentCameraBtn:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 535
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentGalleryBtn:Landroid/widget/ImageButton;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 538
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaEditButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 539
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaClearButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 541
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->starCheckbox:Landroid/widget/CheckBox;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 542
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mapButton:Landroid/view/View;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 545
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->doneListener:Landroid/widget/TextView$OnEditorActionListener;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 546
    return-void
.end method

.method private authAndExecute(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 1
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 1113
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/AuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1114
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->executeAction()V

    .line 1118
    :goto_0
    return-void

    .line 1116
    :cond_0
    invoke-direct {p0, p1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->launchLoginFrag(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V

    goto :goto_0
.end method

.method private decodeLocalBitmap(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 861
    new-instance v0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;-><init>()V

    .line 863
    .local v0, "mediaCaptureBuilder":Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    invoke-virtual {v0, p2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imageView(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 864
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->activity(Landroid/app/Activity;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 865
    invoke-virtual {v0, p1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->photoPath(Ljava/lang/String;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 867
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->build()Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    move-result-object v1

    .line 869
    .local v1, "mediaHelper":Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->setPic()V

    .line 870
    return-void
.end method

.method private displayContent()V
    .locals 15

    .prologue
    .line 690
    const v10, 0x7f0c0063

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v13}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {p0, v10, v11}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 691
    .local v9, "summaryString":Ljava/lang/String;
    const v10, 0x7f0c005b

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v13}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getDescription()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {p0, v10, v11}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 692
    .local v1, "descriptionString":Ljava/lang/String;
    const v10, 0x7f0c005e

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    iget-object v13, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v13}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getAddress()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {p0, v10, v11}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 694
    .local v2, "locationString":Ljava/lang/String;
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->descriptionText:Landroid/widget/TextView;

    invoke-virtual {v10, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 695
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->locationText:Landroid/widget/TextView;

    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 697
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->summaryText:Landroid/widget/TextView;

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 698
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueIdText:Landroid/widget/TextView;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {p0, v11}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getDisplayID(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 699
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->userText:Landroid/widget/TextView;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v11}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getReporterDisplay()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 701
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->dateText:Landroid/widget/TextView;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v11}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCreatedAtEpoch()J

    move-result-wide v12

    invoke-static {v12, v13}, Lcom/seeclickfix/ma/android/date/DateUtil;->getDateDisplayStringFromMSEpoch(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 704
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateDisplayStrings()Ljava/util/List;

    move-result-object v4

    .line 705
    .local v4, "statusDisplayList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusStateKeys()Ljava/util/List;

    move-result-object v7

    .line 707
    .local v7, "statusStateList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    .line 709
    .local v5, "statusPosition":I
    if-ltz v5, :cond_0

    .line 710
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 712
    .local v8, "statusString":Ljava/lang/String;
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->statusTextView:Landroid/widget/TextView;

    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 713
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->statusTextView:Landroid/widget/TextView;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v11}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getForeground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 719
    .end local v8    # "statusString":Ljava/lang/String;
    :cond_0
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {p0, v10}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->renderVotesButton(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 720
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {p0, v10}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->renderCommentsButton(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 723
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v11}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->getBackground(Ljava/lang/String;Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 725
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLocalImagePath()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_1

    .line 726
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 727
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 728
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 729
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLocalImagePath()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    invoke-direct {p0, v10, v11}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->decodeLocalBitmap(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 733
    :cond_1
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    invoke-virtual {v10}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    if-eqz v10, :cond_4

    .line 761
    :goto_0
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->isFollowing()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 762
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v10

    const v11, 0x7f0a0087

    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 763
    .local v0, "ckBox":Landroid/widget/CheckBox;
    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 764
    const/4 v10, 0x0

    invoke-virtual {v0, v10}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 767
    .end local v0    # "ckBox":Landroid/widget/CheckBox;
    :cond_2
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setUpMapIfNeeded()V

    .line 769
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v10

    const v11, 0x7f0a008e

    invoke-virtual {v10, v11}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 770
    .local v3, "spinnerContainer":Landroid/view/ViewGroup;
    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 772
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->statusSpinnerFactory:Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    iget-object v12, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    invoke-virtual {v12}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->closedIsFinal()Z

    move-result v12

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v13

    invoke-virtual {v10, v11, v12, v13}, Lcom/seeclickfix/ma/android/dialogs/StatusSpinnerFactory;->buildSpinner(Lcom/seeclickfix/ma/android/objects/issue/Issue;ZLandroid/content/Context;)Landroid/widget/Spinner;

    move-result-object v6

    .line 773
    .local v6, "statusSpinner":Landroid/widget/Spinner;
    if-eqz v6, :cond_3

    .line 774
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->spinnerClickListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v6, v10}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 775
    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 778
    :cond_3
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->hideCommentControlsIfArchived()V

    .line 780
    return-void

    .line 737
    .end local v3    # "spinnerContainer":Landroid/view/ViewGroup;
    .end local v6    # "statusSpinner":Landroid/widget/Spinner;
    :cond_4
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_5

    .line 738
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 739
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 740
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 741
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getPhotoSmallUrl()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    invoke-direct {p0, v10, v11}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 742
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 743
    :cond_5
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_7

    .line 744
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "no-image"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 745
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 746
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 747
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const v11, 0x7f020150

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 748
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0

    .line 750
    :cond_6
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 751
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 752
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v10}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCategoryIcon()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    invoke-direct {p0, v10, v11}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->loadIcon(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 753
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0

    .line 757
    :cond_7
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 758
    iget-object v10, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0
.end method

.method private enableCommentButton()V
    .locals 4

    .prologue
    .line 1175
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v2

    const v3, 0x7f0a009f

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1176
    .local v0, "btn":Landroid/view/View;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 1177
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1178
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v2

    const v3, 0x7f0a009a

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    .line 1179
    .local v1, "pb":Landroid/widget/ProgressBar;
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1180
    return-void
.end method

.method private getDisplayID(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Ljava/lang/String;
    .locals 9
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    const/4 v8, 0x0

    .line 658
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/seeclickfix/ma/android/config/DedicatedAppManager;->getDedicatedApp(Landroid/content/Context;)Lcom/seeclickfix/ma/android/objects/DedicatedApp;

    move-result-object v0

    .line 660
    .local v0, "app":Lcom/seeclickfix/ma/android/objects/DedicatedApp;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    .line 662
    .local v5, "scfId":Ljava/lang/String;
    const v6, 0x7f0c005d

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v5, v7, v8

    invoke-virtual {p0, v6, v7}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 664
    .local v1, "idString":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getIsDedicatedApp()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/DedicatedApp;->getOptions()Lcom/seeclickfix/ma/android/objects/app/AppOptions;

    move-result-object v6

    iget-boolean v6, v6, Lcom/seeclickfix/ma/android/objects/app/AppOptions;->showIntegrationId:Z

    if-eqz v6, :cond_0

    .line 666
    :try_start_0
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getIntegrationIssues()Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 668
    .local v2, "intIdsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 669
    .local v3, "integrationId":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 671
    .local v4, "integrationTitle":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 684
    .end local v2    # "intIdsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "integrationId":Ljava/lang/String;
    .end local v4    # "integrationTitle":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v1

    .line 672
    :catch_0
    move-exception v6

    goto :goto_0
.end method

.method private getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 643
    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/map/MapOptionsFactory;->getStandardOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v0

    .line 644
    .local v0, "options":Lcom/google/android/gms/maps/GoogleMapOptions;
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 645
    invoke-virtual {v0, v1}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    .line 647
    return-object v0
.end method

.method private handleAction(Ljava/lang/String;)V
    .locals 1
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 651
    const-string/jumbo v0, "com.seeclickfix.actions.COMMENT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 652
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->delayedCommentscroll:Z

    .line 654
    :cond_0
    return-void
.end method

.method private hideCommentControls()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x8

    .line 825
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v4

    const v5, 0x7f0a008b

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 826
    .local v1, "commentDisplayBtn":Landroid/widget/Button;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v4

    const v5, 0x7f0a0095

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 827
    .local v2, "commentLabel":Landroid/view/View;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v4

    const v5, 0x7f0a009b

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 828
    .local v3, "editText":Landroid/view/View;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v4

    const v5, 0x7f0a009c

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 829
    .local v0, "btnContainer":Landroid/view/View;
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->addCommentBtn:Landroid/widget/Button;

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 830
    invoke-virtual {v1, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 832
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 833
    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->addCommentBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 834
    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 835
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 836
    return-void
.end method

.method private hideCommentControlsIfArchived()V
    .locals 2

    .prologue
    .line 816
    const-string/jumbo v0, "Archived"

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 819
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->hideCommentControls()V

    .line 822
    :cond_0
    return-void
.end method

.method private initMap()V
    .locals 3

    .prologue
    .line 638
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mapHelper:Lcom/seeclickfix/ma/android/fragments/map/MapHelper;

    const v1, 0x7f0a0090

    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getMapOptions()Lcom/google/android/gms/maps/GoogleMapOptions;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/map/MapHelper;->initMap(Landroid/support/v4/app/Fragment;ILcom/google/android/gms/maps/GoogleMapOptions;)Lcom/google/android/gms/maps/SupportMapFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    .line 639
    return-void
.end method

.method private launchLoginFrag(Lcom/seeclickfix/ma/android/objects/issue/Comment;)V
    .locals 2
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .prologue
    .line 1122
    new-instance v0, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {p1, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getIssueDetailsParams(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/seeclickfix/ma/android/events/AuthRequiredEvent;-><init>(Lcom/seeclickfix/ma/android/objects/PageParams;)V

    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->postEvent(Ljava/lang/Object;)V

    .line 1123
    return-void
.end method

.method private loadComments(I)V
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 877
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 878
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsListener:Lcom/android/volley/Response$Listener;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->errorListener:Lcom/android/volley/Response$ErrorListener;

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;-><init>(Landroid/content/Context;ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;

    .line 879
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->execute()V

    .line 881
    return-void
.end method

.method private loadIcon(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imgView"    # Landroid/widget/ImageView;

    .prologue
    const/16 v4, 0x60

    .line 1209
    if-eqz p1, :cond_0

    const-string/jumbo v1, "null"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1226
    :cond_0
    :goto_0
    return-void

    .line 1212
    :cond_1
    const-string/jumbo v1, "http://"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1213
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "http://seeclickfix.com"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .end local p1    # "url":Ljava/lang/String;
    .local v0, "url":Ljava/lang/String;
    move-object p1, v0

    .line 1217
    .end local v0    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    const v2, 0x7f020158

    const v3, 0x7f020150

    invoke-static {p2, v2, v3}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v2

    invoke-virtual {v1, p1, v2, v4, v4}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto :goto_0
.end method

.method private loadImage(Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "imgView"    # Landroid/widget/ImageView;

    .prologue
    .line 1186
    if-eqz p1, :cond_0

    const-string/jumbo v1, "null"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1204
    :cond_0
    :goto_0
    return-void

    .line 1189
    :cond_1
    const-string/jumbo v1, "http://"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1190
    new-instance v0, Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "http://seeclickfix.com"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .end local p1    # "url":Ljava/lang/String;
    .local v0, "url":Ljava/lang/String;
    move-object p1, v0

    .line 1194
    .end local v0    # "url":Ljava/lang/String;
    .restart local p1    # "url":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    const v2, 0x7f020158

    const v3, 0x7f020150

    invoke-static {p2, v2, v3}, Lcom/android/volley/toolbox/ImageLoader;->getImageListener(Landroid/widget/ImageView;II)Lcom/android/volley/toolbox/ImageLoader$ImageListener;

    move-result-object v2

    const/16 v3, 0x2a8

    const/16 v4, 0x12c

    invoke-virtual {v1, p1, v2, v3, v4}, Lcom/android/volley/toolbox/ImageLoader;->get(Ljava/lang/String;Lcom/android/volley/toolbox/ImageLoader$ImageListener;II)Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

    goto :goto_0
.end method

.method private loadIssue()V
    .locals 5

    .prologue
    .line 393
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    .line 395
    .local v1, "args":Landroid/os/Bundle;
    const-string/jumbo v3, "issue_bundle"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 396
    .local v2, "passedIssue":Lcom/seeclickfix/ma/android/objects/issue/Issue;
    const-string/jumbo v3, "action_extra"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 398
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v3, "ISSUES"

    invoke-static {v3}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->getInstance(Ljava/lang/String;)Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    move-result-object v3

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    .line 403
    if-eqz v0, :cond_0

    .line 404
    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->handleAction(Ljava/lang/String;)V

    .line 407
    :cond_0
    if-nez v2, :cond_2

    .line 408
    const-string/jumbo v3, "issue_id"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueId:I

    .line 410
    const-string/jumbo v3, "url_params_map"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mParamsMap:Ljava/util/HashMap;

    .line 411
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mParamsMap:Ljava/util/HashMap;

    if-nez v3, :cond_1

    .line 412
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mParamsMap:Ljava/util/HashMap;

    .line 419
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    iget v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueId:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    iput-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 421
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    if-nez v3, :cond_3

    .line 425
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->loadSingleIssue()V

    .line 430
    :goto_1
    return-void

    .line 415
    :cond_2
    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v3

    iput v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueId:I

    goto :goto_0

    .line 428
    :cond_3
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setupContent()V

    goto :goto_1
.end method

.method private loadSingleIssue()V
    .locals 6

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f0a007f

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 356
    .local v0, "loadingView":Landroid/view/View;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 358
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->setSupportProgressBarIndeterminateVisibility(Z)V

    .line 360
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueId:I

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->singleIssueLoadListener:Lcom/android/volley/Response$Listener;

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->errorSingleIssueListener:Lcom/android/volley/Response$ErrorListener;

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mParamsMap:Ljava/util/HashMap;

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->execute(ILcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/util/Map;)V

    .line 364
    return-void
.end method

.method private putPhotoInBundle()V
    .locals 3

    .prologue
    .line 301
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "comment_image_path_extra"

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    return-void
.end method

.method private renderCommentsButton(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 4
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 801
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    const-string/jumbo v3, "com.seeclickfix.actions.COMMENT"

    invoke-virtual {v2, v3, p1}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->isActionableIssue(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z

    move-result v0

    .line 802
    .local v0, "actionable":Z
    if-eqz v0, :cond_1

    const v1, -0xbbbbbc

    .line 804
    .local v1, "textColor":I
    :goto_0
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsBtn:Landroid/widget/CheckBox;

    invoke-virtual {v2, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 805
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsBtn:Landroid/widget/CheckBox;

    invoke-virtual {v2, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 806
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsBtn:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCommentCountExcludingActivity()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 807
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsBtn:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->refreshDrawableState()V

    .line 809
    if-nez v0, :cond_0

    .line 810
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->hideCommentControls()V

    .line 813
    :cond_0
    return-void

    .line 802
    .end local v1    # "textColor":I
    :cond_1
    const v1, -0x333334

    goto :goto_0
.end method

.method private renderVotesButton(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 5
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 784
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    const-string/jumbo v4, "com.seeclickfix.actions.VOTE"

    invoke-virtual {v3, v4, p1}, Lcom/seeclickfix/ma/android/auth/PermissionsManager;->isActionableIssue(Ljava/lang/String;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z

    move-result v0

    .line 785
    .local v0, "actionable":Z
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->isVotedBefore()Z

    move-result v2

    .line 787
    .local v2, "voted":Z
    if-eqz v0, :cond_0

    const v1, -0xbbbbbc

    .line 789
    .local v1, "textColor":I
    :goto_0
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    invoke-virtual {v3, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 790
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    invoke-virtual {v3, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 791
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    invoke-virtual {v3, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 793
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getRating()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 795
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->refreshDrawableState()V

    .line 797
    return-void

    .line 787
    .end local v1    # "textColor":I
    :cond_0
    const v1, -0x333334

    goto :goto_0
.end method

.method private resetAddCommentViews()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 1312
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->enableCommentButton()V

    .line 1314
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v2

    const v3, 0x7f0a009c

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 1315
    .local v1, "mediaBtnsContainer":Landroid/view/ViewGroup;
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1316
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1318
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1319
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 1321
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    if-eqz v2, :cond_0

    .line 1322
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->hidePic()V

    .line 1324
    :cond_0
    iput-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    .line 1325
    iput-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->imageIntent:Landroid/content/Intent;

    .line 1327
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v2

    const v3, 0x7f0a0095

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1329
    .local v0, "addCommentLabel":Landroid/widget/TextView;
    const v2, 0x7f0c0054

    invoke-virtual {p0, v2}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1330
    return-void
.end method

.method private runMediaCaptureHelper()V
    .locals 3

    .prologue
    .line 839
    new-instance v0, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;-><init>()V

    .line 842
    .local v0, "builder":Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->activity(Landroid/app/Activity;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 843
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentThumbnail:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imageView(Landroid/widget/ImageView;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 844
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->imageIntent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->imgIntent(Landroid/content/Intent;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 846
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentThumbContainer:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->viewToShow(Landroid/view/View;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 847
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->photoPath(Ljava/lang/String;)Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;

    .line 849
    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper$Builder;->build()Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .line 852
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->imageIntent:Landroid/content/Intent;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 853
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->imageIntent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->getPathFromtIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    .line 856
    :cond_0
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->setPic()V

    .line 857
    return-void
.end method

.method private scrollToBottom()V
    .locals 4

    .prologue
    .line 1046
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 1048
    .local v0, "sv":Landroid/widget/ScrollView;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 1050
    .local v1, "svChild":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    .line 1052
    .local v2, "vto":Landroid/view/ViewTreeObserver;
    new-instance v3, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$7;

    invoke-direct {v3, p0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$7;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;Landroid/view/ViewGroup;)V

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1064
    return-void
.end method

.method private setMarkerAndAnimate()V
    .locals 8

    .prologue
    .line 1254
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/seeclickfix/ma/android/views/ColorMarkers;->getDotByStatus(Ljava/lang/String;Landroid/content/Context;)Lcom/google/android/gms/maps/model/BitmapDescriptor;

    move-result-object v1

    .line 1256
    .local v1, "iconDescriptor":Lcom/google/android/gms/maps/model/BitmapDescriptor;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 1257
    new-instance v2, Lcom/google/android/gms/maps/model/LatLng;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLat()D

    move-result-wide v4

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getLng()D

    move-result-wide v6

    invoke-direct {v2, v4, v5, v6, v7}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 1258
    .local v2, "latlng":Lcom/google/android/gms/maps/model/LatLng;
    const/high16 v3, 0x41700000    # 15.0f

    invoke-static {v2, v3}, Lcom/google/android/gms/maps/CameraUpdateFactory;->newLatLngZoom(Lcom/google/android/gms/maps/model/LatLng;F)Lcom/google/android/gms/maps/CameraUpdate;

    move-result-object v0

    .line 1259
    .local v0, "camUpdate":Lcom/google/android/gms/maps/CameraUpdate;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/16 v4, 0x1f4

    const/4 v5, 0x0

    invoke-virtual {v3, v0, v4, v5}, Lcom/google/android/gms/maps/GoogleMap;->animateCamera(Lcom/google/android/gms/maps/CameraUpdate;ILcom/google/android/gms/maps/GoogleMap$CancelableCallback;)V

    .line 1261
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->setMyLocationEnabled(Z)V

    .line 1262
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    new-instance v4, Lcom/google/android/gms/maps/model/MarkerOptions;

    invoke-direct {v4}, Lcom/google/android/gms/maps/model/MarkerOptions;-><init>()V

    invoke-virtual {v4, v2}, Lcom/google/android/gms/maps/model/MarkerOptions;->position(Lcom/google/android/gms/maps/model/LatLng;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v4

    iget-object v5, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v5}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getSummary()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/gms/maps/model/MarkerOptions;->title(Ljava/lang/String;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/google/android/gms/maps/model/MarkerOptions;->icon(Lcom/google/android/gms/maps/model/BitmapDescriptor;)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v4

    const v5, 0x3ea8f5c3    # 0.33f

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/maps/model/MarkerOptions;->anchor(FF)Lcom/google/android/gms/maps/model/MarkerOptions;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/maps/GoogleMap;->addMarker(Lcom/google/android/gms/maps/model/MarkerOptions;)Lcom/google/android/gms/maps/model/Marker;

    .line 1269
    return-void
.end method

.method private setReferences()V
    .locals 2

    .prologue
    .line 496
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0089

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->descriptionText:Landroid/widget/TextView;

    .line 497
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0091

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->locationText:Landroid/widget/TextView;

    .line 498
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0086

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->statusTextView:Landroid/widget/TextView;

    .line 499
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a008b

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsBtn:Landroid/widget/CheckBox;

    .line 500
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0088

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->summaryText:Landroid/widget/TextView;

    .line 501
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0084

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->dateText:Landroid/widget/TextView;

    .line 502
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0083

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->userText:Landroid/widget/TextView;

    .line 503
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a00a0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueIdText:Landroid/widget/TextView;

    .line 504
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a008c

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->votesBtn:Landroid/widget/CheckBox;

    .line 505
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a008d

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->flagBtn:Landroid/widget/CheckBox;

    .line 506
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0087

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->starCheckbox:Landroid/widget/CheckBox;

    .line 508
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a009f

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->addCommentBtn:Landroid/widget/Button;

    .line 510
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0093

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsContainer:Landroid/view/ViewGroup;

    .line 511
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0085

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueImageView:Landroid/widget/ImageView;

    .line 512
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a009b

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    .line 513
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a009d

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentCameraBtn:Landroid/widget/ImageButton;

    .line 514
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a009e

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentGalleryBtn:Landroid/widget/ImageButton;

    .line 516
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0097

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentThumbnail:Landroid/widget/ImageView;

    .line 517
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0096

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentThumbContainer:Landroid/view/ViewGroup;

    .line 519
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0098

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaEditButton:Landroid/widget/Button;

    .line 520
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0099

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaClearButton:Landroid/widget/Button;

    .line 522
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a008f

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mapButton:Landroid/view/View;

    .line 523
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    const v1, 0x7f0a0090

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mapContainer:Landroid/view/ViewGroup;

    .line 525
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mapContainer:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 526
    return-void
.end method

.method private setUpMapIfNeeded()V
    .locals 1

    .prologue
    .line 1233
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    if-nez v0, :cond_0

    .line 1234
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->initMap()V

    .line 1240
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-nez v0, :cond_2

    .line 1241
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMapFragment:Lcom/google/android/gms/maps/SupportMapFragment;

    invoke-virtual {v0}, Lcom/google/android/gms/maps/SupportMapFragment;->getMap()Lcom/google/android/gms/maps/GoogleMap;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    .line 1243
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mMap:Lcom/google/android/gms/maps/GoogleMap;

    if-eqz v0, :cond_1

    .line 1244
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setMarkerAndAnimate()V

    .line 1249
    :cond_1
    :goto_0
    return-void

    .line 1247
    :cond_2
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setMarkerAndAnimate()V

    goto :goto_0
.end method

.method private setupClickListener()V
    .locals 1

    .prologue
    .line 549
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$3;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    .line 617
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$4;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag$4;-><init>(Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;)V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->doneListener:Landroid/widget/TextView$OnEditorActionListener;

    .line 629
    return-void
.end method

.method private setupContent()V
    .locals 1

    .prologue
    .line 434
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setReferences()V

    .line 435
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setupClickListener()V

    .line 436
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->attachClickListeners()V

    .line 437
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->displayContent()V

    .line 439
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->loadComments(I)V

    .line 441
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->shouldSetPicOnResume()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 442
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->runMediaCaptureHelper()V

    .line 444
    :cond_0
    return-void
.end method

.method private setupTileOverlay()V
    .locals 0

    .prologue
    .line 1043
    return-void
.end method

.method private shouldSetPicOnResume()Z
    .locals 2

    .prologue
    .line 448
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "comment_image_path_extra"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    .line 450
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 451
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setPicOnResume:Z

    .line 453
    :cond_0
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setPicOnResume:Z

    return v0
.end method

.method private showActionResult(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V
    .locals 1
    .param p1, "notice"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .prologue
    .line 1298
    if-nez p1, :cond_0

    .line 1310
    :goto_0
    return-void

    .line 1302
    :cond_0
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1303
    invoke-virtual {p1, p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->showToast(Landroid/support/v4/app/Fragment;)V

    .line 1304
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->resetAddCommentViews()V

    goto :goto_0

    .line 1306
    :cond_1
    invoke-virtual {p1, p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->showDialog(Landroid/support/v4/app/Fragment;)V

    goto :goto_0
.end method


# virtual methods
.method protected buildComment()Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    const/16 v9, 0x8

    const/4 v8, 0x0

    .line 1127
    const-string/jumbo v6, "Archived"

    iget-object v7, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v7}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1128
    new-instance v1, Lcom/seeclickfix/ma/android/objects/issue/Nop;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {v1, v6}, Lcom/seeclickfix/ma/android/objects/issue/Nop;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 1171
    :goto_0
    return-object v1

    .line 1131
    :cond_0
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->addCommentBtn:Landroid/widget/Button;

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1133
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v6

    const v7, 0x7f0a009b

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    .line 1134
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1135
    .local v3, "commentString":Ljava/lang/String;
    new-instance v1, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {v1, v6, v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;Ljava/lang/String;)V

    .line 1137
    .local v1, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    if-eqz v6, :cond_3

    .line 1138
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    invoke-virtual {v1, v6}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->setCommentImagePath(Ljava/lang/String;)V

    .line 1146
    :cond_1
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v6

    const v7, 0x7f0a008b

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 1147
    .local v2, "commentDisplayBtn":Landroid/widget/Button;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->addCommentBtn:Landroid/widget/Button;

    invoke-virtual {v6, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1148
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1149
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->addCommentBtn:Landroid/widget/Button;

    invoke-virtual {v6, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1151
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v6

    const v7, 0x7f0a009a

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    .line 1152
    .local v5, "pb":Landroid/widget/ProgressBar;
    invoke-virtual {v5, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1154
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    if-eqz v6, :cond_2

    .line 1155
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v6}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->hidePic()V

    .line 1159
    :cond_2
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v6

    const v7, 0x7f0a009c

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 1160
    .local v4, "mediaBtnsContainer":Landroid/view/ViewGroup;
    invoke-virtual {v4, v9}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1161
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    invoke-virtual {v6, v9}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1163
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentEditText:Landroid/widget/EditText;

    invoke-virtual {v6, v8}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 1165
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v6

    const v7, 0x7f0a0095

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 1167
    .local v0, "addCommentLabel":Landroid/widget/TextView;
    const v6, 0x7f0c0055

    invoke-virtual {p0, v6}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1168
    iput-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    .line 1169
    iput-object v11, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->imageIntent:Landroid/content/Intent;

    goto/16 :goto_0

    .line 1139
    .end local v0    # "addCommentLabel":Landroid/widget/TextView;
    .end local v2    # "commentDisplayBtn":Landroid/widget/Button;
    .end local v4    # "mediaBtnsContainer":Landroid/view/ViewGroup;
    .end local v5    # "pb":Landroid/widget/ProgressBar;
    :cond_3
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-gtz v6, :cond_1

    .line 1140
    :cond_4
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f0c0056

    invoke-static {v6, v7}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredShortToast(Landroid/content/Context;I)V

    .line 1141
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->enableCommentButton()V

    .line 1142
    new-instance v1, Lcom/seeclickfix/ma/android/objects/issue/Nop;

    .end local v1    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    iget-object v6, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {v1, v6}, Lcom/seeclickfix/ma/android/objects/issue/Nop;-><init>(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    goto/16 :goto_0
.end method

.method protected clearMedia()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 937
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    if-eqz v0, :cond_0

    .line 938
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;->hidePic()V

    .line 939
    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mediaHelper:Lcom/seeclickfix/ma/android/media/MediaCaptureHelper;

    .line 942
    :cond_0
    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;

    .line 943
    return-void
.end method

.method protected doScrollToBottom()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1067
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 1068
    .local v0, "sv":Landroid/widget/ScrollView;
    invoke-virtual {v0, v3}, Landroid/widget/ScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 1069
    .local v1, "y":I
    invoke-virtual {v0, v3, v1}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 1070
    return-void
.end method

.method protected flagIssue()V
    .locals 0

    .prologue
    .line 919
    return-void
.end method

.method protected getEventReceivers()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 290
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->getEventReceivers()Ljava/util/List;

    move-result-object v0

    .line 291
    .local v0, "receivers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mPermissionsManager:Lcom/seeclickfix/ma/android/auth/PermissionsManager;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    return-object v0
.end method

.method public getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;
    .locals 1

    .prologue
    .line 225
    invoke-static {}, Lcom/seeclickfix/ma/android/MyApplication;->getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;

    move-result-object v0

    return-object v0
.end method

.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 229
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/IssueModel;->getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v0

    return-object v0
.end method

.method protected launchCamera()V
    .locals 1

    .prologue
    .line 952
    :try_start_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;

    invoke-static {p0, v0}, Lcom/seeclickfix/ma/android/media/PhotoTaker;->launchCameraWithCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Lcom/seeclickfix/ma/android/fragments/interfaces/CameraLaunchingActivity;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mCurrentPhotoPath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 956
    :goto_0
    return-void

    .line 953
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method protected launchGallery()V
    .locals 1

    .prologue
    .line 947
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;

    invoke-static {p0, v0}, Lcom/seeclickfix/ma/android/media/GalleryPicker;->launchGalleryForCallback(Lcom/seeclickfix/ma/android/fragments/interfaces/ImageCapturedCallback;Lcom/seeclickfix/ma/android/fragments/interfaces/GalleryLauncher;)V

    .line 948
    return-void
.end method

.method protected launchImageViewer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "smallImgUrl"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "subtitle"    # Ljava/lang/String;
    .param p5, "avatarUri"    # Ljava/lang/String;
    .param p6, "name"    # Ljava/lang/String;

    .prologue
    .line 922
    new-instance v1, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;

    invoke-direct {v1}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;-><init>()V

    .line 923
    .local v1, "imgParcel":Lcom/seeclickfix/ma/android/objects/media/ImageParcel;
    const-string/jumbo v2, "REMOTE_IMAGE_URL"

    invoke-virtual {v1, v2}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->setType(Ljava/lang/String;)V

    .line 924
    invoke-virtual {v1, p1}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->setUriPath(Ljava/lang/String;)V

    .line 925
    invoke-virtual {v1, p3}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->setTitle(Ljava/lang/String;)V

    .line 926
    invoke-virtual {v1, p4}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->setSubtitle(Ljava/lang/String;)V

    .line 927
    invoke-virtual {v1, p5}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->setAvatarUri(Ljava/lang/String;)V

    .line 928
    invoke-virtual {v1, p6}, Lcom/seeclickfix/ma/android/objects/media/ImageParcel;->setUsername(Ljava/lang/String;)V

    .line 930
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;

    .line 932
    .local v0, "homeActivityInterface":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    const/16 v2, 0x13

    invoke-interface {v0, v2, v1}, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;->onClickButton(ILjava/lang/Object;)V

    .line 933
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 324
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onActivityCreated(Landroid/os/Bundle;)V

    .line 326
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/MyApplication;

    .line 328
    .local v0, "myApp":Lcom/seeclickfix/ma/android/MyApplication;
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getInstance(Landroid/content/Context;)Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;

    move-result-object v1

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/net/volley/VolleyRequestQueue;->getImageLoader()Lcom/android/volley/toolbox/ImageLoader;

    move-result-object v1

    iput-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->mImageLoader:Lcom/android/volley/toolbox/ImageLoader;

    .line 333
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setHasOptionsMenu(Z)V

    .line 335
    return-void
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Lcom/actionbarsherlock/view/Menu;
    .param p2, "inflater"    # Lcom/actionbarsherlock/view/MenuInflater;

    .prologue
    .line 339
    invoke-interface {p1}, Lcom/actionbarsherlock/view/Menu;->clear()V

    .line 340
    const v0, 0x7f0e0001

    invoke-virtual {p2, v0, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 341
    invoke-super {p0, p1, p2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 342
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 234
    if-nez p2, :cond_0

    .line 236
    const/4 v0, 0x0

    .line 247
    :goto_0
    return-object v0

    .line 240
    :cond_0
    const v0, 0x7f03002b

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setRootFrag(Landroid/view/ViewGroup;)V

    .line 243
    invoke-static {p0}, Lcom/seeclickfix/ma/android/MyApplication;->inject(Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->initMap()V

    .line 247
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v0

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 0

    .prologue
    .line 260
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDestroyView()V

    .line 264
    return-void
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 307
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->delayedCommentscroll:Z

    .line 308
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onDetach()V

    .line 309
    return-void
.end method

.method public onImageCallback(Landroid/content/Intent;)V
    .locals 1
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 1288
    if-eqz p1, :cond_0

    .line 1290
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->imageIntent:Landroid/content/Intent;

    .line 1293
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setPicOnResume:Z

    .line 1295
    return-void
.end method

.method public onIssueActionEvent(Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;)V
    .locals 5
    .param p1, "event"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 369
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getComment()Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v0

    .line 370
    .local v0, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionEvent;->getIssueActionResult()Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;

    move-result-object v1

    .line 372
    .local v1, "result":Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;, "Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult<Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v0, v2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->isAssociatedWith(Lcom/seeclickfix/ma/android/objects/issue/Issue;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 373
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getReceipt()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    invoke-virtual {v0, v3, v2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 374
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueCache:Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;

    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v2, v3, v4}, Lcom/seeclickfix/ma/android/cache/IssueLruObjectCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getReceipt()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    invoke-virtual {v0, p0, v2}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->updateCard(Lcom/seeclickfix/ma/android/fragments/interfaces/IssueCard;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V

    .line 378
    :cond_0
    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/api/SCFService$RetrofitResult;->getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->showActionResult(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    .line 379
    return-void
.end method

.method public onLoginEvent(Lcom/seeclickfix/ma/android/events/LoginEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/seeclickfix/ma/android/events/LoginEvent;
    .annotation runtime Lcom/squareup/otto/Subscribe;
    .end annotation

    .prologue
    .line 384
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/events/LoginEvent;->getOnAuthCompleteParams()Lcom/seeclickfix/ma/android/objects/PageParams;

    move-result-object v0

    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->paramsToComment(Lcom/seeclickfix/ma/android/objects/PageParams;Lcom/seeclickfix/ma/android/objects/issue/Issue;)Lcom/seeclickfix/ma/android/objects/issue/Comment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->executeAction()V

    .line 385
    invoke-static {}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->getInstance()Lcom/seeclickfix/ma/android/auth/LoginStateController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/auth/LoginStateController;->clearAuthCompleteParams()V

    .line 386
    return-void
.end method

.method public onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    .line 346
    invoke-interface {p1}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0183

    if-ne v0, v1, :cond_0

    .line 347
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->shareIssue()V

    .line 348
    const/4 v0, 0x1

    .line 351
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 269
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->unSubscribeFromEventBus()V

    .line 270
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onPause()V

    .line 271
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 314
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onResume()V

    .line 316
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->loadIssue()V

    .line 317
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->processNotice()V

    .line 318
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->subscribeToEventBus()V

    .line 319
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 276
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getCommentsTask:Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetCommentsTask;->cancel()V

    .line 280
    :cond_0
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;

    if-eqz v0, :cond_1

    .line 281
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getIssueTask:Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/tasks/GetSingleIssueTask;->cancel()V

    .line 284
    :cond_1
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->putPhotoInBundle()V

    .line 285
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->onStop()V

    .line 286
    return-void
.end method

.method public processNotice()V
    .locals 2

    .prologue
    .line 252
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/seeclickfix/ma/android/IssueModel;->getNoticeIssue()I

    move-result v0

    iget v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issueId:I

    if-eq v0, v1, :cond_0

    .line 253
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getIssueModel()Lcom/seeclickfix/ma/android/IssueModel;

    move-result-object v0

    invoke-static {}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->emptyNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/seeclickfix/ma/android/IssueModel;->setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    .line 255
    :cond_0
    invoke-super {p0}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;->processNotice()V

    .line 256
    return-void
.end method

.method public recordVote(Lcom/seeclickfix/ma/android/objects/issue/Vote;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "vote"    # Lcom/seeclickfix/ma/android/objects/issue/Vote;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1363
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->updateVote()V

    .line 1364
    return-void
.end method

.method protected resetStatus()V
    .locals 4

    .prologue
    .line 1272
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusStateKeys()Ljava/util/List;

    move-result-object v1

    .line 1273
    .local v1, "statusStateList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 1277
    .local v0, "position":I
    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->statusSpinner:Landroid/widget/Spinner;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/widget/Spinner;->setSelection(IZ)V

    .line 1278
    return-void
.end method

.method public revokeVote(Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "vote"    # Lcom/seeclickfix/ma/android/objects/issue/RevokeVote;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1367
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->updateVote()V

    .line 1368
    return-void
.end method

.method public setIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V
    .locals 0
    .param p1, "issue"    # Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .prologue
    .line 1281
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    .line 1282
    return-void
.end method

.method protected shareIssue()V
    .locals 2

    .prologue
    .line 632
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/social/ShareIntentHelper;->shareIssue(Lcom/seeclickfix/ma/android/objects/issue/Issue;Landroid/content/Context;)V

    .line 633
    return-void
.end method

.method protected showComments(Ljava/util/List;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/seeclickfix/ma/android/objects/issue/Comment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 960
    .local p1, "resultList":Ljava/util/List;, "Ljava/util/List<Lcom/seeclickfix/ma/android/objects/issue/Comment;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->isDetached()Z

    move-result v16

    if-eqz v16, :cond_1

    .line 1037
    :cond_0
    :goto_0
    return-void

    .line 966
    :cond_1
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentList:Ljava/util/List;

    .line 968
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsContainer:Landroid/view/ViewGroup;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 970
    if-eqz p1, :cond_2

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v16

    if-eqz v16, :cond_3

    .line 971
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v16

    const v17, 0x7f0a0094

    invoke-virtual/range {v16 .. v17}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 973
    .local v8, "noCommentsView":Landroid/widget/TextView;
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 976
    .end local v8    # "noCommentsView":Landroid/widget/TextView;
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v16

    const v17, 0x7f0a0094

    invoke-virtual/range {v16 .. v17}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 978
    .restart local v8    # "noCommentsView":Landroid/widget/TextView;
    const/16 v16, 0x8

    move/from16 v0, v16

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 982
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/seeclickfix/ma/android/objects/issue/Comment;

    .line 983
    .local v3, "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    invoke-virtual/range {p0 .. p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v16

    const v17, 0x7f030053

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsContainer:Landroid/view/ViewGroup;

    move-object/from16 v18, v0

    invoke-static/range {v16 .. v18}, Lcom/alostpacket/pajamalib/utils/ViewUtil;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 985
    .local v6, "commentTile":Landroid/view/ViewGroup;
    const v16, 0x7f0a0143

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 986
    .local v4, "commentImg":Landroid/widget/ImageView;
    const v16, 0x7f0a0144

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/ImageView;

    .line 987
    .local v15, "userImg":Landroid/widget/ImageView;
    const v16, 0x7f0a0145

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v13

    check-cast v13, Landroid/widget/TextView;

    .line 988
    .local v13, "titleTV":Landroid/widget/TextView;
    const v16, 0x7f0a0142

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 989
    .local v12, "timeTV":Landroid/widget/TextView;
    const v16, 0x7f0a0147

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 990
    .local v11, "statusTV":Landroid/widget/TextView;
    const v16, 0x7f0a0146

    move/from16 v0, v16

    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 993
    .local v5, "commentTV":Landroid/widget/TextView;
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->isModerated()Z

    move-result v16

    if-eqz v16, :cond_5

    .line 994
    const v16, 0x7f0c0017

    move/from16 v0, v16

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setText(I)V

    .line 995
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v11, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 998
    :cond_5
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 999
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getCreatedAtShort()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1000
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getComment()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1001
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsContainer:Landroid/view/ViewGroup;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1002
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getUser()Lcom/seeclickfix/ma/android/objects/user/User;

    move-result-object v14

    .line 1004
    .local v14, "user":Lcom/seeclickfix/ma/android/objects/user/User;
    if-eqz v14, :cond_6

    .line 1005
    invoke-virtual {v14}, Lcom/seeclickfix/ma/android/objects/user/User;->getAvatarSquareImage()Ljava/lang/String;

    move-result-object v2

    .line 1007
    .local v2, "avatarUrl":Ljava/lang/String;
    invoke-static {v2}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-eqz v16, :cond_6

    .line 1008
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v15}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->loadIcon(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 1012
    .end local v2    # "avatarUrl":Ljava/lang/String;
    :cond_6
    invoke-virtual {v3}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->getSquareCommentImagePath()Ljava/lang/String;

    move-result-object v10

    .line 1014
    .local v10, "squareImageUrl":Ljava/lang/String;
    invoke-static {v10}, Lorg/apache/commons/lang3/StringUtils;->isNotEmpty(Ljava/lang/CharSequence;)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 1015
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v4}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->loadImage(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 1016
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1018
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->onClickListener:Landroid/view/View$OnClickListener;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1020
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 1026
    .end local v3    # "comment":Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .end local v4    # "commentImg":Landroid/widget/ImageView;
    .end local v5    # "commentTV":Landroid/widget/TextView;
    .end local v6    # "commentTile":Landroid/view/ViewGroup;
    .end local v10    # "squareImageUrl":Ljava/lang/String;
    .end local v11    # "statusTV":Landroid/widget/TextView;
    .end local v12    # "timeTV":Landroid/widget/TextView;
    .end local v13    # "titleTV":Landroid/widget/TextView;
    .end local v14    # "user":Lcom/seeclickfix/ma/android/objects/user/User;
    .end local v15    # "userImg":Landroid/widget/ImageView;
    :cond_7
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v9

    .line 1028
    .local v9, "numComments":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentsBtn:Landroid/widget/CheckBox;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, ""

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 1031
    invoke-direct/range {p0 .. p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->setupTileOverlay()V

    .line 1033
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->delayedCommentscroll:Z

    move/from16 v16, v0

    if-eqz v16, :cond_0

    .line 1034
    invoke-direct/range {p0 .. p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->scrollToBottom()V

    goto/16 :goto_0
.end method

.method protected showMapLarge()V
    .locals 3

    .prologue
    .line 912
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getSherlockActivity()Lcom/actionbarsherlock/app/SherlockFragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;

    .line 914
    .local v0, "homeActivityInterface":Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;
    const/16 v1, 0x14

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-interface {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/HomeButtonsInterface;->onClickButton(ILjava/lang/Object;)V

    .line 915
    return-void
.end method

.method public updateComment(Lcom/seeclickfix/ma/android/objects/issue/Comment;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 3
    .param p1, "comment"    # Lcom/seeclickfix/ma/android/objects/issue/Comment;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1334
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    if-nez v1, :cond_0

    .line 1338
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->resetAddCommentViews()V

    .line 1360
    :goto_0
    return-void

    .line 1342
    :cond_0
    invoke-virtual {p1}, Lcom/seeclickfix/ma/android/objects/issue/Comment;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1343
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->resetAddCommentViews()V

    goto :goto_0

    .line 1347
    :cond_1
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1349
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f0a008b

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 1350
    .local v0, "commentDisplayBtn":Landroid/widget/Button;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1351
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 1353
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-virtual {v1}, Lcom/seeclickfix/ma/android/objects/issue/Issue;->getCommentCountExcludingActivity()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1354
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/anim/Transitions;->fadeIn(Landroid/content/Context;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1356
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->commentList:Ljava/util/List;

    invoke-virtual {p0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->showComments(Ljava/util/List;)V

    .line 1358
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->resetAddCommentViews()V

    goto :goto_0
.end method

.method public updateFollow(Lcom/seeclickfix/ma/android/objects/issue/Follow;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 2
    .param p1, "follow"    # Lcom/seeclickfix/ma/android/objects/issue/Follow;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1379
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->starCheckbox:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 1380
    return-void
.end method

.method public updateStatus(Lcom/seeclickfix/ma/android/objects/issue/Transition;Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;)V
    .locals 0
    .param p1, "transitionAction"    # Lcom/seeclickfix/ma/android/objects/issue/Transition;
    .param p2, "receipt"    # Lcom/seeclickfix/ma/android/api/SCFService$IssueActionReceipt;

    .prologue
    .line 1384
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->displayContent()V

    .line 1385
    return-void
.end method

.method public updateVote()V
    .locals 3

    .prologue
    .line 1371
    iget-object v1, p0, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->issue:Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {p0, v1}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->renderVotesButton(Lcom/seeclickfix/ma/android/objects/issue/Issue;)V

    .line 1372
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getRootFrag()Landroid/view/ViewGroup;

    move-result-object v1

    const v2, 0x7f0a008c

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 1373
    .local v0, "btn":Landroid/widget/Button;
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/seeclickfix/ma/android/anim/Transitions;->fadeIn(Landroid/content/Context;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1374
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1375
    invoke-direct {p0}, Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;->resetAddCommentViews()V

    .line 1376
    return-void
.end method
