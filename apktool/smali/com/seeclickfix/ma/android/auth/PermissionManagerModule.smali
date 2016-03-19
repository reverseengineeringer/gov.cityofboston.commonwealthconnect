.class public Lcom/seeclickfix/ma/android/auth/PermissionManagerModule;
.super Ljava/lang/Object;
.source "PermissionManagerModule.java"


# annotations
.annotation runtime Ldagger/Module;
    complete = false
    injects = {
        Lcom/seeclickfix/ma/android/fragments/IssueDetailsFrag;,
        Lcom/seeclickfix/ma/android/fragments/FeedFrag;
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
