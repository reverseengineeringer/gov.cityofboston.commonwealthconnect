.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1$1;
.super Ljava/lang/Object;
.source "FeedAdapter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;)V
    .locals 0

    .prologue
    .line 1056
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1$1;->this$1:Lcom/seeclickfix/ma/android/adapters/FeedAdapter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 1058
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1059
    return-void
.end method
