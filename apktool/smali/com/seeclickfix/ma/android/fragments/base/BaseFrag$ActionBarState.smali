.class public final enum Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;
.super Ljava/lang/Enum;
.source "BaseFrag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/base/BaseFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ActionBarState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

.field public static final enum ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

.field public static final enum HIDDEN:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

.field public static final enum INACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 398
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    const-string/jumbo v1, "ACTIVE"

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    const-string/jumbo v1, "INACTIVE"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->INACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    const-string/jumbo v1, "HIDDEN"

    invoke-direct {v0, v1, v4}, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->HIDDEN:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    .line 397
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->ACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->INACTIVE:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->HIDDEN:Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

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
    .line 397
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 397
    const-class v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;
    .locals 1

    .prologue
    .line 397
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/fragments/base/BaseFrag$ActionBarState;

    return-object v0
.end method
