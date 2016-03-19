.class public Lcom/seeclickfix/ma/android/ReportModel;
.super Ljava/lang/Object;
.source "ReportModel.java"


# instance fields
.field notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>()V

    iput-object v0, p0, Lcom/seeclickfix/ma/android/ReportModel;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    return-void
.end method


# virtual methods
.method public getNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 10
    iget-object v0, p0, Lcom/seeclickfix/ma/android/ReportModel;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    return-object v0
.end method

.method public setNotice(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V
    .locals 0
    .param p1, "notice"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .prologue
    .line 14
    iput-object p1, p0, Lcom/seeclickfix/ma/android/ReportModel;->notice:Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 15
    return-void
.end method
