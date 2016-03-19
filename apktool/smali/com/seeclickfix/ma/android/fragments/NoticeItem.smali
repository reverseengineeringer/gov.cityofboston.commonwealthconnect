.class public Lcom/seeclickfix/ma/android/fragments/NoticeItem;
.super Ljava/lang/Object;
.source "NoticeItem.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/objects/types/FeedItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;
    }
.end annotation


# static fields
.field private static final D:Z = false

.field private static final TAG:Ljava/lang/String; = "NoticeItem"


# instance fields
.field private action:I

.field private body:I

.field private extra:Ljava/lang/String;

.field private index:I

.field private level:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

.field private listener:Landroid/view/View$OnClickListener;

.field private title:I


# direct methods
.method public constructor <init>()V
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 83
    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->INFORMATION:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    move-object v0, p0

    move v3, v2

    move v4, v2

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;II)V
    .locals 7
    .param p1, "level"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;
    .param p2, "title"    # I
    .param p3, "body"    # I

    .prologue
    .line 87
    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "level"    # Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;
    .param p2, "title"    # I
    .param p3, "body"    # I
    .param p4, "action"    # I
    .param p5, "extra"    # Ljava/lang/String;
    .param p6, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->level:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    .line 92
    iput p2, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->title:I

    .line 93
    iput p3, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->body:I

    .line 94
    iput p4, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->action:I

    .line 95
    if-nez p5, :cond_0

    const-string/jumbo p5, ""

    .end local p5    # "extra":Ljava/lang/String;
    :cond_0
    iput-object p5, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->extra:Ljava/lang/String;

    .line 96
    iput-object p6, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->listener:Landroid/view/View$OnClickListener;

    .line 97
    return-void
.end method

.method public static ACCEPTED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 30
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->WARNING:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c010a

    const v3, 0x7f0c0109

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static APP_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 71
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c010c

    const v3, 0x7f0c010b

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static COMMENT_ACCEPTED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 34
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->WARNING:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c010e

    const v3, 0x7f0c010d

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static CREATED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 42
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c0110

    const v3, 0x7f0c010f

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static DECLINED(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7
    .param p0, "extra"    # Ljava/lang/String;

    .prologue
    .line 75
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c0112

    const v3, 0x7f0c0111

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v5, p0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static DUPLICATE()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 59
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c0114

    const v3, 0x7f0c0113

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static FORBIDDEN()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 47
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->WARNING:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c0116

    const v3, 0x7f0c0115

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static HTTP_ERROR(Ljava/lang/String;)Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7
    .param p0, "extra"    # Ljava/lang/String;

    .prologue
    .line 79
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c0119

    const v3, 0x7f0c0117

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v5, p0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static NETWORK_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 63
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c011b

    const v3, 0x7f0c011a

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static NO_COMMENTS()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 55
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->INFORMATION:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c0078

    const v3, 0x7f0c0077

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static NO_ISSUES()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 51
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->INFORMATION:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c007b

    const v3, 0x7f0c0079

    const v4, 0x7f0c007a

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static PROTOCOL_ERROR()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 67
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->DANGER:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c011d

    const v3, 0x7f0c011c

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static VOTE_REVOKED()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 7

    .prologue
    .line 38
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    const v2, 0x7f0c011e

    const v3, 0x7f0c011f

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;IIILjava/lang/String;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static emptyNotice()Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    .locals 1

    .prologue
    .line 100
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    invoke-direct {v0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;-><init>()V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 105
    if-ne p0, p1, :cond_1

    .line 116
    :cond_0
    :goto_0
    return v1

    .line 106
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 108
    check-cast v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;

    .line 110
    .local v0, "that":Lcom/seeclickfix/ma/android/fragments/NoticeItem;
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->extra:Ljava/lang/String;

    iget-object v4, v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->extra:Ljava/lang/String;

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 111
    :cond_4
    iget v3, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->action:I

    iget v4, v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->action:I

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 112
    :cond_5
    iget v3, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->body:I

    iget v4, v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->body:I

    if-eq v3, v4, :cond_6

    move v1, v2

    goto :goto_0

    .line 113
    :cond_6
    iget v3, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->title:I

    iget v4, v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->title:I

    if-eq v3, v4, :cond_7

    move v1, v2

    goto :goto_0

    .line 114
    :cond_7
    iget-object v3, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->level:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    iget-object v4, v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->level:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getAction()I
    .locals 1

    .prologue
    .line 139
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->action:I

    return v0
.end method

.method public getBody()I
    .locals 1

    .prologue
    .line 135
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->body:I

    return v0
.end method

.method public getExtra()Ljava/lang/String;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->extra:Ljava/lang/String;

    return-object v0
.end method

.method public getLevel()Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->level:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    return-object v0
.end method

.method public getListener()Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->listener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public getTitle()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->title:I

    return v0
.end method

.method public getZeroBasedIndex()I
    .locals 1

    .prologue
    .line 187
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->index:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 121
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->index:I

    .line 122
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->title:I

    add-int v0, v1, v2

    .line 123
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->body:I

    add-int v0, v1, v2

    .line 124
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->extra:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 125
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->level:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    invoke-virtual {v2}, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 126
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->action:I

    add-int v0, v1, v2

    .line 127
    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 150
    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->title:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->body:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->extra:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->action:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isError()Z
    .locals 1

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSuccess()Z
    .locals 2

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getLevel()Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    move-result-object v0

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->SUCCESS:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getLevel()Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    move-result-object v0

    sget-object v1, Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;->INFORMATION:Lcom/seeclickfix/ma/android/fragments/NoticeItem$Level;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->listener:Landroid/view/View$OnClickListener;

    .line 167
    return-void
.end method

.method public setZeroBasedIndex(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 192
    iput p1, p0, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->index:I

    .line 193
    return-void
.end method

.method public showDialog(Landroid/support/v4/app/Fragment;)V
    .locals 1
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 174
    new-instance v0, Lcom/seeclickfix/ma/android/fragments/NoticeItem$1;

    invoke-direct {v0, p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem$1;-><init>(Lcom/seeclickfix/ma/android/fragments/NoticeItem;)V

    invoke-static {p1, p0, v0}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->showNotice(Landroid/support/v4/app/Fragment;Lcom/seeclickfix/ma/android/fragments/NoticeItem;Ljava/lang/Runnable;)V

    .line 179
    return-void
.end method

.method public showDialog(Landroid/support/v4/app/Fragment;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p2, "afterConfirm"    # Ljava/lang/Runnable;

    .prologue
    .line 170
    invoke-static {p1, p0, p2}, Lcom/seeclickfix/ma/android/dialogs/ConfirmationDialog;->showNotice(Landroid/support/v4/app/Fragment;Lcom/seeclickfix/ma/android/fragments/NoticeItem;Ljava/lang/Runnable;)V

    .line 171
    return-void
.end method

.method public showToast(Landroid/support/v4/app/Fragment;)V
    .locals 2
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 182
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/seeclickfix/ma/android/fragments/NoticeItem;->getTitle()I

    move-result v1

    invoke-static {v0, v1}, Lcom/seeclickfix/ma/android/views/ToastFactory;->showCenteredLong(Landroid/content/Context;I)V

    .line 183
    return-void
.end method
