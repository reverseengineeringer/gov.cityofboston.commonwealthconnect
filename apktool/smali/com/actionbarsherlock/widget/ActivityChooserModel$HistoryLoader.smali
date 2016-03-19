.class final Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;
.super Ljava/lang/Object;
.source "ActivityChooserModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/actionbarsherlock/widget/ActivityChooserModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "HistoryLoader"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;


# direct methods
.method private constructor <init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;)V
    .locals 0

    .prologue
    .line 930
    iput-object p1, p0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;Lcom/actionbarsherlock/widget/ActivityChooserModel$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/actionbarsherlock/widget/ActivityChooserModel;
    .param p2, "x1"    # Lcom/actionbarsherlock/widget/ActivityChooserModel$1;

    .prologue
    .line 930
    invoke-direct {p0, p1}, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;-><init>(Lcom/actionbarsherlock/widget/ActivityChooserModel;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 25

    .prologue
    .line 933
    const/4 v5, 0x0

    .line 935
    .local v5, "fis":Ljava/io/FileInputStream;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v22, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mContext:Landroid/content/Context;
    invoke-static/range {v22 .. v22}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$400(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/content/Context;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v23, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 943
    :try_start_1
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v13

    .line 944
    .local v13, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const/16 v22, 0x0

    move-object/from16 v0, v22

    invoke-interface {v13, v5, v0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 946
    const/16 v18, 0x0

    .line 947
    .local v18, "type":I
    :goto_0
    const/16 v22, 0x1

    move/from16 v0, v18

    move/from16 v1, v22

    if-eq v0, v1, :cond_1

    const/16 v22, 0x2

    move/from16 v0, v18

    move/from16 v1, v22

    if-eq v0, v1, :cond_1

    .line 948
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v18

    goto :goto_0

    .line 936
    .end local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v18    # "type":I
    :catch_0
    move-exception v6

    .line 1038
    :cond_0
    :goto_1
    return-void

    .line 951
    .restart local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v18    # "type":I
    :cond_1
    const-string/jumbo v22, "historical-records"

    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_2

    .line 952
    new-instance v22, Lorg/xmlpull/v1/XmlPullParserException;

    const-string/jumbo v23, "Share records file does not start with historical-records tag."

    invoke-direct/range {v22 .. v23}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1025
    .end local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v18    # "type":I
    :catch_1
    move-exception v21

    .line 1026
    .local v21, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_2
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v22

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Error reading historical recrod file: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v24, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1030
    if-eqz v5, :cond_0

    .line 1032
    :try_start_3
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 1033
    :catch_2
    move-exception v22

    goto :goto_1

    .line 956
    .end local v21    # "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v18    # "type":I
    :cond_2
    :try_start_4
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 959
    .local v15, "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :cond_3
    :goto_2
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v18

    .line 960
    const/16 v22, 0x1

    move/from16 v0, v18

    move/from16 v1, v22

    if-ne v0, v1, :cond_4

    .line 990
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v22, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;
    invoke-static/range {v22 .. v22}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$500(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/Object;

    move-result-object v23

    monitor-enter v23
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 991
    :try_start_5
    new-instance v19, Ljava/util/LinkedHashSet;

    move-object/from16 v0, v19

    invoke-direct {v0, v15}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 998
    .local v19, "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v22, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;
    invoke-static/range {v22 .. v22}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$600(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/util/List;

    move-result-object v8

    .line 999
    .local v8, "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    .line 1000
    .local v9, "historicalRecordsCount":I
    add-int/lit8 v10, v9, -0x1

    .local v10, "i":I
    :goto_3
    if-ltz v10, :cond_7

    .line 1001
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;

    .line 1002
    .local v7, "historicalRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    move-object/from16 v0, v19

    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1000
    add-int/lit8 v10, v10, -0x1

    goto :goto_3

    .line 963
    .end local v7    # "historicalRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    .end local v8    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v9    # "historicalRecordsCount":I
    .end local v10    # "i":I
    .end local v19    # "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :cond_4
    const/16 v22, 0x3

    move/from16 v0, v18

    move/from16 v1, v22

    if-eq v0, v1, :cond_3

    const/16 v22, 0x4

    move/from16 v0, v18

    move/from16 v1, v22

    if-eq v0, v1, :cond_3

    .line 966
    :try_start_6
    invoke-interface {v13}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    .line 967
    .local v12, "nodeName":Ljava/lang/String;
    const-string/jumbo v22, "historical-record"

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_5

    .line 968
    new-instance v22, Lorg/xmlpull/v1/XmlPullParserException;

    const-string/jumbo v23, "Share records file not well-formed."

    invoke-direct/range {v22 .. v23}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_6
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1027
    .end local v12    # "nodeName":Ljava/lang/String;
    .end local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v15    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v18    # "type":I
    :catch_3
    move-exception v11

    .line 1028
    .local v11, "ioe":Ljava/io/IOException;
    :try_start_7
    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;
    invoke-static {}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1100()Ljava/lang/String;

    move-result-object v22

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Error reading historical recrod file: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v24, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$300(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-static {v0, v1, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1030
    if-eqz v5, :cond_0

    .line 1032
    :try_start_8
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    goto/16 :goto_1

    .line 1033
    :catch_4
    move-exception v22

    goto/16 :goto_1

    .line 971
    .end local v11    # "ioe":Ljava/io/IOException;
    .restart local v12    # "nodeName":Ljava/lang/String;
    .restart local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v15    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v18    # "type":I
    :cond_5
    const/16 v22, 0x0

    :try_start_9
    const-string/jumbo v23, "activity"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v13, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 972
    .local v4, "activity":Ljava/lang/String;
    const/16 v22, 0x0

    const-string/jumbo v23, "time"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v13, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    .line 974
    .local v16, "time":J
    const/16 v22, 0x0

    const-string/jumbo v23, "weight"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-interface {v13, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v20

    .line 977
    .local v20, "weight":F
    new-instance v14, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;

    move-wide/from16 v0, v16

    move/from16 v2, v20

    invoke-direct {v14, v4, v0, v1, v2}, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;-><init>(Ljava/lang/String;JF)V

    .line 979
    .local v14, "readRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    invoke-interface {v15, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_9
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_2

    .line 1030
    .end local v4    # "activity":Ljava/lang/String;
    .end local v12    # "nodeName":Ljava/lang/String;
    .end local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v14    # "readRecord":Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;
    .end local v15    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v16    # "time":J
    .end local v18    # "type":I
    .end local v20    # "weight":F
    :catchall_0
    move-exception v22

    if-eqz v5, :cond_6

    .line 1032
    :try_start_a
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7

    .line 1035
    :cond_6
    :goto_4
    throw v22

    .line 1005
    .restart local v8    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v9    # "historicalRecordsCount":I
    .restart local v10    # "i":I
    .restart local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v15    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v18    # "type":I
    .restart local v19    # "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :cond_7
    :try_start_b
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v22

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->size()I

    move-result v24

    move/from16 v0, v22

    move/from16 v1, v24

    if-ne v0, v1, :cond_8

    .line 1006
    monitor-exit v23
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 1030
    if-eqz v5, :cond_0

    .line 1032
    :try_start_c
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_5

    goto/16 :goto_1

    .line 1033
    :catch_5
    move-exception v22

    goto/16 :goto_1

    .line 1010
    :cond_8
    :try_start_d
    invoke-interface {v8}, Ljava/util/List;->clear()V

    .line 1011
    move-object/from16 v0, v19

    invoke-interface {v8, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1013
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v22, v0

    const/16 v24, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v24

    # setter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z
    invoke-static {v0, v1}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$702(Lcom/actionbarsherlock/widget/ActivityChooserModel;Z)Z

    .line 1018
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;->this$0:Lcom/actionbarsherlock/widget/ActivityChooserModel;

    move-object/from16 v22, v0

    # getter for: Lcom/actionbarsherlock/widget/ActivityChooserModel;->mHandler:Landroid/os/Handler;
    invoke-static/range {v22 .. v22}, Lcom/actionbarsherlock/widget/ActivityChooserModel;->access$1000(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/os/Handler;

    move-result-object v22

    new-instance v24, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1;

    invoke-direct/range {v24 .. v25}, Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1;-><init>(Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;)V

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1024
    monitor-exit v23
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 1030
    if-eqz v5, :cond_0

    .line 1032
    :try_start_e
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_6

    goto/16 :goto_1

    .line 1033
    :catch_6
    move-exception v22

    goto/16 :goto_1

    .line 1024
    .end local v8    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v9    # "historicalRecordsCount":I
    .end local v10    # "i":I
    .end local v19    # "uniqueShareRecords":Ljava/util/Set;, "Ljava/util/Set<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    :catchall_1
    move-exception v22

    :try_start_f
    monitor-exit v23
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_1

    :try_start_10
    throw v22
    :try_end_10
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_10 .. :try_end_10} :catch_1
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_3
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 1033
    .end local v13    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v15    # "readRecords":Ljava/util/List;, "Ljava/util/List<Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v18    # "type":I
    :catch_7
    move-exception v23

    goto :goto_4
.end method
