.class public final enum Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;
.super Ljava/lang/Enum;
.source "SimpleListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Code"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

.field public static final enum AUTHENTICATION_REQUIRED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

.field public static final enum NETWORK_BLOCKED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

.field public static final enum NETWORK_UNAVAILABLE:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

.field public static final enum SUCCESS:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

.field public static final enum UNAUTHORIZED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    const-string/jumbo v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    const-string/jumbo v1, "NETWORK_UNAVAILABLE"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->NETWORK_UNAVAILABLE:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    const-string/jumbo v1, "NETWORK_BLOCKED"

    invoke-direct {v0, v1, v4}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->NETWORK_BLOCKED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    const-string/jumbo v1, "AUTHENTICATION_REQUIRED"

    invoke-direct {v0, v1, v5}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->AUTHENTICATION_REQUIRED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    const-string/jumbo v1, "UNAUTHORIZED"

    invoke-direct {v0, v1, v6}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->UNAUTHORIZED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    .line 8
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    aput-object v1, v0, v2

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->NETWORK_UNAVAILABLE:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    aput-object v1, v0, v3

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->NETWORK_BLOCKED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    aput-object v1, v0, v4

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->AUTHENTICATION_REQUIRED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    aput-object v1, v0, v5

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->UNAUTHORIZED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    aput-object v1, v0, v6

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

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
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$Code;

    return-object v0
.end method
