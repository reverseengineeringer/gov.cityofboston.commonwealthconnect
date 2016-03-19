.class Lcom/j256/ormlite/stmt/mapped/MappedCreate$KeyHolder;
.super Ljava/lang/Object;
.source "MappedCreate.java"

# interfaces
.implements Lcom/j256/ormlite/support/GeneratedKeyHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/j256/ormlite/stmt/mapped/MappedCreate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "KeyHolder"
.end annotation


# instance fields
.field key:Ljava/lang/Number;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/j256/ormlite/stmt/mapped/MappedCreate$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/j256/ormlite/stmt/mapped/MappedCreate$1;

    .prologue
    .line 251
    invoke-direct {p0}, Lcom/j256/ormlite/stmt/mapped/MappedCreate$KeyHolder;-><init>()V

    return-void
.end method


# virtual methods
.method public addKey(Ljava/lang/Number;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 259
    iget-object v0, p0, Lcom/j256/ormlite/stmt/mapped/MappedCreate$KeyHolder;->key:Ljava/lang/Number;

    if-nez v0, :cond_0

    .line 260
    iput-object p1, p0, Lcom/j256/ormlite/stmt/mapped/MappedCreate$KeyHolder;->key:Ljava/lang/Number;

    .line 264
    return-void

    .line 262
    :cond_0
    new-instance v0, Ljava/sql/SQLException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "generated key has already been set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/j256/ormlite/stmt/mapped/MappedCreate$KeyHolder;->key:Ljava/lang/Number;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", now set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getKey()Ljava/lang/Number;
    .locals 1

    .prologue
    .line 255
    iget-object v0, p0, Lcom/j256/ormlite/stmt/mapped/MappedCreate$KeyHolder;->key:Ljava/lang/Number;

    return-object v0
.end method
