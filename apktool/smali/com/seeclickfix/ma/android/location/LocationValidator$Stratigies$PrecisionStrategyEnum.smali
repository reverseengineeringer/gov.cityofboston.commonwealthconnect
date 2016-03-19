.class public abstract enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;
.super Ljava/lang/Enum;
.source "LocationValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "PrecisionStrategyEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

.field public static final enum ANY:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

.field public static final enum CLOSE:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

.field public static final enum CLOSE_AND_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

.field public static final enum RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 107
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$1;

    const-string/jumbo v1, "ANY"

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->ANY:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    .line 114
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$2;

    const-string/jumbo v1, "RECENT"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    .line 129
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$3;

    const-string/jumbo v1, "CLOSE"

    invoke-direct {v0, v1, v4}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->CLOSE:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    .line 140
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$4;

    const-string/jumbo v1, "CLOSE_AND_RECENT"

    invoke-direct {v0, v1, v5}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->CLOSE_AND_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    .line 106
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->ANY:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    aput-object v1, v0, v2

    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    aput-object v1, v0, v3

    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->CLOSE:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    aput-object v1, v0, v4

    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->CLOSE_AND_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    aput-object v1, v0, v5

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->$VALUES:[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

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
    .line 106
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/seeclickfix/ma/android/location/LocationValidator$1;

    .prologue
    .line 106
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 106
    const-class v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;
    .locals 1

    .prologue
    .line 106
    sget-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->$VALUES:[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$PrecisionStrategyEnum;

    return-object v0
.end method


# virtual methods
.method public abstract isValid(Landroid/location/Location;)Z
.end method
