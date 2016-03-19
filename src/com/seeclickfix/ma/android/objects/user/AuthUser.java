package com.seeclickfix.ma.android.objects.user;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import java.util.List;

public final class AuthUser
  implements Parcelable
{
  public static final Parcelable.Creator<AuthUser> CREATOR = new Parcelable.Creator()
  {
    public AuthUser createFromParcel(Parcel paramAnonymousParcel)
    {
      return new AuthUser(paramAnonymousParcel, null);
    }
    
    public AuthUser[] newArray(int paramAnonymousInt)
    {
      return new AuthUser[paramAnonymousInt];
    }
  };
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "AuthUser";
  @SerializedName("can_ack")
  private boolean canAcknowledge = false;
  @SerializedName("name")
  private String displayName;
  private String email;
  private String response;
  @SerializedName("user_id")
  private int userID;
  
  public AuthUser() {}
  
  private AuthUser(Parcel paramParcel)
  {
    userID = paramParcel.readInt();
    email = paramParcel.readString();
    displayName = paramParcel.readString();
    response = paramParcel.readString();
    if (paramParcel.readByte() != 0) {
      bool = true;
    }
    canAcknowledge = bool;
  }
  
  public AuthUser(String paramString)
  {
    setResponse(paramString);
  }
  
  public static AuthUser from_json(String paramString)
  {
    return (AuthUser)new DeserializeResponse().getJavaObject(paramString, AuthUser.class).get(0);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean getCanAcknowledge()
  {
    return canAcknowledge;
  }
  
  public String getDisplayName()
  {
    return displayName;
  }
  
  public String getEmail()
  {
    return email;
  }
  
  public String getResponse()
  {
    return response;
  }
  
  public int getUserID()
  {
    return userID;
  }
  
  public boolean isAuthenticated()
  {
    if (response != null) {
      return response.equals("1");
    }
    return false;
  }
  
  public void setCanAcknowledge(boolean paramBoolean)
  {
    canAcknowledge = paramBoolean;
  }
  
  public void setDisplayName(String paramString)
  {
    displayName = paramString;
  }
  
  public void setEmail(String paramString)
  {
    email = paramString;
  }
  
  public void setResponse(String paramString)
  {
    response = paramString;
  }
  
  public void setUserID(int paramInt)
  {
    userID = paramInt;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(userID);
    paramParcel.writeString(email);
    paramParcel.writeString(displayName);
    paramParcel.writeString(response);
    if (canAcknowledge) {}
    for (paramInt = 1;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.user.AuthUser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */