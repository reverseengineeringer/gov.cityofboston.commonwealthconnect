package retrofit;

public abstract interface ErrorHandler
{
  public static final ErrorHandler DEFAULT = new ErrorHandler()
  {
    public Throwable handleError(RetrofitError paramAnonymousRetrofitError)
    {
      return paramAnonymousRetrofitError;
    }
  };
  
  public abstract Throwable handleError(RetrofitError paramRetrofitError);
}

/* Location:
 * Qualified Name:     retrofit.ErrorHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */