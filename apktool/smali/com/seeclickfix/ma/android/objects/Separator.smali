.class public Lcom/seeclickfix/ma/android/objects/Separator;
.super Ljava/lang/Object;
.source "Separator.java"

# interfaces
.implements Lcom/seeclickfix/ma/android/objects/types/FeedItem;


# instance fields
.field private iconRes:I

.field private transient index:I

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getIconRes()I
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/Separator;->iconRes:I

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/seeclickfix/ma/android/objects/Separator;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getZeroBasedIndex()I
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lcom/seeclickfix/ma/android/objects/Separator;->index:I

    return v0
.end method

.method public setIconRes(I)V
    .locals 0
    .param p1, "iconRes"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/Separator;->iconRes:I

    .line 29
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/seeclickfix/ma/android/objects/Separator;->text:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public setZeroBasedIndex(I)V
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/seeclickfix/ma/android/objects/Separator;->index:I

    .line 47
    return-void
.end method
