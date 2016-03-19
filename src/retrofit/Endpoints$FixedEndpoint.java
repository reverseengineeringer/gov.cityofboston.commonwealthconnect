package retrofit;

class Endpoints$FixedEndpoint
  implements Endpoint
{
  private final String apiUrl;
  private final String name;
  
  Endpoints$FixedEndpoint(String paramString1, String paramString2)
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

/* Location:
 * Qualified Name:     retrofit.Endpoints.FixedEndpoint
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */