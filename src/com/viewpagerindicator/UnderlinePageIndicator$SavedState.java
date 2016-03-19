package com.viewpagerindicator;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.view.View.BaseSavedState;

class UnderlinePageIndicator$SavedState
  extends View.BaseSavedState
{
  public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
  {
    public UnderlinePageIndicator.SavedState createFromParcel(Parcel paramAnonymousParcel)
    {
      return new UnderlinePageIndicator.SavedState(paramAnonymousParcel, null);
    }
    
    public UnderlinePageIndicator.SavedState[] newArray(int paramAnonymousInt)
    {
      return new UnderlinePageIndicator.SavedState[paramAnonymousInt];
    }
  };
  int currentPage;
  
  private UnderlinePageIndicator$SavedState(Parcel paramParcel)
  {
    super(paramParcel);
    currentPage = paramParcel.readInt();
  }
  
  public UnderlinePageIndicator$SavedState(Parcelable paramParcelable)
  {
    super(paramParcelable);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
    paramParcel.writeInt(currentPage);
  }
}

/* Location:
 * Qualified Name:     com.viewpagerindicator.UnderlinePageIndicator.SavedState
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */