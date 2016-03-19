.class public abstract enum Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;
.super Ljava/lang/Enum;
.source "LocationValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "CompareStrategyEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

.field public static final enum CLOSER_MORE_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

.field public static final enum SIGNIFICANTLY_CLOSER_MORE_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 35
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum$1;

    const-string/jumbo v1, "CLOSER_MORE_RECENT"

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->CLOSER_MORE_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    .line 67
    new-instance v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum$2;

    const-string/jumbo v1, "SIGNIFICANTLY_CLOSER_MORE_RECENT"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->SIGNIFICANTLY_CLOSER_MORE_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    .line 31
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->CLOSER_MORE_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    aput-object v1, v0, v2

    sget-object v1, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->SIGNIFICANTLY_CLOSER_MORE_RECENT:Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    aput-object v1, v0, v3

    sput-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->$VALUES:[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

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
    .line 31
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/seeclickfix/ma/android/location/LocationValidator$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/seeclickfix/ma/android/location/LocationValidator$1;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    const-class v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->$VALUES:[Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/location/LocationValidator$Stratigies$CompareStrategyEnum;

    return-object v0
.end method


# virtual methods
.method public abstract isValid(Landroid/location/Location;Landroid/location/Location;)Z
.end method
