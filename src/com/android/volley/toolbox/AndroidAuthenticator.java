package com.android.volley.toolbox;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.android.volley.AuthFailureError;

public class AndroidAuthenticator
  implements Authenticator
{
  private final Account mAccount;
  private final AccountManager mAccountManager;
  private final String mAuthTokenType;
  private final boolean mNotifyAuthFailure;
  
  AndroidAuthenticator(AccountManager paramAccountManager, Account paramAccount, String paramString, boolean paramBoolean)
  {
    mAccountManager = paramAccountManager;
    mAccount = paramAccount;
    mAuthTokenType = paramString;
    mNotifyAuthFailure = paramBoolean;
  }
  
  public AndroidAuthenticator(Context paramContext, Account paramAccount, String paramString)
  {
    this(paramContext, paramAccount, paramString, false);
  }
  
  public AndroidAuthenticator(Context paramContext, Account paramAccount, String paramString, boolean paramBoolean)
  {
    this(AccountManager.get(paramContext), paramAccount, paramString, paramBoolean);
  }
  
  public Account getAccount()
  {
    return mAccount;
  }
  
  public String getAuthToken()
    throws AuthFailureError
  {
    AccountManagerFuture localAccountManagerFuture = mAccountManager.getAuthToken(mAccount, mAuthTokenType, mNotifyAuthFailure, null, null);
    Bundle localBundle;
    try
    {
      localBundle = (Bundle)localAccountManagerFuture.getResult();
      Object localObject2 = null;
      Object localObject1 = localObject2;
      if (!localAccountManagerFuture.isDone()) {
        break label105;
      }
      localObject1 = localObject2;
      if (localAccountManagerFuture.isCancelled()) {
        break label105;
      }
      if (localBundle.containsKey("intent")) {
        throw new AuthFailureError((Intent)localBundle.getParcelable("intent"));
      }
    }
    catch (Exception localException)
    {
      throw new AuthFailureError("Error while retrieving auth token", localException);
    }
    String str = localBundle.getString("authtoken");
    label105:
    if (str == null) {
      throw new AuthFailureError("Got null auth token for type: " + mAuthTokenType);
    }
    return str;
  }
  
  public void invalidateAuthToken(String paramString)
  {
    mAccountManager.invalidateAuthToken(mAccount.type, paramString);
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.AndroidAuthenticator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */