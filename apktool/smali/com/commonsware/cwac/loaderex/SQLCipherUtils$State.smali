.class public final enum Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;
.super Ljava/lang/Enum;
.source "SQLCipherUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/commonsware/cwac/loaderex/SQLCipherUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

.field public static final enum DOES_NOT_EXIST:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

.field public static final enum ENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

.field public static final enum UNENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

.field public static final enum UNKNOWN:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    const-string/jumbo v1, "DOES_NOT_EXIST"

    invoke-direct {v0, v1, v2}, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->DOES_NOT_EXIST:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    const-string/jumbo v1, "UNENCRYPTED"

    invoke-direct {v0, v1, v3}, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->UNENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    const-string/jumbo v1, "ENCRYPTED"

    invoke-direct {v0, v1, v4}, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->ENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    new-instance v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    const-string/jumbo v1, "UNKNOWN"

    invoke-direct {v0, v1, v5}, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->UNKNOWN:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    .line 25
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    sget-object v1, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->DOES_NOT_EXIST:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->UNENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->ENCRYPTED:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->UNKNOWN:Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    aput-object v1, v0, v5

    sput-object v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->$VALUES:[Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

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
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    return-object v0
.end method

.method public static values()[Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->$VALUES:[Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    invoke-virtual {v0}, [Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/commonsware/cwac/loaderex/SQLCipherUtils$State;

    return-object v0
.end method
