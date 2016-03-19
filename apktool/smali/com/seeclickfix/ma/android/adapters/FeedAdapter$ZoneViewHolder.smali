.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;
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
    name = "ZoneViewHolder"
.end annotation


# instance fields
.field bgColorContainer:Landroid/view/ViewGroup;

.field descriptionTextView:Landroid/widget/TextView;

.field disclaimerTextView:Landroid/widget/TextView;

.field gridView:Lcom/seeclickfix/ma/android/views/ResizableGridView;

.field icon:Landroid/widget/ImageView;

.field imageReqContainer:Lcom/android/volley/toolbox/ImageLoader$ImageContainer;

.field titleTextView:Landroid/widget/TextView;

.field final viewType:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 378
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 387
    const/4 v0, 0x1

    iput v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ZoneViewHolder;->viewType:I

    return-void
.end method


# virtual methods
.method public getType()I
    .locals 1

    .prologue
    .line 391
    const/4 v0, 0x1

    return v0
.end method
