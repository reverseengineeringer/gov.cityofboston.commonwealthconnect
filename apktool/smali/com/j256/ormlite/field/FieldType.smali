.class public Lcom/j256/ormlite/field/FieldType;
.super Ljava/lang/Object;
.source "FieldType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/j256/ormlite/field/FieldType$LevelCounters;
    }
.end annotation


# static fields
.field private static DEFAULT_VALUE_BOOLEAN:Z = false

.field private static DEFAULT_VALUE_BYTE:B = 0x0t

.field private static DEFAULT_VALUE_CHAR:C = '\u0000'

.field private static DEFAULT_VALUE_DOUBLE:D = 0.0

.field private static DEFAULT_VALUE_FLOAT:F = 0.0f

.field private static DEFAULT_VALUE_INT:I = 0x0

.field private static DEFAULT_VALUE_LONG:J = 0x0L

.field private static DEFAULT_VALUE_SHORT:S = 0x0s

.field public static final FOREIGN_ID_FIELD_SUFFIX:Ljava/lang/String; = "_id"

.field private static final threadLevelCounters:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/j256/ormlite/field/FieldType$LevelCounters;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final columnName:Ljava/lang/String;

.field private final connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

.field private dataPersister:Lcom/j256/ormlite/field/DataPersister;

.field private dataTypeConfigObj:Ljava/lang/Object;

.field private defaultValue:Ljava/lang/Object;

.field private final field:Ljava/lang/reflect/Field;

.field private final fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

.field private fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

.field private final fieldGetMethod:Ljava/lang/reflect/Method;

.field private final fieldSetMethod:Ljava/lang/reflect/Method;

.field private foreignDao:Lcom/j256/ormlite/dao/BaseDaoImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/dao/BaseDaoImpl",
            "<**>;"
        }
    .end annotation
.end field

.field private foreignFieldType:Lcom/j256/ormlite/field/FieldType;

.field private foreignIdField:Lcom/j256/ormlite/field/FieldType;

.field private foreignTableInfo:Lcom/j256/ormlite/table/TableInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/table/TableInfo",
            "<**>;"
        }
    .end annotation
.end field

.field private final generatedIdSequence:Ljava/lang/String;

.field private final isGeneratedId:Z

.field private final isId:Z

.field private mappedQueryForId:Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final parentClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final tableName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 79
    new-instance v0, Lcom/j256/ormlite/field/FieldType$1;

    invoke-direct {v0}, Lcom/j256/ormlite/field/FieldType$1;-><init>()V

    sput-object v0, Lcom/j256/ormlite/field/FieldType;->threadLevelCounters:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/String;Ljava/lang/reflect/Field;Lcom/j256/ormlite/field/DatabaseFieldConfig;Ljava/lang/Class;)V
    .locals 19
    .param p1, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .param p2, "tableName"    # Ljava/lang/String;
    .param p3, "field"    # Ljava/lang/reflect/Field;
    .param p4, "fieldConfig"    # Lcom/j256/ormlite/field/DatabaseFieldConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            "Lcom/j256/ormlite/field/DatabaseFieldConfig;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 90
    .local p5, "parentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 91
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    .line 92
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->tableName:Ljava/lang/String;

    .line 93
    invoke-interface/range {p1 .. p1}, Lcom/j256/ormlite/support/ConnectionSource;->getDatabaseType()Lcom/j256/ormlite/db/DatabaseType;

    move-result-object v4

    .line 94
    .local v4, "databaseType":Lcom/j256/ormlite/db/DatabaseType;
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    .line 95
    move-object/from16 v0, p5

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->parentClass:Ljava/lang/Class;

    .line 98
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->postProcess()V

    .line 100
    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    .line 102
    .local v2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v16

    if-nez v16, :cond_5

    .line 103
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getPersisterClass()Ljava/lang/Class;

    move-result-object v10

    .line 104
    .local v10, "persisterClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/j256/ormlite/field/DataPersister;>;"
    if-eqz v10, :cond_0

    const-class v16, Lcom/j256/ormlite/field/types/VoidType;

    move-object/from16 v0, v16

    if-ne v10, v0, :cond_3

    .line 105
    :cond_0
    invoke-static/range {p3 .. p3}, Lcom/j256/ormlite/field/DataPersisterManager;->lookupForField(Ljava/lang/reflect/Field;)Lcom/j256/ormlite/field/DataPersister;

    move-result-object v3

    .line 149
    .end local v10    # "persisterClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/j256/ormlite/field/DataPersister;>;"
    .local v3, "dataPersister":Lcom/j256/ormlite/field/DataPersister;
    :cond_1
    :goto_0
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignColumnName()Ljava/lang/String;

    move-result-object v7

    .line 150
    .local v7, "foreignColumnName":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    .line 151
    .local v5, "defaultFieldName":Ljava/lang/String;
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v16

    if-nez v16, :cond_2

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoRefresh()Z

    move-result v16

    if-nez v16, :cond_2

    if-eqz v7, :cond_9

    .line 152
    :cond_2
    if-eqz v3, :cond_7

    invoke-interface {v3}, Lcom/j256/ormlite/field/DataPersister;->isPrimitive()Z

    move-result v16

    if-eqz v16, :cond_7

    .line 153
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " is a primitive class "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " but marked as foreign"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 109
    .end local v3    # "dataPersister":Lcom/j256/ormlite/field/DataPersister;
    .end local v5    # "defaultFieldName":Ljava/lang/String;
    .end local v7    # "foreignColumnName":Ljava/lang/String;
    .restart local v10    # "persisterClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/j256/ormlite/field/DataPersister;>;"
    :cond_3
    :try_start_0
    const-string/jumbo v16, "getSingleton"

    const/16 v17, 0x0

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v10, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 116
    .local v9, "method":Ljava/lang/reflect/Method;
    const/16 v16, 0x0

    const/16 v17, 0x0

    :try_start_1
    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v9, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v12

    .line 123
    .local v12, "result":Ljava/lang/Object;
    if-nez v12, :cond_4

    .line 124
    new-instance v16, Ljava/sql/SQLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Static getSingleton method should not return null on class "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 110
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v12    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v6

    .line 111
    .local v6, "e":Ljava/lang/Exception;
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "Could not find getSingleton static method on class "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v0, v6}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v16

    throw v16

    .line 117
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v9    # "method":Ljava/lang/reflect/Method;
    :catch_1
    move-exception v6

    .line 118
    .local v6, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "Could not run getSingleton method on class "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual {v6}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v16

    throw v16

    .line 120
    .end local v6    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v6

    .line 121
    .local v6, "e":Ljava/lang/Exception;
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "Could not run getSingleton method on class "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v0, v6}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v16

    throw v16

    .line 128
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v12    # "result":Ljava/lang/Object;
    :cond_4
    :try_start_2
    move-object v0, v12

    check-cast v0, Lcom/j256/ormlite/field/DataPersister;

    move-object v3, v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .restart local v3    # "dataPersister":Lcom/j256/ormlite/field/DataPersister;
    goto/16 :goto_0

    .line 129
    .end local v3    # "dataPersister":Lcom/j256/ormlite/field/DataPersister;
    :catch_3
    move-exception v6

    .line 130
    .restart local v6    # "e":Ljava/lang/Exception;
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "Could not cast result of static getSingleton method to DataPersister from class "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v0, v6}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v16

    throw v16

    .line 136
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v10    # "persisterClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/j256/ormlite/field/DataPersister;>;"
    .end local v12    # "result":Ljava/lang/Object;
    :cond_5
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v3

    .line 137
    .restart local v3    # "dataPersister":Lcom/j256/ormlite/field/DataPersister;
    move-object/from16 v0, p3

    invoke-interface {v3, v0}, Lcom/j256/ormlite/field/DataPersister;->isValidForField(Ljava/lang/reflect/Field;)Z

    move-result v16

    if-nez v16, :cond_1

    .line 138
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .local v13, "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v16, "Field class "

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    const-string/jumbo v16, " for field "

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 141
    const-string/jumbo v16, " is not valid for type "

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 142
    invoke-interface {v3}, Lcom/j256/ormlite/field/DataPersister;->getPrimaryClass()Ljava/lang/Class;

    move-result-object v11

    .line 143
    .local v11, "primaryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v11, :cond_6

    .line 144
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, ", maybe should be "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_6
    new-instance v16, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 156
    .end local v11    # "primaryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v13    # "sb":Ljava/lang/StringBuilder;
    .restart local v5    # "defaultFieldName":Ljava/lang/String;
    .restart local v7    # "foreignColumnName":Ljava/lang/String;
    :cond_7
    if-nez v7, :cond_8

    .line 157
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string/jumbo v17, "_id"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 161
    :goto_1
    const-class v16, Lcom/j256/ormlite/dao/ForeignCollection;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v16

    if-eqz v16, :cond_f

    .line 162
    new-instance v16, Ljava/sql/SQLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field \'"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "\' in class "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "\' should use the @"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-class v18, Lcom/j256/ormlite/field/ForeignCollectionField;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " annotation not foreign=true"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 159
    :cond_8
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string/jumbo v17, "_"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 165
    :cond_9
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollection()Z

    move-result v16

    if-eqz v16, :cond_c

    .line 166
    const-class v16, Ljava/util/Collection;

    move-object/from16 v0, v16

    if-eq v2, v0, :cond_a

    const-class v16, Lcom/j256/ormlite/dao/ForeignCollection;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v16

    if-nez v16, :cond_a

    .line 167
    new-instance v16, Ljava/sql/SQLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field class for \'"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "\' must be of class "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-class v18, Lcom/j256/ormlite/dao/ForeignCollection;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " or Collection."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 170
    :cond_a
    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v15

    .line 171
    .local v15, "type":Ljava/lang/reflect/Type;
    instance-of v0, v15, Ljava/lang/reflect/ParameterizedType;

    move/from16 v16, v0

    if-nez v16, :cond_b

    .line 172
    new-instance v16, Ljava/sql/SQLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field class for \'"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "\' must be a parameterized Collection."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 174
    :cond_b
    check-cast v15, Ljava/lang/reflect/ParameterizedType;

    .end local v15    # "type":Ljava/lang/reflect/Type;
    invoke-interface {v15}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v8

    .line 175
    .local v8, "genericArguments":[Ljava/lang/reflect/Type;
    array-length v0, v8

    move/from16 v16, v0

    if-nez v16, :cond_f

    .line 177
    new-instance v16, Ljava/sql/SQLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field class for \'"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "\' must be a parameterized Collection with at least 1 type."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 180
    .end local v8    # "genericArguments":[Ljava/lang/reflect/Type;
    :cond_c
    if-nez v3, :cond_f

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollection()Z

    move-result v16

    if-nez v16, :cond_f

    .line 181
    const-class v16, [B

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v16

    if-eqz v16, :cond_d

    .line 182
    new-instance v16, Ljava/sql/SQLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "ORMLite does not know how to store "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " for field \'"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "\'. byte[] fields must specify dataType=DataType.BYTE_ARRAY or SERIALIZABLE"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 184
    :cond_d
    const-class v16, Ljava/io/Serializable;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v16

    if-eqz v16, :cond_e

    .line 185
    new-instance v16, Ljava/sql/SQLException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "ORMLite does not know how to store "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " for field \'"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "\'.  Use another class, custom persister, or to serialize it use "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "dataType=DataType.SERIALIZABLE"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 189
    :cond_e
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "ORMLite does not know how to store "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " for field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, ". Use another class or a custom persister."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 193
    :cond_f
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getColumnName()Ljava/lang/String;

    move-result-object v16

    if-nez v16, :cond_11

    .line 194
    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/j256/ormlite/field/FieldType;->columnName:Ljava/lang/String;

    .line 198
    :goto_2
    move-object/from16 v0, p4

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    .line 199
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isId()Z

    move-result v16

    if-eqz v16, :cond_14

    .line 200
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isGeneratedId()Z

    move-result v16

    if-nez v16, :cond_10

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getGeneratedIdSequence()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_12

    .line 201
    :cond_10
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Must specify one of id, generatedId, and generatedIdSequence with "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 196
    :cond_11
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getColumnName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->columnName:Ljava/lang/String;

    goto :goto_2

    .line 204
    :cond_12
    const/16 v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isId:Z

    .line 205
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isGeneratedId:Z

    .line 206
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->generatedIdSequence:Ljava/lang/String;

    .line 232
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/j256/ormlite/field/FieldType;->isId:Z

    move/from16 v16, v0

    if-eqz v16, :cond_1a

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v16

    if-nez v16, :cond_13

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoRefresh()Z

    move-result v16

    if-eqz v16, :cond_1a

    .line 233
    :cond_13
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Id field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " cannot also be a foreign object"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 207
    :cond_14
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isGeneratedId()Z

    move-result v16

    if-eqz v16, :cond_17

    .line 208
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getGeneratedIdSequence()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_15

    .line 209
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Must specify one of id, generatedId, and generatedIdSequence with "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 212
    :cond_15
    const/16 v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isId:Z

    .line 213
    const/16 v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isGeneratedId:Z

    .line 214
    invoke-interface {v4}, Lcom/j256/ormlite/db/DatabaseType;->isIdSequenceNeeded()Z

    move-result v16

    if-eqz v16, :cond_16

    .line 215
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    invoke-interface {v4, v0, v1}, Lcom/j256/ormlite/db/DatabaseType;->generateIdSequenceName(Ljava/lang/String;Lcom/j256/ormlite/field/FieldType;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->generatedIdSequence:Ljava/lang/String;

    goto/16 :goto_3

    .line 217
    :cond_16
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->generatedIdSequence:Ljava/lang/String;

    goto/16 :goto_3

    .line 219
    :cond_17
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getGeneratedIdSequence()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_19

    .line 220
    const/16 v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isId:Z

    .line 221
    const/16 v16, 0x1

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isGeneratedId:Z

    .line 222
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getGeneratedIdSequence()Ljava/lang/String;

    move-result-object v14

    .line 223
    .local v14, "seqName":Ljava/lang/String;
    invoke-interface {v4}, Lcom/j256/ormlite/db/DatabaseType;->isEntityNamesMustBeUpCase()Z

    move-result v16

    if-eqz v16, :cond_18

    .line 224
    invoke-virtual {v14}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v14

    .line 226
    :cond_18
    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/j256/ormlite/field/FieldType;->generatedIdSequence:Ljava/lang/String;

    goto/16 :goto_3

    .line 228
    .end local v14    # "seqName":Ljava/lang/String;
    :cond_19
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isId:Z

    .line 229
    const/16 v16, 0x0

    move/from16 v0, v16

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/j256/ormlite/field/FieldType;->isGeneratedId:Z

    .line 230
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->generatedIdSequence:Ljava/lang/String;

    goto/16 :goto_3

    .line 235
    :cond_1a
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isUseGetSet()Z

    move-result v16

    if-eqz v16, :cond_1b

    .line 236
    const/16 v16, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-static {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->findGetMethod(Ljava/lang/reflect/Field;Z)Ljava/lang/reflect/Method;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->fieldGetMethod:Ljava/lang/reflect/Method;

    .line 237
    const/16 v16, 0x1

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-static {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->findSetMethod(Ljava/lang/reflect/Field;Z)Ljava/lang/reflect/Method;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->fieldSetMethod:Ljava/lang/reflect/Method;

    .line 250
    :goto_4
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isAllowGeneratedIdInsert()Z

    move-result v16

    if-eqz v16, :cond_1d

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isGeneratedId()Z

    move-result v16

    if-nez v16, :cond_1d

    .line 251
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " must be a generated-id if allowGeneratedIdInsert = true"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 239
    :cond_1b
    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v16

    if-nez v16, :cond_1c

    .line 241
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-virtual/range {v16 .. v17}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_4

    .line 247
    :cond_1c
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->fieldGetMethod:Ljava/lang/reflect/Method;

    .line 248
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/j256/ormlite/field/FieldType;->fieldSetMethod:Ljava/lang/reflect/Method;

    goto :goto_4

    .line 242
    :catch_4
    move-exception v6

    .line 243
    .local v6, "e":Ljava/lang/SecurityException;
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Could not open access to field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, ".  You may have to set useGetSet=true to fix."

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 254
    .end local v6    # "e":Ljava/lang/SecurityException;
    :cond_1d
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoRefresh()Z

    move-result v16

    if-eqz v16, :cond_1e

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v16

    if-nez v16, :cond_1e

    .line 255
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " must have foreign = true if foreignAutoRefresh = true"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 258
    :cond_1e
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoCreate()Z

    move-result v16

    if-eqz v16, :cond_1f

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v16

    if-nez v16, :cond_1f

    .line 259
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " must have foreign = true if foreignAutoCreate = true"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 262
    :cond_1f
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignColumnName()Ljava/lang/String;

    move-result-object v16

    if-eqz v16, :cond_20

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v16

    if-nez v16, :cond_20

    .line 263
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " must have foreign = true if foreignColumnName is set"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 266
    :cond_20
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isVersion()Z

    move-result v16

    if-eqz v16, :cond_22

    if-eqz v3, :cond_21

    invoke-interface {v3}, Lcom/j256/ormlite/field/DataPersister;->isValidForVersion()Z

    move-result v16

    if-nez v16, :cond_22

    .line 267
    :cond_21
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " is not a valid type to be a version field"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 270
    :cond_22
    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getMaxForeignAutoRefreshLevel()I

    move-result v16

    if-lez v16, :cond_23

    invoke-virtual/range {p4 .. p4}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoRefresh()Z

    move-result v16

    if-nez v16, :cond_23

    .line 271
    new-instance v16, Ljava/lang/IllegalArgumentException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Field "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p3 .. p3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " has maxForeignAutoRefreshLevel set but not foreignAutoRefresh is false"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 274
    :cond_23
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v3}, Lcom/j256/ormlite/field/FieldType;->assignDataType(Lcom/j256/ormlite/db/DatabaseType;Lcom/j256/ormlite/field/DataPersister;)V

    .line 275
    return-void
.end method

.method private assignDataType(Lcom/j256/ormlite/db/DatabaseType;Lcom/j256/ormlite/field/DataPersister;)V
    .locals 10
    .param p1, "databaseType"    # Lcom/j256/ormlite/db/DatabaseType;
    .param p2, "dataPersister"    # Lcom/j256/ormlite/field/DataPersister;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 1010
    iput-object p2, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    .line 1011
    if-nez p2, :cond_0

    .line 1012
    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v7}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v7

    if-nez v7, :cond_6

    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v7}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollection()Z

    move-result v7

    if-nez v7, :cond_6

    .line 1014
    new-instance v7, Ljava/sql/SQLException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Data persister for field "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " is null but the field is not a foreign or foreignCollection"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1019
    :cond_0
    invoke-interface {p1, p2}, Lcom/j256/ormlite/db/DatabaseType;->getFieldConverter(Lcom/j256/ormlite/field/DataPersister;)Lcom/j256/ormlite/field/FieldConverter;

    move-result-object v7

    iput-object v7, p0, Lcom/j256/ormlite/field/FieldType;->fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

    .line 1020
    iget-boolean v7, p0, Lcom/j256/ormlite/field/FieldType;->isGeneratedId:Z

    if-eqz v7, :cond_3

    invoke-interface {p2}, Lcom/j256/ormlite/field/DataPersister;->isValidGeneratedType()Z

    move-result v7

    if-nez v7, :cond_3

    .line 1021
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 1022
    .local v6, "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v7, "Generated-id field \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1023
    const-string/jumbo v7, "\' in "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1024
    const-string/jumbo v7, " can\'t be type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v8}, Lcom/j256/ormlite/field/DataPersister;->getSqlType()Lcom/j256/ormlite/field/SqlType;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1025
    const-string/jumbo v7, ".  Must be one of: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1026
    invoke-static {}, Lcom/j256/ormlite/field/DataType;->values()[Lcom/j256/ormlite/field/DataType;

    move-result-object v0

    .local v0, "arr$":[Lcom/j256/ormlite/field/DataType;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 1027
    .local v1, "dataType":Lcom/j256/ormlite/field/DataType;
    invoke-virtual {v1}, Lcom/j256/ormlite/field/DataType;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v5

    .line 1028
    .local v5, "persister":Lcom/j256/ormlite/field/DataPersister;
    if-eqz v5, :cond_1

    invoke-interface {v5}, Lcom/j256/ormlite/field/DataPersister;->isValidGeneratedType()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1029
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x20

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1026
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1032
    .end local v1    # "dataType":Lcom/j256/ormlite/field/DataType;
    .end local v5    # "persister":Lcom/j256/ormlite/field/DataPersister;
    :cond_2
    new-instance v7, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1034
    .end local v0    # "arr$":[Lcom/j256/ormlite/field/DataType;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v7}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isThrowIfNull()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {p2}, Lcom/j256/ormlite/field/DataPersister;->isPrimitive()Z

    move-result v7

    if-nez v7, :cond_4

    .line 1035
    new-instance v7, Ljava/sql/SQLException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Field "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " must be a primitive if set with throwIfNull"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1037
    :cond_4
    iget-boolean v7, p0, Lcom/j256/ormlite/field/FieldType;->isId:Z

    if-eqz v7, :cond_5

    invoke-interface {p2}, Lcom/j256/ormlite/field/DataPersister;->isAppropriateId()Z

    move-result v7

    if-nez v7, :cond_5

    .line 1038
    new-instance v7, Ljava/sql/SQLException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Field \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\' is of data type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " which cannot be the ID field"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1041
    :cond_5
    invoke-interface {p2, p0}, Lcom/j256/ormlite/field/DataPersister;->makeConfigObject(Lcom/j256/ormlite/field/FieldType;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lcom/j256/ormlite/field/FieldType;->dataTypeConfigObj:Ljava/lang/Object;

    .line 1042
    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v7}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDefaultValue()Ljava/lang/String;

    move-result-object v2

    .line 1043
    .local v2, "defaultStr":Ljava/lang/String;
    if-nez v2, :cond_7

    .line 1044
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/j256/ormlite/field/FieldType;->defaultValue:Ljava/lang/Object;

    .line 1051
    .end local v2    # "defaultStr":Ljava/lang/String;
    :cond_6
    :goto_1
    return-void

    .line 1045
    .restart local v2    # "defaultStr":Ljava/lang/String;
    :cond_7
    iget-boolean v7, p0, Lcom/j256/ormlite/field/FieldType;->isGeneratedId:Z

    if-eqz v7, :cond_8

    .line 1046
    new-instance v7, Ljava/sql/SQLException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Field \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\' cannot be a generatedId and have a default value \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1049
    :cond_8
    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

    invoke-interface {v7, p0, v2}, Lcom/j256/ormlite/field/FieldConverter;->parseDefaultString(Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lcom/j256/ormlite/field/FieldType;->defaultValue:Ljava/lang/Object;

    goto :goto_1
.end method

.method public static createFieldType(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/Class;)Lcom/j256/ormlite/field/FieldType;
    .locals 7
    .param p0, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Field;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lcom/j256/ormlite/field/FieldType;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 934
    .local p3, "parentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {p0}, Lcom/j256/ormlite/support/ConnectionSource;->getDatabaseType()Lcom/j256/ormlite/db/DatabaseType;

    move-result-object v6

    .line 935
    .local v6, "databaseType":Lcom/j256/ormlite/db/DatabaseType;
    invoke-static {v6, p1, p2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->fromField(Lcom/j256/ormlite/db/DatabaseType;Ljava/lang/String;Ljava/lang/reflect/Field;)Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-result-object v4

    .line 936
    .local v4, "fieldConfig":Lcom/j256/ormlite/field/DatabaseFieldConfig;
    if-nez v4, :cond_0

    .line 937
    const/4 v0, 0x0

    .line 939
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/j256/ormlite/field/FieldType;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/j256/ormlite/field/FieldType;-><init>(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/String;Ljava/lang/reflect/Field;Lcom/j256/ormlite/field/DatabaseFieldConfig;Ljava/lang/Class;)V

    goto :goto_0
.end method

.method private findForeignFieldType(Ljava/lang/Class;Ljava/lang/Class;Lcom/j256/ormlite/dao/BaseDaoImpl;)Lcom/j256/ormlite/field/FieldType;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/j256/ormlite/dao/BaseDaoImpl",
            "<**>;)",
            "Lcom/j256/ormlite/field/FieldType;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 982
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "foreignClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v6}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionForeignFieldName()Ljava/lang/String;

    move-result-object v2

    .line 983
    .local v2, "foreignColumnName":Ljava/lang/String;
    invoke-virtual {p3}, Lcom/j256/ormlite/dao/BaseDaoImpl;->getTableInfo()Lcom/j256/ormlite/table/TableInfo;

    move-result-object v6

    invoke-virtual {v6}, Lcom/j256/ormlite/table/TableInfo;->getFieldTypes()[Lcom/j256/ormlite/field/FieldType;

    move-result-object v0

    .local v0, "arr$":[Lcom/j256/ormlite/field/FieldType;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 984
    .local v1, "fieldType":Lcom/j256/ormlite/field/FieldType;
    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->getType()Ljava/lang/Class;

    move-result-object v6

    if-ne v6, p2, :cond_1

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/j256/ormlite/field/FieldType;->getField()Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 986
    :cond_0
    iget-object v6, v1, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v6}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v6

    if-nez v6, :cond_4

    iget-object v6, v1, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v6}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoRefresh()Z

    move-result v6

    if-nez v6, :cond_4

    .line 988
    new-instance v6, Ljava/sql/SQLException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Foreign collection object "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " for field \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\' contains a field of class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " but it\'s not foreign"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 983
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 995
    .end local v1    # "fieldType":Lcom/j256/ormlite/field/FieldType;
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 996
    .local v5, "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v6, "Foreign collection class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 997
    const-string/jumbo v6, " for field \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\' column-name does not contain a foreign field"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 998
    if-eqz v2, :cond_3

    .line 999
    const-string/jumbo v6, " named \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x27

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1001
    :cond_3
    const-string/jumbo v6, " of class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1002
    new-instance v6, Ljava/sql/SQLException;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 991
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    .restart local v1    # "fieldType":Lcom/j256/ormlite/field/FieldType;
    :cond_4
    return-object v1
.end method

.method private isFieldValueDefault(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "fieldValue"    # Ljava/lang/Object;

    .prologue
    .line 969
    if-nez p1, :cond_0

    .line 970
    const/4 v0, 0x1

    .line 972
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/j256/ormlite/field/FieldType;->getJavaDefaultValueDefault()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public assignField(Ljava/lang/Object;Ljava/lang/Object;ZLcom/j256/ormlite/dao/ObjectCache;)V
    .locals 9
    .param p1, "data"    # Ljava/lang/Object;
    .param p2, "val"    # Ljava/lang/Object;
    .param p3, "parentObject"    # Z
    .param p4, "objectCache"    # Lcom/j256/ormlite/dao/ObjectCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 501
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    if-eqz v6, :cond_2

    if-eqz p2, :cond_2

    .line 503
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/field/FieldType;->extractJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 509
    .local v3, "foreignId":Ljava/lang/Object;
    if-eqz v3, :cond_0

    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 572
    .end local v3    # "foreignId":Ljava/lang/Object;
    :goto_0
    return-void

    .line 512
    .restart local v3    # "foreignId":Ljava/lang/Object;
    :cond_0
    if-nez p3, :cond_2

    .line 514
    sget-object v6, Lcom/j256/ormlite/field/FieldType;->threadLevelCounters:Ljava/lang/ThreadLocal;

    invoke-virtual {v6}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;

    .line 516
    .local v5, "levelCounters":Lcom/j256/ormlite/field/FieldType$LevelCounters;
    iget v6, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    if-nez v6, :cond_1

    .line 517
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v6}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getMaxForeignAutoRefreshLevel()I

    move-result v6

    iput v6, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevelMax:I

    .line 520
    :cond_1
    iget v6, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    iget v7, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevelMax:I

    if-lt v6, v7, :cond_3

    .line 522
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->foreignTableInfo:Lcom/j256/ormlite/table/TableInfo;

    invoke-virtual {v6}, Lcom/j256/ormlite/table/TableInfo;->createObject()Ljava/lang/Object;

    move-result-object v4

    .line 523
    .local v4, "foreignObject":Ljava/lang/Object;
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v6, v4, p2, v8, p4}, Lcom/j256/ormlite/field/FieldType;->assignField(Ljava/lang/Object;Ljava/lang/Object;ZLcom/j256/ormlite/dao/ObjectCache;)V

    .line 552
    :goto_1
    move-object p2, v4

    .line 556
    .end local v3    # "foreignId":Ljava/lang/Object;
    .end local v4    # "foreignObject":Ljava/lang/Object;
    .end local v5    # "levelCounters":Lcom/j256/ormlite/field/FieldType$LevelCounters;
    :cond_2
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->fieldSetMethod:Ljava/lang/reflect/Method;

    if-nez v6, :cond_5

    .line 558
    :try_start_0
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v6, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 559
    :catch_0
    move-exception v2

    .line 560
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Could not assign object \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\' to field "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v2}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v6

    throw v6

    .line 530
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v3    # "foreignId":Ljava/lang/Object;
    .restart local v5    # "levelCounters":Lcom/j256/ormlite/field/FieldType$LevelCounters;
    :cond_3
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->mappedQueryForId:Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;

    if-nez v6, :cond_4

    .line 532
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    invoke-interface {v6}, Lcom/j256/ormlite/support/ConnectionSource;->getDatabaseType()Lcom/j256/ormlite/db/DatabaseType;

    move-result-object v6

    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->foreignDao:Lcom/j256/ormlite/dao/BaseDaoImpl;

    invoke-virtual {v7}, Lcom/j256/ormlite/dao/BaseDaoImpl;->getTableInfo()Lcom/j256/ormlite/table/TableInfo;

    move-result-object v7

    iget-object v8, p0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    invoke-static {v6, v7, v8}, Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;->build(Lcom/j256/ormlite/db/DatabaseType;Lcom/j256/ormlite/table/TableInfo;Lcom/j256/ormlite/field/FieldType;)Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;

    move-result-object v0

    .line 536
    .local v0, "castMappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    iput-object v0, p0, Lcom/j256/ormlite/field/FieldType;->mappedQueryForId:Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;

    .line 538
    .end local v0    # "castMappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_4
    iget v6, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    .line 540
    :try_start_1
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    invoke-interface {v6}, Lcom/j256/ormlite/support/ConnectionSource;->getReadOnlyConnection()Lcom/j256/ormlite/support/DatabaseConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v1

    .line 543
    .local v1, "databaseConnection":Lcom/j256/ormlite/support/DatabaseConnection;
    :try_start_2
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->mappedQueryForId:Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;

    invoke-virtual {v6, v1, p2, p4}, Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;->execute(Lcom/j256/ormlite/support/DatabaseConnection;Ljava/lang/Object;Lcom/j256/ormlite/dao/ObjectCache;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v4

    .line 545
    .restart local v4    # "foreignObject":Ljava/lang/Object;
    :try_start_3
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    invoke-interface {v6, v1}, Lcom/j256/ormlite/support/ConnectionSource;->releaseConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 548
    iget v6, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    goto :goto_1

    .line 545
    .end local v4    # "foreignObject":Ljava/lang/Object;
    :catchall_0
    move-exception v6

    :try_start_4
    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->connectionSource:Lcom/j256/ormlite/support/ConnectionSource;

    invoke-interface {v7, v1}, Lcom/j256/ormlite/support/ConnectionSource;->releaseConnection(Lcom/j256/ormlite/support/DatabaseConnection;)V

    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 548
    .end local v1    # "databaseConnection":Lcom/j256/ormlite/support/DatabaseConnection;
    :catchall_1
    move-exception v6

    iget v7, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v5, Lcom/j256/ormlite/field/FieldType$LevelCounters;->autoRefreshLevel:I

    throw v6

    .line 561
    .end local v3    # "foreignId":Ljava/lang/Object;
    .end local v5    # "levelCounters":Lcom/j256/ormlite/field/FieldType$LevelCounters;
    :catch_1
    move-exception v2

    .line 562
    .local v2, "e":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Could not assign object \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\' to field "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v2}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v6

    throw v6

    .line 566
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :cond_5
    :try_start_5
    iget-object v6, p0, Lcom/j256/ormlite/field/FieldType;->fieldSetMethod:Ljava/lang/reflect/Method;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p2, v7, v8

    invoke-virtual {v6, p1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_0

    .line 567
    :catch_2
    move-exception v2

    .line 568
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Could not call "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/j256/ormlite/field/FieldType;->fieldSetMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " on object with \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\' for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v2}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v6

    throw v6
.end method

.method public assignIdValue(Ljava/lang/Object;Ljava/lang/Number;Lcom/j256/ormlite/dao/ObjectCache;)Ljava/lang/Object;
    .locals 4
    .param p1, "data"    # Ljava/lang/Object;
    .param p2, "val"    # Ljava/lang/Number;
    .param p3, "objectCache"    # Lcom/j256/ormlite/dao/ObjectCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 578
    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v1, p2}, Lcom/j256/ormlite/field/DataPersister;->convertIdNumber(Ljava/lang/Number;)Ljava/lang/Object;

    move-result-object v0

    .line 579
    .local v0, "idVal":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 580
    new-instance v1, Ljava/sql/SQLException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Invalid class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " for sequence-id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 582
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, p3}, Lcom/j256/ormlite/field/FieldType;->assignField(Ljava/lang/Object;Ljava/lang/Object;ZLcom/j256/ormlite/dao/ObjectCache;)V

    .line 583
    return-object v0
.end method

.method public buildForeignCollection(Ljava/lang/Object;Ljava/lang/Object;)Lcom/j256/ormlite/dao/BaseForeignCollection;
    .locals 8
    .param p1, "parent"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<FT:",
            "Ljava/lang/Object;",
            "FID:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "TFID;)",
            "Lcom/j256/ormlite/dao/BaseForeignCollection",
            "<TFT;TFID;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 761
    .local p2, "id":Ljava/lang/Object;, "TFID;"
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->foreignFieldType:Lcom/j256/ormlite/field/FieldType;

    if-nez v0, :cond_0

    .line 762
    const/4 v0, 0x0

    .line 787
    :goto_0
    return-object v0

    .line 765
    :cond_0
    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->foreignDao:Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 766
    .local v1, "castDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TFT;TFID;>;"
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollectionEager()Z

    move-result v0

    if-nez v0, :cond_1

    .line 768
    new-instance v0, Lcom/j256/ormlite/dao/LazyForeignCollection;

    iget-object v4, p0, Lcom/j256/ormlite/field/FieldType;->foreignFieldType:Lcom/j256/ormlite/field/FieldType;

    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionOrderColumnName()Ljava/lang/String;

    move-result-object v5

    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollectionOrderAscending()Z

    move-result v6

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/j256/ormlite/dao/LazyForeignCollection;-><init>(Lcom/j256/ormlite/dao/Dao;Ljava/lang/Object;Ljava/lang/Object;Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;Z)V

    goto :goto_0

    .line 772
    :cond_1
    sget-object v0, Lcom/j256/ormlite/field/FieldType;->threadLevelCounters:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;

    .line 773
    .local v7, "levelCounters":Lcom/j256/ormlite/field/FieldType$LevelCounters;
    iget v0, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    if-nez v0, :cond_2

    .line 774
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionMaxEagerLevel()I

    move-result v0

    iput v0, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevelMax:I

    .line 777
    :cond_2
    iget v0, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    iget v2, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevelMax:I

    if-lt v0, v2, :cond_3

    .line 779
    new-instance v0, Lcom/j256/ormlite/dao/LazyForeignCollection;

    iget-object v4, p0, Lcom/j256/ormlite/field/FieldType;->foreignFieldType:Lcom/j256/ormlite/field/FieldType;

    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionOrderColumnName()Ljava/lang/String;

    move-result-object v5

    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollectionOrderAscending()Z

    move-result v6

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/j256/ormlite/dao/LazyForeignCollection;-><init>(Lcom/j256/ormlite/dao/Dao;Ljava/lang/Object;Ljava/lang/Object;Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;Z)V

    goto :goto_0

    .line 782
    :cond_3
    iget v0, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    add-int/lit8 v0, v0, 0x1

    iput v0, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    .line 784
    :try_start_0
    new-instance v0, Lcom/j256/ormlite/dao/EagerForeignCollection;

    iget-object v4, p0, Lcom/j256/ormlite/field/FieldType;->foreignFieldType:Lcom/j256/ormlite/field/FieldType;

    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignCollectionOrderColumnName()Ljava/lang/String;

    move-result-object v5

    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollectionOrderAscending()Z

    move-result v6

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/j256/ormlite/dao/EagerForeignCollection;-><init>(Lcom/j256/ormlite/dao/Dao;Ljava/lang/Object;Ljava/lang/Object;Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 787
    iget v2, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    goto :goto_0

    :catchall_0
    move-exception v0

    iget v2, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v7, Lcom/j256/ormlite/field/FieldType$LevelCounters;->foreignCollectionLevel:I

    throw v0
.end method

.method public configDaoInformation(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)V
    .locals 20
    .param p1, "connectionSource"    # Lcom/j256/ormlite/support/ConnectionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/j256/ormlite/support/ConnectionSource;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 284
    .local p2, "parentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v6

    .line 285
    .local v6, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface/range {p1 .. p1}, Lcom/j256/ormlite/support/ConnectionSource;->getDatabaseType()Lcom/j256/ormlite/db/DatabaseType;

    move-result-object v5

    .line 292
    .local v5, "databaseType":Lcom/j256/ormlite/db/DatabaseType;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignColumnName()Ljava/lang/String;

    move-result-object v7

    .line 293
    .local v7, "foreignColumnName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoRefresh()Z

    move-result v17

    if-nez v17, :cond_0

    if-eqz v7, :cond_5

    .line 294
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignTableConfig()Lcom/j256/ormlite/table/DatabaseTableConfig;

    move-result-object v15

    .line 295
    .local v15, "tableConfig":Lcom/j256/ormlite/table/DatabaseTableConfig;, "Lcom/j256/ormlite/table/DatabaseTableConfig<*>;"
    if-nez v15, :cond_1

    .line 297
    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v8

    check-cast v8, Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 298
    .local v8, "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    invoke-virtual {v8}, Lcom/j256/ormlite/dao/BaseDaoImpl;->getTableInfo()Lcom/j256/ormlite/table/TableInfo;

    move-result-object v11

    .line 305
    .local v11, "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    :goto_0
    if-nez v7, :cond_2

    .line 306
    invoke-virtual {v11}, Lcom/j256/ormlite/table/TableInfo;->getIdField()Lcom/j256/ormlite/field/FieldType;

    move-result-object v10

    .line 307
    .local v10, "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    if-nez v10, :cond_3

    .line 308
    new-instance v17, Ljava/lang/IllegalArgumentException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Foreign field "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " does not have id field"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 300
    .end local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    .end local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    .end local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    :cond_1
    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lcom/j256/ormlite/table/DatabaseTableConfig;->extractFieldTypes(Lcom/j256/ormlite/support/ConnectionSource;)V

    .line 302
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Lcom/j256/ormlite/table/DatabaseTableConfig;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v8

    check-cast v8, Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 303
    .restart local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    invoke-virtual {v8}, Lcom/j256/ormlite/dao/BaseDaoImpl;->getTableInfo()Lcom/j256/ormlite/table/TableInfo;

    move-result-object v11

    .restart local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    goto :goto_0

    .line 311
    :cond_2
    invoke-virtual {v11, v7}, Lcom/j256/ormlite/table/TableInfo;->getFieldTypeByColumnName(Ljava/lang/String;)Lcom/j256/ormlite/field/FieldType;

    move-result-object v10

    .line 312
    .restart local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    if-nez v10, :cond_3

    .line 313
    new-instance v17, Ljava/lang/IllegalArgumentException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Foreign field "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " does not have field named \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "\'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 318
    :cond_3
    invoke-static {v5, v11, v10}, Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;->build(Lcom/j256/ormlite/db/DatabaseType;Lcom/j256/ormlite/table/TableInfo;Lcom/j256/ormlite/field/FieldType;)Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;

    move-result-object v3

    .line 321
    .local v3, "castMappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    move-object v14, v3

    .line 322
    .local v14, "mappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    const/4 v9, 0x0

    .line 397
    .end local v3    # "castMappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v15    # "tableConfig":Lcom/j256/ormlite/table/DatabaseTableConfig;, "Lcom/j256/ormlite/table/DatabaseTableConfig<*>;"
    .local v9, "foreignFieldType":Lcom/j256/ormlite/field/FieldType;
    :goto_1
    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/j256/ormlite/field/FieldType;->mappedQueryForId:Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;

    .line 398
    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/j256/ormlite/field/FieldType;->foreignTableInfo:Lcom/j256/ormlite/table/TableInfo;

    .line 399
    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/j256/ormlite/field/FieldType;->foreignFieldType:Lcom/j256/ormlite/field/FieldType;

    .line 400
    move-object/from16 v0, p0

    iput-object v8, v0, Lcom/j256/ormlite/field/FieldType;->foreignDao:Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 401
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    .line 404
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    move-object/from16 v17, v0

    if-eqz v17, :cond_4

    .line 405
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/FieldType;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v5, v1}, Lcom/j256/ormlite/field/FieldType;->assignDataType(Lcom/j256/ormlite/db/DatabaseType;Lcom/j256/ormlite/field/DataPersister;)V

    .line 407
    :cond_4
    return-void

    .line 323
    .end local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    .end local v9    # "foreignFieldType":Lcom/j256/ormlite/field/FieldType;
    .end local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    .end local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    .end local v14    # "mappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v17

    if-eqz v17, :cond_a

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    move-object/from16 v17, v0

    if-eqz v17, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lcom/j256/ormlite/field/DataPersister;->isPrimitive()Z

    move-result v17

    if-eqz v17, :cond_6

    .line 325
    new-instance v17, Ljava/lang/IllegalArgumentException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Field "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " is a primitive class "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " but marked as foreign"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 328
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignTableConfig()Lcom/j256/ormlite/table/DatabaseTableConfig;

    move-result-object v15

    .line 329
    .restart local v15    # "tableConfig":Lcom/j256/ormlite/table/DatabaseTableConfig;, "Lcom/j256/ormlite/table/DatabaseTableConfig<*>;"
    if-eqz v15, :cond_7

    .line 330
    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Lcom/j256/ormlite/table/DatabaseTableConfig;->extractFieldTypes(Lcom/j256/ormlite/support/ConnectionSource;)V

    .line 332
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Lcom/j256/ormlite/table/DatabaseTableConfig;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v8

    check-cast v8, Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 343
    .restart local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    :goto_2
    invoke-virtual {v8}, Lcom/j256/ormlite/dao/BaseDaoImpl;->getTableInfo()Lcom/j256/ormlite/table/TableInfo;

    move-result-object v11

    .line 344
    .restart local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    invoke-virtual {v11}, Lcom/j256/ormlite/table/TableInfo;->getIdField()Lcom/j256/ormlite/field/FieldType;

    move-result-object v10

    .line 345
    .restart local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    if-nez v10, :cond_8

    .line 346
    new-instance v17, Ljava/lang/IllegalArgumentException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Foreign field "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " does not have id field"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 341
    .end local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    .end local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    .end local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    :cond_7
    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v8

    check-cast v8, Lcom/j256/ormlite/dao/BaseDaoImpl;

    .restart local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    goto :goto_2

    .line 348
    .restart local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    .restart local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/j256/ormlite/field/FieldType;->isForeignAutoCreate()Z

    move-result v17

    if-eqz v17, :cond_9

    invoke-virtual {v10}, Lcom/j256/ormlite/field/FieldType;->isGeneratedId()Z

    move-result v17

    if-nez v17, :cond_9

    .line 349
    new-instance v17, Ljava/lang/IllegalArgumentException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Field "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ", if foreignAutoCreate = true then class "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " must have id field with generatedId = true"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 353
    :cond_9
    const/4 v9, 0x0

    .line 354
    .restart local v9    # "foreignFieldType":Lcom/j256/ormlite/field/FieldType;
    const/4 v14, 0x0

    .line 355
    .restart local v14    # "mappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    goto/16 :goto_1

    .end local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    .end local v9    # "foreignFieldType":Lcom/j256/ormlite/field/FieldType;
    .end local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    .end local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    .end local v14    # "mappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v15    # "tableConfig":Lcom/j256/ormlite/table/DatabaseTableConfig;, "Lcom/j256/ormlite/table/DatabaseTableConfig<*>;"
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollection()Z

    move-result v17

    if-eqz v17, :cond_f

    .line 356
    const-class v17, Ljava/util/Collection;

    move-object/from16 v0, v17

    if-eq v6, v0, :cond_b

    const-class v17, Lcom/j256/ormlite/dao/ForeignCollection;

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-nez v17, :cond_b

    .line 357
    new-instance v17, Ljava/sql/SQLException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Field class for \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "\' must be of class "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-class v19, Lcom/j256/ormlite/dao/ForeignCollection;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " or Collection."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 360
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v16

    .line 361
    .local v16, "type":Ljava/lang/reflect/Type;
    move-object/from16 v0, v16

    instance-of v0, v0, Ljava/lang/reflect/ParameterizedType;

    move/from16 v17, v0

    if-nez v17, :cond_c

    .line 362
    new-instance v17, Ljava/sql/SQLException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Field class for \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "\' must be a parameterized Collection."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 364
    :cond_c
    check-cast v16, Ljava/lang/reflect/ParameterizedType;

    .end local v16    # "type":Ljava/lang/reflect/Type;
    invoke-interface/range {v16 .. v16}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v13

    .line 365
    .local v13, "genericArguments":[Ljava/lang/reflect/Type;
    array-length v0, v13

    move/from16 v17, v0

    if-nez v17, :cond_d

    .line 367
    new-instance v17, Ljava/sql/SQLException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Field class for \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "\' must be a parameterized Collection with at least 1 type."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 370
    :cond_d
    const/16 v17, 0x0

    aget-object v4, v13, v17

    check-cast v4, Ljava/lang/Class;

    .line 371
    .local v4, "collectionClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getForeignTableConfig()Lcom/j256/ormlite/table/DatabaseTableConfig;

    move-result-object v15

    .line 373
    .restart local v15    # "tableConfig":Lcom/j256/ormlite/table/DatabaseTableConfig;, "Lcom/j256/ormlite/table/DatabaseTableConfig<*>;"
    if-nez v15, :cond_e

    .line 375
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Ljava/lang/Class;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    check-cast v2, Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 377
    .local v2, "castDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    move-object v12, v2

    .line 384
    .local v12, "foundDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    :goto_3
    move-object v8, v12

    .line 385
    .restart local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v4, v1, v12}, Lcom/j256/ormlite/field/FieldType;->findForeignFieldType(Ljava/lang/Class;Ljava/lang/Class;Lcom/j256/ormlite/dao/BaseDaoImpl;)Lcom/j256/ormlite/field/FieldType;

    move-result-object v9

    .line 386
    .restart local v9    # "foreignFieldType":Lcom/j256/ormlite/field/FieldType;
    const/4 v10, 0x0

    .line 387
    .restart local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    const/4 v11, 0x0

    .line 388
    .restart local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    const/4 v14, 0x0

    .line 389
    .restart local v14    # "mappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    goto/16 :goto_1

    .line 380
    .end local v2    # "castDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    .end local v9    # "foreignFieldType":Lcom/j256/ormlite/field/FieldType;
    .end local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    .end local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    .end local v12    # "foundDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v14    # "mappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    :cond_e
    move-object/from16 v0, p1

    invoke-static {v0, v15}, Lcom/j256/ormlite/dao/DaoManager;->createDao(Lcom/j256/ormlite/support/ConnectionSource;Lcom/j256/ormlite/table/DatabaseTableConfig;)Lcom/j256/ormlite/dao/Dao;

    move-result-object v2

    check-cast v2, Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 382
    .restart local v2    # "castDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    move-object v12, v2

    .restart local v12    # "foundDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    goto :goto_3

    .line 390
    .end local v2    # "castDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v4    # "collectionClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "foundDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<Ljava/lang/Object;Ljava/lang/Object;>;"
    .end local v13    # "genericArguments":[Ljava/lang/reflect/Type;
    .end local v15    # "tableConfig":Lcom/j256/ormlite/table/DatabaseTableConfig;, "Lcom/j256/ormlite/table/DatabaseTableConfig<*>;"
    :cond_f
    const/4 v11, 0x0

    .line 391
    .restart local v11    # "foreignTableInfo":Lcom/j256/ormlite/table/TableInfo;, "Lcom/j256/ormlite/table/TableInfo<**>;"
    const/4 v10, 0x0

    .line 392
    .restart local v10    # "foreignIdField":Lcom/j256/ormlite/field/FieldType;
    const/4 v9, 0x0

    .line 393
    .restart local v9    # "foreignFieldType":Lcom/j256/ormlite/field/FieldType;
    const/4 v8, 0x0

    .line 394
    .restart local v8    # "foreignDao":Lcom/j256/ormlite/dao/BaseDaoImpl;, "Lcom/j256/ormlite/dao/BaseDaoImpl<**>;"
    const/4 v14, 0x0

    .restart local v14    # "mappedQueryForId":Lcom/j256/ormlite/stmt/mapped/MappedQueryForId;, "Lcom/j256/ormlite/stmt/mapped/MappedQueryForId<Ljava/lang/Object;Ljava/lang/Object;>;"
    goto/16 :goto_1
.end method

.method public convertJavaFieldToSqlArgValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "fieldVal"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 639
    if-nez p1, :cond_0

    .line 640
    const/4 v0, 0x0

    .line 642
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

    invoke-interface {v0, p0, p1}, Lcom/j256/ormlite/field/FieldConverter;->javaToSqlArg(Lcom/j256/ormlite/field/FieldType;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public convertStringToJavaField(Ljava/lang/String;I)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "columnPos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 650
    if-nez p1, :cond_0

    .line 651
    const/4 v0, 0x0

    .line 653
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

    invoke-interface {v0, p0, p1, p2}, Lcom/j256/ormlite/field/FieldConverter;->resultStringToJava(Lcom/j256/ormlite/field/FieldType;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public createWithForeignDao(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 925
    .local p1, "foreignData":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->foreignDao:Lcom/j256/ormlite/dao/BaseDaoImpl;

    .line 926
    .local v0, "castDao":Lcom/j256/ormlite/dao/Dao;, "Lcom/j256/ormlite/dao/Dao<TT;*>;"
    invoke-interface {v0, p1}, Lcom/j256/ormlite/dao/Dao;->create(Ljava/lang/Object;)I

    move-result v1

    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 945
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    .line 949
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 948
    check-cast v0, Lcom/j256/ormlite/field/FieldType;

    .line 949
    .local v0, "other":Lcom/j256/ormlite/field/FieldType;
    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    iget-object v3, v0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->parentClass:Ljava/lang/Class;

    if-nez v2, :cond_2

    iget-object v2, v0, Lcom/j256/ormlite/field/FieldType;->parentClass:Ljava/lang/Class;

    if-nez v2, :cond_0

    :goto_1
    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->parentClass:Ljava/lang/Class;

    iget-object v3, v0, Lcom/j256/ormlite/field/FieldType;->parentClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1
.end method

.method public extractJavaFieldToSqlArgValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 632
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/field/FieldType;->extractJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/j256/ormlite/field/FieldType;->convertJavaFieldToSqlArgValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public extractJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 618
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/field/FieldType;->extractRawJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 621
    .local v0, "val":Ljava/lang/Object;
    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 622
    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    invoke-virtual {v1, v0}, Lcom/j256/ormlite/field/FieldType;->extractRawJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 625
    :cond_0
    return-object v0
.end method

.method public extractRawJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<FV:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            ")TFV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 592
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->fieldGetMethod:Ljava/lang/reflect/Method;

    if-nez v3, :cond_0

    .line 595
    :try_start_0
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 608
    .local v2, "val":Ljava/lang/Object;
    :goto_0
    move-object v0, v2

    .line 609
    .local v0, "converted":Ljava/lang/Object;, "TFV;"
    return-object v0

    .line 596
    .end local v0    # "converted":Ljava/lang/Object;, "TFV;"
    .end local v2    # "val":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 597
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Could not get field value for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v3

    throw v3

    .line 601
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->fieldGetMethod:Ljava/lang/reflect/Method;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .restart local v2    # "val":Ljava/lang/Object;
    goto :goto_0

    .line 602
    .end local v2    # "val":Ljava/lang/Object;
    :catch_1
    move-exception v1

    .line 603
    .restart local v1    # "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Could not call "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/j256/ormlite/field/FieldType;->fieldGetMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v3

    throw v3
.end method

.method public generateId()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 862
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v0}, Lcom/j256/ormlite/field/DataPersister;->generateId()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getColumnDefinition()Ljava/lang/String;
    .locals 1

    .prologue
    .line 841
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getColumnDefinition()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getColumnName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 429
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->columnName:Ljava/lang/String;

    return-object v0
.end method

.method public getDataPersister()Lcom/j256/ormlite/field/DataPersister;
    .locals 1

    .prologue
    .line 433
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    return-object v0
.end method

.method public getDataTypeConfigObj()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataTypeConfigObj:Ljava/lang/Object;

    return-object v0
.end method

.method public getDefaultValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->defaultValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getField()Ljava/lang/reflect/Field;
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public getFieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFieldValueIfNotDefault(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<FV:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            ")TFV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 878
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/field/FieldType;->extractJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 879
    .local v0, "fieldValue":Ljava/lang/Object;, "TFV;"
    invoke-direct {p0, v0}, Lcom/j256/ormlite/field/FieldType;->isFieldValueDefault(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 880
    const/4 v0, 0x0

    .line 882
    .end local v0    # "fieldValue":Ljava/lang/Object;, "TFV;"
    :cond_0
    return-object v0
.end method

.method public getForeignIdField()Lcom/j256/ormlite/field/FieldType;
    .locals 1

    .prologue
    .line 672
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->foreignIdField:Lcom/j256/ormlite/field/FieldType;

    return-object v0
.end method

.method public getFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 690
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getFormat()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGeneratedIdSequence()Ljava/lang/String;
    .locals 1

    .prologue
    .line 489
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->generatedIdSequence:Ljava/lang/String;

    return-object v0
.end method

.method public getIndexName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 702
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->tableName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getIndexName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getJavaDefaultValueDefault()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 899
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_0

    .line 900
    sget-boolean v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_BOOLEAN:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 916
    :goto_0
    return-object v0

    .line 901
    :cond_0
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Byte;

    if-ne v0, v1, :cond_2

    .line 902
    :cond_1
    sget-byte v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_BYTE:B

    invoke-static {v0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    goto :goto_0

    .line 903
    :cond_2
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Character;

    if-ne v0, v1, :cond_4

    .line 904
    :cond_3
    sget-char v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_CHAR:C

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    goto :goto_0

    .line 905
    :cond_4
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_5

    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Short;

    if-ne v0, v1, :cond_6

    .line 906
    :cond_5
    sget-short v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_SHORT:S

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    goto :goto_0

    .line 907
    :cond_6
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_7

    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Integer;

    if-ne v0, v1, :cond_8

    .line 908
    :cond_7
    sget v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_INT:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 909
    :cond_8
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_9

    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Long;

    if-ne v0, v1, :cond_a

    .line 910
    :cond_9
    sget-wide v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_LONG:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto/16 :goto_0

    .line 911
    :cond_a
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_b

    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Float;

    if-ne v0, v1, :cond_c

    .line 912
    :cond_b
    sget v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_FLOAT:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto/16 :goto_0

    .line 913
    :cond_c
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq v0, v1, :cond_d

    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/Double;

    if-ne v0, v1, :cond_e

    .line 914
    :cond_d
    sget-wide v0, Lcom/j256/ormlite/field/FieldType;->DEFAULT_VALUE_DOUBLE:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto/16 :goto_0

    .line 916
    :cond_e
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public getSqlType()Lcom/j256/ormlite/field/SqlType;
    .locals 1

    .prologue
    .line 441
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

    invoke-interface {v0}, Lcom/j256/ormlite/field/FieldConverter;->getSqlType()Lcom/j256/ormlite/field/SqlType;

    move-result-object v0

    return-object v0
.end method

.method public getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 414
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->tableName:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 425
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getUniqueIndexName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 706
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->tableName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getUniqueIndexName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUnknownEnumVal()Ljava/lang/Enum;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Enum",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 683
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getUnknownEnumValue()Ljava/lang/Enum;

    move-result-object v0

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 452
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getWidth()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 955
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->hashCode()I

    move-result v0

    return v0
.end method

.method public isAllowGeneratedIdInsert()Z
    .locals 1

    .prologue
    .line 834
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isAllowGeneratedIdInsert()Z

    move-result v0

    return v0
.end method

.method public isArgumentHolderRequired()Z
    .locals 1

    .prologue
    .line 739
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v0}, Lcom/j256/ormlite/field/DataPersister;->isArgumentHolderRequired()Z

    move-result v0

    return v0
.end method

.method public isCanBeNull()Z
    .locals 1

    .prologue
    .line 456
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isCanBeNull()Z

    move-result v0

    return v0
.end method

.method public isComparable()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 720
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollection()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 721
    const/4 v0, 0x0

    .line 731
    :goto_0
    return v0

    .line 727
    :cond_0
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    if-nez v0, :cond_1

    .line 728
    new-instance v0, Ljava/sql/SQLException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Internal error.  Data-persister is not configured for field.  Please post _full_ exception with associated data objects to mailing list: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 731
    :cond_1
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v0}, Lcom/j256/ormlite/field/DataPersister;->isComparable()Z

    move-result v0

    goto :goto_0
.end method

.method public isEscapedDefaultValue()Z
    .locals 1

    .prologue
    .line 713
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v0}, Lcom/j256/ormlite/field/DataPersister;->isEscapedDefaultValue()Z

    move-result v0

    return v0
.end method

.method public isEscapedValue()Z
    .locals 1

    .prologue
    .line 679
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v0}, Lcom/j256/ormlite/field/DataPersister;->isEscapedValue()Z

    move-result v0

    return v0
.end method

.method public isForeign()Z
    .locals 1

    .prologue
    .line 493
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v0

    return v0
.end method

.method public isForeignAutoCreate()Z
    .locals 1

    .prologue
    .line 848
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignAutoCreate()Z

    move-result v0

    return v0
.end method

.method public isForeignCollection()Z
    .locals 1

    .prologue
    .line 746
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeignCollection()Z

    move-result v0

    return v0
.end method

.method public isGeneratedId()Z
    .locals 1

    .prologue
    .line 472
    iget-boolean v0, p0, Lcom/j256/ormlite/field/FieldType;->isGeneratedId:Z

    return v0
.end method

.method public isGeneratedIdSequence()Z
    .locals 1

    .prologue
    .line 482
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->generatedIdSequence:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isId()Z
    .locals 1

    .prologue
    .line 464
    iget-boolean v0, p0, Lcom/j256/ormlite/field/FieldType;->isId:Z

    return v0
.end method

.method public isObjectsFieldValueDefault(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 890
    invoke-virtual {p0, p1}, Lcom/j256/ormlite/field/FieldType;->extractJavaFieldValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 891
    .local v0, "fieldValue":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lcom/j256/ormlite/field/FieldType;->isFieldValueDefault(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public isReadOnly()Z
    .locals 1

    .prologue
    .line 869
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isReadOnly()Z

    move-result v0

    return v0
.end method

.method public isSelfGeneratedId()Z
    .locals 1

    .prologue
    .line 827
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v0}, Lcom/j256/ormlite/field/DataPersister;->isSelfGeneratedId()Z

    move-result v0

    return v0
.end method

.method public isUnique()Z
    .locals 1

    .prologue
    .line 694
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isUnique()Z

    move-result v0

    return v0
.end method

.method public isUniqueCombo()Z
    .locals 1

    .prologue
    .line 698
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isUniqueCombo()Z

    move-result v0

    return v0
.end method

.method public isVersion()Z
    .locals 1

    .prologue
    .line 855
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isVersion()Z

    move-result v0

    return v0
.end method

.method public moveToNextValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "val"    # Ljava/lang/Object;

    .prologue
    .line 661
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    if-nez v0, :cond_0

    .line 662
    const/4 v0, 0x0

    .line 664
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v0, p1}, Lcom/j256/ormlite/field/DataPersister;->moveToNextValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public resultToJava(Lcom/j256/ormlite/support/DatabaseResults;Ljava/util/Map;)Ljava/lang/Object;
    .locals 5
    .param p1, "results"    # Lcom/j256/ormlite/support/DatabaseResults;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/j256/ormlite/support/DatabaseResults;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .local p2, "columnPositions":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .line 795
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->columnName:Ljava/lang/String;

    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 796
    .local v1, "dbColumnPos":Ljava/lang/Integer;
    if-nez v1, :cond_0

    .line 797
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->columnName:Ljava/lang/String;

    invoke-interface {p1, v3}, Lcom/j256/ormlite/support/DatabaseResults;->findColumn(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 798
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->columnName:Ljava/lang/String;

    invoke-interface {p2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 801
    :cond_0
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-interface {v3, p0, p1, v4}, Lcom/j256/ormlite/field/FieldConverter;->resultToJava(Lcom/j256/ormlite/field/FieldType;Lcom/j256/ormlite/support/DatabaseResults;I)Ljava/lang/Object;

    move-result-object v0

    .line 802
    .local v0, "converted":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v3}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isForeign()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 808
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p1, v3}, Lcom/j256/ormlite/support/DatabaseResults;->wasNull(I)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v0, v2

    .line 820
    .end local v0    # "converted":Ljava/lang/Object;, "TT;"
    :cond_1
    :goto_0
    return-object v0

    .line 811
    .restart local v0    # "converted":Ljava/lang/Object;, "TT;"
    :cond_2
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->dataPersister:Lcom/j256/ormlite/field/DataPersister;

    invoke-interface {v3}, Lcom/j256/ormlite/field/DataPersister;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 812
    iget-object v2, p0, Lcom/j256/ormlite/field/FieldType;->fieldConfig:Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-virtual {v2}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->isThrowIfNull()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Lcom/j256/ormlite/support/DatabaseResults;->wasNull(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 813
    new-instance v2, Ljava/sql/SQLException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Results value for primitive field \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\' was an invalid null value"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/sql/SQLException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 816
    :cond_3
    iget-object v3, p0, Lcom/j256/ormlite/field/FieldType;->fieldConverter:Lcom/j256/ormlite/field/FieldConverter;

    invoke-interface {v3}, Lcom/j256/ormlite/field/FieldConverter;->isStreamType()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {p1, v3}, Lcom/j256/ormlite/support/DatabaseResults;->wasNull(I)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v0, v2

    .line 818
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 960
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ",class="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/j256/ormlite/field/FieldType;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
