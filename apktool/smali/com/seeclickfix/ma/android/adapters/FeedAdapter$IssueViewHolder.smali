.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/adapters/TypedViewHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IssueViewHolder"
.end annotation


# instance fields
.field commentBtn:Landroid/widget/CheckBox;

.field dateTextView:Landroid/widget/TextView;

.field descriptionTextView:Landroid/widget/TextView;

.field flagBtn:Landroid/widget/CheckBox;

.field icon:Landroid/widget/ImageView;

.field imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field itemObj:Ljava/lang/Object;

.field locationTextView:Landroid/widget/TextView;

.field mainBtn:Landroid/view/ViewGroup;

.field position:I

.field starCheckbox:Landroid/widget/CheckBox;

.field statusContainer:Landroid/view/ViewGroup;

.field statusSpinner:Landroid/widget/Spinner;

.field statusTextView:Landroid/widget/TextView;

.field titleTextView:Landroid/widget/TextView;

.field userIcon:Landroid/widget/ImageView;

.field usernameTextView:Landroid/widget/TextView;

.field final viewType:I

.field voteBtn:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 346
    const/4 v0, 0x2

    iput v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$IssueViewHolder;->viewType:I

    return-void
.end method


# virtual methods
.method public getType()I
    .locals 1

    .prologue
    .line 350
    const/4 v0, 0x2

    return v0
.end method
