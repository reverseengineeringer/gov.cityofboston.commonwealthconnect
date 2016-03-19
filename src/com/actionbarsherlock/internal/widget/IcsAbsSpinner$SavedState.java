package com.actionbarsherlock.internal.widget;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.view.View.BaseSavedState;

class IcsAbsSpinner$SavedState
  extends View.BaseSavedState
{
  public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
  {
    public IcsAbsSpinner.SavedState createFromParcel(Parcel paramAnonymousParcel)
    {
      return new IcsAbsSpinner.SavedState(paramAnonymousParcel, null);
    }
    
    public IcsAbsSpinner.SavedState[] newArray(int paramAnonymousInt)
    {
      return new IcsAbsSpinner.SavedState[paramAnonymousInt];
    }
  };
  int position;
  long selectedId;
  
  private IcsAbsSpinner$SavedState(Parcel paramParcel)
  {
    super(paramParcel);
    selectedId = paramParcel.readLong();
    position = paramParcel.readInt();
  }
  
  IcsAbsSpinner$SavedState(Parcelable paramParcelable)
  {
    super(paramParcelable);
  }
  
  public String toString()
  {
    return "AbsSpinner.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + selectedId + " position=" + position + "}";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
    paramParcel.writeLong(selectedId);
    paramParcel.writeInt(position);
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.widget.IcsAbsSpinner.SavedState
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */