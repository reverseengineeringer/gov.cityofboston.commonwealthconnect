.class Lcom/seeclickfix/ma/android/db/SqlViews$1;
.super Ljava/lang/Object;
.source "SqlViews.java"

# interfaces
.implements Lcom/j256/ormlite/dao/RawRowMapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/db/SqlViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/j256/ormlite/dao/RawRowMapper",
        "<",
        "Lcom/seeclickfix/ma/android/objects/issue/Issue;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/db/SqlViews;


# direct methods
.method constructor <init>(Lcom/seeclickfix/ma/android/db/SqlViews;)V
    .locals 0

    .prologue
    .line 24
    iput-object p1, p0, Lcom/seeclickfix/ma/android/db/SqlViews$1;->this$0:Lcom/seeclickfix/ma/android/db/SqlViews;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public mapRow([Ljava/lang/String;[Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/issue/Issue;
    .locals 1
    .param p1, "columnNames"    # [Ljava/lang/String;
    .param p2, "resultColumns"    # [Ljava/lang/String;

    .prologue
    .line 27
    new-instance v0, Lcom/seeclickfix/ma/android/objects/issue/Issue;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/objects/issue/Issue;-><init>()V

    return-object v0
.end method

.method public bridge synthetic mapRow([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/String;
    .param p2, "x1"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 24
    invoke-virtual {p0, p1, p2}, Lcom/seeclickfix/ma/android/db/SqlViews$1;->mapRow([Ljava/lang/String;[Ljava/lang/String;)Lcom/seeclickfix/ma/android/objects/issue/Issue;

    move-result-object v0

    return-object v0
.end method
