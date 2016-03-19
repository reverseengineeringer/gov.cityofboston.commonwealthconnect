.class public Lcom/seeclickfix/ma/android/fragments/reporting/ReportDbLoaderModule;
.super Ljava/lang/Object;
.source "ReportDbLoaderModule.java"


# annotations
.annotation runtime Ldagger/Module;
    complete = false
    includes = {
        Lcom/seeclickfix/ma/android/objects/modules/ContextModule;
    }
    injects = {
        Lcom/seeclickfix/ma/android/fragments/reporting/ReportProvider;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
