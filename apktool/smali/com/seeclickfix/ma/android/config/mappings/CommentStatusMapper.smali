.class public Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;
.super Ljava/lang/Object;
.source "CommentStatusMapper.java"


# static fields
.field private static cardDarkHeaderGrey:I

.field private static cardHeaderGrey:I

.field private static scfBlue:I

.field private static scfDarkBlue:I

.field private static scfDarkGreen:I

.field private static scfDarkOrange:I

.field private static scfGreen:I

.field private static scfOrange:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBackground(Ljava/lang/String;Landroid/content/Context;)I
    .locals 2
    .param p0, "commentType"    # Ljava/lang/String;
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 102
    sget v1, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->cardHeaderGrey:I

    if-gtz v1, :cond_0

    .line 103
    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->initColorsAndStrings(Landroid/content/Context;)V

    .line 106
    :cond_0
    const/4 v0, 0x0

    .line 108
    .local v0, "color":I
    const-string/jumbo v1, "Issue Acknowledged"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 109
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfGreen:I

    .line 126
    :goto_0
    return v0

    .line 110
    :cond_1
    const-string/jumbo v1, "Issue Closed"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 111
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfBlue:I

    goto :goto_0

    .line 112
    :cond_2
    const-string/jumbo v1, "Issue Reopened"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 113
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfOrange:I

    goto :goto_0

    .line 114
    :cond_3
    const-string/jumbo v1, "Issue Voted For"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 115
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfGreen:I

    goto :goto_0

    .line 116
    :cond_4
    const-string/jumbo v1, "Comment"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 117
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->cardHeaderGrey:I

    goto :goto_0

    .line 118
    :cond_5
    const-string/jumbo v1, "Watcher Added"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 119
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfGreen:I

    goto :goto_0

    .line 120
    :cond_6
    const-string/jumbo v1, "Thank You"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 121
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfGreen:I

    goto :goto_0

    .line 123
    :cond_7
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getColorForCommentType(Ljava/lang/String;Landroid/content/Context;)I
    .locals 2
    .param p0, "commentType"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 73
    sget v1, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->cardHeaderGrey:I

    if-gtz v1, :cond_0

    .line 74
    invoke-static {p1}, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->initColorsAndStrings(Landroid/content/Context;)V

    .line 78
    :cond_0
    const/4 v0, 0x0

    .line 80
    .local v0, "color":I
    const-string/jumbo v1, "Issue Acknowledged"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 81
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkGreen:I

    .line 98
    :goto_0
    return v0

    .line 82
    :cond_1
    const-string/jumbo v1, "Issue Closed"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 83
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkBlue:I

    goto :goto_0

    .line 84
    :cond_2
    const-string/jumbo v1, "Issue Reopened"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 85
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkOrange:I

    goto :goto_0

    .line 86
    :cond_3
    const-string/jumbo v1, "Issue Voted For"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 87
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkGreen:I

    goto :goto_0

    .line 88
    :cond_4
    const-string/jumbo v1, "Comment"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 89
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->cardDarkHeaderGrey:I

    goto :goto_0

    .line 90
    :cond_5
    const-string/jumbo v1, "Watcher Added"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 91
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkGreen:I

    goto :goto_0

    .line 92
    :cond_6
    const-string/jumbo v1, "Thank You"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 93
    sget v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkGreen:I

    goto :goto_0

    .line 95
    :cond_7
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getCommentStatus(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "commentType"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 47
    .local v0, "res":Landroid/content/res/Resources;
    const/4 v1, 0x0

    .line 49
    .local v1, "str":Ljava/lang/String;
    const-string/jumbo v2, "Issue Acknowledged"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 50
    const v2, 0x7f0c001e

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 67
    :goto_0
    return-object v1

    .line 51
    :cond_0
    const-string/jumbo v2, "Issue Closed"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 52
    const v2, 0x7f0c001f

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 53
    :cond_1
    const-string/jumbo v2, "Issue Reopened"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 54
    const v2, 0x7f0c0021

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 55
    :cond_2
    const-string/jumbo v2, "Issue Voted For"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 56
    const v2, 0x7f0c0023

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 57
    :cond_3
    const-string/jumbo v2, "Comment"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 58
    const v2, 0x7f0c0020

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 59
    :cond_4
    const-string/jumbo v2, "Watcher Added"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 60
    const v2, 0x7f0c0024

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 61
    :cond_5
    const-string/jumbo v2, "Thank You"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 62
    const v2, 0x7f0c0022

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 64
    :cond_6
    const-string/jumbo v1, "NOT_DISPLAYABLE"

    goto :goto_0
.end method

.method public static getCommentToast(Ljava/lang/String;Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "commentType"    # Ljava/lang/String;
    .param p1, "formatObj"    # Ljava/lang/Object;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 22
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 24
    .local v0, "res":Landroid/content/res/Resources;
    const/4 v1, 0x0

    .line 26
    .local v1, "str":Ljava/lang/String;
    const-string/jumbo v2, "Issue Acknowledged"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 27
    const v2, 0x7f0c0018

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 40
    :cond_0
    :goto_0
    return-object v1

    .line 28
    :cond_1
    const-string/jumbo v2, "Issue Closed"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 29
    const v2, 0x7f0c0019

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 30
    :cond_2
    const-string/jumbo v2, "Issue Reopened"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 31
    const v2, 0x7f0c001b

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 32
    :cond_3
    const-string/jumbo v2, "Issue Voted For"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 33
    const v2, 0x7f0c001c

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 34
    :cond_4
    const-string/jumbo v2, "Comment"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 35
    const v2, 0x7f0c001a

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 36
    :cond_5
    const-string/jumbo v2, "Watcher Added"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 37
    const v2, 0x7f0c001d

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static initColorsAndStrings(Landroid/content/Context;)V
    .locals 2
    .param p0, "c"    # Landroid/content/Context;

    .prologue
    .line 136
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08001f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->cardHeaderGrey:I

    .line 137
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfBlue:I

    .line 138
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080033

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfOrange:I

    .line 139
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080027

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfGreen:I

    .line 140
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08003b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->cardDarkHeaderGrey:I

    .line 141
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080039

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkBlue:I

    .line 142
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08003c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkOrange:I

    .line 143
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08003a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    sput v0, Lcom/seeclickfix/ma/android/config/mappings/CommentStatusMapper;->scfDarkGreen:I

    .line 145
    return-void
.end method
