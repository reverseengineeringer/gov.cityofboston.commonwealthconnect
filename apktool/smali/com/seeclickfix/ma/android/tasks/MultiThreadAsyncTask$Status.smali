.class public final enum Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;
.super Ljava/lang/Enum;
.source "MultiThreadAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

.field public static final enum FINISHED:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

.field public static final enum PENDING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

.field public static final enum RUNNING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 284
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    const-string/jumbo v1, "PENDING"

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->PENDING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    .line 288
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    const-string/jumbo v1, "RUNNING"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->RUNNING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    .line 292
    new-instance v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    const-string/jumbo v1, "FINISHED"

    invoke-direct {v0, v1, v4}, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->FINISHED:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    .line 280
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    sget-object v1, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->PENDING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    aput-object v1, v0, v2

    sget-object v1, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->RUNNING:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->FINISHED:Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    aput-object v1, v0, v4

    sput-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->$VALUES:[Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 280
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 280
    const-class v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;
    .locals 1

    .prologue
    .line 280
    sget-object v0, Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->$VALUES:[Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/tasks/MultiThreadAsyncTask$Status;

    return-object v0
.end method
