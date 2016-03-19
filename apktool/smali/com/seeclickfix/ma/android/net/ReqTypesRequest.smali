.class public Lcom/seeclickfix/ma/android/net/ReqTypesRequest;
.super Ljava/lang/Object;
.source "ReqTypesRequest.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ServiceCategoryRequest"


# instance fields
.field private c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/seeclickfix/ma/android/net/ReqTypesRequest;->c:Landroid/content/Context;

    .line 35
    return-void
.end method
