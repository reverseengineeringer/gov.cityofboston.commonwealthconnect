.class public final enum Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;
.super Ljava/lang/Enum;
.source "NoticeItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/seeclickfix/ma/android/fragments/NoticeItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Level"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

.field public static final enum DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

.field public static final enum INFORMATION:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

.field public static final enum SUCCESS:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

.field public static final enum WARNING:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;


# instance fields
.field backgroundColor:I

.field webviewClass:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 196
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const-string/jumbo v1, "INFORMATION"

    const v2, 0x7f08001a

    const-string/jumbo v3, "alert-info"

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->INFORMATION:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    .line 197
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const-string/jumbo v1, "SUCCESS"

    const v2, 0x7f08001b

    const-string/jumbo v3, "alert-success"

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    .line 198
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const-string/jumbo v1, "WARNING"

    const v2, 0x7f08001c

    const-string/jumbo v3, "alert-warning"

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->WARNING:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    .line 199
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const-string/jumbo v1, "DANGER"

    const v2, 0x7f080019

    const-string/jumbo v3, "alert-danger"

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    .line 195
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->INFORMATION:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    aput-object v1, v0, v4

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    aput-object v1, v0, v5

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->WARNING:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    aput-object v1, v0, v6

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    aput-object v1, v0, v7

    sput-object v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .param p3, "color"    # I
    .param p4, "webviewClass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 204
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 205
    iput p3, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->backgroundColor:I

    .line 206
    iput-object p4, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->webviewClass:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 195
    const-class v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    return-object v0
.end method

.method public static values()[Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;
    .locals 1

    .prologue
    .line 195
    sget-object v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->$VALUES:[Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    invoke-virtual {v0}, [Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    return-object v0
.end method


# virtual methods
.method public backgroundColor()I
    .locals 1

    .prologue
    .line 210
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->backgroundColor:I

    return v0
.end method

.method public webviewClass()Ljava/lang/String;
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->webviewClass:Ljava/lang/String;

    return-object v0
.end method
