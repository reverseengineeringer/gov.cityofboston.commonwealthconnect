package com.seeclickfix.ma.android;

import java.util.HashMap;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

class SeeclickfixActivity$4
  implements Callback<HashMap<String, String>>
{
  SeeclickfixActivity$4(SeeclickfixActivity paramSeeclickfixActivity) {}
  
  public void failure(RetrofitError paramRetrofitError)
  {
    this$0.notifyUser(2131492993);
  }
  
  public void success(HashMap<String, String> paramHashMap, Response paramResponse)
  {
    this$0.notifyUser(2131492991);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.SeeclickfixActivity.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */