.class public Lcom/j256/ormlite/misc/JavaxPersistence;
.super Ljava/lang/Object;
.source "JavaxPersistence.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFieldConfig(Lcom/j256/ormlite/db/DatabaseType;Ljava/lang/reflect/Field;)Lcom/j256/ormlite/field/DatabaseFieldConfig;
    .locals 31
    .param p0, "databaseType"    # Lcom/j256/ormlite/db/DatabaseType;
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .prologue
    .line 28
    const/4 v7, 0x0

    .line 29
    .local v7, "columnAnnotation":Ljava/lang/annotation/Annotation;
    const/4 v6, 0x0

    .line 30
    .local v6, "basicAnnotation":Ljava/lang/annotation/Annotation;
    const/16 v16, 0x0

    .line 31
    .local v16, "idAnnotation":Ljava/lang/annotation/Annotation;
    const/4 v14, 0x0

    .line 32
    .local v14, "generatedValueAnnotation":Ljava/lang/annotation/Annotation;
    const/16 v23, 0x0

    .line 33
    .local v23, "oneToOneAnnotation":Ljava/lang/annotation/Annotation;
    const/16 v19, 0x0

    .line 34
    .local v19, "manyToOneAnnotation":Ljava/lang/annotation/Annotation;
    const/16 v17, 0x0

    .line 35
    .local v17, "joinColumnAnnotation":Ljava/lang/annotation/Annotation;
    const/4 v11, 0x0

    .line 36
    .local v11, "enumeratedAnnotation":Ljava/lang/annotation/Annotation;
    const/16 v27, 0x0

    .line 38
    .local v27, "versionAnnotation":Ljava/lang/annotation/Annotation;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v5

    .local v5, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v0, v5

    move/from16 v18, v0

    .local v18, "len$":I
    const/4 v15, 0x0

    .local v15, "i$":I
    :goto_0
    move/from16 v0, v18

    if-ge v15, v0, :cond_9

    aget-object v3, v5, v15

    .line 39
    .local v3, "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {v3}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v4

    .line 40
    .local v4, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.Column"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_0

    .line 41
    move-object v7, v3

    .line 43
    :cond_0
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.Basic"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1

    .line 44
    move-object v6, v3

    .line 46
    :cond_1
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.Id"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_2

    .line 47
    move-object/from16 v16, v3

    .line 49
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.GeneratedValue"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_3

    .line 50
    move-object v14, v3

    .line 52
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.OneToOne"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_4

    .line 53
    move-object/from16 v23, v3

    .line 55
    :cond_4
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.ManyToOne"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_5

    .line 56
    move-object/from16 v19, v3

    .line 58
    :cond_5
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.JoinColumn"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_6

    .line 59
    move-object/from16 v17, v3

    .line 61
    :cond_6
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.Enumerated"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_7

    .line 62
    move-object v11, v3

    .line 64
    :cond_7
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "javax.persistence.Version"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_8

    .line 65
    move-object/from16 v27, v3

    .line 38
    :cond_8
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 69
    .end local v3    # "annotation":Ljava/lang/annotation/Annotation;
    .end local v4    # "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_9
    if-nez v7, :cond_a

    if-nez v6, :cond_a

    if-nez v16, :cond_a

    if-nez v23, :cond_a

    if-nez v19, :cond_a

    if-nez v11, :cond_a

    if-nez v27, :cond_a

    .line 71
    const/4 v9, 0x0

    .line 204
    :goto_1
    return-object v9

    .line 74
    :cond_a
    new-instance v9, Lcom/j256/ormlite/field/DatabaseFieldConfig;

    invoke-direct {v9}, Lcom/j256/ormlite/field/DatabaseFieldConfig;-><init>()V

    .line 75
    .local v9, "config":Lcom/j256/ormlite/field/DatabaseFieldConfig;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v13

    .line 76
    .local v13, "fieldName":Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Lcom/j256/ormlite/db/DatabaseType;->isEntityNamesMustBeUpCase()Z

    move-result v28

    if-eqz v28, :cond_b

    .line 77
    invoke-virtual {v13}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v13

    .line 79
    :cond_b
    invoke-virtual {v9, v13}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setFieldName(Ljava/lang/String;)V

    .line 81
    if-eqz v7, :cond_f

    .line 83
    :try_start_0
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "name"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 84
    .local v20, "method":Ljava/lang/reflect/Method;
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 85
    .local v21, "name":Ljava/lang/String;
    if-eqz v21, :cond_c

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v28

    if-lez v28, :cond_c

    .line 86
    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnName(Ljava/lang/String;)V

    .line 88
    :cond_c
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "columnDefinition"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 89
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 90
    .local v8, "columnDefinition":Ljava/lang/String;
    if-eqz v8, :cond_d

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v28

    if-lez v28, :cond_d

    .line 91
    invoke-virtual {v9, v8}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnDefinition(Ljava/lang/String;)V

    .line 93
    :cond_d
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "length"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 94
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/Integer;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Integer;->intValue()I

    move-result v28

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setWidth(I)V

    .line 95
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "nullable"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 96
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Boolean;

    .line 97
    .local v22, "nullable":Ljava/lang/Boolean;
    if-eqz v22, :cond_e

    .line 98
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v28

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setCanBeNull(Z)V

    .line 100
    :cond_e
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "unique"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 101
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v7, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/Boolean;

    .line 102
    .local v26, "unique":Ljava/lang/Boolean;
    if-eqz v26, :cond_f

    .line 103
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v28

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUnique(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v8    # "columnDefinition":Ljava/lang/String;
    .end local v20    # "method":Ljava/lang/reflect/Method;
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "nullable":Ljava/lang/Boolean;
    .end local v26    # "unique":Ljava/lang/Boolean;
    :cond_f
    if-eqz v6, :cond_10

    .line 112
    :try_start_1
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "optional"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 113
    .restart local v20    # "method":Ljava/lang/reflect/Method;
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v6, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/Boolean;

    .line 114
    .local v24, "optional":Ljava/lang/Boolean;
    if-nez v24, :cond_19

    .line 115
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setCanBeNull(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 124
    .end local v20    # "method":Ljava/lang/reflect/Method;
    .end local v24    # "optional":Ljava/lang/Boolean;
    :cond_10
    :goto_2
    if-eqz v16, :cond_11

    .line 125
    if-nez v14, :cond_1a

    .line 126
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setId(Z)V

    .line 132
    :cond_11
    :goto_3
    if-nez v23, :cond_12

    if-eqz v19, :cond_15

    .line 134
    :cond_12
    const-class v28, Ljava/util/Collection;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v28

    if-nez v28, :cond_13

    const-class v28, Lcom/j256/ormlite/dao/ForeignCollection;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v28

    if-eqz v28, :cond_1b

    .line 136
    :cond_13
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollection(Z)V

    .line 137
    if-eqz v17, :cond_15

    .line 139
    :try_start_2
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "name"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 140
    .restart local v20    # "method":Ljava/lang/reflect/Method;
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 141
    .restart local v21    # "name":Ljava/lang/String;
    if-eqz v21, :cond_14

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v28

    if-lez v28, :cond_14

    .line 142
    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionColumnName(Ljava/lang/String;)V

    .line 144
    :cond_14
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "fetch"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 145
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 146
    .local v12, "fetchType":Ljava/lang/Object;
    if-eqz v12, :cond_15

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "EAGER"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_15

    .line 147
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeignCollectionEager(Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 181
    .end local v12    # "fetchType":Ljava/lang/Object;
    .end local v20    # "method":Ljava/lang/reflect/Method;
    .end local v21    # "name":Ljava/lang/String;
    :cond_15
    :goto_4
    if-eqz v11, :cond_16

    .line 183
    :try_start_3
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "value"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 184
    .restart local v20    # "method":Ljava/lang/reflect/Method;
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v11, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    .line 185
    .local v25, "typeValue":Ljava/lang/Object;
    if-eqz v25, :cond_1e

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v28

    const-string/jumbo v29, "STRING"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1e

    .line 186
    sget-object v28, Lcom/j256/ormlite/field/DataType;->ENUM_STRING:Lcom/j256/ormlite/field/DataType;

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDataType(Lcom/j256/ormlite/field/DataType;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 195
    .end local v20    # "method":Ljava/lang/reflect/Method;
    .end local v25    # "typeValue":Ljava/lang/Object;
    :cond_16
    :goto_5
    if-eqz v27, :cond_17

    .line 197
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setVersion(Z)V

    .line 199
    :cond_17
    invoke-virtual {v9}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->getDataPersister()Lcom/j256/ormlite/field/DataPersister;

    move-result-object v28

    if-nez v28, :cond_18

    .line 200
    invoke-static/range {p1 .. p1}, Lcom/j256/ormlite/field/DataPersisterManager;->lookupForField(Ljava/lang/reflect/Field;)Lcom/j256/ormlite/field/DataPersister;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDataPersister(Lcom/j256/ormlite/field/DataPersister;)V

    .line 202
    :cond_18
    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-static {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->findGetMethod(Ljava/lang/reflect/Field;Z)Ljava/lang/reflect/Method;

    move-result-object v28

    if-eqz v28, :cond_1f

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-static {v0, v1}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->findSetMethod(Ljava/lang/reflect/Field;Z)Ljava/lang/reflect/Method;

    move-result-object v28

    if-eqz v28, :cond_1f

    const/16 v28, 0x1

    :goto_6
    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUseGetSet(Z)V

    goto/16 :goto_1

    .line 105
    :catch_0
    move-exception v10

    .line 106
    .local v10, "e":Ljava/lang/Exception;
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v29, "Problem accessing fields from the @Column annotation for field "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-static {v0, v10}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v28

    throw v28

    .line 117
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v20    # "method":Ljava/lang/reflect/Method;
    .restart local v24    # "optional":Ljava/lang/Boolean;
    :cond_19
    :try_start_4
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v28

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setCanBeNull(Z)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_2

    .line 119
    .end local v20    # "method":Ljava/lang/reflect/Method;
    .end local v24    # "optional":Ljava/lang/Boolean;
    :catch_1
    move-exception v10

    .line 120
    .restart local v10    # "e":Ljava/lang/Exception;
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v29, "Problem accessing fields from the @Basic annotation for field "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-static {v0, v10}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v28

    throw v28

    .line 129
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_1a
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setGeneratedId(Z)V

    goto/16 :goto_3

    .line 149
    :catch_2
    move-exception v10

    .line 150
    .restart local v10    # "e":Ljava/lang/Exception;
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v29, "Problem accessing fields from the @JoinColumn annotation for field "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-static {v0, v10}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v28

    throw v28

    .line 156
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_1b
    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setForeign(Z)V

    .line 157
    if-eqz v17, :cond_15

    .line 159
    :try_start_5
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "name"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 160
    .restart local v20    # "method":Ljava/lang/reflect/Method;
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    .line 161
    .restart local v21    # "name":Ljava/lang/String;
    if-eqz v21, :cond_1c

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v28

    if-lez v28, :cond_1c

    .line 162
    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setColumnName(Ljava/lang/String;)V

    .line 164
    :cond_1c
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "nullable"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 165
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Boolean;

    .line 166
    .restart local v22    # "nullable":Ljava/lang/Boolean;
    if-eqz v22, :cond_1d

    .line 167
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v28

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setCanBeNull(Z)V

    .line 169
    :cond_1d
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v28

    const-string/jumbo v29, "unique"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    invoke-virtual/range {v28 .. v30}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v20

    .line 170
    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/lang/Boolean;

    .line 171
    .restart local v26    # "unique":Ljava/lang/Boolean;
    if-eqz v26, :cond_15

    .line 172
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v28

    move/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setUnique(Z)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto/16 :goto_4

    .line 174
    .end local v20    # "method":Ljava/lang/reflect/Method;
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "nullable":Ljava/lang/Boolean;
    .end local v26    # "unique":Ljava/lang/Boolean;
    :catch_3
    move-exception v10

    .line 175
    .restart local v10    # "e":Ljava/lang/Exception;
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v29, "Problem accessing fields from the @JoinColumn annotation for field "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-static {v0, v10}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v28

    throw v28

    .line 188
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v20    # "method":Ljava/lang/reflect/Method;
    .restart local v25    # "typeValue":Ljava/lang/Object;
    :cond_1e
    :try_start_6
    sget-object v28, Lcom/j256/ormlite/field/DataType;->ENUM_INTEGER:Lcom/j256/ormlite/field/DataType;

    move-object/from16 v0, v28

    invoke-virtual {v9, v0}, Lcom/j256/ormlite/field/DatabaseFieldConfig;->setDataType(Lcom/j256/ormlite/field/DataType;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    goto/16 :goto_5

    .line 190
    .end local v20    # "method":Ljava/lang/reflect/Method;
    .end local v25    # "typeValue":Ljava/lang/Object;
    :catch_4
    move-exception v10

    .line 191
    .restart local v10    # "e":Ljava/lang/Exception;
    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v29, "Problem accessing fields from the @Enumerated annotation for field "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-static {v0, v10}, Lcom/j256/ormlite/misc/SqlExceptionUtil;->create(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/sql/SQLException;

    move-result-object v28

    throw v28

    .line 202
    .end local v10    # "e":Ljava/lang/Exception;
    :cond_1f
    const/16 v28, 0x0

    goto/16 :goto_6
.end method

.method public static getEntityName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v9, 0x0

    .line 212
    const/4 v4, 0x0

    .line 213
    .local v4, "entityAnnotation":Ljava/lang/annotation/Annotation;
    invoke-virtual {p0}, Ljava/lang/Class;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v2

    .local v2, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_1

    aget-object v0, v2, v5

    .line 214
    .local v0, "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v1

    .line 215
    .local v1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    const-string/jumbo v11, "javax.persistence.Entity"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 216
    move-object v4, v0

    .line 213
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 220
    .end local v0    # "annotation":Ljava/lang/annotation/Annotation;
    .end local v1    # "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    if-nez v4, :cond_3

    move-object v8, v9

    .line 229
    :cond_2
    :goto_1
    return-object v8

    .line 224
    :cond_3
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string/jumbo v11, "name"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 225
    .local v7, "method":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v7, v4, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 226
    .local v8, "name":Ljava/lang/String;
    if-eqz v8, :cond_4

    invoke-virtual {v8}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    if-gtz v10, :cond_2

    :cond_4
    move-object v8, v9

    .line 229
    goto :goto_1

    .line 231
    .end local v7    # "method":Ljava/lang/reflect/Method;
    .end local v8    # "name":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 232
    .local v3, "e":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/IllegalStateException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Could not get entity name from class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
.end method
