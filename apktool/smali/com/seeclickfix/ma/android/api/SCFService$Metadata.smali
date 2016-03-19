.class public Lcom/seeclickfix/ma/android/api/SCFService$Metadata;
.super Ljava/lang/Object;
.source "SCFService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/api/SCFService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Metadata"
.end annotation


# instance fields
.field public moderated:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .param p1, "moderated"    # Z

    .prologue
    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 229
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/api/SCFService$Metadata;->moderated:Z

    .line 230
    return-void
.end method


# virtual methods
.method public isModerated()Z
    .locals 1

    .prologue
    .line 233
    iget-boolean v0, p0, Lcom/seeclickfix/ma/android/api/SCFService$Metadata;->moderated:Z

    return v0
.end method

.method public setModerated(Z)V
    .locals 0
    .param p1, "moderated"    # Z

    .prologue
    .line 237
    iput-boolean p1, p0, Lcom/seeclickfix/ma/android/api/SCFService$Metadata;->moderated:Z

    .line 238
    return-void
.end method
