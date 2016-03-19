.class public Lcom/j256/ormlite/field/types/ByteArrayType;
.super Lcom/j256/ormlite/field/types/BaseDataType;
.source "ByteArrayType.java"


# static fields
.field private static final singleTon:Lcom/j256/ormlite/field/types/ByteArrayType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    new-instance v0, Lcom/j256/ormlite/field/types/ByteArrayType;

    invoke-direct {v0}, Lcom/j256/ormlite/field/types/ByteArrayType;-><init>()V

    sput-object v0, Lcom/j256/ormlite/field/types/ByteArrayType;->singleTon:Lcom/j256/ormlite/field/types/ByteArrayType;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 24
    sget-object v0, Lcom/j256/ormlite/field/SqlType;->BYTE_ARRAY:Lcom/j256/ormlite/field/SqlType;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/field/types/BaseDataType;-><init>(Lcom/j256/ormlite/field/SqlType;[Ljava/lang/Class;)V

    .line 25
    return-void
.end method

.method protected constructor <init>(Lcom/j256/ormlite/field/SqlType;[Ljava/lang/Class;)V
    .locals 0
    .param p1, "sqlType"    # Lcom/j256/ormlite/field/SqlType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/field/SqlType;",
            "[",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p2, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Lcom/j256/ormlite/field/types/BaseDataType;-><init>(Lcom/j256/ormlite/field/SqlType;[Ljava/lang/Class;)V

    .line 32
    return-void
.end method

.method public static getSingleton()Lcom/j256/ormlite/field/types/ByteArrayType;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/j256/ormlite/field/types/ByteArrayType;->singleTon:Lcom/j256/ormlite/field/types/ByteArrayType;

    return-object v0
.end method


# virtual methods
.method public dataIsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "fieldObj1"    # Ljava/lang/Object;
    .param p2, "fieldObj2"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 56
    if-nez p1, :cond_1

    .line 57
    if-nez p2, :cond_0

    const/4 v0, 0x1

    .line 61
    .end local p1    # "fieldObj1":Ljava/lang/Object;
    .end local p2    # "fieldObj2":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .line 58
    .restart local p1    # "fieldObj1":Ljava/lang/Object;
    .restart local p2    # "fieldObj2":Ljava/lang/Object;
    :cond_1
    if-eqz p2, :cond_0

    .line 61
    check-cast p1, [B

    .end local p1    # "fieldObj1":Ljava/lang/Object;
    check-cast p1, [B

    check-cast p2, [B

    .end local p2    # "fieldObj2":Ljava/lang/Object;
    check-cast p2, [B

    invoke-static {p1, p2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    goto :goto_0
.end method

.method public getPrimaryClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 72
    const-class v0, [B

    return-object v0
.end method

.method public isAppropriateId()Z
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x0

    return v0
.end method

.method public isArgumentHolderRequired()Z
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x1

    return v0
.end method

.method public parseDefaultString(Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p2, "defaultStr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 36
    new-instance v0, Ljava/sql/SQLException;

    const-string/jumbo v1, "byte[] type cannot have default values"

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resultStringToJava(Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 2
    .param p1, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p2, "stringValue"    # Ljava/lang/String;
    .param p3, "columnPos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Ljava/sql/SQLException;

    const-string/jumbo v1, "byte[] type cannot be converted from string to Java"

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resultToSqlArg(Lcom/j256/ormlite/field/FieldType;Lcom/j256/ormlite/support/DatabaseResults;I)Ljava/lang/Object;
    .locals 1
    .param p1, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p2, "results"    # Lcom/j256/ormlite/support/DatabaseResults;
    .param p3, "columnPos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-interface {p2, p3}, Lcom/j256/ormlite/support/DatabaseResults;->getBytes(I)[B

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method
