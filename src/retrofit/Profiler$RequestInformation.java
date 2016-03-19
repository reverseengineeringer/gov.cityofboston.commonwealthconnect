package retrofit;

public final class Profiler$RequestInformation
{
  private final String baseUrl;
  private final long contentLength;
  private final String contentType;
  private final String method;
  private final String relativePath;
  
  public Profiler$RequestInformation(String paramString1, String paramString2, String paramString3, long paramLong, String paramString4)
  {
    method = paramString1;
    baseUrl = paramString2;
    relativePath = paramString3;
    contentLength = paramLong;
    contentType = paramString4;
  }
  
  public String getBaseUrl()
  {
    return baseUrl;
  }
  
  public long getContentLength()
  {
    return contentLength;
  }
  
  public String getContentType()
  {
    return contentType;
  }
  
  public String getMethod()
  {
    return method;
  }
  
  public String getRelativePath()
  {
    return relativePath;
  }
}

/* Location:
 * Qualified Name:     retrofit.Profiler.RequestInformation
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */