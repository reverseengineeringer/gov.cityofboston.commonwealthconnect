package retrofit;

import retrofit.client.Response;

final class ResponseWrapper
{
  final Response response;
  final Object responseBody;
  
  ResponseWrapper(Response paramResponse, Object paramObject)
  {
    response = paramResponse;
    responseBody = paramObject;
  }
}

/* Location:
 * Qualified Name:     retrofit.ResponseWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */