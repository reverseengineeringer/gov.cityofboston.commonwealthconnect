package com.viewpagerindicator;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.view.View.BaseSavedState;

class TitlePageIndicator$SavedState
  extends View.BaseSavedState
{
  public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
  {
    public TitlePageIndicator.SavedState createFromParcel(Parcel paramAnonymousParcel)
    {
      return new TitlePageIndicator.SavedState(paramAnonymousParcel, null);
    }
    
    public TitlePageIndicator.SavedState[] newArray(int paramAnonymousInt)
    {
      return new TitlePageIndicator.SavedState[paramAnonymousInt];
    }
  };
  int currentPage;
  
  private TitlePageIndicator$SavedState(Parcel paramParcel)
  {
    super(paramParcel);
    currentPage = paramParcel.readInt();
  }
  
  public TitlePageIndicator$SavedState(Parcelable paramParcelable)
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
 * Qualified Name:     com.viewpagerindicator.TitlePageIndicator.SavedState
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */