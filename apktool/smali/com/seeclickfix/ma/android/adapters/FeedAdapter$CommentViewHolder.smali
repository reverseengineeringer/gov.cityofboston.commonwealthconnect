.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;
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
    name = "CommentViewHolder"
.end annotation


# instance fields
.field dateTextView:Landroid/widget/TextView;

.field descriptionTextView:Landroid/widget/TextView;

.field headerBg:Landroid/view/View;

.field icon:Landroid/widget/ImageView;

.field imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field itemObj:Ljava/lang/Object;

.field mainBtn:Landroid/view/ViewGroup;

.field position:I

.field statusTextView:Landroid/widget/TextView;

.field userIcon:Landroid/widget/ImageView;

.field usernameTextView:Landroid/widget/TextView;

.field final viewType:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 354
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 370
    const/4 v0, 0x3

    iput v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$CommentViewHolder;->viewType:I

    return-void
.end method


# virtual methods
.method public getType()I
    .locals 1

    .prologue
    .line 374
    const/4 v0, 0x3

    return v0
.end method
