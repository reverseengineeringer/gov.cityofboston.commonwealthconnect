.class Lcom/seeclickfix/ma/android/SeeclickfixActivity$5;
.super Ljava/lang/Object;
.source "SeeclickfixActivity.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/fragments/interfaces/OnBackKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/SeeclickfixActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V
    .locals 0

    .prologue
    .line 1320
    iput-object p1, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$5;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackKey()Lcom/seeclickfix/ma/android/objects/PageParams;
    .locals 1

    .prologue
    .line 1329
    iget-object v0, p0, Lcom/seeclickfix/ma/android/SeeclickfixActivity$5;->this$0:Lcom/seeclickfix/ma/android/SeeclickfixActivity;

    # invokes: Lcom/seeclickfix/ma/android/SeeclickfixActivity;->exitActivity()V
    invoke-static {v0}, Lcom/seeclickfix/ma/android/SeeclickfixActivity;->access$700(Lcom/seeclickfix/ma/android/SeeclickfixActivity;)V

    .line 1330
    const/4 v0, 0x0

    return-object v0
.end method

.method public willHandleBackKey()Z
    .locals 1

    .prologue
    .line 1324
    const/4 v0, 0x1

    return v0
.end method
