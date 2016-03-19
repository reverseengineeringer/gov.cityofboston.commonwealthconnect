.class final Lcom/seeclickfix/ma/android/config/mappings/StatusMap$1;
.super Ljava/lang/Object;
.source "StatusMap.java"

# interfaces
.implements Lcom/google/common/base/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getDisplayForList(Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Function",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 151
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap$1;->apply(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 154
    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStateDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
