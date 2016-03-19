package com.seeclickfix.ma.android.objects;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;

public class PageParams
  implements Parcelable
{
  public static final Parcelable.Creator<PageParams> CREATOR = new Parcelable.Creator()
  {
    public PageParams createFromParcel(Parcel paramAnonymousParcel)
    {
      return new PageParams(paramAnonymousParcel, null);
    }
    
    public PageParams[] newArray(int paramAnonymousInt)
    {
      return new PageParams[paramAnonymousInt];
    }
  };
  private String actionExtra;
  private String clazzName;
  private Parcelable dataParcel;
  private String dataParcelName;
  private String displayName;
  private Class<? extends BaseFrag> fragClass;
  private int fragIdPosition = 0;
  private int iconResId = 0;
  private Intent intent;
  private boolean isMe = false;
  private boolean isSubitem = false;
  private Parcelable parcel;
  private String parcelName;
  private int scrollOffset = 0;
  private int scrollPosition = 0;
  private String tag;
  private String transition;
  
  public PageParams() {}
  
  private PageParams(Parcel paramParcel)
  {
    tag = paramParcel.readString();
    parcel = paramParcel.readParcelable(getClass().getClassLoader());
    parcelName = paramParcel.readString();
    dataParcel = paramParcel.readParcelable(getClass().getClassLoader());
    dataParcelName = paramParcel.readString();
    fragIdPosition = paramParcel.readInt();
    scrollPosition = paramParcel.readInt();
    scrollOffset = paramParcel.readInt();
    displayName = paramParcel.readString();
    actionExtra = paramParcel.readString();
    clazzName = paramParcel.readString();
    transition = paramParcel.readString();
    intent = ((Intent)paramParcel.readParcelable(Intent.CREATOR.getClass().getClassLoader()));
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getActionExtra()
  {
    return actionExtra;
  }
  
  public Parcelable getDataParcel()
  {
    return dataParcel;
  }
  
  public String getDataParcelName()
  {
    return dataParcelName;
  }
  
  public String getDisplayName()
  {
    return displayName;
  }
  
  public Class<? extends BaseFrag> getFragClass()
  {
    return fragClass;
  }
  
  public int getIconResId()
  {
    return iconResId;
  }
  
  public Intent getIntent()
  {
    return intent;
  }
  
  public int getPagePosition()
  {
    return fragIdPosition;
  }
  
  public Parcelable getParcel()
  {
    return parcel;
  }
  
  public String getParcelName()
  {
    return parcelName;
  }
  
  public int getScrollOffset()
  {
    return scrollOffset;
  }
  
  public int getScrollPosition()
  {
    return scrollPosition;
  }
  
  public String getTag()
  {
    return tag;
  }
  
  public String getTransition()
  {
    return transition;
  }
  
  public boolean isMe()
  {
    return isMe;
  }
  
  public boolean isSubitem()
  {
    return isSubitem;
  }
  
  public void setActionExtra(String paramString)
  {
    actionExtra = paramString;
  }
  
  public void setDataParcel(Parcelable paramParcelable)
  {
    dataParcel = paramParcelable;
  }
  
  public void setDataParcelName(String paramString)
  {
    dataParcelName = paramString;
  }
  
  public void setDisplayName(String paramString)
  {
    displayName = paramString;
  }
  
  public void setFragClass(Class<? extends BaseFrag> paramClass)
  {
    clazzName = paramClass.getName();
    fragClass = paramClass;
  }
  
  public void setIconResId(int paramInt)
  {
    iconResId = paramInt;
  }
  
  public void setIntent(Intent paramIntent)
  {
    intent = paramIntent;
  }
  
  public void setMe(boolean paramBoolean)
  {
    isMe = paramBoolean;
  }
  
  public void setPagePosition(int paramInt)
  {
    fragIdPosition = paramInt;
  }
  
  public void setParcel(Parcelable paramParcelable)
  {
    parcel = paramParcelable;
  }
  
  public void setParcelName(String paramString)
  {
    parcelName = paramString;
  }
  
  public void setScrollOffset(int paramInt)
  {
    scrollOffset = paramInt;
  }
  
  public void setScrollPosition(int paramInt)
  {
    scrollPosition = paramInt;
  }
  
  public void setSubitem(boolean paramBoolean)
  {
    isSubitem = paramBoolean;
  }
  
  public void setTag(String paramString)
  {
    tag = paramString;
  }
  
  public void setTransition(String paramString)
  {
    transition = paramString;
  }
  
  public String toString()
  {
    return "PageParams [fragClass=" + fragClass + ", tag=" + tag + ", iconResId=" + iconResId + ", parcel=" + parcel + ", parcelName=" + parcelName + ", dataParcel=" + dataParcel + ", dataParcelName=" + dataParcelName + ", fragIdPosition=" + fragIdPosition + ", scrollPosition=" + scrollPosition + ", scrollOffset=" + scrollOffset + ", displayName=" + displayName + ", actionExtra=" + actionExtra + ", clazzName=" + clazzName + ", isSubitem=" + isSubitem + ", transition=" + transition + ", intent=" + intent + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(tag);
    paramParcel.writeParcelable(parcel, 0);
    paramParcel.writeString(parcelName);
    paramParcel.writeParcelable(dataParcel, 0);
    paramParcel.writeString(dataParcelName);
    paramParcel.writeInt(fragIdPosition);
    paramParcel.writeInt(scrollPosition);
    paramParcel.writeInt(scrollOffset);
    paramParcel.writeString(displayName);
    paramParcel.writeString(actionExtra);
    paramParcel.writeString(clazzName);
    paramParcel.writeString(transition);
    paramParcel.writeParcelable(intent, 0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.PageParams
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */