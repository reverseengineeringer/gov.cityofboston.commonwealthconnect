.class public Lcom/seeclickfix/ma/android/events/ShowReportEvent;
.super Ljava/lang/Object;
.source "ShowReportEvent.java"


# instance fields
.field private from:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/seeclickfix/ma/android/events/ShowReportEvent;->from:Ljava/lang/String;

    .line 10
    return-void
.end method


# virtual methods
.method public getFrom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lcom/seeclickfix/ma/android/events/ShowReportEvent;->from:Ljava/lang/String;

    return-object v0
.end method
