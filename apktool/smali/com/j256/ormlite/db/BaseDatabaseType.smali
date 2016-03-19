.class public abstract Lcom/j256/ormlite/db/BaseDatabaseType;
.super Ljava/lang/Object;
.source "BaseDatabaseType.java"

# interfaces
.implements Lcom/j256/ormlite/db/DatabaseType;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/j256/ormlite/db/BaseDatabaseType$1;,
        Lcom/j256/ormlite/db/BaseDatabaseType$BooleanNumberFieldConverter;
    }
.end annotation


# static fields
.field protected static DEFAULT_SEQUENCE_SUFFIX:Ljava/lang/String;


# instance fields
.field protected driver:Ljava/sql/Driver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string/jumbo v0, "_id_seq"

    sput-object v0, Lcom/j256/ormlite/db/BaseDatabaseType;->DEFAULT_SEQUENCE_SUFFIX:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 509
    return-void
.end method

.method private addSingleUnique(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 499
    .local p3, "additionalArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "statementsAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 500
    .local v0, "alterSb":Ljava/lang/StringBuilder;
    const-string/jumbo v1, " UNIQUE ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    invoke-virtual {p2}, Lcom/j256/ormlite/field/FieldType;->getColumnName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendEscapedEntityName(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 502
    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 504
    return-void
.end method

.method private appendCanBeNull(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;)V
    .locals 0
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;

    .prologue
    .line 492
    return-void
.end method

.method private appendDefaultValue(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/lang/Object;)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 268
    invoke-virtual {p2}, Lcom/j256/ormlite/field/FieldType;->isEscapedDefaultValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendEscapedWord(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 273
    :goto_0
    return-void

    .line 271
    :cond_0
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private appendDoubleType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 240
    const-string/jumbo v0, "DOUBLE PRECISION"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    return-void
.end method

.method private appendFloatType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 233
    const-string/jumbo v0, "FLOAT"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    return-void
.end method

.method private appendIntegerType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 219
    const-string/jumbo v0, "INTEGER"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    return-void
.end method


# virtual methods
.method public addPrimaryKeySql([Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 6
    .param p1, "fieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 313
    .local p2, "additionalArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "statementsBefore":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "statementsAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "queriesAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 314
    .local v4, "sb":Ljava/lang/StringBuilder;
    move-object v0, p1

    .local v0, "arr$":[Lcom/j256/ormlite/field/FieldType;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 315
    .local v1, "fieldType":Lcom/j256/ormlite/field/FieldType;
    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->isGeneratedId()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->generatedIdSqlAtEnd()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->isSelfGeneratedId()Z

    move-result v5

    if-nez v5, :cond_1

    .line 314
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 317
    :cond_1
    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->isId()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 318
    if-nez v4, :cond_2

    .line 319
    new-instance v4, Ljava/lang/StringBuilder;

    .end local v4    # "sb":Ljava/lang/StringBuilder;
    const/16 v5, 0x30

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 320
    .restart local v4    # "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v5, "PRIMARY KEY ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    :goto_2
    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->getColumnName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendEscapedEntityName(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_1

    .line 322
    :cond_2
    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 327
    .end local v1    # "fieldType":Lcom/j256/ormlite/field/FieldType;
    :cond_3
    if-eqz v4, :cond_4

    .line 328
    const-string/jumbo v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    :cond_4
    return-void
.end method

.method public addUniqueComboSql([Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 6
    .param p1, "fieldTypes"    # [Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 343
    .local p2, "additionalArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "statementsBefore":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "statementsAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "queriesAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 344
    .local v4, "sb":Ljava/lang/StringBuilder;
    move-object v0, p1

    .local v0, "arr$":[Lcom/j256/ormlite/field/FieldType;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 345
    .local v1, "fieldType":Lcom/j256/ormlite/field/FieldType;
    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->isUniqueCombo()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 346
    if-nez v4, :cond_1

    .line 347
    new-instance v4, Ljava/lang/StringBuilder;

    .end local v4    # "sb":Ljava/lang/StringBuilder;
    const/16 v5, 0x30

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 348
    .restart local v4    # "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v5, "UNIQUE ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    :goto_1
    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->getColumnName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendEscapedEntityName(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 344
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 350
    :cond_1
    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 355
    .end local v1    # "fieldType":Lcom/j256/ormlite/field/FieldType;
    :cond_2
    if-eqz v4, :cond_3

    .line 356
    const-string/jumbo v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    :cond_3
    return-void
.end method

.method protected appendBigDecimalNumericType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 261
    const-string/jumbo v0, "NUMERIC"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    return-void
.end method

.method protected appendBooleanType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 191
    const-string/jumbo v0, "BOOLEAN"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    return-void
.end method

.method protected appendByteArrayType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 247
    const-string/jumbo v0, "BLOB"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    return-void
.end method

.method protected appendByteType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 205
    const-string/jumbo v0, "TINYINT"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    return-void
.end method

.method protected appendCharType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 198
    const-string/jumbo v0, "CHAR"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    return-void
.end method

.method public appendColumnArg(Ljava/lang/String;Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 15
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .param p3, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/StringBuilder;",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 57
    .local p4, "additionalArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "statementsBefore":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p6, "statementsAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p7, "queriesAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->getColumnName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {p0, v0, v4}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendEscapedEntityName(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 58
    const/16 v4, 0x20

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v12

    .line 61
    .local v12, "dataPersister":Lcom/j256/ormlite/field/DataPersister;
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->getWidth()I

    move-result v14

    .line 62
    .local v14, "fieldWidth":I
    if-nez v14, :cond_0

    .line 64
    invoke-interface {v12}, Lcom/j256/ormlite/field/DataPersister;->getDefaultWidth()I

    move-result v14

    .line 66
    :cond_0
    sget-object v4, Lcom/j256/ormlite/db/BaseDatabaseType$1;->$SwitchMap$com$j256$ormlite$field$SqlType:[I

    invoke-interface {v12}, Lcom/j256/ormlite/field/DataPersister;->getSqlType()Lcom/j256/ormlite/field/SqlType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/j256/ormlite/field/SqlType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 127
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Unknown SQL-type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v12}, Lcom/j256/ormlite/field/DataPersister;->getSqlType()Lcom/j256/ormlite/field/SqlType;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 69
    :pswitch_0
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendStringType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    .line 129
    :goto_0
    const/16 v4, 0x20

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isGeneratedIdSequence()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isSelfGeneratedId()Z

    move-result v4

    if-nez v4, :cond_4

    move-object v4, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p5

    move-object/from16 v8, p4

    move-object/from16 v9, p7

    .line 136
    invoke-virtual/range {v4 .. v9}, Lcom/j256/ormlite/db/BaseDatabaseType;->configureGeneratedIdSequence(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 144
    :cond_1
    :goto_1
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isGeneratedId()Z

    move-result v4

    if-nez v4, :cond_3

    .line 145
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->getDefaultValue()Ljava/lang/Object;

    move-result-object v13

    .line 146
    .local v13, "defaultValue":Ljava/lang/Object;
    if-eqz v13, :cond_2

    .line 147
    const-string/jumbo v4, "DEFAULT "

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {p0, v0, v1, v13}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendDefaultValue(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/lang/Object;)V

    .line 149
    const/16 v4, 0x20

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    :cond_2
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isCanBeNull()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 152
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {p0, v0, v1}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendCanBeNull(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;)V

    .line 156
    :goto_2
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isUnique()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 157
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p6

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/j256/ormlite/db/BaseDatabaseType;->addSingleUnique(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;)V

    .line 160
    .end local v13    # "defaultValue":Ljava/lang/Object;
    :cond_3
    return-void

    .line 73
    :pswitch_1
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendLongStringType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto :goto_0

    .line 77
    :pswitch_2
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendBooleanType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto :goto_0

    .line 81
    :pswitch_3
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendDateType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto :goto_0

    .line 85
    :pswitch_4
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendCharType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 89
    :pswitch_5
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendByteType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 93
    :pswitch_6
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendByteArrayType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 97
    :pswitch_7
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendShortType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 101
    :pswitch_8
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendIntegerType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 105
    :pswitch_9
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendLongType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 109
    :pswitch_a
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendFloatType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 113
    :pswitch_b
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendDoubleType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 117
    :pswitch_c
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendSerializableType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 121
    :pswitch_d
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-virtual {p0, v0, v1, v14}, Lcom/j256/ormlite/db/BaseDatabaseType;->appendBigDecimalNumericType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V

    goto/16 :goto_0

    .line 137
    :cond_4
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isGeneratedId()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isSelfGeneratedId()Z

    move-result v4

    if-nez v4, :cond_5

    move-object v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p4

    move-object/from16 v11, p7

    .line 138
    invoke-virtual/range {v4 .. v11}, Lcom/j256/ormlite/db/BaseDatabaseType;->configureGeneratedId(Ljava/lang/String;Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto/16 :goto_1

    .line 140
    :cond_5
    invoke-virtual/range {p3 .. p3}, Lcom/j256/ormlite/field/FieldType;->isId()Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v4, p0

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p5

    move-object/from16 v8, p4

    move-object/from16 v9, p7

    .line 141
    invoke-virtual/range {v4 .. v9}, Lcom/j256/ormlite/db/BaseDatabaseType;->configureId(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto/16 :goto_1

    .line 154
    .restart local v13    # "defaultValue":Ljava/lang/Object;
    :cond_6
    const-string/jumbo v4, "NOT NULL "

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 66
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method public appendCreateTableSuffix(Ljava/lang/StringBuilder;)V
    .locals 0
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 429
    return-void
.end method

.method protected appendDateType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 184
    const-string/jumbo v0, "TIMESTAMP"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    return-void
.end method

.method public appendEscapedEntityName(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x60

    .line 370
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 371
    return-void
.end method

.method public appendEscapedWord(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "word"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x27

    .line 366
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 367
    return-void
.end method

.method public appendLimitValue(Ljava/lang/StringBuilder;JLjava/lang/Long;)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "limit"    # J
    .param p4, "offset"    # Ljava/lang/Long;

    .prologue
    .line 416
    const-string/jumbo v0, "LIMIT "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 417
    return-void
.end method

.method protected appendLongStringType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 177
    const-string/jumbo v0, "TEXT"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    return-void
.end method

.method protected appendLongType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 226
    const-string/jumbo v0, "BIGINT"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    return-void
.end method

.method public appendOffsetValue(Ljava/lang/StringBuilder;J)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "offset"    # J

    .prologue
    .line 420
    const-string/jumbo v0, "OFFSET "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 421
    return-void
.end method

.method public appendSelectNextValFromSequence(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 0
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "sequenceName"    # Ljava/lang/String;

    .prologue
    .line 425
    return-void
.end method

.method protected appendSerializableType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 254
    const-string/jumbo v0, "BLOB"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    return-void
.end method

.method protected appendShortType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 1
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 212
    const-string/jumbo v0, "SMALLINT"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    return-void
.end method

.method protected appendStringType(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;I)V
    .locals 2
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .param p3, "fieldWidth"    # I

    .prologue
    .line 166
    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->isVarcharFieldWidthSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    const-string/jumbo v0, "VARCHAR("

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    :goto_0
    return-void

    .line 169
    :cond_0
    const-string/jumbo v0, "VARCHAR"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method protected configureGeneratedId(Ljava/lang/String;Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "sb"    # Ljava/lang/StringBuilder;
    .param p3, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/StringBuilder;",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 296
    .local p4, "statementsBefore":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "statementsAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p6, "additionalArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p7, "queriesAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GeneratedId is not supported by database "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->getDatabaseName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " for field "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected configureGeneratedIdSequence(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 283
    .local p3, "statementsBefore":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "additionalArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "queriesAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/sql/SQLException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GeneratedIdSequence is not supported by database "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->getDatabaseName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " for field "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected configureId(Ljava/lang/StringBuilder;Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 309
    .local p3, "statementsBefore":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p4, "additionalArgs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p5, "queriesAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public dropColumnArg(Lcom/j256/ormlite/field/FieldType;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .param p1, "fieldType"    # Lcom/j256/ormlite/field/FieldType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/field/FieldType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 363
    .local p2, "statementsBefore":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p3, "statementsAfter":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public extractDatabaseTableConfig(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/table/DatabaseTableConfig;
    .locals 1
    .param p1, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lcom/j256/ormlite/table/DatabaseTableConfig",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 482
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method public generateIdSequenceName(Ljava/lang/String;Lcom/j256/ormlite/field/FieldType;)Ljava/lang/String;
    .locals 3
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "idFieldType"    # Lcom/j256/ormlite/field/FieldType;

    .prologue
    .line 374
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/j256/ormlite/db/BaseDatabaseType;->DEFAULT_SEQUENCE_SUFFIX:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 375
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->isEntityNamesMustBeUpCase()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 376
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 378
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method protected generatedIdSqlAtEnd()Z
    .locals 1

    .prologue
    .line 338
    const/4 v0, 0x1

    return v0
.end method

.method public getCommentLinePrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 383
    const-string/jumbo v0, "-- "

    return-object v0
.end method

.method protected abstract getDriverClassName()Ljava/lang/String;
.end method

.method public getFieldConverter(Lcom/j256/ormlite/field/DataPersister;)Lcom/j256/ormlite/field/FieldConverter;
    .locals 0
    .param p1, "dataPersister"    # Lcom/j256/ormlite/field/DataPersister;

    .prologue
    .line 388
    return-object p1
.end method

.method public getPingStatement()Ljava/lang/String;
    .locals 1

    .prologue
    .line 448
    const-string/jumbo v0, "SELECT 1"

    return-object v0
.end method

.method public isAllowGeneratedIdInsertSupported()Z
    .locals 1

    .prologue
    .line 472
    const/4 v0, 0x1

    return v0
.end method

.method public isBatchUseTransaction()Z
    .locals 1

    .prologue
    .line 452
    const/4 v0, 0x0

    return v0
.end method

.method public isCreateIfNotExistsSupported()Z
    .locals 1

    .prologue
    .line 460
    const/4 v0, 0x0

    return v0
.end method

.method public isCreateIndexIfNotExistsSupported()Z
    .locals 1

    .prologue
    .line 464
    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->isCreateIfNotExistsSupported()Z

    move-result v0

    return v0
.end method

.method public isCreateTableReturnsNegative()Z
    .locals 1

    .prologue
    .line 436
    const/4 v0, 0x0

    return v0
.end method

.method public isCreateTableReturnsZero()Z
    .locals 1

    .prologue
    .line 432
    const/4 v0, 0x1

    return v0
.end method

.method public isEntityNamesMustBeUpCase()Z
    .locals 1

    .prologue
    .line 440
    const/4 v0, 0x0

    return v0
.end method

.method public isIdSequenceNeeded()Z
    .locals 1

    .prologue
    .line 392
    const/4 v0, 0x0

    return v0
.end method

.method public isLimitAfterSelect()Z
    .locals 1

    .prologue
    .line 412
    const/4 v0, 0x0

    return v0
.end method

.method public isLimitSqlSupported()Z
    .locals 1

    .prologue
    .line 400
    const/4 v0, 0x1

    return v0
.end method

.method public isNestedSavePointsSupported()Z
    .locals 1

    .prologue
    .line 444
    const/4 v0, 0x1

    return v0
.end method

.method public isOffsetLimitArgument()Z
    .locals 1

    .prologue
    .line 408
    const/4 v0, 0x0

    return v0
.end method

.method public isOffsetSqlSupported()Z
    .locals 1

    .prologue
    .line 404
    const/4 v0, 0x1

    return v0
.end method

.method public isSelectSequenceBeforeInsert()Z
    .locals 1

    .prologue
    .line 468
    const/4 v0, 0x0

    return v0
.end method

.method public isTruncateSupported()Z
    .locals 1

    .prologue
    .line 456
    const/4 v0, 0x0

    return v0
.end method

.method public isVarcharFieldWidthSupported()Z
    .locals 1

    .prologue
    .line 396
    const/4 v0, 0x1

    return v0
.end method

.method public loadDriver()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->getDriverClassName()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 43
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :cond_0
    return-void

    .line 44
    :catch_0
    move-exception v1

    .line 45
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Driver class was not found for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/j256/ormlite/db/BaseDatabaseType;->getDatabaseName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " database.  Missing jar with class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v2

    throw v2
.end method

.method public setDriver(Ljava/sql/Driver;)V
    .locals 0
    .param p1, "driver"    # Ljava/sql/Driver;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/j256/ormlite/db/BaseDatabaseType;->driver:Ljava/sql/Driver;

    .line 53
    return-void
.end method
