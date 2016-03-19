.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;
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
    name = "SeparatorViewHolder"
.end annotation


# instance fields
.field imgView:Landroid/widget/ImageView;

.field textView:Landroid/widget/TextView;

.field final viewType:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 415
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$SeparatorViewHolder;->viewType:I

    return-void
.end method


# virtual methods
.method public getType()I
    .locals 1

    .prologue
    .line 419
    const/4 v0, 0x0

    return v0
.end method
