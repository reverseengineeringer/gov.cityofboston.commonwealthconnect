.class public final enum Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;
.super Ljava/lang/Enum;
.source "SimpleListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SimpleState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

.field public static final enum FINISHED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

.field public static final enum STARTED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 13
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    const-string/jumbo v1, "STARTED"

    invoke-direct {v0, v1, v2}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->STARTED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    new-instance v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    const-string/jumbo v1, "FINISHED"

    invoke-direct {v0, v1, v3}, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->FINISHED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    .line 12
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->STARTED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->FINISHED:Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    aput-object v1, v0, v3

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

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
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    const-class v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/fragments/interfaces/SimpleListener$SimpleState;

    return-object v0
.end method
