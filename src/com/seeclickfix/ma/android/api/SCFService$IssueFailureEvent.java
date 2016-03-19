package com.seeclickfix.ma.android.api;

import android.content.Context;
import com.seeclickfix.ma.android.fragments.NoticeItem;
import java.util.HashMap;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class SCFService$IssueFailureEvent
{
  private RetrofitError retrofitError;
  
  public SCFService$IssueFailureEvent(RetrofitError paramRetrofitError)
  {
    retrofitError = paramRetrofitError;
  }
  
  public NoticeItem getNoticeItem(Context paramContext)
  {
    SCFService.ErrorResponse localErrorResponse = (SCFService.ErrorResponse)getRetrofitError().getBodyAs(SCFService.ErrorResponse.class);
    switch (SCFService.2.$SwitchMap$retrofit$RetrofitError$Kind[getRetrofitError().getKind().ordinal()])
    {
    default: 
      return NoticeItem.APP_ERROR();
    case 1: 
      return NoticeItem.NETWORK_ERROR();
    case 2: 
      if (getRetrofitError().getResponse().getStatus() == 422)
      {
        if (errors.containsKey("duplicate")) {
          return NoticeItem.DUPLICATE();
        }
        return NoticeItem.DECLINED(localErrorResponse.toUL());
      }
      return NoticeItem.HTTP_ERROR(paramContext.getString(2131493144, new Object[] { Integer.valueOf(getRetrofitError().getResponse().getStatus()) }));
    }
    return NoticeItem.PROTOCOL_ERROR();
  }
  
  public RetrofitError getRetrofitError()
  {
    return retrofitError;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.IssueFailureEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */