package retrofit;

public final class Endpoints
{
  private static final String DEFAULT_NAME = "default";
  
  public static Endpoint newFixedEndpoint(String paramString)
  {
    return new FixedEndpoint(paramString, "default");
  }
  
  public static Endpoint newFixedEndpoint(String paramString1, String paramString2)
  {
    return new FixedEndpoint(paramString1, paramString2);
  }
  
  private static class FixedEndpoint
    implements Endpoint
  {
    private final String apiUrl;
    private final String name;
    
    FixedEndpoint(String paramString1, String paramString2)
    {
      apiUrl = paramString1;
      name = paramString2;
    }
    
    public String getName()
    {
      return name;
    }
    
    public String getUrl()
    {
      return apiUrl;
    }
  }
}

/* Location:
 * Qualified Name:     retrofit.Endpoints
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */