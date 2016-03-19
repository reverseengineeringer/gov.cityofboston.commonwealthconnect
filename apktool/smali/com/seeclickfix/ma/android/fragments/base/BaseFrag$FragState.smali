.class public final enum Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;
.super Ljava/lang/Enum;
.source "BaseFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FragState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

.field public static final enum ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

.field public static final enum BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

.field public static final enum ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 402
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    const-string/jumbo v1, "ACTIVE"

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    const-string/jumbo v1, "BUSY"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    const-string/jumbo v1, "ERROR"

    invoke-direct {v0, v1, v4}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    .line 401
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->BUSY:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->ERROR:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

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
    .line 401
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 401
    const-class v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;
    .locals 1

    .prologue
    .line 401
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$FragState;

    return-object v0
.end method
