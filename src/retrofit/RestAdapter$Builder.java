package retrofit;

import java.util.concurrent.Executor;
import retrofit.client.Client;
import retrofit.client.Client.Provider;
import retrofit.converter.Converter;

public class RestAdapter$Builder
{
  private Executor callbackExecutor;
  private Client.Provider clientProvider;
  private Converter converter;
  private Endpoint endpoint;
  private ErrorHandler errorHandler;
  private Executor httpExecutor;
  private RestAdapter.Log log;
  private RestAdapter.LogLevel logLevel = RestAdapter.LogLevel.NONE;
  private Profiler profiler;
  private RequestInterceptor requestInterceptor;
  
  private void ensureSaneDefaults()
  {
    if (converter == null) {
      converter = Platform.get().defaultConverter();
    }
    if (clientProvider == null) {
      clientProvider = Platform.get().defaultClient();
    }
    if (httpExecutor == null) {
      httpExecutor = Platform.get().defaultHttpExecutor();
    }
    if (callbackExecutor == null) {
      callbackExecutor = Platform.get().defaultCallbackExecutor();
    }
    if (errorHandler == null) {
      errorHandler = ErrorHandler.DEFAULT;
    }
    if (log == null) {
      log = Platform.get().defaultLog();
    }
    if (requestInterceptor == null) {
      requestInterceptor = RequestInterceptor.NONE;
    }
  }
  
  public RestAdapter build()
  {
    if (endpoint == null) {
      throw new IllegalArgumentException("Endpoint may not be null.");
    }
    ensureSaneDefaults();
    return new RestAdapter(endpoint, clientProvider, httpExecutor, callbackExecutor, requestInterceptor, converter, profiler, errorHandler, log, logLevel, null);
  }
  
  public Builder setClient(Client.Provider paramProvider)
  {
    if (paramProvider == null) {
      throw new NullPointerException("Client provider may not be null.");
    }
    clientProvider = paramProvider;
    return this;
  }
  
  public Builder setClient(final Client paramClient)
  {
    if (paramClient == null) {
      throw new NullPointerException("Client may not be null.");
    }
    setClient(new Client.Provider()
    {
      public Client get()
      {
        return paramClient;
      }
    });
  }
  
  public Builder setConverter(Converter paramConverter)
  {
    if (paramConverter == null) {
      throw new NullPointerException("Converter may not be null.");
    }
    converter = paramConverter;
    return this;
  }
  
  public Builder setEndpoint(String paramString)
  {
    if ((paramString == null) || (paramString.trim().length() == 0)) {
      throw new NullPointerException("Endpoint may not be blank.");
    }
    endpoint = Endpoints.newFixedEndpoint(paramString);
    return this;
  }
  
  public Builder setEndpoint(Endpoint paramEndpoint)
  {
    if (paramEndpoint == null) {
      throw new NullPointerException("Endpoint may not be null.");
    }
    endpoint = paramEndpoint;
    return this;
  }
  
  public Builder setErrorHandler(ErrorHandler paramErrorHandler)
  {
    if (paramErrorHandler == null) {
      throw new NullPointerException("Error handler may not be null.");
    }
    errorHandler = paramErrorHandler;
    return this;
  }
  
  public Builder setExecutors(Executor paramExecutor1, Executor paramExecutor2)
  {
    if (paramExecutor1 == null) {
      throw new NullPointerException("HTTP executor may not be null.");
    }
    Object localObject = paramExecutor2;
    if (paramExecutor2 == null) {
      localObject = new Utils.SynchronousExecutor();
    }
    httpExecutor = paramExecutor1;
    callbackExecutor = ((Executor)localObject);
    return this;
  }
  
  public Builder setLog(RestAdapter.Log paramLog)
  {
    if (paramLog == null) {
      throw new NullPointerException("Log may not be null.");
    }
    log = paramLog;
    return this;
  }
  
  public Builder setLogLevel(RestAdapter.LogLevel paramLogLevel)
  {
    if (paramLogLevel == null) {
      throw new NullPointerException("Log level may not be null.");
    }
    logLevel = paramLogLevel;
    return this;
  }
  
  public Builder setProfiler(Profiler paramProfiler)
  {
    if (paramProfiler == null) {
      throw new NullPointerException("Profiler may not be null.");
    }
    profiler = paramProfiler;
    return this;
  }
  
  public Builder setRequestInterceptor(RequestInterceptor paramRequestInterceptor)
  {
    if (paramRequestInterceptor == null) {
      throw new NullPointerException("Request interceptor may not be null.");
    }
    requestInterceptor = paramRequestInterceptor;
    return this;
  }
}

/* Location:
 * Qualified Name:     retrofit.RestAdapter.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */