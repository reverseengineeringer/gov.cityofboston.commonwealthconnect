.class public Lcom/seeclickfix/ma/android/objects/apiv2/Comment;
.super Ljava/lang/Object;
.source "Comment.java"


# instance fields
.field private comment:Ljava/lang/String;

.field private commenter:Lcom/seeclickfix/ma/android/objects/apiv2/User;

.field private createdAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "created_at"
    .end annotation
.end field

.field private id:I

.field private issue:Lcom/seeclickfix/ma/android/objects/apiv2/IssueInfo;

.field private media:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private updatedAt:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "updated_at"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
