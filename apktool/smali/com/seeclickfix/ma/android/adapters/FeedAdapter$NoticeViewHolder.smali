.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;
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
    name = "NoticeViewHolder"
.end annotation


# instance fields
.field actionTextView:Landroid/widget/TextView;

.field bodyTextView:Landroid/widget/TextView;

.field dividerView:Landroid/view/View;

.field extraTextView:Landroid/widget/TextView;

.field titleTextView:Landroid/widget/TextView;

.field final viewType:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 395
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 402
    const/4 v0, 0x4

    iput v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$NoticeViewHolder;->viewType:I

    return-void
.end method


# virtual methods
.method public getType()I
    .locals 1

    .prologue
    .line 406
    const/4 v0, 0x4

    return v0
.end method
