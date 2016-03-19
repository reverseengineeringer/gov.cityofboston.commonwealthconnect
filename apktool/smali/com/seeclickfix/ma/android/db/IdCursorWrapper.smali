.class public Lcom/seeclickfix/ma/android/db/IdCursorWrapper;
.super Landroid/database/CursorWrapper;
.source "IdCursorWrapper.java"


# instance fields
.field private idColumnIndex:I


# direct methods
.method public constructor <init>(Landroid/database/Cursor;I)V
    .locals 0
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "idColumnIndex"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    .line 34
    iput p2, p0, Lcom/seeclickfix/ma/android/db/IdCursorWrapper;->idColumnIndex:I

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;Ljava/lang/String;)V
    .locals 1
    .param p1, "c"    # Landroid/database/Cursor;
    .param p2, "idColumnName"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    .line 47
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/seeclickfix/ma/android/db/IdCursorWrapper;->idColumnIndex:I

    .line 48
    return-void
.end method


# virtual methods
.method public getColumnIndex(Ljava/lang/String;)I
    .locals 2
    .param p1, "columnName"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-super {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 54
    .local v0, "index":I
    if-gez v0, :cond_0

    const-string/jumbo v1, "_id"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    iget v0, p0, Lcom/seeclickfix/ma/android/db/IdCursorWrapper;->idColumnIndex:I

    .line 57
    :cond_0
    return v0
.end method

.method public getColumnIndexOrThrow(Ljava/lang/String;)I
    .locals 1
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lcom/seeclickfix/ma/android/db/IdCursorWrapper;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 66
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 70
    .end local v0    # "index":I
    :goto_0
    return v0

    .restart local v0    # "index":I
    :cond_0
    invoke-super {p0, p1}, Landroid/database/CursorWrapper;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method
