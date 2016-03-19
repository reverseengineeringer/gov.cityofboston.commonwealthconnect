package android.support.v4.media.session;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public final class MediaSessionCompat$Token
  implements Parcelable
{
  public static final Parcelable.Creator<Token> CREATOR = new Parcelable.Creator()
  {
    public MediaSessionCompat.Token createFromParcel(Parcel paramAnonymousParcel)
    {
      return new MediaSessionCompat.Token(paramAnonymousParcel.readParcelable(null));
    }
    
    public MediaSessionCompat.Token[] newArray(int paramAnonymousInt)
    {
      return new MediaSessionCompat.Token[paramAnonymousInt];
    }
  };
  private final Parcelable mInner;
  
  MediaSessionCompat$Token(Parcelable paramParcelable)
  {
    mInner = paramParcelable;
  }
  
  public int describeContents()
  {
    return mInner.describeContents();
  }
  
  public Object getToken()
  {
    return mInner;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeParcelable(mInner, paramInt);
  }
}

/* Location:
 * Qualified Name:     android.support.v4.media.session.MediaSessionCompat.Token
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */