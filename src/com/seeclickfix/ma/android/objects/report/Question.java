package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import java.util.ArrayList;
import java.util.List;

@DatabaseTable(tableName="questions")
public class Question
  implements Parcelable
{
  public static final Parcelable.Creator<Question> CREATOR = new Parcelable.Creator()
  {
    public Question createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Question(paramAnonymousParcel, null);
    }
    
    public Question[] newArray(int paramAnonymousInt)
    {
      return new Question[paramAnonymousInt];
    }
  };
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "Question";
  @SerializedName("id")
  @DatabaseField(columnName="api_id")
  private int api_id;
  @SerializedName("created_at")
  @DatabaseField(columnName="date_created")
  private String createdAt;
  @DatabaseField(columnName="id", generatedId=true)
  private transient int db_id;
  @SerializedName("display_answer")
  @DatabaseField(columnName="displayed_answer")
  private boolean displayAnswer;
  @DatabaseField(columnName="position")
  private int position;
  @SerializedName("primary_key")
  @DatabaseField(columnName="primary_api_key")
  private String primaryKey;
  @SerializedName("question")
  @DatabaseField(columnName="question_text")
  private String questionText;
  @SerializedName("question_type")
  @DatabaseField(columnName="type")
  private String questionType;
  @DatabaseField(foreign=true)
  private transient Report report;
  @SerializedName("required_response")
  @DatabaseField(columnName="required")
  private boolean required;
  @SerializedName("select_values")
  @DatabaseField(columnName="selectable_values")
  private String selectValues;
  @DatabaseField(foreign=true)
  private transient Answer selectedAnswer;
  @SerializedName("selected_values")
  @DatabaseField(columnName="default_vaules")
  private String selectedValues;
  @SerializedName("updated_at")
  @DatabaseField(columnName="date_updated")
  private String updatedAt;
  
  public Question() {}
  
  private Question(Parcel paramParcel)
  {
    db_id = paramParcel.readInt();
    api_id = paramParcel.readInt();
    position = paramParcel.readInt();
    questionText = paramParcel.readString();
    questionType = paramParcel.readString();
    if (paramParcel.readByte() != 0)
    {
      bool1 = true;
      displayAnswer = bool1;
      if (paramParcel.readByte() == 0) {
        break label136;
      }
    }
    label136:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      required = bool1;
      selectValues = paramParcel.readString();
      selectedValues = paramParcel.readString();
      updatedAt = paramParcel.readString();
      createdAt = paramParcel.readString();
      primaryKey = paramParcel.readString();
      selectedAnswer = ((Answer)paramParcel.readParcelable(Answer.class.getClassLoader()));
      return;
      bool1 = false;
      break;
    }
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAnswerAsString()
  {
    Answer localAnswer = getSelectedAnswer();
    if (localAnswer == null) {
      return "";
    }
    return localAnswer.getAnswer();
  }
  
  public List<Answer> getAnswerList()
  {
    String[] arrayOfString = getValPairArray();
    ArrayList localArrayList = new ArrayList();
    int j = arrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str = arrayOfString[i];
      Answer localAnswer = new Answer();
      localAnswer.setNameValueString(str);
      localAnswer.setPrimaryKey(getPrimaryKey());
      localArrayList.add(localAnswer);
      i += 1;
    }
    return localArrayList;
  }
  
  public int getApiId()
  {
    return api_id;
  }
  
  public String getCreatedAt()
  {
    return createdAt;
  }
  
  public int getDbId()
  {
    return db_id;
  }
  
  public int getPosition()
  {
    return position;
  }
  
  public String getPrimaryKey()
  {
    return primaryKey;
  }
  
  public String getQuestionText()
  {
    return questionText;
  }
  
  public String getQuestionType()
  {
    return questionType;
  }
  
  public Report getReport()
  {
    return report;
  }
  
  public String getSelectValues()
  {
    return selectValues;
  }
  
  public Answer getSelectedAnswer()
  {
    return selectedAnswer;
  }
  
  public String getSelectedValues()
  {
    return selectedValues;
  }
  
  public String getUpdatedAt()
  {
    return updatedAt;
  }
  
  public String[] getValPairArray()
  {
    return getSelectValues().split("\\|");
  }
  
  public boolean isMultiValue()
  {
    return getQuestionType().equals("multivaluelist");
  }
  
  public boolean isReportable()
  {
    return !getQuestionType().equals("note");
  }
  
  public boolean isRequired()
  {
    return required;
  }
  
  public void setApiId(int paramInt)
  {
    api_id = paramInt;
  }
  
  public void setCreatedAt(String paramString)
  {
    createdAt = paramString;
  }
  
  public void setDbId(int paramInt)
  {
    db_id = paramInt;
  }
  
  public void setDisplayAnswer(boolean paramBoolean)
  {
    displayAnswer = paramBoolean;
  }
  
  public void setPosition(int paramInt)
  {
    position = paramInt;
  }
  
  public void setPrimaryKey(String paramString)
  {
    primaryKey = paramString;
  }
  
  public void setQuestionText(String paramString)
  {
    questionText = paramString;
  }
  
  public void setQuestionType(String paramString)
  {
    questionType = paramString;
  }
  
  public void setReport(Report paramReport)
  {
    report = paramReport;
  }
  
  public void setRequired(boolean paramBoolean)
  {
    required = paramBoolean;
  }
  
  public void setSelectValues(String paramString)
  {
    selectValues = paramString;
  }
  
  public void setSelectedAnswer(Answer paramAnswer)
  {
    selectedAnswer = paramAnswer;
  }
  
  public void setSelectedValues(String paramString)
  {
    selectedValues = paramString;
  }
  
  public void setUpdatedAt(String paramString)
  {
    updatedAt = paramString;
  }
  
  public String toString()
  {
    return "Question [db_id=" + db_id + ", api_id=" + api_id + ", position=" + position + ", questionText=" + questionText + ", questionType=" + questionType + ", displayAnswer=" + displayAnswer + ", required=" + required + ", selectValues=" + selectValues + ", selectedValues=" + selectedValues + ", updatedAt=" + updatedAt + ", createdAt=" + createdAt + ", primaryKey=" + primaryKey + ", selectedAnswer=" + selectedAnswer + "]";
  }
  
  public boolean willDisplayAnswer()
  {
    return displayAnswer;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    paramParcel.writeInt(db_id);
    paramParcel.writeInt(api_id);
    paramParcel.writeInt(position);
    paramParcel.writeString(questionText);
    paramParcel.writeString(questionType);
    if (displayAnswer)
    {
      paramInt = 1;
      paramParcel.writeByte((byte)paramInt);
      if (!required) {
        break label127;
      }
    }
    label127:
    for (paramInt = i;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      paramParcel.writeString(selectValues);
      paramParcel.writeString(selectedValues);
      paramParcel.writeString(updatedAt);
      paramParcel.writeString(createdAt);
      paramParcel.writeString(primaryKey);
      paramParcel.writeParcelable(selectedAnswer, 0);
      return;
      paramInt = 0;
      break;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.Question
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */