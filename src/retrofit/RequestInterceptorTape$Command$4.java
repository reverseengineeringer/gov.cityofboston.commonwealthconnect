package retrofit;

 enum RequestInterceptorTape$Command$4
{
  RequestInterceptorTape$Command$4()
  {
    super(paramString, paramInt, null);
  }
  
  public void intercept(RequestInterceptor.RequestFacade paramRequestFacade, String paramString1, String paramString2)
  {
    paramRequestFacade.addQueryParam(paramString1, paramString2);
  }
}

/* Location:
 * Qualified Name:     retrofit.RequestInterceptorTape.Command.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */