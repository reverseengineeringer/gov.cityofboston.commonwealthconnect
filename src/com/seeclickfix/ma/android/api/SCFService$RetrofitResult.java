package com.seeclickfix.ma.android.api;

import android.content.res.Resources;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.fragments.NoticeItem;
import java.util.HashMap;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class SCFService$RetrofitResult<Receipt>
{
  protected SCFService.ErrorResponse _errorBody = null;
  private int _httpStatus = 0;
  protected final Response httpResponse;
  protected final Receipt receipt;
  protected final RetrofitError retrofitError;
  
  public SCFService$RetrofitResult(Receipt paramReceipt, Response paramResponse)
  {
    this(paramReceipt, paramResponse, null);
  }
  
  public SCFService$RetrofitResult(Receipt paramReceipt, Response paramResponse, RetrofitError paramRetrofitError)
  {
    receipt = paramReceipt;
    retrofitError = paramRetrofitError;
    httpResponse = paramResponse;
  }
  
  public SCFService$RetrofitResult(RetrofitError paramRetrofitError)
  {
    this(null, null, paramRetrofitError);
  }
  
  public SCFService.ErrorResponse errorBody()
  {
    if (_errorBody == null) {
      _errorBody = ((SCFService.ErrorResponse)getRetrofitError().getBodyAs(SCFService.ErrorResponse.class));
    }
    return _errorBody;
  }
  
  public NoticeItem fetchNotice()
  {
    if (isError()) {
      switch (SCFService.2.$SwitchMap$retrofit$RetrofitError$Kind[getRetrofitError().getKind().ordinal()])
      {
      default: 
        return NoticeItem.APP_ERROR();
      case 1: 
        return NoticeItem.NETWORK_ERROR();
      case 3: 
        return NoticeItem.PROTOCOL_ERROR();
      }
    }
    switch (httpStatus())
    {
    default: 
      MyApplication localMyApplication = MyApplication.instance;
      return NoticeItem.HTTP_ERROR(MyApplication.res.getString(2131493144, new Object[] { Integer.valueOf(httpStatus()) }));
    case 202: 
      return NoticeItem.COMMENT_ACCEPTED();
    case 204: 
      return NoticeItem.VOTE_REVOKED();
    case 201: 
      return NoticeItem.CREATED();
    case 403: 
      return NoticeItem.FORBIDDEN();
    }
    if (errorBodyerrors.containsKey("duplicate")) {
      return NoticeItem.DUPLICATE();
    }
    return NoticeItem.DECLINED(errorBody().toUL());
  }
  
  public Response getHttpResponse()
  {
    return httpResponse;
  }
  
  public NoticeItem getNotice()
  {
    if ((isSuccess()) && (!isAccepted())) {
      return null;
    }
    return fetchNotice();
  }
  
  public Receipt getReceipt()
  {
    return (Receipt)receipt;
  }
  
  public Response getResponse()
  {
    if (isSuccess()) {
      return getHttpResponse();
    }
    return getRetrofitError().getResponse();
  }
  
  public RetrofitError getRetrofitError()
  {
    return retrofitError;
  }
  
  public boolean hasHttpStatus(int paramInt)
  {
    return httpStatus() == paramInt;
  }
  
  public int httpStatus()
  {
    if (_httpStatus == 0)
    {
      Response localResponse = getResponse();
      if (localResponse != null) {
        _httpStatus = localResponse.getStatus();
      }
    }
    return _httpStatus;
  }
  
  public boolean isAccepted()
  {
    return hasHttpStatus(202);
  }
  
  public boolean isError()
  {
    return !isSuccess();
  }
  
  public boolean isSuccess()
  {
    return (receipt != null) || (getRetrofitError() == null);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.api.SCFService.RetrofitResult
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */