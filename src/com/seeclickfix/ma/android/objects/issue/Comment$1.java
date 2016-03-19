package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable.Creator;

final class Comment$1
  implements Parcelable.Creator<Comment>
{
  public Comment createFromParcel(Parcel paramParcel)
  {
    return new Comment(paramParcel);
  }
  
  public Comment[] newArray(int paramInt)
  {
    return new Comment[paramInt];
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Comment.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */