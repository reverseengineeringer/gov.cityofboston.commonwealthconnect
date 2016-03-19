package retrofit;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.Executor;

class RestAdapter$RestHandler
  implements InvocationHandler
{
  private final Map<Method, RestMethodInfo> methodDetailsCache;
  
  RestAdapter$RestHandler(Map<Method, RestMethodInfo> paramMap)
  {
    Map localMap;
    methodDetailsCache = localMap;
  }
  
  /* Error */
  private Object invokeRequest(RequestInterceptor paramRequestInterceptor, RestMethodInfo paramRestMethodInfo, Object[] paramArrayOfObject)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 12
    //   3: aconst_null
    //   4: astore 10
    //   6: aload 10
    //   8: astore 8
    //   10: aload 12
    //   12: astore 9
    //   14: aload_2
    //   15: invokevirtual 49	retrofit/RestMethodInfo:init	()V
    //   18: aload 10
    //   20: astore 8
    //   22: aload 12
    //   24: astore 9
    //   26: aload_0
    //   27: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   30: getfield 53	retrofit/RestAdapter:server	Lretrofit/Endpoint;
    //   33: invokeinterface 59 1 0
    //   38: astore 13
    //   40: aload 10
    //   42: astore 8
    //   44: aload 12
    //   46: astore 9
    //   48: new 61	retrofit/RequestBuilder
    //   51: dup
    //   52: aload 13
    //   54: aload_2
    //   55: aload_0
    //   56: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   59: getfield 65	retrofit/RestAdapter:converter	Lretrofit/converter/Converter;
    //   62: invokespecial 68	retrofit/RequestBuilder:<init>	(Ljava/lang/String;Lretrofit/RestMethodInfo;Lretrofit/converter/Converter;)V
    //   65: astore 11
    //   67: aload 10
    //   69: astore 8
    //   71: aload 12
    //   73: astore 9
    //   75: aload 11
    //   77: aload_3
    //   78: invokevirtual 72	retrofit/RequestBuilder:setArguments	([Ljava/lang/Object;)V
    //   81: aload 10
    //   83: astore 8
    //   85: aload 12
    //   87: astore 9
    //   89: aload_1
    //   90: aload 11
    //   92: invokeinterface 78 2 0
    //   97: aload 10
    //   99: astore 8
    //   101: aload 12
    //   103: astore 9
    //   105: aload 11
    //   107: invokevirtual 82	retrofit/RequestBuilder:build	()Lretrofit/client/Request;
    //   110: astore 11
    //   112: aload 10
    //   114: astore 8
    //   116: aload 12
    //   118: astore 9
    //   120: aload 11
    //   122: invokevirtual 85	retrofit/client/Request:getUrl	()Ljava/lang/String;
    //   125: astore 10
    //   127: aload 10
    //   129: astore 8
    //   131: aload 10
    //   133: astore 9
    //   135: aload_2
    //   136: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   139: ifne +45 -> 184
    //   142: aload 10
    //   144: astore 8
    //   146: aload 10
    //   148: astore 9
    //   150: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   153: new 97	java/lang/StringBuilder
    //   156: dup
    //   157: invokespecial 98	java/lang/StringBuilder:<init>	()V
    //   160: ldc 100
    //   162: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   165: aload 10
    //   167: aload 13
    //   169: invokevirtual 110	java/lang/String:length	()I
    //   172: invokevirtual 114	java/lang/String:substring	(I)Ljava/lang/String;
    //   175: invokevirtual 104	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   178: invokevirtual 117	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   181: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   184: aload 11
    //   186: astore_1
    //   187: aload 10
    //   189: astore 8
    //   191: aload 10
    //   193: astore 9
    //   195: aload_0
    //   196: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   199: getfield 125	retrofit/RestAdapter:logLevel	Lretrofit/RestAdapter$LogLevel;
    //   202: invokevirtual 131	retrofit/RestAdapter$LogLevel:log	()Z
    //   205: ifeq +24 -> 229
    //   208: aload 10
    //   210: astore 8
    //   212: aload 10
    //   214: astore 9
    //   216: aload_0
    //   217: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   220: ldc -123
    //   222: aload 11
    //   224: aload_3
    //   225: invokevirtual 137	retrofit/RestAdapter:logAndReplaceRequest	(Ljava/lang/String;Lretrofit/client/Request;[Ljava/lang/Object;)Lretrofit/client/Request;
    //   228: astore_1
    //   229: aconst_null
    //   230: astore_3
    //   231: aload 10
    //   233: astore 8
    //   235: aload 10
    //   237: astore 9
    //   239: aload_0
    //   240: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   243: invokestatic 141	retrofit/RestAdapter:access$200	(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   246: ifnull +24 -> 270
    //   249: aload 10
    //   251: astore 8
    //   253: aload 10
    //   255: astore 9
    //   257: aload_0
    //   258: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   261: invokestatic 141	retrofit/RestAdapter:access$200	(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   264: invokeinterface 147 1 0
    //   269: astore_3
    //   270: aload 10
    //   272: astore 8
    //   274: aload 10
    //   276: astore 9
    //   278: invokestatic 153	java/lang/System:nanoTime	()J
    //   281: lstore 5
    //   283: aload 10
    //   285: astore 8
    //   287: aload 10
    //   289: astore 9
    //   291: aload_0
    //   292: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   295: invokestatic 157	retrofit/RestAdapter:access$300	(Lretrofit/RestAdapter;)Lretrofit/client/Client$Provider;
    //   298: invokeinterface 163 1 0
    //   303: aload_1
    //   304: invokeinterface 169 2 0
    //   309: astore 11
    //   311: aload 10
    //   313: astore 8
    //   315: aload 10
    //   317: astore 9
    //   319: getstatic 175	java/util/concurrent/TimeUnit:NANOSECONDS	Ljava/util/concurrent/TimeUnit;
    //   322: invokestatic 153	java/lang/System:nanoTime	()J
    //   325: lload 5
    //   327: lsub
    //   328: invokevirtual 179	java/util/concurrent/TimeUnit:toMillis	(J)J
    //   331: lstore 5
    //   333: aload 10
    //   335: astore 8
    //   337: aload 10
    //   339: astore 9
    //   341: aload 11
    //   343: invokevirtual 184	retrofit/client/Response:getStatus	()I
    //   346: istore 4
    //   348: aload 10
    //   350: astore 8
    //   352: aload 10
    //   354: astore 9
    //   356: aload_0
    //   357: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   360: invokestatic 141	retrofit/RestAdapter:access$200	(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   363: ifnull +45 -> 408
    //   366: aload 10
    //   368: astore 8
    //   370: aload 10
    //   372: astore 9
    //   374: aload 13
    //   376: aload_2
    //   377: aload_1
    //   378: invokestatic 188	retrofit/RestAdapter:access$400	(Ljava/lang/String;Lretrofit/RestMethodInfo;Lretrofit/client/Request;)Lretrofit/Profiler$RequestInformation;
    //   381: astore_1
    //   382: aload 10
    //   384: astore 8
    //   386: aload 10
    //   388: astore 9
    //   390: aload_0
    //   391: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   394: invokestatic 141	retrofit/RestAdapter:access$200	(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   397: aload_1
    //   398: lload 5
    //   400: iload 4
    //   402: aload_3
    //   403: invokeinterface 192 6 0
    //   408: aload 11
    //   410: astore_1
    //   411: aload 10
    //   413: astore 8
    //   415: aload 10
    //   417: astore 9
    //   419: aload_0
    //   420: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   423: getfield 125	retrofit/RestAdapter:logLevel	Lretrofit/RestAdapter$LogLevel;
    //   426: invokevirtual 131	retrofit/RestAdapter$LogLevel:log	()Z
    //   429: ifeq +25 -> 454
    //   432: aload 10
    //   434: astore 8
    //   436: aload 10
    //   438: astore 9
    //   440: aload_0
    //   441: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   444: aload 10
    //   446: aload 11
    //   448: lload 5
    //   450: invokestatic 196	retrofit/RestAdapter:access$500	(Lretrofit/RestAdapter;Ljava/lang/String;Lretrofit/client/Response;J)Lretrofit/client/Response;
    //   453: astore_1
    //   454: aload 10
    //   456: astore 8
    //   458: aload 10
    //   460: astore 9
    //   462: aload_2
    //   463: getfield 200	retrofit/RestMethodInfo:responseObjectType	Ljava/lang/reflect/Type;
    //   466: astore 11
    //   468: iload 4
    //   470: sipush 200
    //   473: if_icmplt +475 -> 948
    //   476: iload 4
    //   478: sipush 300
    //   481: if_icmpge +467 -> 948
    //   484: aload 10
    //   486: astore 8
    //   488: aload 10
    //   490: astore 9
    //   492: aload 11
    //   494: ldc -75
    //   496: invokevirtual 204	java/lang/Object:equals	(Ljava/lang/Object;)Z
    //   499: ifeq +108 -> 607
    //   502: aload_1
    //   503: astore_3
    //   504: aload 10
    //   506: astore 8
    //   508: aload 10
    //   510: astore 9
    //   512: aload_2
    //   513: getfield 207	retrofit/RestMethodInfo:isStreaming	Z
    //   516: ifne +16 -> 532
    //   519: aload 10
    //   521: astore 8
    //   523: aload 10
    //   525: astore 9
    //   527: aload_1
    //   528: invokestatic 213	retrofit/Utils:readBodyToBytesIfNecessary	(Lretrofit/client/Response;)Lretrofit/client/Response;
    //   531: astore_3
    //   532: aload 10
    //   534: astore 8
    //   536: aload 10
    //   538: astore 9
    //   540: aload_2
    //   541: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   544: istore 7
    //   546: iload 7
    //   548: ifeq +22 -> 570
    //   551: aload_2
    //   552: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   555: ifne +11 -> 566
    //   558: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   561: ldc -41
    //   563: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   566: aload_3
    //   567: astore_1
    //   568: aload_1
    //   569: areturn
    //   570: aload 10
    //   572: astore 8
    //   574: aload 10
    //   576: astore 9
    //   578: new 217	retrofit/ResponseWrapper
    //   581: dup
    //   582: aload_3
    //   583: aload_3
    //   584: invokespecial 220	retrofit/ResponseWrapper:<init>	(Lretrofit/client/Response;Ljava/lang/Object;)V
    //   587: astore_3
    //   588: aload_3
    //   589: astore_1
    //   590: aload_2
    //   591: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   594: ifne -26 -> 568
    //   597: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   600: ldc -41
    //   602: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   605: aload_3
    //   606: areturn
    //   607: aload 10
    //   609: astore 8
    //   611: aload 10
    //   613: astore 9
    //   615: aload_1
    //   616: invokevirtual 224	retrofit/client/Response:getBody	()Lretrofit/mime/TypedInput;
    //   619: astore 13
    //   621: aload 13
    //   623: ifnonnull +78 -> 701
    //   626: aload 10
    //   628: astore 8
    //   630: aload 10
    //   632: astore 9
    //   634: aload_2
    //   635: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   638: istore 7
    //   640: iload 7
    //   642: ifeq +22 -> 664
    //   645: aconst_null
    //   646: astore_1
    //   647: aload_2
    //   648: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   651: ifne -83 -> 568
    //   654: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   657: ldc -41
    //   659: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   662: aconst_null
    //   663: areturn
    //   664: aload 10
    //   666: astore 8
    //   668: aload 10
    //   670: astore 9
    //   672: new 217	retrofit/ResponseWrapper
    //   675: dup
    //   676: aload_1
    //   677: aconst_null
    //   678: invokespecial 220	retrofit/ResponseWrapper:<init>	(Lretrofit/client/Response;Ljava/lang/Object;)V
    //   681: astore_3
    //   682: aload_3
    //   683: astore_1
    //   684: aload_2
    //   685: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   688: ifne -120 -> 568
    //   691: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   694: ldc -41
    //   696: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   699: aload_3
    //   700: areturn
    //   701: aload 10
    //   703: astore 8
    //   705: aload 10
    //   707: astore 9
    //   709: new 226	retrofit/ExceptionCatchingTypedInput
    //   712: dup
    //   713: aload 13
    //   715: invokespecial 229	retrofit/ExceptionCatchingTypedInput:<init>	(Lretrofit/mime/TypedInput;)V
    //   718: astore 12
    //   720: aload 10
    //   722: astore 8
    //   724: aload 10
    //   726: astore 9
    //   728: aload_0
    //   729: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   732: getfield 65	retrofit/RestAdapter:converter	Lretrofit/converter/Converter;
    //   735: aload 12
    //   737: aload 11
    //   739: invokeinterface 235 3 0
    //   744: astore_3
    //   745: aload 10
    //   747: astore 8
    //   749: aload 10
    //   751: astore 9
    //   753: aload_0
    //   754: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   757: aload 13
    //   759: aload_3
    //   760: invokestatic 239	retrofit/RestAdapter:access$600	(Lretrofit/RestAdapter;Lretrofit/mime/TypedInput;Ljava/lang/Object;)V
    //   763: aload 10
    //   765: astore 8
    //   767: aload 10
    //   769: astore 9
    //   771: aload_2
    //   772: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   775: istore 7
    //   777: iload 7
    //   779: ifeq +22 -> 801
    //   782: aload_3
    //   783: astore_1
    //   784: aload_2
    //   785: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   788: ifne -220 -> 568
    //   791: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   794: ldc -41
    //   796: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   799: aload_3
    //   800: areturn
    //   801: aload 10
    //   803: astore 8
    //   805: aload 10
    //   807: astore 9
    //   809: new 217	retrofit/ResponseWrapper
    //   812: dup
    //   813: aload_1
    //   814: aload_3
    //   815: invokespecial 220	retrofit/ResponseWrapper:<init>	(Lretrofit/client/Response;Ljava/lang/Object;)V
    //   818: astore_3
    //   819: aload_2
    //   820: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   823: ifne +11 -> 834
    //   826: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   829: ldc -41
    //   831: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   834: aload_3
    //   835: areturn
    //   836: astore_3
    //   837: aload 10
    //   839: astore 8
    //   841: aload 10
    //   843: astore 9
    //   845: aload 12
    //   847: invokevirtual 242	retrofit/ExceptionCatchingTypedInput:threwException	()Z
    //   850: ifeq +38 -> 888
    //   853: aload 10
    //   855: astore 8
    //   857: aload 10
    //   859: astore 9
    //   861: aload 12
    //   863: invokevirtual 246	retrofit/ExceptionCatchingTypedInput:getThrownException	()Ljava/io/IOException;
    //   866: athrow
    //   867: astore_1
    //   868: aload_1
    //   869: athrow
    //   870: astore_1
    //   871: aload_2
    //   872: getfield 89	retrofit/RestMethodInfo:isSynchronous	Z
    //   875: ifne +11 -> 886
    //   878: invokestatic 95	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   881: ldc -41
    //   883: invokevirtual 121	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   886: aload_1
    //   887: athrow
    //   888: aload 10
    //   890: astore 8
    //   892: aload 10
    //   894: astore 9
    //   896: aload 10
    //   898: aload_1
    //   899: aconst_null
    //   900: invokestatic 250	retrofit/Utils:replaceResponseBody	(Lretrofit/client/Response;Lretrofit/mime/TypedInput;)Lretrofit/client/Response;
    //   903: aload_0
    //   904: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   907: getfield 65	retrofit/RestAdapter:converter	Lretrofit/converter/Converter;
    //   910: aload 11
    //   912: aload_3
    //   913: invokestatic 254	retrofit/RetrofitError:conversionError	(Ljava/lang/String;Lretrofit/client/Response;Lretrofit/converter/Converter;Ljava/lang/reflect/Type;Lretrofit/converter/ConversionException;)Lretrofit/RetrofitError;
    //   916: athrow
    //   917: astore_1
    //   918: aload_0
    //   919: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   922: getfield 125	retrofit/RestAdapter:logLevel	Lretrofit/RestAdapter$LogLevel;
    //   925: invokevirtual 131	retrofit/RestAdapter$LogLevel:log	()Z
    //   928: ifeq +13 -> 941
    //   931: aload_0
    //   932: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   935: aload_1
    //   936: aload 8
    //   938: invokevirtual 258	retrofit/RestAdapter:logException	(Ljava/lang/Throwable;Ljava/lang/String;)V
    //   941: aload 8
    //   943: aload_1
    //   944: invokestatic 262	retrofit/RetrofitError:networkError	(Ljava/lang/String;Ljava/io/IOException;)Lretrofit/RetrofitError;
    //   947: athrow
    //   948: aload 10
    //   950: astore 8
    //   952: aload 10
    //   954: astore 9
    //   956: aload 10
    //   958: aload_1
    //   959: invokestatic 213	retrofit/Utils:readBodyToBytesIfNecessary	(Lretrofit/client/Response;)Lretrofit/client/Response;
    //   962: aload_0
    //   963: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   966: getfield 65	retrofit/RestAdapter:converter	Lretrofit/converter/Converter;
    //   969: aload 11
    //   971: invokestatic 266	retrofit/RetrofitError:httpError	(Ljava/lang/String;Lretrofit/client/Response;Lretrofit/converter/Converter;Ljava/lang/reflect/Type;)Lretrofit/RetrofitError;
    //   974: athrow
    //   975: astore_1
    //   976: aload_0
    //   977: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   980: getfield 125	retrofit/RestAdapter:logLevel	Lretrofit/RestAdapter$LogLevel;
    //   983: invokevirtual 131	retrofit/RestAdapter$LogLevel:log	()Z
    //   986: ifeq +13 -> 999
    //   989: aload_0
    //   990: getfield 22	retrofit/RestAdapter$RestHandler:this$0	Lretrofit/RestAdapter;
    //   993: aload_1
    //   994: aload 9
    //   996: invokevirtual 258	retrofit/RestAdapter:logException	(Ljava/lang/Throwable;Ljava/lang/String;)V
    //   999: aload 9
    //   1001: aload_1
    //   1002: invokestatic 270	retrofit/RetrofitError:unexpectedError	(Ljava/lang/String;Ljava/lang/Throwable;)Lretrofit/RetrofitError;
    //   1005: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1006	0	this	RestHandler
    //   0	1006	1	paramRequestInterceptor	RequestInterceptor
    //   0	1006	2	paramRestMethodInfo	RestMethodInfo
    //   0	1006	3	paramArrayOfObject	Object[]
    //   346	136	4	i	int
    //   281	168	5	l	long
    //   544	234	7	bool	boolean
    //   8	943	8	str1	String
    //   12	988	9	localObject1	Object
    //   4	953	10	str2	String
    //   65	905	11	localObject2	Object
    //   1	861	12	localExceptionCatchingTypedInput	ExceptionCatchingTypedInput
    //   38	720	13	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   728	745	836	retrofit/converter/ConversionException
    //   753	763	836	retrofit/converter/ConversionException
    //   771	777	836	retrofit/converter/ConversionException
    //   809	819	836	retrofit/converter/ConversionException
    //   14	18	867	retrofit/RetrofitError
    //   26	40	867	retrofit/RetrofitError
    //   48	67	867	retrofit/RetrofitError
    //   75	81	867	retrofit/RetrofitError
    //   89	97	867	retrofit/RetrofitError
    //   105	112	867	retrofit/RetrofitError
    //   120	127	867	retrofit/RetrofitError
    //   135	142	867	retrofit/RetrofitError
    //   150	184	867	retrofit/RetrofitError
    //   195	208	867	retrofit/RetrofitError
    //   216	229	867	retrofit/RetrofitError
    //   239	249	867	retrofit/RetrofitError
    //   257	270	867	retrofit/RetrofitError
    //   278	283	867	retrofit/RetrofitError
    //   291	311	867	retrofit/RetrofitError
    //   319	333	867	retrofit/RetrofitError
    //   341	348	867	retrofit/RetrofitError
    //   356	366	867	retrofit/RetrofitError
    //   374	382	867	retrofit/RetrofitError
    //   390	408	867	retrofit/RetrofitError
    //   419	432	867	retrofit/RetrofitError
    //   440	454	867	retrofit/RetrofitError
    //   462	468	867	retrofit/RetrofitError
    //   492	502	867	retrofit/RetrofitError
    //   512	519	867	retrofit/RetrofitError
    //   527	532	867	retrofit/RetrofitError
    //   540	546	867	retrofit/RetrofitError
    //   578	588	867	retrofit/RetrofitError
    //   615	621	867	retrofit/RetrofitError
    //   634	640	867	retrofit/RetrofitError
    //   672	682	867	retrofit/RetrofitError
    //   709	720	867	retrofit/RetrofitError
    //   728	745	867	retrofit/RetrofitError
    //   753	763	867	retrofit/RetrofitError
    //   771	777	867	retrofit/RetrofitError
    //   809	819	867	retrofit/RetrofitError
    //   845	853	867	retrofit/RetrofitError
    //   861	867	867	retrofit/RetrofitError
    //   896	917	867	retrofit/RetrofitError
    //   956	975	867	retrofit/RetrofitError
    //   14	18	870	finally
    //   26	40	870	finally
    //   48	67	870	finally
    //   75	81	870	finally
    //   89	97	870	finally
    //   105	112	870	finally
    //   120	127	870	finally
    //   135	142	870	finally
    //   150	184	870	finally
    //   195	208	870	finally
    //   216	229	870	finally
    //   239	249	870	finally
    //   257	270	870	finally
    //   278	283	870	finally
    //   291	311	870	finally
    //   319	333	870	finally
    //   341	348	870	finally
    //   356	366	870	finally
    //   374	382	870	finally
    //   390	408	870	finally
    //   419	432	870	finally
    //   440	454	870	finally
    //   462	468	870	finally
    //   492	502	870	finally
    //   512	519	870	finally
    //   527	532	870	finally
    //   540	546	870	finally
    //   578	588	870	finally
    //   615	621	870	finally
    //   634	640	870	finally
    //   672	682	870	finally
    //   709	720	870	finally
    //   728	745	870	finally
    //   753	763	870	finally
    //   771	777	870	finally
    //   809	819	870	finally
    //   845	853	870	finally
    //   861	867	870	finally
    //   868	870	870	finally
    //   896	917	870	finally
    //   918	941	870	finally
    //   941	948	870	finally
    //   956	975	870	finally
    //   976	999	870	finally
    //   999	1006	870	finally
    //   14	18	917	java/io/IOException
    //   26	40	917	java/io/IOException
    //   48	67	917	java/io/IOException
    //   75	81	917	java/io/IOException
    //   89	97	917	java/io/IOException
    //   105	112	917	java/io/IOException
    //   120	127	917	java/io/IOException
    //   135	142	917	java/io/IOException
    //   150	184	917	java/io/IOException
    //   195	208	917	java/io/IOException
    //   216	229	917	java/io/IOException
    //   239	249	917	java/io/IOException
    //   257	270	917	java/io/IOException
    //   278	283	917	java/io/IOException
    //   291	311	917	java/io/IOException
    //   319	333	917	java/io/IOException
    //   341	348	917	java/io/IOException
    //   356	366	917	java/io/IOException
    //   374	382	917	java/io/IOException
    //   390	408	917	java/io/IOException
    //   419	432	917	java/io/IOException
    //   440	454	917	java/io/IOException
    //   462	468	917	java/io/IOException
    //   492	502	917	java/io/IOException
    //   512	519	917	java/io/IOException
    //   527	532	917	java/io/IOException
    //   540	546	917	java/io/IOException
    //   578	588	917	java/io/IOException
    //   615	621	917	java/io/IOException
    //   634	640	917	java/io/IOException
    //   672	682	917	java/io/IOException
    //   709	720	917	java/io/IOException
    //   728	745	917	java/io/IOException
    //   753	763	917	java/io/IOException
    //   771	777	917	java/io/IOException
    //   809	819	917	java/io/IOException
    //   845	853	917	java/io/IOException
    //   861	867	917	java/io/IOException
    //   896	917	917	java/io/IOException
    //   956	975	917	java/io/IOException
    //   14	18	975	java/lang/Throwable
    //   26	40	975	java/lang/Throwable
    //   48	67	975	java/lang/Throwable
    //   75	81	975	java/lang/Throwable
    //   89	97	975	java/lang/Throwable
    //   105	112	975	java/lang/Throwable
    //   120	127	975	java/lang/Throwable
    //   135	142	975	java/lang/Throwable
    //   150	184	975	java/lang/Throwable
    //   195	208	975	java/lang/Throwable
    //   216	229	975	java/lang/Throwable
    //   239	249	975	java/lang/Throwable
    //   257	270	975	java/lang/Throwable
    //   278	283	975	java/lang/Throwable
    //   291	311	975	java/lang/Throwable
    //   319	333	975	java/lang/Throwable
    //   341	348	975	java/lang/Throwable
    //   356	366	975	java/lang/Throwable
    //   374	382	975	java/lang/Throwable
    //   390	408	975	java/lang/Throwable
    //   419	432	975	java/lang/Throwable
    //   440	454	975	java/lang/Throwable
    //   462	468	975	java/lang/Throwable
    //   492	502	975	java/lang/Throwable
    //   512	519	975	java/lang/Throwable
    //   527	532	975	java/lang/Throwable
    //   540	546	975	java/lang/Throwable
    //   578	588	975	java/lang/Throwable
    //   615	621	975	java/lang/Throwable
    //   634	640	975	java/lang/Throwable
    //   672	682	975	java/lang/Throwable
    //   709	720	975	java/lang/Throwable
    //   728	745	975	java/lang/Throwable
    //   753	763	975	java/lang/Throwable
    //   771	777	975	java/lang/Throwable
    //   809	819	975	java/lang/Throwable
    //   845	853	975	java/lang/Throwable
    //   861	867	975	java/lang/Throwable
    //   896	917	975	java/lang/Throwable
    //   956	975	975	java/lang/Throwable
  }
  
  public Object invoke(final Object paramObject, final Method paramMethod, final Object[] paramArrayOfObject)
    throws Throwable
  {
    if (paramMethod.getDeclaringClass() == Object.class) {
      return paramMethod.invoke(this, paramArrayOfObject);
    }
    paramObject = RestAdapter.getMethodInfo(methodDetailsCache, paramMethod);
    if (isSynchronous) {
      try
      {
        paramObject = invokeRequest(this$0.requestInterceptor, (RestMethodInfo)paramObject, paramArrayOfObject);
        return paramObject;
      }
      catch (RetrofitError paramObject)
      {
        paramMethod = this$0.errorHandler.handleError((RetrofitError)paramObject);
        if (paramMethod == null) {
          throw new IllegalStateException("Error handler returned null for wrapped exception.", (Throwable)paramObject);
        }
        throw paramMethod;
      }
    }
    if ((this$0.httpExecutor == null) || (this$0.callbackExecutor == null)) {
      throw new IllegalStateException("Asynchronous invocation requires calling setExecutors.");
    }
    if (isObservable)
    {
      if (RestAdapter.access$000(this$0) == null)
      {
        if (Platform.HAS_RX_JAVA) {
          RestAdapter.access$002(this$0, new RxSupport(this$0.httpExecutor, this$0.errorHandler, this$0.requestInterceptor));
        }
      }
      else {
        RestAdapter.access$000(this$0).createRequestObservable(new RxSupport.Invoker()
        {
          public ResponseWrapper invoke(RequestInterceptor paramAnonymousRequestInterceptor)
          {
            return (ResponseWrapper)RestAdapter.RestHandler.this.invokeRequest(paramAnonymousRequestInterceptor, paramObject, paramArrayOfObject);
          }
        });
      }
      throw new IllegalStateException("Observable method found but no RxJava on classpath.");
    }
    paramMethod = new RequestInterceptorTape();
    this$0.requestInterceptor.intercept(paramMethod);
    Callback localCallback = (Callback)paramArrayOfObject[(paramArrayOfObject.length - 1)];
    this$0.httpExecutor.execute(new CallbackRunnable(localCallback, this$0.callbackExecutor, this$0.errorHandler)
    {
      public ResponseWrapper obtainResponse()
      {
        return (ResponseWrapper)RestAdapter.RestHandler.this.invokeRequest(paramMethod, paramObject, paramArrayOfObject);
      }
    });
    return null;
  }
}

/* Location:
 * Qualified Name:     retrofit.RestAdapter.RestHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */