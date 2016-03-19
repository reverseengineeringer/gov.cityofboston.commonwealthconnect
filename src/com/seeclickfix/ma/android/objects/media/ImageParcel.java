package com.seeclickfix.ma.android.objects.media;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ImageParcel
  implements Parcelable
{
  public static final Parcelable.Creator<ImageParcel> CREATOR = new Parcelable.Creator()
  {
    public ImageParcel createFromParcel(Parcel paramAnonymousParcel)
    {
      return new ImageParcel(paramAnonymousParcel, null);
    }
    
    public ImageParcel[] newArray(int paramAnonymousInt)
    {
      return new ImageParcel[paramAnonymousInt];
    }
  };
  private String avatarUri;
  private String smallImageUri;
  private String subtitle;
  private String title;
  private String type;
  private String uriPath;
  private String username;
  
  public ImageParcel() {}
  
  private ImageParcel(Parcel paramParcel)
  {
    type = paramParcel.readString();
    uriPath = paramParcel.readString();
    title = paramParcel.readString();
    subtitle = paramParcel.readString();
    username = paramParcel.readString();
    avatarUri = paramParcel.readString();
    smallImageUri = paramParcel.readString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAvatarUri()
  {
    return avatarUri;
  }
  
  public String getSmallImageUri()
  {
    return smallImageUri;
  }
  
  public String getSubtitle()
  {
    return subtitle;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public String getType()
  {
    return type;
  }
  
  public String getUriPath()
  {
    return uriPath;
  }
  
  public String getUsername()
  {
    return username;
  }
  
  public void setAvatarUri(String paramString)
  {
    avatarUri = paramString;
  }
  
  public void setSmallImageUri(String paramString)
  {
    smallImageUri = paramString;
  }
  
  public void setSubtitle(String paramString)
  {
    subtitle = paramString;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public void setType(String paramString)
  {
    type = paramString;
  }
  
  public void setUriPath(String paramString)
  {
    uriPath = paramString;
  }
  
  public void setUsername(String paramString)
  {
    username = paramString;
  }
  
  public String toString()
  {
    return "ImageParcel [type=" + type + ", uriPath=" + uriPath + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(type);
    paramParcel.writeString(uriPath);
    paramParcel.writeString(title);
    paramParcel.writeString(subtitle);
    paramParcel.writeString(username);
    paramParcel.writeString(avatarUri);
    paramParcel.writeString(smallImageUri);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.media.ImageParcel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */