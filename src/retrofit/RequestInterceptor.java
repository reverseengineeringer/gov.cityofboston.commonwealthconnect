package retrofit;

public abstract interface RequestInterceptor
{
  public static final RequestInterceptor NONE = new RequestInterceptor()
  {
    public void intercept(RequestInterceptor.RequestFacade paramAnonymousRequestFacade) {}
  };
  
  public abstract void intercept(RequestFacade paramRequestFacade);
  
  public static abstract interface RequestFacade
  {
    public abstract void addEncodedPathParam(String paramString1, String paramString2);
    
    public abstract void addEncodedQueryParam(String paramString1, String paramString2);
    
    public abstract void addHeader(String paramString1, String paramString2);
    
    public abstract void addPathParam(String paramString1, String paramString2);
    
    public abstract void addQueryParam(String paramString1, String paramString2);
  }
}

/* Location:
 * Qualified Name:     retrofit.RequestInterceptor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */