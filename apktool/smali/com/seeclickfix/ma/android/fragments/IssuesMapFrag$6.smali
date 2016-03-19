.class Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$6;
.super Ljava/lang/Object;
.source "IssuesMapFrag.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V
    .locals 0

    .prologue
    .line 461
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 465
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag$6;->this$0:Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;

    # invokes: Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->reload()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;->access$800(Lcom/seeclickfix/ma/android/fragments/IssuesMapFrag;)V

    .line 466
    return-void
.end method
