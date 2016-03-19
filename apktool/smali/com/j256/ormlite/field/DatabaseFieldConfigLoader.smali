.class public Lcom/j256/ormlite/field/DatabaseFieldConfigLoader;
.super Ljava/lang/Object;
.source "DatabaseFieldConfigLoader.java"


# static fields
.field private static final CONFIG_FILE_END_MARKER:Ljava/lang/String; = "# --field-end--"

.field private static final CONFIG_FILE_START_MARKER:Ljava/lang/String; = "# --field-start--"

.field private static final DEFAULT_DATA_PERSISTER:Lcom/j256/ormlite/field/DataPersister;

.field private static final DEFAULT_MAX_EAGER_FOREIGN_COLLECTION_LEVEL:I = 0x1

.field private static final FIELD_NAME_ALLOW_GENERATED_ID_INSERT:Ljava/lang/String; = "allowGeneratedIdInsert"

.field private static final FIELD_NAME_CAN_BE_NULL:Ljava/lang/String; = "canBeNull"

.field private static final FIELD_NAME_COLUMN_DEFINITION:Ljava/lang/String; = "columnDefinition"

.field private static final FIELD_NAME_COLUMN_NAME:Ljava/lang/String; = "columnName"

.field private static final FIELD_NAME_DATA_PERSISTER:Ljava/lang/String; = "dataPersister"

.field private static final FIELD_NAME_DEFAULT_VALUE:Ljava/lang/String; = "defaultValue"

.field private static final FIELD_NAME_FIELD_NAME:Ljava/lang/String; = "fieldName"

.field private static final FIELD_NAME_FOREIGN:Ljava/lang/String; = "foreign"

.field private static final FIELD_NAME_FOREIGN_AUTO_CREATE:Ljava/lang/String; = "foreignAutoCreate"

.field private static final FIELD_NAME_FOREIGN_AUTO_REFRESH:Ljava/lang/String; = "foreignAutoRefresh"

.field private static final FIELD_NAME_FOREIGN_COLLECTION:Ljava/lang/String; = "foreignCollection"

.field private static final FIELD_NAME_FOREIGN_COLLECTION_COLUMN_NAME:Ljava/lang/String; = "foreignCollectionColumnName"

.field private static final FIELD_NAME_FOREIGN_COLLECTION_EAGER:Ljava/lang/String; = "foreignCollectionEager"

.field private static final FIELD_NAME_FOREIGN_COLLECTION_FOREIGN_FIELD_NAME:Ljava/lang/String; = "foreignCollectionForeignFieldName"

.field private static final FIELD_NAME_FOREIGN_COLLECTION_FOREIGN_FIELD_NAME_OLD:Ljava/lang/String; = "foreignCollectionForeignColumnName"

.field private static final FIELD_NAME_FOREIGN_COLLECTION_ORDER_ASCENDING:Ljava/lang/String; = "foreignCollectionOrderAscending"

.field private static final FIELD_NAME_FOREIGN_COLLECTION_ORDER_COLUMN_NAME:Ljava/lang/String; = "foreignCollectionOrderColumnName"

.field private static final FIELD_NAME_FOREIGN_COLLECTION_ORDER_COLUMN_NAME_OLD:Ljava/lang/String; = "foreignCollectionOrderColumn"

.field private static final FIELD_NAME_FOREIGN_COLUMN_NAME:Ljava/lang/String; = "foreignColumnName"

.field private static final FIELD_NAME_FORMAT:Ljava/lang/String; = "format"

.field private static final FIELD_NAME_GENERATED_ID:Ljava/lang/String; = "generatedId"

.field private static final FIELD_NAME_GENERATED_ID_SEQUENCE:Ljava/lang/String; = "generatedIdSequence"

.field private static final FIELD_NAME_ID:Ljava/lang/String; = "id"

.field private static final FIELD_NAME_INDEX:Ljava/lang/String; = "index"

.field private static final FIELD_NAME_INDEX_NAME:Ljava/lang/String; = "indexName"

.field private static final FIELD_NAME_MAX_EAGER_FOREIGN_COLLECTION_LEVEL:Ljava/lang/String; = "foreignCollectionMaxEagerLevel"

.field private static final FIELD_NAME_MAX_EAGER_FOREIGN_COLLECTION_LEVEL_OLD:Ljava/lang/String; = "maxEagerForeignCollectionLevel"

.field private static final FIELD_NAME_MAX_FOREIGN_AUTO_REFRESH_LEVEL:Ljava/lang/String; = "maxForeignAutoRefreshLevel"

.field private static final FIELD_NAME_PERSISTER_CLASS:Ljava/lang/String; = "persisterClass"

.field private static final FIELD_NAME_READ_ONLY:Ljava/lang/String; = "readOnly"

.field private static final FIELD_NAME_THROW_IF_NULL:Ljava/lang/String; = "throwIfNull"

.field private static final FIELD_NAME_UNIQUE:Ljava/lang/String; = "unique"

.field private static final FIELD_NAME_UNIQUE_COMBO:Ljava/lang/String; = "uniqueCombo"

.field private static final FIELD_NAME_UNIQUE_INDEX:Ljava/lang/String; = "uniqueIndex"

.field private static final FIELD_NAME_UNIQUE_INDEX_NAME:Ljava/lang/String; = "uniqueIndexName"

.field private static final FIELD_NAME_UNKNOWN_ENUM_VALUE:Ljava/lang/String; = "unknownEnumValue"

.field private static final FIELD_NAME_USE_GET_SET:Ljava/lang/String; = "useGetSet"

.field private static final FIELD_NAME_VERSION:Ljava/lang/String; = "version"

.field private static final FIELD_NAME_WIDTH:Ljava/lang/String; = "width"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/j256/ormlite/field/DatabaseFieldConfig;->DEFAULT_DATA_TYPE:Lcom/j256/ormlite/field/DataType;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DataType;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v0

    sput-object v0, Lcom/j256/ormlite/field/DatabaseFieldConfigLoader;->DEFAULT_DATA_PERSISTER:Lcom/j256/ormlite/field/DataPersister;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fromReader(Ljava/io/BufferedReader;)Lcom/j256/ormlite/field/DatabaseFieldConfig;
    .locals 8
    .param p0, "reader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 30
    new-instance v1, Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-direct {v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;-><init>()V

    .line 31
    .local v1, "config":Lcom/j256/ormlite/field/DatabaseFieldConfig;
    const/4 v0, 0x0

    .line 35
    .local v0, "anything":Z
    :cond_0
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 39
    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 58
    :cond_1
    if-eqz v0, :cond_4

    .line 62
    .end local v1    # "config":Lcom/j256/ormlite/field/DatabaseFieldConfig;
    :goto_1
    return-object v1

    .line 36
    .end local v3    # "line":Ljava/lang/String;
    .restart local v1    # "config":Lcom/j256/ormlite/field/DatabaseFieldConfig;
    :catch_0
    move-exception v2

    .line 37
    .local v2, "e":Ljava/io/IOException;
    const-string/jumbo v5, "Could not read DatabaseFieldConfig from stream"

    invoke-static {v5, v2}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v5

    throw v5

    .line 43
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "line":Ljava/lang/String;
    :cond_2
    const-string/jumbo v5, "# --field-end--"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 47
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    const-string/jumbo v5, "#"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string/jumbo v5, "# --field-start--"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 50
    const-string/jumbo v5, "="

    const/4 v6, -0x2

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 51
    .local v4, "parts":[Ljava/lang/String;
    array-length v5, v4

    const/4 v6, 0x2

    if-eq v5, v6, :cond_3

    .line 52
    new-instance v5, Ljava/sql/SQLException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "DatabaseFieldConfig reading from stream cannot parse line: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 54
    :cond_3
    const/4 v5, 0x0

    aget-object v5, v4, v5

    const/4 v6, 0x1

    aget-object v6, v4, v6

    invoke-static {v1, v5, v6}, Lcom/j256/ormlite/field/DatabaseFieldConfigLoader;->readField(Lcom/j256/ormlite/field/DatabaseFieldConfig;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const/4 v0, 0x1

    .line 56
    goto :goto_0

    .line 62
    .end local v4    # "parts":[Ljava/lang/String;
    :cond_4
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private static readField(Lcom/j256/ormlite/field/DatabaseFieldConfig;Ljava/lang/String;Ljava/lang/String;)V
    .locals 15
    .param p0, "config"    # Lcom/j256/ormlite/field/DatabaseFieldConfig;
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 304
    const-string/jumbo v12, "fieldName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 305
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setFieldName(Ljava/lang/String;)V

    .line 421
    :cond_0
    :goto_0
    return-void

    .line 306
    :cond_1
    const-string/jumbo v12, "columnName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 307
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnName(Ljava/lang/String;)V

    goto :goto_0

    .line 308
    :cond_2
    const-string/jumbo v12, "dataPersister"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 309
    invoke-static/range {p2 .. p2}, Lcom/j256/ormlite/field/DataType;->valueOf(Ljava/lang/String;)Lcom/j256/ormlite/field/DataType;

    move-result-object v12

    invoke-virtual {v12}, Lcom/j256/ormlite/field/DataType;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDataPersister(Lcom/j256/ormlite/field/DataPersister;)V

    goto :goto_0

    .line 310
    :cond_3
    const-string/jumbo v12, "defaultValue"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 311
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDefaultValue(Ljava/lang/String;)V

    goto :goto_0

    .line 312
    :cond_4
    const-string/jumbo v12, "width"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 313
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setWidth(I)V

    goto :goto_0

    .line 314
    :cond_5
    const-string/jumbo v12, "canBeNull"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 315
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setCanBeNull(Z)V

    goto :goto_0

    .line 316
    :cond_6
    const-string/jumbo v12, "id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 317
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setId(Z)V

    goto :goto_0

    .line 318
    :cond_7
    const-string/jumbo v12, "generatedId"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8

    .line 319
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setGeneratedId(Z)V

    goto/16 :goto_0

    .line 320
    :cond_8
    const-string/jumbo v12, "generatedIdSequence"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 321
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setGeneratedIdSequence(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 322
    :cond_9
    const-string/jumbo v12, "foreign"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a

    .line 323
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeign(Z)V

    goto/16 :goto_0

    .line 324
    :cond_a
    const-string/jumbo v12, "useGetSet"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_b

    .line 325
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUseGetSet(Z)V

    goto/16 :goto_0

    .line 326
    :cond_b
    const-string/jumbo v12, "unknownEnumValue"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_10

    .line 327
    const-string/jumbo v12, "#"

    const/4 v13, -0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v11

    .line 328
    .local v11, "parts":[Ljava/lang/String;
    array-length v12, v11

    const/4 v13, 0x2

    if-eq v12, v13, :cond_c

    .line 329
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Invalid value for unknownEnumValue which should be in class#name format: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 334
    :cond_c
    const/4 v12, 0x0

    :try_start_0
    aget-object v12, v11, v12

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 338
    .local v5, "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v5}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v3

    .line 339
    .local v3, "consts":[Ljava/lang/Object;
    if-nez v3, :cond_d

    .line 340
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Invalid class is not an Enum for unknownEnumValue: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 335
    .end local v3    # "consts":[Ljava/lang/Object;
    .end local v5    # "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v4

    .line 336
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Unknown class specified for unknownEnumValue: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 343
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v3    # "consts":[Ljava/lang/Object;
    .restart local v5    # "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_d
    check-cast v3, [Ljava/lang/Enum;

    .end local v3    # "consts":[Ljava/lang/Object;
    move-object v6, v3

    check-cast v6, [Ljava/lang/Enum;

    .line 344
    .local v6, "enumConstants":[Ljava/lang/Enum;
    const/4 v8, 0x0

    .line 345
    .local v8, "found":Z
    move-object v1, v6

    .local v1, "arr$":[Ljava/lang/Enum;
    array-length v10, v1

    .local v10, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_1
    if-ge v9, v10, :cond_f

    aget-object v7, v1, v9

    .line 346
    .local v7, "enumInstance":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    invoke-virtual {v7}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    aget-object v13, v11, v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    .line 347
    invoke-virtual {p0, v7}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUnknownEnumValue(Ljava/lang/Enum;)V

    .line 348
    const/4 v8, 0x1

    .line 345
    :cond_e
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 351
    .end local v7    # "enumInstance":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    :cond_f
    if-nez v8, :cond_0

    .line 352
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Invalid enum value name for unknownEnumvalue: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 354
    .end local v1    # "arr$":[Ljava/lang/Enum;
    .end local v5    # "enumClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "enumConstants":[Ljava/lang/Enum;
    .end local v8    # "found":Z
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v11    # "parts":[Ljava/lang/String;
    :cond_10
    const-string/jumbo v12, "throwIfNull"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_11

    .line 355
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setThrowIfNull(Z)V

    goto/16 :goto_0

    .line 356
    :cond_11
    const-string/jumbo v12, "format"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_12

    .line 357
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setFormat(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 358
    :cond_12
    const-string/jumbo v12, "unique"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_13

    .line 359
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUnique(Z)V

    goto/16 :goto_0

    .line 360
    :cond_13
    const-string/jumbo v12, "uniqueCombo"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_14

    .line 361
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUniqueCombo(Z)V

    goto/16 :goto_0

    .line 362
    :cond_14
    const-string/jumbo v12, "index"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_15

    .line 363
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setIndex(Z)V

    goto/16 :goto_0

    .line 364
    :cond_15
    const-string/jumbo v12, "indexName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_16

    .line 365
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setIndex(Z)V

    .line 366
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setIndexName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 367
    :cond_16
    const-string/jumbo v12, "uniqueIndex"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_17

    .line 368
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUniqueIndex(Z)V

    goto/16 :goto_0

    .line 369
    :cond_17
    const-string/jumbo v12, "uniqueIndexName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_18

    .line 370
    const/4 v12, 0x1

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUniqueIndex(Z)V

    .line 371
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUniqueIndexName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 372
    :cond_18
    const-string/jumbo v12, "foreignAutoRefresh"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_19

    .line 373
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignAutoRefresh(Z)V

    goto/16 :goto_0

    .line 374
    :cond_19
    const-string/jumbo v12, "maxForeignAutoRefreshLevel"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1a

    .line 375
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setMaxForeignAutoRefreshLevel(I)V

    goto/16 :goto_0

    .line 376
    :cond_1a
    const-string/jumbo v12, "persisterClass"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1b

    .line 379
    :try_start_1
    invoke-static/range {p2 .. p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 380
    .local v2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/j256/ormlite/field/DataPersister;>;"
    invoke-virtual {p0, v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setPersisterClass(Ljava/lang/Class;)V
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 381
    .end local v2    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/j256/ormlite/field/DataPersister;>;"
    :catch_1
    move-exception v4

    .line 382
    .restart local v4    # "e":Ljava/lang/ClassNotFoundException;
    new-instance v12, Ljava/lang/IllegalArgumentException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Could not find persisterClass: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 384
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    :cond_1b
    const-string/jumbo v12, "allowGeneratedIdInsert"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1c

    .line 385
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setAllowGeneratedIdInsert(Z)V

    goto/16 :goto_0

    .line 386
    :cond_1c
    const-string/jumbo v12, "columnDefinition"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1d

    .line 387
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnDefinition(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 388
    :cond_1d
    const-string/jumbo v12, "foreignAutoCreate"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1e

    .line 389
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignAutoCreate(Z)V

    goto/16 :goto_0

    .line 390
    :cond_1e
    const-string/jumbo v12, "version"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1f

    .line 391
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setVersion(Z)V

    goto/16 :goto_0

    .line 392
    :cond_1f
    const-string/jumbo v12, "foreignColumnName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_20

    .line 393
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignColumnName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 394
    :cond_20
    const-string/jumbo v12, "readOnly"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_21

    .line 395
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setReadOnly(Z)V

    goto/16 :goto_0

    .line 400
    :cond_21
    const-string/jumbo v12, "foreignCollection"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_22

    .line 401
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollection(Z)V

    goto/16 :goto_0

    .line 402
    :cond_22
    const-string/jumbo v12, "foreignCollectionEager"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_23

    .line 403
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionEager(Z)V

    goto/16 :goto_0

    .line 404
    :cond_23
    const-string/jumbo v12, "maxEagerForeignCollectionLevel"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_24

    .line 405
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionMaxEagerLevel(I)V

    goto/16 :goto_0

    .line 406
    :cond_24
    const-string/jumbo v12, "foreignCollectionMaxEagerLevel"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_25

    .line 407
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionMaxEagerLevel(I)V

    goto/16 :goto_0

    .line 408
    :cond_25
    const-string/jumbo v12, "foreignCollectionColumnName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_26

    .line 409
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionColumnName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 410
    :cond_26
    const-string/jumbo v12, "foreignCollectionOrderColumn"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_27

    .line 411
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionOrderColumnName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 412
    :cond_27
    const-string/jumbo v12, "foreignCollectionOrderColumnName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_28

    .line 413
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionOrderColumnName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 414
    :cond_28
    const-string/jumbo v12, "foreignCollectionOrderAscending"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_29

    .line 415
    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v12

    invoke-virtual {p0, v12}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionOrderAscending(Z)V

    goto/16 :goto_0

    .line 416
    :cond_29
    const-string/jumbo v12, "foreignCollectionForeignColumnName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2a

    .line 417
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionForeignFieldName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 418
    :cond_2a
    const-string/jumbo v12, "foreignCollectionForeignFieldName"

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 419
    move-object/from16 v0, p2

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionForeignFieldName(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public static write(Ljava/io/BufferedWriter;Lcom/j256/ormlite/field/DatabaseFieldConfig;Ljava/lang/String;)V
    .locals 2
    .param p0, "writer"    # Ljava/io/BufferedWriter;
    .param p1, "config"    # Lcom/j256/ormlite/field/DatabaseFieldConfig;
    .param p2, "tableName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 71
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/j256/ormlite/field/DatabaseFieldConfigLoader;->writeConfig(Ljava/io/BufferedWriter;Lcom/j256/ormlite/field/DatabaseFieldConfig;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "Could not write config to writer"

    invoke-static {v1, v0}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v1

    throw v1
.end method

.method public static writeConfig(Ljava/io/BufferedWriter;Lcom/j256/ormlite/field/DatabaseFieldConfig;Ljava/lang/String;)V
    .locals 12
    .param p0, "writer"    # Ljava/io/BufferedWriter;
    .param p1, "config"    # Lcom/j256/ormlite/field/DatabaseFieldConfig;
    .param p2, "tableName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/16 v10, 0x3d

    .line 124
    const-string/jumbo v8, "# --field-start--"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 125
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 126
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getFieldName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 127
    const-string/jumbo v8, "fieldName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getFieldName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 128
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 130
    :cond_0
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getColumnName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 131
    const-string/jumbo v8, "columnName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getColumnName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 132
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 134
    :cond_1
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v8

    sget-object v9, Lcom/j256/ormlite/field/DatabaseFieldConfigLoader;->DEFAULT_DATA_PERSISTER:Lcom/j256/ormlite/field/DataPersister;

    if-eq v8, v9, :cond_4

    .line 135
    const/4 v3, 0x0

    .line 136
    .local v3, "found":Z
    invoke-static {}, Lcom/j256/ormlite/field/DataType;->values()[Lcom/j256/ormlite/field/DataType;

    move-result-object v0

    .local v0, "arr$":[Lcom/j256/ormlite/field/DataType;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v6, :cond_2

    aget-object v1, v0, v4

    .line 137
    .local v1, "dataType":Lcom/j256/ormlite/field/DataType;
    invoke-virtual {v1}, Lcom/j256/ormlite/field/DataType;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v9

    if-ne v8, v9, :cond_3

    .line 138
    const-string/jumbo v8, "dataPersister"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v1}, Lcom/j256/ormlite/field/DataType;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 139
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 140
    const/4 v3, 0x1

    .line 144
    .end local v1    # "dataType":Lcom/j256/ormlite/field/DataType;
    :cond_2
    if-nez v3, :cond_4

    .line 145
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Unknown data persister field: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 136
    .restart local v1    # "dataType":Lcom/j256/ormlite/field/DataType;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 148
    .end local v0    # "arr$":[Lcom/j256/ormlite/field/DataType;
    .end local v1    # "dataType":Lcom/j256/ormlite/field/DataType;
    .end local v3    # "found":Z
    .end local v4    # "i$":I
    .end local v6    # "len$":I
    :cond_4
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDefaultValue()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 149
    const-string/jumbo v8, "defaultValue"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDefaultValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 150
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 152
    :cond_5
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getWidth()I

    move-result v8

    if-eqz v8, :cond_6

    .line 153
    const-string/jumbo v8, "width"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getWidth()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 154
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 156
    :cond_6
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isCanBeNull()Z

    move-result v8

    if-eq v8, v11, :cond_7

    .line 157
    const-string/jumbo v8, "canBeNull"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isCanBeNull()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 158
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 160
    :cond_7
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isId()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 161
    const-string/jumbo v8, "id"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 162
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 164
    :cond_8
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isGeneratedId()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 165
    const-string/jumbo v8, "generatedId"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 166
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 168
    :cond_9
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getGeneratedIdSequence()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_a

    .line 169
    const-string/jumbo v8, "generatedIdSequence"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getGeneratedIdSequence()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 170
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 172
    :cond_a
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v8

    if-eqz v8, :cond_b

    .line 173
    const-string/jumbo v8, "foreign"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 174
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 176
    :cond_b
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isUseGetSet()Z

    move-result v8

    if-eqz v8, :cond_c

    .line 177
    const-string/jumbo v8, "useGetSet"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 178
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 180
    :cond_c
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getUnknownEnumValue()Ljava/lang/Enum;

    move-result-object v8

    if-eqz v8, :cond_d

    .line 181
    const-string/jumbo v8, "unknownEnumValue"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getUnknownEnumValue()Ljava/lang/Enum;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "#"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getUnknownEnumValue()Ljava/lang/Enum;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 186
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 188
    :cond_d
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isThrowIfNull()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 189
    const-string/jumbo v8, "throwIfNull"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 190
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 192
    :cond_e
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getFormat()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_f

    .line 193
    const-string/jumbo v8, "format"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getFormat()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 194
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 196
    :cond_f
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isUnique()Z

    move-result v8

    if-eqz v8, :cond_10

    .line 197
    const-string/jumbo v8, "unique"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 198
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 200
    :cond_10
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isUniqueCombo()Z

    move-result v8

    if-eqz v8, :cond_11

    .line 201
    const-string/jumbo v8, "uniqueCombo"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 202
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 204
    :cond_11
    invoke-virtual {p1, p2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getIndexName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 205
    .local v5, "indexName":Ljava/lang/String;
    if-eqz v5, :cond_12

    .line 206
    const-string/jumbo v8, "indexName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 207
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 209
    :cond_12
    invoke-virtual {p1, p2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getUniqueIndexName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 210
    .local v7, "uniqueIndexName":Ljava/lang/String;
    if-eqz v7, :cond_13

    .line 211
    const-string/jumbo v8, "uniqueIndexName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 212
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 214
    :cond_13
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoRefresh()Z

    move-result v8

    if-eqz v8, :cond_14

    .line 215
    const-string/jumbo v8, "foreignAutoRefresh"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 216
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 218
    :cond_14
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getMaxForeignAutoRefreshLevel()I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_15

    .line 219
    const-string/jumbo v8, "maxForeignAutoRefreshLevel"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getMaxForeignAutoRefreshLevel()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 222
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 224
    :cond_15
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getPersisterClass()Ljava/lang/Class;

    move-result-object v8

    sget-object v9, Lcom/j256/ormlite/field/DatabaseFieldConfig;->DEFAULT_PERSISTER_CLASS:Ljava/lang/Class;

    if-eq v8, v9, :cond_16

    .line 225
    const-string/jumbo v8, "persisterClass"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getPersisterClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 226
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 228
    :cond_16
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isAllowGeneratedIdInsert()Z

    move-result v8

    if-eqz v8, :cond_17

    .line 229
    const-string/jumbo v8, "allowGeneratedIdInsert"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 230
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 232
    :cond_17
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getColumnDefinition()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_18

    .line 233
    const-string/jumbo v8, "columnDefinition"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getColumnDefinition()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 234
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 236
    :cond_18
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoCreate()Z

    move-result v8

    if-eqz v8, :cond_19

    .line 237
    const-string/jumbo v8, "foreignAutoCreate"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 238
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 240
    :cond_19
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isVersion()Z

    move-result v8

    if-eqz v8, :cond_1a

    .line 241
    const-string/jumbo v8, "version"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 242
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 244
    :cond_1a
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignColumnName()Ljava/lang/String;

    move-result-object v2

    .line 245
    .local v2, "foreignColumnName":Ljava/lang/String;
    if-eqz v2, :cond_1b

    .line 246
    const-string/jumbo v8, "foreignColumnName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 247
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 249
    :cond_1b
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isReadOnly()Z

    move-result v8

    if-eqz v8, :cond_1c

    .line 250
    const-string/jumbo v8, "readOnly"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 251
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 257
    :cond_1c
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollection()Z

    move-result v8

    if-eqz v8, :cond_1d

    .line 258
    const-string/jumbo v8, "foreignCollection"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 259
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 261
    :cond_1d
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollectionEager()Z

    move-result v8

    if-eqz v8, :cond_1e

    .line 262
    const-string/jumbo v8, "foreignCollectionEager"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    const-string/jumbo v9, "true"

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 263
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 265
    :cond_1e
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionMaxEagerLevel()I

    move-result v8

    if-eq v8, v11, :cond_1f

    .line 266
    const-string/jumbo v8, "foreignCollectionMaxEagerLevel"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionMaxEagerLevel()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 269
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 271
    :cond_1f
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionColumnName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_20

    .line 272
    const-string/jumbo v8, "foreignCollectionColumnName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionColumnName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 275
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 277
    :cond_20
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionOrderColumnName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_21

    .line 278
    const-string/jumbo v8, "foreignCollectionOrderColumnName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionOrderColumnName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 281
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 283
    :cond_21
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollectionOrderAscending()Z

    move-result v8

    if-eq v8, v11, :cond_22

    .line 284
    const-string/jumbo v8, "foreignCollectionOrderAscending"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollectionOrderAscending()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 287
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 289
    :cond_22
    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionForeignFieldName()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_23

    .line 290
    const-string/jumbo v8, "foreignCollectionForeignFieldName"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    move-result-object v8

    invoke-virtual {p1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionForeignFieldName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 293
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 296
    :cond_23
    const-string/jumbo v8, "# --field-end--"

    invoke-virtual {p0, v8}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 297
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->newLine()V

    .line 298
    return-void
.end method
