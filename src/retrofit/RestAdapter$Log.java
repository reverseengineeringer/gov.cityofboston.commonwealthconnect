package retrofit;

public abstract interface RestAdapter$Log
{
  public static final Log NONE = new Log()
  {
    public void log(String paramAnonymousString) {}
  };
  
  public abstract void log(String paramString);
}

/* Location:
 * Qualified Name:     retrofit.RestAdapter.Log
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */