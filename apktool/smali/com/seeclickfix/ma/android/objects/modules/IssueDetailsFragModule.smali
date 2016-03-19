.class public Lcom/seeclickfix/ma/android/objects/modules/IssueDetailsFragModule;
.super Ljava/lang/Object;
.source "IssueDetailsFragModule.java"


# annotations
.annotation runtime Ldagger/Module;
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/ContextModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
