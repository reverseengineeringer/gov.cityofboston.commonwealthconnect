package retrofit.android;

import android.util.Log;
import retrofit.RestAdapter.Log;

public class AndroidLog
  implements RestAdapter.Log
{
  private static final int LOG_CHUNK_SIZE = 4000;
  private final String tag;
  
  public AndroidLog(String paramString)
  {
    tag = paramString;
  }
  
  public String getTag()
  {
    return tag;
  }
  
  public final void log(String paramString)
  {
    int i = 0;
    int j = paramString.length();
    while (i < j)
    {
      logChunk(paramString.substring(i, Math.min(j, i + 4000)));
      i += 4000;
    }
  }
  
  public void logChunk(String paramString)
  {
    Log.d(getTag(), paramString);
  }
}

/* Location:
 * Qualified Name:     retrofit.android.AndroidLog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */