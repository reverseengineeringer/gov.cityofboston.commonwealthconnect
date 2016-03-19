package com.actionbarsherlock.widget;

final class ActivityChooserModel$HistoryLoader
  implements Runnable
{
  private ActivityChooserModel$HistoryLoader(ActivityChooserModel paramActivityChooserModel) {}
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   4: invokestatic 35	com/actionbarsherlock/widget/ActivityChooserModel:access$400	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/content/Context;
    //   7: aload_0
    //   8: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   11: invokestatic 39	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   14: invokevirtual 45	android/content/Context:openFileInput	(Ljava/lang/String;)Ljava/io/FileInputStream;
    //   17: astore_2
    //   18: invokestatic 51	android/util/Xml:newPullParser	()Lorg/xmlpull/v1/XmlPullParser;
    //   21: astore_3
    //   22: aload_3
    //   23: aload_2
    //   24: aconst_null
    //   25: invokeinterface 57 3 0
    //   30: iconst_0
    //   31: istore_1
    //   32: iload_1
    //   33: iconst_1
    //   34: if_icmpeq +18 -> 52
    //   37: iload_1
    //   38: iconst_2
    //   39: if_icmpeq +13 -> 52
    //   42: aload_3
    //   43: invokeinterface 61 1 0
    //   48: istore_1
    //   49: goto -17 -> 32
    //   52: ldc 63
    //   54: aload_3
    //   55: invokeinterface 67 1 0
    //   60: invokevirtual 73	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   63: ifne +58 -> 121
    //   66: new 29	org/xmlpull/v1/XmlPullParserException
    //   69: dup
    //   70: ldc 75
    //   72: invokespecial 78	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
    //   75: athrow
    //   76: astore_3
    //   77: invokestatic 81	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
    //   80: new 83	java/lang/StringBuilder
    //   83: dup
    //   84: invokespecial 84	java/lang/StringBuilder:<init>	()V
    //   87: ldc 86
    //   89: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   92: aload_0
    //   93: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   96: invokestatic 39	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   99: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   102: invokevirtual 93	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   105: aload_3
    //   106: invokestatic 99	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   109: pop
    //   110: aload_2
    //   111: ifnull +342 -> 453
    //   114: aload_2
    //   115: invokevirtual 104	java/io/FileInputStream:close	()V
    //   118: return
    //   119: astore_2
    //   120: return
    //   121: new 106	java/util/ArrayList
    //   124: dup
    //   125: invokespecial 107	java/util/ArrayList:<init>	()V
    //   128: astore 4
    //   130: aload_3
    //   131: invokeinterface 61 1 0
    //   136: istore_1
    //   137: iload_1
    //   138: iconst_1
    //   139: if_icmpne +73 -> 212
    //   142: aload_0
    //   143: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   146: invokestatic 111	com/actionbarsherlock/widget/ActivityChooserModel:access$500	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/Object;
    //   149: astore_3
    //   150: aload_3
    //   151: monitorenter
    //   152: new 113	java/util/LinkedHashSet
    //   155: dup
    //   156: aload 4
    //   158: invokespecial 116	java/util/LinkedHashSet:<init>	(Ljava/util/Collection;)V
    //   161: astore 4
    //   163: aload_0
    //   164: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   167: invokestatic 120	com/actionbarsherlock/widget/ActivityChooserModel:access$600	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/util/List;
    //   170: astore 5
    //   172: aload 5
    //   174: invokeinterface 125 1 0
    //   179: iconst_1
    //   180: isub
    //   181: istore_1
    //   182: iload_1
    //   183: iflt +170 -> 353
    //   186: aload 4
    //   188: aload 5
    //   190: iload_1
    //   191: invokeinterface 129 2 0
    //   196: checkcast 131	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord
    //   199: invokeinterface 136 2 0
    //   204: pop
    //   205: iload_1
    //   206: iconst_1
    //   207: isub
    //   208: istore_1
    //   209: goto -27 -> 182
    //   212: iload_1
    //   213: iconst_3
    //   214: if_icmpeq -84 -> 130
    //   217: iload_1
    //   218: iconst_4
    //   219: if_icmpeq -89 -> 130
    //   222: ldc -118
    //   224: aload_3
    //   225: invokeinterface 67 1 0
    //   230: invokevirtual 73	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   233: ifne +58 -> 291
    //   236: new 29	org/xmlpull/v1/XmlPullParserException
    //   239: dup
    //   240: ldc -116
    //   242: invokespecial 78	org/xmlpull/v1/XmlPullParserException:<init>	(Ljava/lang/String;)V
    //   245: athrow
    //   246: astore_3
    //   247: invokestatic 81	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
    //   250: new 83	java/lang/StringBuilder
    //   253: dup
    //   254: invokespecial 84	java/lang/StringBuilder:<init>	()V
    //   257: ldc 86
    //   259: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   262: aload_0
    //   263: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   266: invokestatic 39	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   269: invokevirtual 90	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   272: invokevirtual 93	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   275: aload_3
    //   276: invokestatic 99	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   279: pop
    //   280: aload_2
    //   281: ifnull +172 -> 453
    //   284: aload_2
    //   285: invokevirtual 104	java/io/FileInputStream:close	()V
    //   288: return
    //   289: astore_2
    //   290: return
    //   291: aload 4
    //   293: new 131	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord
    //   296: dup
    //   297: aload_3
    //   298: aconst_null
    //   299: ldc -114
    //   301: invokeinterface 146 3 0
    //   306: aload_3
    //   307: aconst_null
    //   308: ldc -108
    //   310: invokeinterface 146 3 0
    //   315: invokestatic 154	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   318: aload_3
    //   319: aconst_null
    //   320: ldc -100
    //   322: invokeinterface 146 3 0
    //   327: invokestatic 162	java/lang/Float:parseFloat	(Ljava/lang/String;)F
    //   330: invokespecial 165	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:<init>	(Ljava/lang/String;JF)V
    //   333: invokeinterface 166 2 0
    //   338: pop
    //   339: goto -209 -> 130
    //   342: astore_3
    //   343: aload_2
    //   344: ifnull +7 -> 351
    //   347: aload_2
    //   348: invokevirtual 104	java/io/FileInputStream:close	()V
    //   351: aload_3
    //   352: athrow
    //   353: aload 5
    //   355: invokeinterface 125 1 0
    //   360: aload 4
    //   362: invokeinterface 167 1 0
    //   367: if_icmpne +16 -> 383
    //   370: aload_3
    //   371: monitorexit
    //   372: aload_2
    //   373: ifnull +80 -> 453
    //   376: aload_2
    //   377: invokevirtual 104	java/io/FileInputStream:close	()V
    //   380: return
    //   381: astore_2
    //   382: return
    //   383: aload 5
    //   385: invokeinterface 170 1 0
    //   390: aload 5
    //   392: aload 4
    //   394: invokeinterface 174 2 0
    //   399: pop
    //   400: aload_0
    //   401: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   404: iconst_1
    //   405: invokestatic 178	com/actionbarsherlock/widget/ActivityChooserModel:access$702	(Lcom/actionbarsherlock/widget/ActivityChooserModel;Z)Z
    //   408: pop
    //   409: aload_0
    //   410: getfield 17	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   413: invokestatic 182	com/actionbarsherlock/widget/ActivityChooserModel:access$1000	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/os/Handler;
    //   416: new 11	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1
    //   419: dup
    //   420: aload_0
    //   421: invokespecial 185	com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader$1:<init>	(Lcom/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader;)V
    //   424: invokevirtual 191	android/os/Handler:post	(Ljava/lang/Runnable;)Z
    //   427: pop
    //   428: aload_3
    //   429: monitorexit
    //   430: aload_2
    //   431: ifnull +22 -> 453
    //   434: aload_2
    //   435: invokevirtual 104	java/io/FileInputStream:close	()V
    //   438: return
    //   439: astore_2
    //   440: return
    //   441: astore 4
    //   443: aload_3
    //   444: monitorexit
    //   445: aload 4
    //   447: athrow
    //   448: astore_2
    //   449: goto -98 -> 351
    //   452: astore_2
    //   453: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	454	0	this	HistoryLoader
    //   31	189	1	i	int
    //   17	98	2	localFileInputStream	java.io.FileInputStream
    //   119	166	2	localIOException1	java.io.IOException
    //   289	88	2	localIOException2	java.io.IOException
    //   381	54	2	localIOException3	java.io.IOException
    //   439	1	2	localIOException4	java.io.IOException
    //   448	1	2	localIOException5	java.io.IOException
    //   452	1	2	localFileNotFoundException	java.io.FileNotFoundException
    //   21	34	3	localXmlPullParser	org.xmlpull.v1.XmlPullParser
    //   76	55	3	localXmlPullParserException	org.xmlpull.v1.XmlPullParserException
    //   246	73	3	localIOException6	java.io.IOException
    //   342	102	3	localObject2	Object
    //   128	265	4	localObject3	Object
    //   441	5	4	localObject4	Object
    //   170	221	5	localList	java.util.List
    // Exception table:
    //   from	to	target	type
    //   18	30	76	org/xmlpull/v1/XmlPullParserException
    //   42	49	76	org/xmlpull/v1/XmlPullParserException
    //   52	76	76	org/xmlpull/v1/XmlPullParserException
    //   121	130	76	org/xmlpull/v1/XmlPullParserException
    //   130	137	76	org/xmlpull/v1/XmlPullParserException
    //   142	152	76	org/xmlpull/v1/XmlPullParserException
    //   222	246	76	org/xmlpull/v1/XmlPullParserException
    //   291	339	76	org/xmlpull/v1/XmlPullParserException
    //   445	448	76	org/xmlpull/v1/XmlPullParserException
    //   114	118	119	java/io/IOException
    //   18	30	246	java/io/IOException
    //   42	49	246	java/io/IOException
    //   52	76	246	java/io/IOException
    //   121	130	246	java/io/IOException
    //   130	137	246	java/io/IOException
    //   142	152	246	java/io/IOException
    //   222	246	246	java/io/IOException
    //   291	339	246	java/io/IOException
    //   445	448	246	java/io/IOException
    //   284	288	289	java/io/IOException
    //   18	30	342	finally
    //   42	49	342	finally
    //   52	76	342	finally
    //   77	110	342	finally
    //   121	130	342	finally
    //   130	137	342	finally
    //   142	152	342	finally
    //   222	246	342	finally
    //   247	280	342	finally
    //   291	339	342	finally
    //   445	448	342	finally
    //   376	380	381	java/io/IOException
    //   434	438	439	java/io/IOException
    //   152	182	441	finally
    //   186	205	441	finally
    //   353	372	441	finally
    //   383	430	441	finally
    //   443	445	441	finally
    //   347	351	448	java/io/IOException
    //   0	18	452	java/io/FileNotFoundException
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.widget.ActivityChooserModel.HistoryLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */