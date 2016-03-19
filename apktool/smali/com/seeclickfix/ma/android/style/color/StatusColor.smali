.class public Lcom/seeclickfix/ma/android/style/color/StatusColor;
.super Ljava/lang/Object;
.source "StatusColor.java"


# static fields
.field private static final D:Z = false

.field private static final GLOBAL_DEBUG:Z = false

.field private static final LOCAL_DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "StatusColor"

.field private static cardDarkHeaderGrey:I

.field private static cardHeaderGrey:I

.field private static scfBlue:I

.field private static scfDarkBlue:I

.field private static scfDarkGreen:I

.field private static scfDarkOrange:I

.field private static scfGreen:I

.field private static scfOrange:I

.field private static statusStates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBackground(Ljava/lang/String;Landroid/content/Context;)I
    .locals 3
    .param p0, "statusState"    # Ljava/lang/String;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 32
    sget v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->cardHeaderGrey:I

    if-gtz v1, :cond_0

    .line 33
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->initColorsAndStrings(Landroid/content/Context;)V

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 39
    .local v0, "color":I
    if-nez p0, :cond_1

    .line 40
    sget v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->cardHeaderGrey:I

    .line 55
    :goto_0
    return v1

    .line 41
    :cond_1
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 43
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfOrange:I

    :cond_2
    :goto_1
    move v1, v0

    .line 55
    goto :goto_0

    .line 44
    :cond_3
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 46
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfBlue:I

    goto :goto_1

    .line 47
    :cond_4
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 49
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfGreen:I

    goto :goto_1

    .line 50
    :cond_5
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x3

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 52
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfBlue:I

    goto :goto_1
.end method

.method public static getForeground(Ljava/lang/String;Landroid/content/Context;)I
    .locals 3
    .param p0, "statusState"    # Ljava/lang/String;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 59
    sget v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->cardHeaderGrey:I

    if-gtz v1, :cond_0

    .line 60
    invoke-static {p1}, Lcom/seeclickfix/ma/android/style/color/StatusColor;->initColorsAndStrings(Landroid/content/Context;)V

    .line 64
    :cond_0
    const/4 v0, 0x0

    .line 66
    .local v0, "color":I
    if-nez p0, :cond_1

    .line 67
    sget v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->cardHeaderGrey:I

    .line 82
    :goto_0
    return v1

    .line 68
    :cond_1
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 70
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfDarkOrange:I

    :cond_2
    :goto_1
    move v1, v0

    .line 82
    goto :goto_0

    .line 71
    :cond_3
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 73
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfDarkBlue:I

    goto :goto_1

    .line 74
    :cond_4
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 76
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfDarkGreen:I

    goto :goto_1

    .line 77
    :cond_5
    sget-object v1, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    const/4 v2, 0x3

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 79
    sget v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfDarkBlue:I

    goto :goto_1
.end method

.method private static initColorsAndStrings(Landroid/content/Context;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 88
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08001f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->cardHeaderGrey:I

    .line 89
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfBlue:I

    .line 90
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080033

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfOrange:I

    .line 91
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080027

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfGreen:I

    .line 92
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08003b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->cardDarkHeaderGrey:I

    .line 93
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080039

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfDarkBlue:I

    .line 94
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08003c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfDarkOrange:I

    .line 95
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08003a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->scfDarkGreen:I

    .line 97
    invoke-static {}, Lcom/seeclickfix/ma/android/config/mappings/StatusMap;->getStatusStateKeys()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/seeclickfix/ma/android/style/color/StatusColor;->statusStates:Ljava/util/List;

    .line 98
    return-void
.end method
