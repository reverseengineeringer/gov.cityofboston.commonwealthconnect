package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.dao.ForeignCollection;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.field.ForeignCollectionField;
import com.j256.ormlite.table.DatabaseTable;
import java.util.ArrayList;
import java.util.List;

@DatabaseTable(tableName="request_watch_areas")
public class RequestWatchArea
  implements Parcelable
{
  public static final Parcelable.Creator<RequestWatchArea> CREATOR = new Parcelable.Creator()
  {
    public RequestWatchArea createFromParcel(Parcel paramAnonymousParcel)
    {
      return new RequestWatchArea(paramAnonymousParcel, null);
    }
    
    public RequestWatchArea[] newArray(int paramAnonymousInt)
    {
      return new RequestWatchArea[paramAnonymousInt];
    }
  };
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "RequestWatchArea";
  @SerializedName("id")
  @DatabaseField(columnName="id", id=true)
  private int id;
  @SerializedName("includes_point")
  @DatabaseField(columnName="includes_point")
  private boolean includesPoint = false;
  private transient boolean isDefault = false;
  private transient boolean isFromDraft = false;
  @DatabaseField(canBeNull=true, foreign=true)
  private Report report;
  @SerializedName("request_types")
  private List<RequestType> requestTypes = new ArrayList();
  @ForeignCollectionField(columnName="request_types_db")
  private ForeignCollection<RequestType> requestTypesDB;
  private transient int selectedPosition = 0;
  @DatabaseField(columnName="title")
  private String title;
  
  public RequestWatchArea() {}
  
  private RequestWatchArea(Parcel paramParcel)
  {
    id = paramParcel.readInt();
    title = paramParcel.readString();
    setSelectedPosition(paramParcel.readInt());
    if (paramParcel.readByte() != 0)
    {
      bool1 = true;
      includesPoint = bool1;
      if (paramParcel.readByte() == 0) {
        break label106;
      }
    }
    label106:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      setIsFromDraft(bool1);
      paramParcel.readTypedList(requestTypes, RequestType.CREATOR);
      return;
      bool1 = false;
      break;
    }
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      paramObject = (RequestWatchArea)paramObject;
    } while (id == id);
    return false;
  }
  
  public int getId()
  {
    return id;
  }
  
  public boolean getIncludesPoint()
  {
    return includesPoint;
  }
  
  public boolean getIsFromDraft()
  {
    return isFromDraft;
  }
  
  public Report getReport()
  {
    return report;
  }
  
  public List<RequestType> getRequestTypes()
  {
    if (requestTypes == null) {
      requestTypes = new ArrayList();
    }
    return requestTypes;
  }
  
  public ForeignCollection<RequestType> getRequestTypesDb()
  {
    return requestTypesDB;
  }
  
  public int getSelectedPosition()
  {
    return selectedPosition;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public int hashCode()
  {
    return id + 31;
  }
  
  public boolean isDefault()
  {
    return isDefault;
  }
  
  public void setDefault(boolean paramBoolean)
  {
    isDefault = paramBoolean;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setIncludesPoint(boolean paramBoolean)
  {
    includesPoint = paramBoolean;
  }
  
  public void setIsFromDraft(boolean paramBoolean)
  {
    isFromDraft = paramBoolean;
  }
  
  public void setReport(Report paramReport)
  {
    report = paramReport;
  }
  
  public void setRequestTypes(List<RequestType> paramList)
  {
    requestTypes = paramList;
  }
  
  public void setRequestTypesDB(ForeignCollection<RequestType> paramForeignCollection)
  {
    requestTypesDB = paramForeignCollection;
  }
  
  public void setSelectedPosition(int paramInt)
  {
    selectedPosition = paramInt;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public String toString()
  {
    return "RequestWatchArea [id=" + id + ", title=" + title + ", includesPoint=" + includesPoint + ", requestTypesDB=" + requestTypesDB + ", selectedPosition=" + selectedPosition + ", queueSelection=" + isFromDraft + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    paramParcel.writeInt(id);
    paramParcel.writeString(title);
    paramParcel.writeInt(getSelectedPosition());
    if (includesPoint)
    {
      paramInt = 1;
      paramParcel.writeByte((byte)paramInt);
      if (!getIsFromDraft()) {
        break label70;
      }
    }
    label70:
    for (paramInt = i;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      paramParcel.writeTypedList(requestTypes);
      return;
      paramInt = 0;
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.RequestWatchArea
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */