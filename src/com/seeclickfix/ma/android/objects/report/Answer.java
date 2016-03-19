package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName="answers")
public class Answer
  implements Parcelable
{
  public static final Parcelable.Creator<Answer> CREATOR = new Parcelable.Creator()
  {
    public Answer createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Answer(paramAnonymousParcel, null);
    }
    
    public Answer[] newArray(int paramAnonymousInt)
    {
      return new Answer[paramAnonymousInt];
    }
  };
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "Answer";
  @DatabaseField
  private String answer;
  @DatabaseField
  private transient long date;
  @DatabaseField(columnName="id", generatedId=true)
  private transient int db_id;
  @DatabaseField
  private String displayText;
  @SerializedName("request_type_question_primary_key")
  @DatabaseField
  private String primaryKey;
  @DatabaseField(foreign=true)
  private transient Report report;
  @DatabaseField
  private transient int selectedPosition;
  @DatabaseField
  private transient String time;
  
  public Answer() {}
  
  private Answer(Parcel paramParcel)
  {
    db_id = paramParcel.readInt();
    answer = paramParcel.readString();
    displayText = paramParcel.readString();
    primaryKey = paramParcel.readString();
    date = paramParcel.readLong();
    time = paramParcel.readString();
    selectedPosition = paramParcel.readInt();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAnswer()
  {
    return answer;
  }
  
  public long getDate()
  {
    return date;
  }
  
  public int getDbId()
  {
    return db_id;
  }
  
  public String getDisplayText()
  {
    return displayText;
  }
  
  public String getPrimaryKey()
  {
    return primaryKey;
  }
  
  public Report getReport()
  {
    return report;
  }
  
  public int getSelectedPosition()
  {
    return selectedPosition;
  }
  
  public String getTime()
  {
    return time;
  }
  
  public void setAnswer(String paramString)
  {
    answer = paramString;
  }
  
  public void setDate(long paramLong)
  {
    date = paramLong;
  }
  
  public void setDbId(int paramInt)
  {
    db_id = paramInt;
  }
  
  public void setDisplayText(String paramString)
  {
    displayText = paramString;
  }
  
  public void setNameValueString(String paramString)
  {
    String str = new String(paramString.substring(paramString.indexOf("=") + 1));
    answer = new String(paramString.substring(0, paramString.indexOf("=")));
    displayText = str;
  }
  
  public void setPrimaryKey(String paramString)
  {
    primaryKey = paramString;
  }
  
  public void setReport(Report paramReport)
  {
    report = paramReport;
  }
  
  public void setSelectedPosition(int paramInt)
  {
    selectedPosition = paramInt;
  }
  
  public void setTime(String paramString)
  {
    time = paramString;
  }
  
  public String toLogString()
  {
    return "Answer [answer=" + answer + ", displayText=" + displayText + ", time=" + time + ", date=" + date + ", primaryKey=" + primaryKey + "]";
  }
  
  public String toString()
  {
    return displayText;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(db_id);
    paramParcel.writeString(answer);
    paramParcel.writeString(displayText);
    paramParcel.writeString(primaryKey);
    paramParcel.writeLong(date);
    paramParcel.writeString(time);
    paramParcel.writeInt(selectedPosition);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.Answer
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */