package com.seeclickfix.ma.android.objects;

import android.os.Parcel;
import android.os.Parcelable.Creator;

public class ErrorResponse
{
  public static final Parcelable.Creator<ErrorResponse> CREATOR = new Parcelable.Creator()
  {
    public ErrorResponse createFromParcel(Parcel paramAnonymousParcel)
    {
      return new ErrorResponse(paramAnonymousParcel);
    }
    
    public ErrorResponse[] newArray(int paramAnonymousInt)
    {
      return new ErrorResponse[paramAnonymousInt];
    }
  };
  private String code;
  private String field;
  private String message;
  private String request;
  private String resource;
  
  protected ErrorResponse(Parcel paramParcel)
  {
    message = paramParcel.readString();
    resource = paramParcel.readString();
    field = paramParcel.readString();
    code = paramParcel.readString();
    request = paramParcel.readString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getCode()
  {
    return code;
  }
  
  public String getField()
  {
    return field;
  }
  
  public String getMessage()
  {
    return message;
  }
  
  public String getRequest()
  {
    return request;
  }
  
  public String getResource()
  {
    return resource;
  }
  
  public void setCode(String paramString)
  {
    code = paramString;
  }
  
  public void setField(String paramString)
  {
    field = paramString;
  }
  
  public void setMessage(String paramString)
  {
    message = paramString;
  }
  
  public void setRequest(String paramString)
  {
    request = paramString;
  }
  
  public void setResource(String paramString)
  {
    resource = paramString;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(message);
    paramParcel.writeString(resource);
    paramParcel.writeString(field);
    paramParcel.writeString(code);
    paramParcel.writeString(request);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.ErrorResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */