.class public Lcom/seeclickfix/ma/android/IssueModel;
.super Ljava/lang/Object;
.source "IssueModel.java"


# instance fields
.field notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

.field noticeIssue:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/IssueModel;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 8
    const/4 v0, 0x0

    iput v0, p0, Lcom/seeclickfix/ma/android/IssueModel;->noticeIssue:I

    return-void
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/seeclickfix/ma/android/IssueModel;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    return-object v0
.end method

.method public getNoticeIssue()I
    .locals 1

    .prologue
    .line 11
    iget v0, p0, Lcom/seeclickfix/ma/android/IssueModel;->noticeIssue:I

    return v0
.end method

.method public setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V
    .locals 0
    .param p1, "notice"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/seeclickfix/ma/android/IssueModel;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 24
    return-void
.end method

.method public setNoticeIssue(I)V
    .locals 0
    .param p1, "noticeIssue"    # I

    .prologue
    .line 15
    iput p1, p0, Lcom/seeclickfix/ma/android/IssueModel;->noticeIssue:I

    .line 16
    return-void
.end method
