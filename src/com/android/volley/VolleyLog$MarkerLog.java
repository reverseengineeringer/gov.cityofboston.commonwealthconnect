package com.android.volley;

import android.os.SystemClock;
import java.util.ArrayList;
import java.util.List;

class VolleyLog$MarkerLog
{
  public static final boolean ENABLED = VolleyLog.DEBUG;
  private static final long MIN_DURATION_FOR_LOGGING_MS = 0L;
  private boolean mFinished = false;
  private final List<Marker> mMarkers = new ArrayList();
  
  private long getTotalDuration()
  {
    if (mMarkers.size() == 0) {
      return 0L;
    }
    long l = mMarkers.get(0)).time;
    return mMarkers.get(mMarkers.size() - 1)).time - l;
  }
  
  public void add(String paramString, long paramLong)
  {
    try
    {
      if (mFinished) {
        throw new IllegalStateException("Marker added to finished log");
      }
    }
    finally {}
    mMarkers.add(new Marker(paramString, paramLong, SystemClock.elapsedRealtime()));
  }
  
  protected void finalize()
    throws Throwable
  {
    if (!mFinished)
    {
      finish("Request on the loose");
      VolleyLog.e("Marker log finalized without finish() - uncaught exit point for request", new Object[0]);
    }
  }
  
  /* Error */
  public void finish(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iconst_1
    //   4: putfield 38	com/android/volley/VolleyLog$MarkerLog:mFinished	Z
    //   7: aload_0
    //   8: invokespecial 90	com/android/volley/VolleyLog$MarkerLog:getTotalDuration	()J
    //   11: lstore 4
    //   13: lload 4
    //   15: lconst_0
    //   16: lcmp
    //   17: ifgt +6 -> 23
    //   20: aload_0
    //   21: monitorexit
    //   22: return
    //   23: aload_0
    //   24: getfield 36	com/android/volley/VolleyLog$MarkerLog:mMarkers	Ljava/util/List;
    //   27: iconst_0
    //   28: invokeinterface 50 2 0
    //   33: checkcast 9	com/android/volley/VolleyLog$MarkerLog$Marker
    //   36: getfield 53	com/android/volley/VolleyLog$MarkerLog$Marker:time	J
    //   39: lstore_2
    //   40: ldc 92
    //   42: iconst_2
    //   43: anewarray 4	java/lang/Object
    //   46: dup
    //   47: iconst_0
    //   48: lload 4
    //   50: invokestatic 98	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   53: aastore
    //   54: dup
    //   55: iconst_1
    //   56: aload_1
    //   57: aastore
    //   58: invokestatic 101	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   61: aload_0
    //   62: getfield 36	com/android/volley/VolleyLog$MarkerLog:mMarkers	Ljava/util/List;
    //   65: invokeinterface 105 1 0
    //   70: astore_1
    //   71: aload_1
    //   72: invokeinterface 111 1 0
    //   77: ifeq -57 -> 20
    //   80: aload_1
    //   81: invokeinterface 115 1 0
    //   86: checkcast 9	com/android/volley/VolleyLog$MarkerLog$Marker
    //   89: astore 6
    //   91: aload 6
    //   93: getfield 53	com/android/volley/VolleyLog$MarkerLog$Marker:time	J
    //   96: lstore 4
    //   98: ldc 117
    //   100: iconst_3
    //   101: anewarray 4	java/lang/Object
    //   104: dup
    //   105: iconst_0
    //   106: lload 4
    //   108: lload_2
    //   109: lsub
    //   110: invokestatic 98	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   113: aastore
    //   114: dup
    //   115: iconst_1
    //   116: aload 6
    //   118: getfield 120	com/android/volley/VolleyLog$MarkerLog$Marker:thread	J
    //   121: invokestatic 98	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   124: aastore
    //   125: dup
    //   126: iconst_2
    //   127: aload 6
    //   129: getfield 124	com/android/volley/VolleyLog$MarkerLog$Marker:name	Ljava/lang/String;
    //   132: aastore
    //   133: invokestatic 101	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   136: lload 4
    //   138: lstore_2
    //   139: goto -68 -> 71
    //   142: astore_1
    //   143: aload_0
    //   144: monitorexit
    //   145: aload_1
    //   146: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	147	0	this	MarkerLog
    //   0	147	1	paramString	String
    //   39	100	2	l1	long
    //   11	126	4	l2	long
    //   89	39	6	localMarker	Marker
    // Exception table:
    //   from	to	target	type
    //   2	13	142	finally
    //   23	71	142	finally
    //   71	136	142	finally
  }
  
  private static class Marker
  {
    public final String name;
    public final long thread;
    public final long time;
    
    public Marker(String paramString, long paramLong1, long paramLong2)
    {
      name = paramString;
      thread = paramLong1;
      time = paramLong2;
    }
  }
}

/* Location:
 * Qualified Name:     com.android.volley.VolleyLog.MarkerLog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */