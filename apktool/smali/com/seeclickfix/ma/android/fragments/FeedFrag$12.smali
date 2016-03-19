.class Lcom/seeclickfix/ma/android/fragments/FeedFrag$12;
.super Ljava/lang/Object;
.source "FeedFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/FeedFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V
    .locals 0

    .prologue
    .line 807
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 811
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/FeedFrag$12;->this$0:Lcom/seeclickfix/ma/android/fragments/FeedFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/FeedFrag;->showListView()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/FeedFrag;->access$1100(Lcom/seeclickfix/ma/android/fragments/FeedFrag;)V

    .line 812
    return-void
.end method
