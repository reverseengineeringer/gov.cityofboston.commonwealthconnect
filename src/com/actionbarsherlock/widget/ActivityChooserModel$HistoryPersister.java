package com.actionbarsherlock.widget;

final class ActivityChooserModel$HistoryPersister
  implements Runnable
{
  private ActivityChooserModel$HistoryPersister(ActivityChooserModel paramActivityChooserModel) {}
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   4: invokestatic 35	com/actionbarsherlock/widget/ActivityChooserModel:access$500	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/Object;
    //   7: astore 4
    //   9: aload 4
    //   11: monitorenter
    //   12: new 37	java/util/ArrayList
    //   15: dup
    //   16: aload_0
    //   17: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   20: invokestatic 41	com/actionbarsherlock/widget/ActivityChooserModel:access$600	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/util/List;
    //   23: invokespecial 44	java/util/ArrayList:<init>	(Ljava/util/Collection;)V
    //   26: astore 5
    //   28: aload 4
    //   30: monitorexit
    //   31: aload_0
    //   32: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   35: invokestatic 48	com/actionbarsherlock/widget/ActivityChooserModel:access$400	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Landroid/content/Context;
    //   38: aload_0
    //   39: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   42: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   45: iconst_0
    //   46: invokevirtual 58	android/content/Context:openFileOutput	(Ljava/lang/String;I)Ljava/io/FileOutputStream;
    //   49: astore_3
    //   50: invokestatic 64	android/util/Xml:newSerializer	()Lorg/xmlpull/v1/XmlSerializer;
    //   53: astore 4
    //   55: aload 4
    //   57: aload_3
    //   58: aconst_null
    //   59: invokeinterface 70 3 0
    //   64: aload 4
    //   66: ldc 72
    //   68: iconst_1
    //   69: invokestatic 78	java/lang/Boolean:valueOf	(Z)Ljava/lang/Boolean;
    //   72: invokeinterface 82 3 0
    //   77: aload 4
    //   79: aconst_null
    //   80: ldc 84
    //   82: invokeinterface 88 3 0
    //   87: pop
    //   88: aload 5
    //   90: invokeinterface 94 1 0
    //   95: istore_2
    //   96: iconst_0
    //   97: istore_1
    //   98: iload_1
    //   99: iload_2
    //   100: if_icmpge +143 -> 243
    //   103: aload 5
    //   105: iconst_0
    //   106: invokeinterface 98 2 0
    //   111: checkcast 100	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord
    //   114: astore 6
    //   116: aload 4
    //   118: aconst_null
    //   119: ldc 102
    //   121: invokeinterface 88 3 0
    //   126: pop
    //   127: aload 4
    //   129: aconst_null
    //   130: ldc 104
    //   132: aload 6
    //   134: getfield 107	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:activity	Landroid/content/ComponentName;
    //   137: invokevirtual 113	android/content/ComponentName:flattenToString	()Ljava/lang/String;
    //   140: invokeinterface 117 4 0
    //   145: pop
    //   146: aload 4
    //   148: aconst_null
    //   149: ldc 119
    //   151: aload 6
    //   153: getfield 122	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:time	J
    //   156: invokestatic 127	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   159: invokeinterface 117 4 0
    //   164: pop
    //   165: aload 4
    //   167: aconst_null
    //   168: ldc -127
    //   170: aload 6
    //   172: getfield 132	com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord:weight	F
    //   175: invokestatic 135	java/lang/String:valueOf	(F)Ljava/lang/String;
    //   178: invokeinterface 117 4 0
    //   183: pop
    //   184: aload 4
    //   186: aconst_null
    //   187: ldc 102
    //   189: invokeinterface 138 3 0
    //   194: pop
    //   195: iload_1
    //   196: iconst_1
    //   197: iadd
    //   198: istore_1
    //   199: goto -101 -> 98
    //   202: astore_3
    //   203: aload 4
    //   205: monitorexit
    //   206: aload_3
    //   207: athrow
    //   208: astore_3
    //   209: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
    //   212: new 143	java/lang/StringBuilder
    //   215: dup
    //   216: invokespecial 144	java/lang/StringBuilder:<init>	()V
    //   219: ldc -110
    //   221: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   224: aload_0
    //   225: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   228: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   231: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   234: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   237: aload_3
    //   238: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   241: pop
    //   242: return
    //   243: aload 4
    //   245: aconst_null
    //   246: ldc 84
    //   248: invokeinterface 138 3 0
    //   253: pop
    //   254: aload 4
    //   256: invokeinterface 162 1 0
    //   261: aload_3
    //   262: ifnull -20 -> 242
    //   265: aload_3
    //   266: invokevirtual 167	java/io/FileOutputStream:close	()V
    //   269: return
    //   270: astore_3
    //   271: return
    //   272: astore 4
    //   274: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
    //   277: new 143	java/lang/StringBuilder
    //   280: dup
    //   281: invokespecial 144	java/lang/StringBuilder:<init>	()V
    //   284: ldc -110
    //   286: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   289: aload_0
    //   290: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   293: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   296: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   299: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   302: aload 4
    //   304: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   307: pop
    //   308: aload_3
    //   309: ifnull -67 -> 242
    //   312: aload_3
    //   313: invokevirtual 167	java/io/FileOutputStream:close	()V
    //   316: return
    //   317: astore_3
    //   318: return
    //   319: astore 4
    //   321: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
    //   324: new 143	java/lang/StringBuilder
    //   327: dup
    //   328: invokespecial 144	java/lang/StringBuilder:<init>	()V
    //   331: ldc -110
    //   333: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   336: aload_0
    //   337: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   340: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   343: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   346: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   349: aload 4
    //   351: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   354: pop
    //   355: aload_3
    //   356: ifnull -114 -> 242
    //   359: aload_3
    //   360: invokevirtual 167	java/io/FileOutputStream:close	()V
    //   363: return
    //   364: astore_3
    //   365: return
    //   366: astore 4
    //   368: invokestatic 141	com/actionbarsherlock/widget/ActivityChooserModel:access$1100	()Ljava/lang/String;
    //   371: new 143	java/lang/StringBuilder
    //   374: dup
    //   375: invokespecial 144	java/lang/StringBuilder:<init>	()V
    //   378: ldc -110
    //   380: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   383: aload_0
    //   384: getfield 15	com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister:this$0	Lcom/actionbarsherlock/widget/ActivityChooserModel;
    //   387: invokestatic 52	com/actionbarsherlock/widget/ActivityChooserModel:access$300	(Lcom/actionbarsherlock/widget/ActivityChooserModel;)Ljava/lang/String;
    //   390: invokevirtual 150	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   393: invokevirtual 153	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   396: aload 4
    //   398: invokestatic 159	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   401: pop
    //   402: aload_3
    //   403: ifnull -161 -> 242
    //   406: aload_3
    //   407: invokevirtual 167	java/io/FileOutputStream:close	()V
    //   410: return
    //   411: astore_3
    //   412: return
    //   413: astore 4
    //   415: aload_3
    //   416: ifnull +7 -> 423
    //   419: aload_3
    //   420: invokevirtual 167	java/io/FileOutputStream:close	()V
    //   423: aload 4
    //   425: athrow
    //   426: astore_3
    //   427: goto -4 -> 423
    //   430: astore_3
    //   431: goto -228 -> 203
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	434	0	this	HistoryPersister
    //   97	102	1	i	int
    //   95	6	2	j	int
    //   49	9	3	localFileOutputStream	java.io.FileOutputStream
    //   202	5	3	localObject1	Object
    //   208	58	3	localFileNotFoundException	java.io.FileNotFoundException
    //   270	43	3	localIOException1	java.io.IOException
    //   317	43	3	localIOException2	java.io.IOException
    //   364	43	3	localIOException3	java.io.IOException
    //   411	9	3	localIOException4	java.io.IOException
    //   426	1	3	localIOException5	java.io.IOException
    //   430	1	3	localObject2	Object
    //   7	248	4	localObject3	Object
    //   272	31	4	localIllegalArgumentException	IllegalArgumentException
    //   319	31	4	localIllegalStateException	IllegalStateException
    //   366	31	4	localIOException6	java.io.IOException
    //   413	11	4	localObject4	Object
    //   26	78	5	localArrayList	java.util.ArrayList
    //   114	57	6	localHistoricalRecord	ActivityChooserModel.HistoricalRecord
    // Exception table:
    //   from	to	target	type
    //   12	28	202	finally
    //   203	206	202	finally
    //   31	50	208	java/io/FileNotFoundException
    //   265	269	270	java/io/IOException
    //   55	96	272	java/lang/IllegalArgumentException
    //   103	195	272	java/lang/IllegalArgumentException
    //   243	261	272	java/lang/IllegalArgumentException
    //   312	316	317	java/io/IOException
    //   55	96	319	java/lang/IllegalStateException
    //   103	195	319	java/lang/IllegalStateException
    //   243	261	319	java/lang/IllegalStateException
    //   359	363	364	java/io/IOException
    //   55	96	366	java/io/IOException
    //   103	195	366	java/io/IOException
    //   243	261	366	java/io/IOException
    //   406	410	411	java/io/IOException
    //   55	96	413	finally
    //   103	195	413	finally
    //   243	261	413	finally
    //   274	308	413	finally
    //   321	355	413	finally
    //   368	402	413	finally
    //   419	423	426	java/io/IOException
    //   28	31	430	finally
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.widget.ActivityChooserModel.HistoryPersister
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */