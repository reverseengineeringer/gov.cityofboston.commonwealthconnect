package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName="request_type")
public class RequestType
  implements Parcelable
{
  public static final Parcelable.Creator<RequestType> CREATOR = new Parcelable.Creator()
  {
    public RequestType createFromParcel(Parcel paramAnonymousParcel)
    {
      return new RequestType(paramAnonymousParcel, null);
    }
    
    public RequestType[] newArray(int paramAnonymousInt)
    {
      return new RequestType[paramAnonymousInt];
    }
  };
  @DatabaseField(columnName="action")
  private transient String action;
  @DatabaseField(columnName="action_data")
  private transient String actionData;
  @SerializedName("id")
  @DatabaseField(columnName="api_id")
  private String apiId;
  @DatabaseField(columnName="header_title")
  private transient String headerTitle;
  @DatabaseField(columnName="id", generatedId=true)
  private transient int id;
  @SerializedName("additional_questions_count")
  @DatabaseField(columnName="num_questions")
  private int numQuestions;
  @DatabaseField(columnName="position")
  private int position;
  @DatabaseField(foreign=true)
  private transient Report report;
  @DatabaseField(columnName="title")
  private String title;
  @DatabaseField(columnName="view_type")
  private transient String viewType = "req_type_normal_view";
  @DatabaseField(foreign=true)
  private RequestWatchArea watchArea;
  
  public RequestType() {}
  
  private RequestType(Parcel paramParcel)
  {
    id = paramParcel.readInt();
    apiId = paramParcel.readString();
    title = paramParcel.readString();
    action = paramParcel.readString();
    actionData = paramParcel.readString();
    headerTitle = paramParcel.readString();
    viewType = paramParcel.readString();
    position = paramParcel.readInt();
    numQuestions = paramParcel.readInt();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAction()
  {
    return action;
  }
  
  public String getActionData()
  {
    return actionData;
  }
  
  public String getApiId()
  {
    return apiId;
  }
  
  public int getDbId()
  {
    return id;
  }
  
  public String getHeaderTitle()
  {
    return headerTitle;
  }
  
  public int getNumQuestions()
  {
    return numQuestions;
  }
  
  public int getPosition()
  {
    return position;
  }
  
  public Report getReport()
  {
    return report;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public String getViewType()
  {
    return viewType;
  }
  
  public RequestWatchArea getWatchArea()
  {
    return watchArea;
  }
  
  public void setAction(String paramString)
  {
    action = paramString;
  }
  
  public void setActionData(String paramString)
  {
    actionData = paramString;
  }
  
  public void setApiId(String paramString)
  {
    apiId = paramString;
  }
  
  public void setDbId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setHeaderTitle(String paramString)
  {
    headerTitle = paramString;
  }
  
  public void setNumQuestions(int paramInt)
  {
    numQuestions = paramInt;
  }
  
  public void setPosition(int paramInt)
  {
    position = paramInt;
  }
  
  public void setReport(Report paramReport)
  {
    report = paramReport;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public void setViewType(String paramString)
  {
    viewType = paramString;
  }
  
  public void setWatchArea(RequestWatchArea paramRequestWatchArea)
  {
    watchArea = paramRequestWatchArea;
  }
  
  public String toString()
  {
    return "RequestType{id=" + id + ", apiId='" + apiId + '\'' + ", title='" + title + '\'' + ", position=" + position + ", numQuestions=" + numQuestions + ", headerTitle='" + headerTitle + '\'' + ", actionData='" + actionData + '\'' + ", action='" + action + '\'' + ", viewType='" + viewType + '\'' + '}';
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(id);
    paramParcel.writeString(apiId);
    paramParcel.writeString(title);
    paramParcel.writeString(action);
    paramParcel.writeString(actionData);
    paramParcel.writeString(headerTitle);
    paramParcel.writeString(viewType);
    paramParcel.writeInt(position);
    paramParcel.writeInt(numQuestions);
  }
  
  public static class ViewTypes
  {
    public static final String BLANK = "req_type_blank_view";
    public static final String BUTTON = "req_type_button_view";
    public static final String NORMAL = "req_type_normal_view";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.RequestType
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */