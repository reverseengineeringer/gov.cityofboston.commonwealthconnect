package com.android.volley.toolbox;

import com.android.volley.AuthFailureError;

public abstract interface Authenticator
{
  public abstract String getAuthToken()
    throws AuthFailureError;
  
  public abstract void invalidateAuthToken(String paramString);
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.Authenticator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */