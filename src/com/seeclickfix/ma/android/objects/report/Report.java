package com.seeclickfix.ma.android.objects.report;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.ForeignCollection;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.field.ForeignCollectionField;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.objects.SimpleMultiMap;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.util.CollectionUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.http.entity.mime.content.FileBody;
import retrofit.mime.TypedFile;

@DatabaseTable(tableName="reports")
public class Report
  implements Parcelable
{
  public static final Parcelable.Creator<Report> CREATOR = new Parcelable.Creator()
  {
    public Report createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Report(paramAnonymousParcel, null);
    }
    
    public Report[] newArray(int paramAnonymousInt)
    {
      return new Report[paramAnonymousInt];
    }
  };
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "Reports";
  @DatabaseField
  private String address;
  @DatabaseField
  private boolean anonymize_reporter;
  @SerializedName("request_type_answers_attributes")
  private List<Answer> answers = new ArrayList();
  @SerializedName("id")
  private int api_id;
  private transient CameraPosition camPosition;
  private transient Dao<Report, Integer> dao;
  @DatabaseField(allowGeneratedIdInsert=true, columnName="id", generatedId=true)
  private int db_id;
  @DatabaseField
  private String description;
  @DatabaseField
  private transient boolean empty = true;
  @DatabaseField(columnName="using_current_loc")
  private transient boolean isUsingCurrentLocation = true;
  @DatabaseField
  private long lastEdited;
  @DatabaseField
  private double lat = 0.0D;
  private transient LatLng latLng;
  private transient boolean latLngModified = false;
  @DatabaseField
  private double lng = 0.0D;
  @DatabaseField
  private String localImagePath;
  private transient boolean modified = false;
  private transient List<Question> questions = new ArrayList();
  @ForeignCollectionField(eager=false)
  private transient ForeignCollection<Question> questionsDb;
  @SerializedName("reporter_display")
  @DatabaseField
  private String reporterDisplay;
  @SerializedName("reporter_email")
  @DatabaseField
  private String reporterEmail;
  @SerializedName("request_type_id")
  @DatabaseField(columnName="req_type_id")
  private String reqTypeID;
  private RequestType requestType;
  @DatabaseField
  private transient int selectedWatchAreaApiId;
  @DatabaseField(columnName="report_state")
  private String state = "ReportState:NONE";
  @DatabaseField
  private String summary;
  private int userID;
  private transient List<RequestWatchArea> watchAreas = new ArrayList();
  @ForeignCollectionField(eager=false)
  private transient ForeignCollection<RequestWatchArea> watchAreasDb;
  @DatabaseField
  private transient float zoom;
  
  public Report() {}
  
  private Report(Parcel paramParcel)
  {
    api_id = paramParcel.readInt();
    db_id = paramParcel.readInt();
    setReqTypeID(paramParcel.readString());
    summary = paramParcel.readString();
    description = paramParcel.readString();
    localImagePath = paramParcel.readString();
    lat = paramParcel.readDouble();
    lng = paramParcel.readDouble();
    if (paramParcel.readByte() != 0)
    {
      bool1 = true;
      anonymize_reporter = bool1;
      address = paramParcel.readString();
      reporterDisplay = paramParcel.readString();
      reporterEmail = paramParcel.readString();
      selectedWatchAreaApiId = paramParcel.readInt();
      state = paramParcel.readString();
      paramParcel.readTypedList(questions, Question.CREATOR);
      paramParcel.readTypedList(answers, Answer.CREATOR);
      paramParcel.readTypedList(watchAreas, RequestWatchArea.CREATOR);
      camPosition = ((CameraPosition)paramParcel.readValue(CameraPosition.class.getClassLoader()));
      latLng = ((LatLng)paramParcel.readValue(LatLng.class.getClassLoader()));
      if (paramParcel.readByte() == 0) {
        break label306;
      }
      bool1 = true;
      label267:
      empty = bool1;
      if (paramParcel.readByte() == 0) {
        break label311;
      }
      bool1 = true;
      label281:
      latLngModified = bool1;
      if (paramParcel.readByte() == 0) {
        break label316;
      }
    }
    label306:
    label311:
    label316:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      isUsingCurrentLocation = bool1;
      return;
      bool1 = false;
      break;
      bool1 = false;
      break label267;
      bool1 = false;
      break label281;
    }
  }
  
  public Report(Report paramReport)
  {
    address = paramReport.getAddress();
    answers = paramReport.getAnswers();
    api_id = paramReport.getApiID();
    camPosition = paramReport.getCamPosition();
    dao = paramReport.getDao();
    db_id = paramReport.getDbId();
    description = paramReport.getDescription();
    lat = paramReport.getLat();
    latLng = paramReport.getLatLng();
    lng = paramReport.getLng();
    anonymize_reporter = paramReport.getAnonymizeReporter();
    localImagePath = paramReport.getLocalImagePath();
    questions = paramReport.getQuestions();
    questionsDb = paramReport.getQuestionsDb();
    reporterDisplay = paramReport.getReporterDisplay();
    reporterEmail = paramReport.getReporterEmail();
    setReqTypeID(paramReport.getRequestTypeId());
    selectedWatchAreaApiId = paramReport.getSelectedWatchAreaApiId();
    state = paramReport.getState();
    summary = paramReport.getSummary();
    userID = paramReport.getUserID();
    setWatchAreas(paramReport.getWatchAreas());
    zoom = paramReport.getZoom();
    empty = paramReport.isEmpty();
  }
  
  private void addAnswerToQuestion(Answer paramAnswer)
  {
    setModified(true);
    empty = false;
    Iterator localIterator = getQuestions().iterator();
    while (localIterator.hasNext())
    {
      Question localQuestion = (Question)localIterator.next();
      if (localQuestion.getPrimaryKey().equals(paramAnswer.getPrimaryKey())) {
        localQuestion.setSelectedAnswer(paramAnswer);
      }
    }
  }
  
  private void removeAnswerFromQuestion(Answer paramAnswer)
  {
    Iterator localIterator = getQuestions().iterator();
    while (localIterator.hasNext())
    {
      Question localQuestion = (Question)localIterator.next();
      if (localQuestion.getPrimaryKey().equals(paramAnswer.getPrimaryKey())) {
        localQuestion.setSelectedAnswer(null);
      }
    }
  }
  
  public void addAnswer(Answer paramAnswer)
  {
    setModified(true);
    empty = false;
    if (answers.size() > 0)
    {
      int j = 0;
      Iterator localIterator = answers.iterator();
      Answer localAnswer;
      do
      {
        i = j;
        if (!localIterator.hasNext()) {
          break;
        }
        localAnswer = (Answer)localIterator.next();
      } while (!localAnswer.getPrimaryKey().equals(paramAnswer.getPrimaryKey()));
      answers.remove(localAnswer);
      answers.add(paramAnswer);
      int i = 1;
      if (i == 0) {
        answers.add(paramAnswer);
      }
    }
    for (;;)
    {
      addAnswerToQuestion(paramAnswer);
      return;
      answers.add(paramAnswer);
    }
  }
  
  public void clearSecondaryData()
  {
    setReqTypeID(null);
    answers = new ArrayList();
    questions = new ArrayList();
  }
  
  public void clearWatchAreaAndReqTypes()
  {
    clearSecondaryData();
    watchAreas = new ArrayList();
    questionsDb = null;
    watchAreasDb = null;
    selectedWatchAreaApiId = 0;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void encodeMultiValueAnswer(SimpleMultiMap<String, String> paramSimpleMultiMap, String paramString1, String paramString2)
  {
    paramString2 = CollectionUtil.nullToEmpty((String[])new Gson().fromJson(paramString2, String[].class));
    int j = paramString2.length;
    int i = 0;
    while (i < j)
    {
      Object localObject = paramString2[i];
      paramSimpleMultiMap.put(String.format("%s[]", new Object[] { paramString1 }), localObject);
      i += 1;
    }
  }
  
  public void encodeQuestion(SimpleMultiMap<String, String> paramSimpleMultiMap, Question paramQuestion)
  {
    String str1 = String.format("answers[%s]", new Object[] { String.valueOf(paramQuestion.getPrimaryKey()) });
    String str2 = paramQuestion.getAnswerAsString();
    if (paramQuestion.isMultiValue())
    {
      encodeMultiValueAnswer(paramSimpleMultiMap, str1, str2);
      return;
    }
    paramSimpleMultiMap.put(str1, str2);
  }
  
  public String getAddress()
  {
    return address;
  }
  
  public boolean getAnonymizeReporter()
  {
    return anonymize_reporter;
  }
  
  public List<Answer> getAnswers()
  {
    return answers;
  }
  
  public int getApiID()
  {
    return api_id;
  }
  
  public CameraPosition getCamPosition()
  {
    return camPosition;
  }
  
  public Dao<Report, Integer> getDao()
  {
    return dao;
  }
  
  public int getDbId()
  {
    return db_id;
  }
  
  public String getDescription()
  {
    return description;
  }
  
  public boolean getIsUsingCurrentLocation()
  {
    return isUsingCurrentLocation;
  }
  
  public long getLastEdited()
  {
    return lastEdited;
  }
  
  public double getLat()
  {
    return lat;
  }
  
  public LatLng getLatLng()
  {
    if ((latLng == null) && (lat != 0.0D) && (lng != 0.0D)) {
      latLng = new LatLng(lat, lng);
    }
    return latLng;
  }
  
  public boolean getLatLngModified()
  {
    return latLngModified;
  }
  
  public double getLng()
  {
    return lng;
  }
  
  public String getLocalImagePath()
  {
    return localImagePath;
  }
  
  public List<Question> getQuestions()
  {
    return questions;
  }
  
  public ForeignCollection<Question> getQuestionsDb()
  {
    return questionsDb;
  }
  
  public List<Question> getReportableQuestions()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = getQuestions().iterator();
    while (localIterator.hasNext())
    {
      Question localQuestion = (Question)localIterator.next();
      if (localQuestion.isReportable()) {
        localArrayList.add(localQuestion);
      }
    }
    return localArrayList;
  }
  
  public String getReporterDisplay()
  {
    return reporterDisplay;
  }
  
  public String getReporterEmail()
  {
    return reporterEmail;
  }
  
  public String getReqTypeID()
  {
    return reqTypeID;
  }
  
  public RequestType getRequestType()
  {
    return requestType;
  }
  
  public String getRequestTypeId()
  {
    return getReqTypeID();
  }
  
  public RequestWatchArea getSelectedWatchArea()
  {
    Object localObject2 = null;
    if (selectedWatchAreaApiId <= 0) {
      return null;
    }
    Iterator localIterator = getWatchAreas().iterator();
    Object localObject1;
    do
    {
      localObject1 = localObject2;
      if (!localIterator.hasNext()) {
        break;
      }
      localObject1 = (RequestWatchArea)localIterator.next();
    } while (((RequestWatchArea)localObject1).getId() != selectedWatchAreaApiId);
    return (RequestWatchArea)localObject1;
  }
  
  public int getSelectedWatchAreaApiId()
  {
    return selectedWatchAreaApiId;
  }
  
  public String getState()
  {
    return state;
  }
  
  public String getSummary()
  {
    return summary;
  }
  
  public int getUserID()
  {
    return userID;
  }
  
  public List<RequestWatchArea> getWatchAreas()
  {
    return watchAreas;
  }
  
  public ForeignCollection<RequestWatchArea> getWatchAreasDb()
  {
    return watchAreasDb;
  }
  
  public float getZoom()
  {
    return zoom;
  }
  
  public boolean isEmpty()
  {
    return empty;
  }
  
  public boolean isModified()
  {
    return modified;
  }
  
  public void removeAnswer(Answer paramAnswer)
  {
    Object localObject = answers.iterator();
    if (((Iterator)localObject).hasNext())
    {
      localObject = (Answer)((Iterator)localObject).next();
      if (((Answer)localObject).getPrimaryKey().equals(paramAnswer.getPrimaryKey())) {}
      answers.remove(localObject);
      removeAnswerFromQuestion(paramAnswer);
    }
  }
  
  public void setAddress(String paramString)
  {
    if (!isUsingCurrentLocation)
    {
      setModified(true);
      empty = false;
    }
    address = paramString;
  }
  
  public void setAnonymizeReporter(boolean paramBoolean)
  {
    setModified(true);
    anonymize_reporter = paramBoolean;
  }
  
  public void setAnswers(List<Answer> paramList)
  {
    empty = false;
    answers = paramList;
  }
  
  public void setApiID(int paramInt)
  {
    empty = false;
    setModified(true);
    api_id = paramInt;
  }
  
  public void setCamPosition(CameraPosition paramCameraPosition)
  {
    try
    {
      setModified(true);
      empty = false;
      zoom = zoom;
      camPosition = paramCameraPosition;
      return;
    }
    catch (Exception paramCameraPosition) {}
  }
  
  public void setDao(Dao<Report, Integer> paramDao)
  {
    dao = paramDao;
  }
  
  public void setDbId(int paramInt)
  {
    db_id = paramInt;
  }
  
  public void setDescription(String paramString)
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      setModified(true);
      empty = false;
      description = paramString;
    }
  }
  
  public void setEmpty(boolean paramBoolean)
  {
    empty = paramBoolean;
  }
  
  public void setIsUsingCurrentLocation(boolean paramBoolean)
  {
    if (!paramBoolean) {
      setModified(true);
    }
    isUsingCurrentLocation = paramBoolean;
  }
  
  public void setLastEdited(long paramLong)
  {
    lastEdited = paramLong;
  }
  
  public void setLat(double paramDouble)
  {
    setModified(true);
    empty = false;
    lat = paramDouble;
  }
  
  public void setLatLng(LatLng paramLatLng)
  {
    if (paramLatLng == null) {
      return;
    }
    latLng = paramLatLng;
    setModified(true);
    empty = false;
    lat = latitude;
    lng = longitude;
  }
  
  public void setLatLngModified(boolean paramBoolean)
  {
    latLngModified = paramBoolean;
  }
  
  public void setLng(double paramDouble)
  {
    setModified(true);
    empty = false;
    lng = paramDouble;
  }
  
  public void setLocalImagePath(String paramString)
  {
    if ((localImagePath == null) || (!localImagePath.equals(paramString)))
    {
      setModified(true);
      empty = false;
      localImagePath = paramString;
    }
  }
  
  public void setModified(boolean paramBoolean)
  {
    modified = paramBoolean;
    if (paramBoolean)
    {
      lastEdited = System.currentTimeMillis();
      return;
    }
    lastEdited = 0L;
  }
  
  public void setQuestions(List<Question> paramList)
  {
    empty = false;
    setModified(true);
    questions = paramList;
  }
  
  public void setReporterDisplay(String paramString)
  {
    reporterDisplay = paramString;
  }
  
  public void setReporterEmail(String paramString)
  {
    reporterEmail = paramString;
  }
  
  public void setReqTypeID(String paramString)
  {
    reqTypeID = paramString;
  }
  
  public void setRequestType(RequestType paramRequestType)
  {
    requestType = paramRequestType;
    setRequestTypeId(paramRequestType.getApiId());
    setSummary(paramRequestType.getTitle());
  }
  
  public void setRequestTypeId(String paramString)
  {
    setModified(true);
    empty = false;
    setReqTypeID(String.valueOf(paramString));
  }
  
  public void setSelectedWatchAreaApiId(int paramInt)
  {
    selectedWatchAreaApiId = paramInt;
  }
  
  public void setState(String paramString)
  {
    state = paramString;
  }
  
  public void setSummary(String paramString)
  {
    if (paramString == null) {}
    for (String str = "";; str = paramString)
    {
      if (str.length() > 0) {
        empty = false;
      }
      summary = paramString;
      return;
    }
  }
  
  public void setUserID(int paramInt)
  {
    empty = false;
    setModified(true);
    userID = paramInt;
  }
  
  public void setUserInfo(AuthUser paramAuthUser)
  {
    setReporterEmail(paramAuthUser.getEmail());
    setReporterDisplay(paramAuthUser.getDisplayName());
    setUserID(paramAuthUser.getUserID());
  }
  
  public void setWatchAreas(List<RequestWatchArea> paramList)
  {
    if (paramList != null) {
      empty = false;
    }
    for (watchAreas = paramList;; watchAreas = new ArrayList())
    {
      setModified(true);
      return;
    }
  }
  
  public void setWatchAreasDb(ForeignCollection<RequestWatchArea> paramForeignCollection)
  {
    watchAreasDb = paramForeignCollection;
  }
  
  public void setZoom(float paramFloat)
  {
    empty = false;
    setModified(true);
    zoom = paramFloat;
  }
  
  public SimpleMultiMap<String, String> toAPIv2Map()
  {
    SimpleMultiMap localSimpleMultiMap = new SimpleMultiMap();
    localSimpleMultiMap.put("api_key", "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    localSimpleMultiMap.put("request_type_id", getRequestTypeId());
    localSimpleMultiMap.put("address", getAddress());
    localSimpleMultiMap.put("lat", String.valueOf(getLat()));
    localSimpleMultiMap.put("lng", String.valueOf(getLng()));
    localSimpleMultiMap.put("anonymize_reporter", String.valueOf(getAnonymizeReporter()));
    localSimpleMultiMap.put("answers[summary]", getSummary());
    localSimpleMultiMap.put("answers[description]", getDescription());
    localSimpleMultiMap.putAll(MyApplication.getDeviceParams());
    Iterator localIterator = getReportableQuestions().iterator();
    while (localIterator.hasNext()) {
      encodeQuestion(localSimpleMultiMap, (Question)localIterator.next());
    }
    return localSimpleMultiMap;
  }
  
  public String toString()
  {
    return "Reports [dbId=" + db_id + ", state = " + state + ", apiId=" + api_id + ", reqTypeID=" + getReqTypeID() + ", answers=" + answers + ", summary=" + summary + ", description=" + description + ", localImagePath=" + localImagePath + ", lat=" + lat + ", lng=" + lng + ", address=" + address + ", reporterDisplay=" + reporterDisplay + ", reporterEmail=" + reporterEmail + ", latLng=" + latLng + ", camPosition=" + camPosition + ", anonymize_reporter=" + anonymize_reporter + ", questions=(removed)" + ", answers=(removed)" + ", watchAreas= (removed)" + ", hashCode=" + hashCode() + "]";
  }
  
  public TypedFile typedImageFile()
  {
    String str = getLocalImagePath();
    Object localObject = null;
    if (str != null)
    {
      localObject = new File(str);
      localObject = new TypedFile(new FileBody((File)localObject).getMimeType(), (File)localObject);
    }
    return (TypedFile)localObject;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    paramParcel.writeInt(api_id);
    paramParcel.writeInt(db_id);
    paramParcel.writeString(getReqTypeID());
    paramParcel.writeString(summary);
    paramParcel.writeString(description);
    paramParcel.writeString(localImagePath);
    paramParcel.writeDouble(lat);
    paramParcel.writeDouble(lng);
    if (anonymize_reporter)
    {
      paramInt = 1;
      paramParcel.writeByte((byte)paramInt);
      paramParcel.writeString(address);
      paramParcel.writeString(reporterDisplay);
      paramParcel.writeString(reporterEmail);
      paramParcel.writeInt(selectedWatchAreaApiId);
      paramParcel.writeString(state);
      paramParcel.writeTypedList(questions);
      paramParcel.writeTypedList(answers);
      paramParcel.writeTypedList(watchAreas);
      paramParcel.writeValue(camPosition);
      paramParcel.writeValue(latLng);
      if (!empty) {
        break label212;
      }
      paramInt = 1;
      label170:
      paramParcel.writeByte((byte)paramInt);
      if (!latLngModified) {
        break label217;
      }
      paramInt = 1;
      label185:
      paramParcel.writeByte((byte)paramInt);
      if (!isUsingCurrentLocation) {
        break label222;
      }
    }
    label212:
    label217:
    label222:
    for (paramInt = i;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      return;
      paramInt = 0;
      break;
      paramInt = 0;
      break label170;
      paramInt = 0;
      break label185;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.Report
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */