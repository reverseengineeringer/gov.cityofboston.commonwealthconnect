package com.alostpacket.pajamalib.utils;

import java.io.File;

public class ErrorLog
{
  private static final boolean D = true;
  private static final boolean GLOBAL_DEBUG = true;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "pjLIB_ErrorLog";
  private static File logFile = null;
  
  /* Error */
  public static void write(String paramString, android.content.Context paramContext)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 19	com/alostpacket/pajamalib/utils/ErrorLog:logFile	Ljava/io/File;
    //   6: ifnonnull +19 -> 25
    //   9: new 29	java/io/File
    //   12: dup
    //   13: aload_1
    //   14: invokestatic 35	com/alostpacket/pajamalib/utils/FolderUtil:getAppFolder	(Landroid/content/Context;)Ljava/io/File;
    //   17: ldc 37
    //   19: invokespecial 40	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   22: putstatic 19	com/alostpacket/pajamalib/utils/ErrorLog:logFile	Ljava/io/File;
    //   25: getstatic 19	com/alostpacket/pajamalib/utils/ErrorLog:logFile	Ljava/io/File;
    //   28: invokevirtual 44	java/io/File:exists	()Z
    //   31: istore_2
    //   32: iload_2
    //   33: ifne +10 -> 43
    //   36: getstatic 19	com/alostpacket/pajamalib/utils/ErrorLog:logFile	Ljava/io/File;
    //   39: invokevirtual 47	java/io/File:createNewFile	()Z
    //   42: pop
    //   43: new 49	java/io/BufferedWriter
    //   46: dup
    //   47: new 51	java/io/FileWriter
    //   50: dup
    //   51: getstatic 19	com/alostpacket/pajamalib/utils/ErrorLog:logFile	Ljava/io/File;
    //   54: iconst_1
    //   55: invokespecial 54	java/io/FileWriter:<init>	(Ljava/io/File;Z)V
    //   58: invokespecial 57	java/io/BufferedWriter:<init>	(Ljava/io/Writer;)V
    //   61: astore_1
    //   62: aload_1
    //   63: new 59	java/lang/StringBuilder
    //   66: dup
    //   67: invokestatic 65	java/lang/System:currentTimeMillis	()J
    //   70: invokestatic 71	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   73: invokespecial 74	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   76: ldc 76
    //   78: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   81: aload_0
    //   82: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: invokevirtual 84	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   88: invokevirtual 87	java/io/BufferedWriter:append	(Ljava/lang/CharSequence;)Ljava/io/Writer;
    //   91: pop
    //   92: aload_1
    //   93: invokevirtual 90	java/io/BufferedWriter:newLine	()V
    //   96: aload_1
    //   97: invokevirtual 93	java/io/BufferedWriter:close	()V
    //   100: ldc 2
    //   102: monitorexit
    //   103: return
    //   104: astore_1
    //   105: aload_1
    //   106: invokevirtual 96	java/lang/Exception:printStackTrace	()V
    //   109: goto -66 -> 43
    //   112: astore_0
    //   113: ldc 2
    //   115: monitorexit
    //   116: aload_0
    //   117: athrow
    //   118: astore_0
    //   119: aload_0
    //   120: invokevirtual 96	java/lang/Exception:printStackTrace	()V
    //   123: goto -23 -> 100
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	126	0	paramString	String
    //   0	126	1	paramContext	android.content.Context
    //   31	2	2	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   36	43	104	java/lang/Exception
    //   3	25	112	finally
    //   25	32	112	finally
    //   36	43	112	finally
    //   43	100	112	finally
    //   105	109	112	finally
    //   119	123	112	finally
    //   43	100	118	java/lang/Exception
  }
}

/* Location:
 * Qualified Name:     com.alostpacket.pajamalib.utils.ErrorLog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */