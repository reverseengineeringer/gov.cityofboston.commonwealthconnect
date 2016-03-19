package com.android.volley;

class RequestQueue$1
  implements RequestQueue.RequestFilter
{
  RequestQueue$1(RequestQueue paramRequestQueue, Object paramObject) {}
  
  public boolean apply(Request<?> paramRequest)
  {
    return paramRequest.getTag() == val$tag;
  }
}

/* Location:
 * Qualified Name:     com.android.volley.RequestQueue.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */