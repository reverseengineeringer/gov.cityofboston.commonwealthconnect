package com.android.volley;

public abstract interface Network
{
  public abstract NetworkResponse performRequest(Request<?> paramRequest)
    throws VolleyError;
}

/* Location:
 * Qualified Name:     com.android.volley.Network
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */