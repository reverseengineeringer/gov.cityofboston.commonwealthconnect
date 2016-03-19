.class public Lcom/seeclickfix/ma/android/views/ZoneButtonStateList;
.super Landroid/graphics/drawable/StateListDrawable;
.source "ZoneButtonStateList.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "ZoneButtonStateList"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    return-void
.end method


# virtual methods
.method protected onStateChange([I)Z
    .locals 4
    .param p1, "stateSet"    # [I

    .prologue
    .line 22
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/views/ZoneButtonStateList;->invalidateSelf()V

    .line 62
    const/4 v3, 0x1

    return v3
.end method
