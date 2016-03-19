.class public final enum Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
.super Ljava/lang/Enum;
.source "DisplayUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/util/DisplayUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DENSITY"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

.field public static final enum HIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

.field public static final enum LOW:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

.field public static final enum MEDIUM:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

.field public static final enum UNKNOWN:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

.field public static final enum XHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

.field public static final enum XXHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 109
    new-instance v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    const-string/jumbo v1, "UNKNOWN"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->UNKNOWN:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    .line 110
    new-instance v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    const-string/jumbo v1, "LOW"

    invoke-direct {v0, v1, v4}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->LOW:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    .line 111
    new-instance v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    const-string/jumbo v1, "MEDIUM"

    invoke-direct {v0, v1, v5}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->MEDIUM:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    .line 112
    new-instance v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    const-string/jumbo v1, "HIGH"

    invoke-direct {v0, v1, v6}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->HIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    .line 113
    new-instance v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    const-string/jumbo v1, "XHIGH"

    invoke-direct {v0, v1, v7}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->XHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    .line 114
    new-instance v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    const-string/jumbo v1, "XXHIGH"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->XXHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    .line 108
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    sget-object v1, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->UNKNOWN:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    aput-object v1, v0, v3

    sget-object v1, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->LOW:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    aput-object v1, v0, v4

    sget-object v1, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->MEDIUM:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    aput-object v1, v0, v5

    sget-object v1, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->HIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    aput-object v1, v0, v6

    sget-object v1, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->XHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->XXHIGH:Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    aput-object v2, v0, v1

    sput-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->$VALUES:[Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

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
    .line 108
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 108
    const-class v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;
    .locals 1

    .prologue
    .line 108
    sget-object v0, Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->$VALUES:[Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/util/DisplayUtil$DENSITY;

    return-object v0
.end method
