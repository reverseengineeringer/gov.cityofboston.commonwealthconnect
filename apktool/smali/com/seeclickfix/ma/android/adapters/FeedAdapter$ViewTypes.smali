.class Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ViewTypes;
.super Ljava/lang/Object;
.source "FeedAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/adapters/FeedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewTypes"
.end annotation


# static fields
.field static final COMMENT:I = 0x3

.field static final ISSUE:I = 0x2

.field static final NOTICE:I = 0x4

.field static final SEPARATOR:I = 0x0

.field static final ZONE:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;


# direct methods
.method private constructor <init>(Lcom/seeclickfix/ma/android/adapters/FeedAdapter;)V
    .locals 0

    .prologue
    .line 114
    iput-object p1, p0, Lcom/seeclickfix/ma/android/adapters/FeedAdapter$ViewTypes;->this$0:Lcom/seeclickfix/ma/android/adapters/FeedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
