package retrofit;

 enum RequestInterceptorTape$Command$1
{
  RequestInterceptorTape$Command$1()
  {
    super(paramString, paramInt, null);
  }
  
  public void intercept(RequestInterceptor.RequestFacade paramRequestFacade, String paramString1, String paramString2)
  {
    paramRequestFacade.addHeader(paramString1, paramString2);
  }
}

/* Location:
 * Qualified Name:     retrofit.RequestInterceptorTape.Command.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */