package com.seeclickfix.ma.android.objects.issue;

import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.objects.apiv2.IssueV2;
import com.seeclickfix.ma.android.objects.apiv2.RemoteIntegration;
import com.seeclickfix.ma.android.objects.apiv2.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;

@DatabaseTable(tableName="issues")
public class Issue
  implements Parcelable
{
  public static final Parcelable.Creator<Issue> CREATOR = new Parcelable.Creator()
  {
    public Issue createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Issue(paramAnonymousParcel);
    }
    
    public Issue[] newArray(int paramAnonymousInt)
    {
      return new Issue[paramAnonymousInt];
    }
  };
  private static final boolean D = false;
  private static final String TAG = "Issue";
  @DatabaseField(columnName="address")
  private String address;
  @DatabaseField(columnName="anonymize_reporter")
  private boolean anonymize_reporter;
  @DatabaseField(columnName="bitly")
  private String bitly;
  @SerializedName("category_icon")
  @DatabaseField(columnName="category_icon")
  private String categoryIcon;
  @SerializedName("comment_count_excluding_activity")
  @DatabaseField(columnName="comment_count_excluding_activity")
  private int commentCountExcludingActivity;
  @SerializedName("created_at")
  @DatabaseField(columnName="created_at")
  private String createdAt;
  @SerializedName("created_at_epoch")
  @DatabaseField(columnName="created_at_epoch")
  private long createdAtEpoch;
  @DatabaseField(columnName="description")
  private String description;
  @SerializedName("following")
  @DatabaseField(columnName="following")
  private boolean following;
  @SerializedName("square_image")
  @DatabaseField(columnName="icon_square")
  private String iconSquare;
  @DatabaseField(allowGeneratedIdInsert=true, generatedId=true)
  private int id;
  @SerializedName("integration_issues")
  private List<Map<String, String>> integrationIssues;
  @DatabaseField(columnName="lat")
  private double lat;
  @DatabaseField(columnName="lng")
  private double lng;
  private String localImagePath;
  @SerializedName("minutes_since_created")
  @DatabaseField(columnName="minutes_since_created")
  private int minutesSinceCreated;
  @DatabaseField(columnName="num_comments")
  private int numComments;
  @SerializedName("public_filename")
  @DatabaseField(columnName="photo_large_url")
  private String photoLargeUrl;
  @SerializedName("small_public_filename")
  @DatabaseField(columnName="photo_small_url")
  private String photoSmallUrl;
  @SerializedName("square_public_filename")
  @DatabaseField(columnName="photo_square_url")
  private String photoSquareUrl;
  @DatabaseField(columnName="rating")
  private int rating = 0;
  @SerializedName("reporter_display")
  @DatabaseField(columnName="reporter_display")
  private String reporterDisplay;
  private transient int scrollPosition;
  @DatabaseField(columnName="slug")
  private String slug;
  @DatabaseField(columnName="status")
  private String status;
  @DatabaseField(columnName="summary")
  private String summary;
  @DatabaseField(columnName="type")
  private String type;
  @SerializedName("updated_at")
  @DatabaseField(columnName="updated_at")
  private String updatedAt;
  @SerializedName("updated_at_raw")
  @DatabaseField(columnName="updated_at_raw")
  private String updatedAtRaw;
  @DatabaseField(columnName="user_id")
  private int userId;
  @SerializedName("voted_before")
  @DatabaseField(columnName="voted_before")
  private boolean votedBefore;
  
  public Issue() {}
  
  protected Issue(Parcel paramParcel)
  {
    id = paramParcel.readInt();
    scrollPosition = paramParcel.readInt();
    userId = paramParcel.readInt();
    summary = paramParcel.readString();
    type = paramParcel.readString();
    description = paramParcel.readString();
    updatedAt = paramParcel.readString();
    updatedAtRaw = paramParcel.readString();
    createdAt = paramParcel.readString();
    lat = paramParcel.readDouble();
    lng = paramParcel.readDouble();
    if (paramParcel.readByte() != 0)
    {
      bool1 = true;
      anonymize_reporter = bool1;
      rating = paramParcel.readInt();
      bitly = paramParcel.readString();
      slug = paramParcel.readString();
      minutesSinceCreated = paramParcel.readInt();
      address = paramParcel.readString();
      status = paramParcel.readString();
      numComments = paramParcel.readInt();
      reporterDisplay = paramParcel.readString();
      commentCountExcludingActivity = paramParcel.readInt();
      if (paramParcel.readByte() == 0) {
        break label288;
      }
      bool1 = true;
      label194:
      votedBefore = bool1;
      if (paramParcel.readByte() == 0) {
        break label293;
      }
    }
    label288:
    label293:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      following = bool1;
      iconSquare = paramParcel.readString();
      photoLargeUrl = paramParcel.readString();
      localImagePath = paramParcel.readString();
      photoSmallUrl = paramParcel.readString();
      photoSquareUrl = paramParcel.readString();
      categoryIcon = paramParcel.readString();
      createdAtEpoch = paramParcel.readLong();
      paramParcel.readList(integrationIssues, Issue.class.getClassLoader());
      return;
      bool1 = false;
      break;
      bool1 = false;
      break label194;
    }
  }
  
  public static Issue fromIssue2(IssueV2 paramIssueV2)
  {
    Issue localIssue = new Issue();
    id = paramIssueV2.getId();
    userId = paramIssueV2.getReporter().getId();
    summary = paramIssueV2.getSummary();
    type = "";
    description = paramIssueV2.getDescription();
    updatedAtRaw = IssueV2.toISO8601(paramIssueV2.getUpdatedAt());
    updatedAt = paramIssueV2.getUpdatedAtLocal();
    createdAtEpoch = paramIssueV2.getCreatedAt().getTime();
    minutesSinceCreated = ((int)(new Date().getTime() - createdAtEpoch) / 1000 / 60);
    createdAt = paramIssueV2.getCreatedAtLocal();
    lat = paramIssueV2.getLat();
    lng = paramIssueV2.getLng();
    anonymize_reporter = paramIssueV2.getAnonymizeReporter();
    rating = paramIssueV2.getRating();
    bitly = paramIssueV2.getShortenedUrl();
    slug = "";
    address = paramIssueV2.getAddress();
    status = paramIssueV2.getStatus();
    numComments = 0;
    reporterDisplay = paramIssueV2.getReporter().getName();
    commentCountExcludingActivity = paramIssueV2.getCommentsCount();
    Object localObject = paramIssueV2.getUserRelationships();
    if (localObject != null)
    {
      votedBefore = BooleanUtils.isFalse((Boolean)((Map)localObject).get("voted"));
      following = BooleanUtils.isFalse((Boolean)((Map)localObject).get("following"));
    }
    iconSquare = null;
    photoSmallUrl = ((String)paramIssueV2.getMedia().get("image_small"));
    photoLargeUrl = ((String)paramIssueV2.getMedia().get("image_full"));
    photoSquareUrl = ((String)paramIssueV2.getMedia().get("image_square_100x100"));
    categoryIcon = null;
    if (paramIssueV2.getRemoteIntegrations() != null)
    {
      localObject = new ArrayList();
      paramIssueV2 = paramIssueV2.getRemoteIntegrations().iterator();
      while (paramIssueV2.hasNext())
      {
        RemoteIntegration localRemoteIntegration = (RemoteIntegration)paramIssueV2.next();
        HashMap localHashMap = new HashMap();
        localHashMap.put(localRemoteIntegration.getRemoteId(), localRemoteIntegration.getTitle());
        ((List)localObject).add(localHashMap);
      }
      integrationIssues = ((List)localObject);
    }
    return localIssue;
  }
  
  public boolean create(Context paramContext)
  {
    paramContext = DaoUtil.getIssueDao(paramContext);
    try
    {
      paramContext.create(this);
      paramContext.refresh(this);
      return true;
    }
    catch (SQLException paramContext) {}
    return false;
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
      paramObject = (Issue)paramObject;
    } while (id == id);
    return false;
  }
  
  public String getAddress()
  {
    return address;
  }
  
  public boolean getAnonymizeReporter()
  {
    return anonymize_reporter;
  }
  
  public String getBitly()
  {
    return bitly;
  }
  
  public String getCategoryIcon()
  {
    return categoryIcon;
  }
  
  public int getCommentCountExcludingActivity()
  {
    return commentCountExcludingActivity;
  }
  
  public String getCreatedAt()
  {
    return createdAt;
  }
  
  public long getCreatedAtEpoch()
  {
    return createdAtEpoch;
  }
  
  public String getDescription()
  {
    return description;
  }
  
  public String getIconSquare()
  {
    return iconSquare;
  }
  
  public int getId()
  {
    return id;
  }
  
  public List<Map<String, String>> getIntegrationIssues()
  {
    return integrationIssues;
  }
  
  public double getLat()
  {
    return lat;
  }
  
  public double getLng()
  {
    return lng;
  }
  
  public String getLocalImagePath()
  {
    return localImagePath;
  }
  
  public int getMinutesSinceCreated()
  {
    return minutesSinceCreated;
  }
  
  public int getNumComments()
  {
    return numComments;
  }
  
  public String getPhotoLargeUrl()
  {
    return photoLargeUrl;
  }
  
  public String getPhotoSmallUrl()
  {
    return photoSmallUrl;
  }
  
  public String getPhotoSquareUrl()
  {
    return photoSquareUrl;
  }
  
  public int getRating()
  {
    return rating;
  }
  
  public String getReporterDisplay()
  {
    return reporterDisplay;
  }
  
  public int getScrollPosition()
  {
    return scrollPosition;
  }
  
  public String getStatus()
  {
    return status;
  }
  
  public String getSummary()
  {
    return summary;
  }
  
  public String getType()
  {
    return type;
  }
  
  public String getUpdatedAt()
  {
    return updatedAt;
  }
  
  public String getUpdatedAtRaw()
  {
    return updatedAtRaw;
  }
  
  public int getUserId()
  {
    return userId;
  }
  
  public int hashCode()
  {
    return id + 31;
  }
  
  public boolean isClosedOrArchived()
  {
    return ("Closed".equals(status)) || ("Archived".equals(status));
  }
  
  public boolean isFollowing()
  {
    return following;
  }
  
  public boolean isVotedBefore()
  {
    return votedBefore;
  }
  
  public void setAddress(String paramString)
  {
    address = paramString;
  }
  
  public void setAnonymizeReporter(boolean paramBoolean)
  {
    anonymize_reporter = paramBoolean;
  }
  
  public void setBitly(String paramString)
  {
    bitly = paramString;
  }
  
  public void setCategoryIcon(String paramString)
  {
    categoryIcon = paramString;
  }
  
  public void setCommentCountExcludingActivity(int paramInt)
  {
    commentCountExcludingActivity = paramInt;
  }
  
  public void setCreatedAt(String paramString)
  {
    createdAt = paramString;
  }
  
  public void setCreatedAtEpoch(long paramLong)
  {
    createdAtEpoch = paramLong;
  }
  
  public void setDescription(String paramString)
  {
    description = paramString;
  }
  
  public void setFollowing(boolean paramBoolean)
  {
    following = paramBoolean;
  }
  
  public void setIconSquare(String paramString)
  {
    iconSquare = paramString;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setIntegrationIssues(List<Map<String, String>> paramList)
  {
    integrationIssues = paramList;
  }
  
  public void setLat(double paramDouble)
  {
    lat = paramDouble;
  }
  
  public void setLng(double paramDouble)
  {
    lng = paramDouble;
  }
  
  public void setLocalImagePath(String paramString)
  {
    localImagePath = paramString;
  }
  
  public void setMinutesSinceCreated(int paramInt)
  {
    minutesSinceCreated = paramInt;
  }
  
  public void setNumComments(int paramInt)
  {
    numComments = paramInt;
  }
  
  public void setPhotoLargeUrl(String paramString)
  {
    photoLargeUrl = paramString;
  }
  
  public void setPhotoSmallUrl(String paramString)
  {
    photoSmallUrl = paramString;
  }
  
  public void setPhotoSquareUrl(String paramString)
  {
    photoSquareUrl = paramString;
  }
  
  public void setRating(int paramInt)
  {
    rating = paramInt;
  }
  
  public void setReporterDisplay(String paramString)
  {
    reporterDisplay = paramString;
  }
  
  public void setScrollPosition(int paramInt)
  {
    scrollPosition = paramInt;
  }
  
  public void setStatus(String paramString)
  {
    status = paramString;
  }
  
  public void setSummary(String paramString)
  {
    summary = paramString;
  }
  
  public void setType(String paramString)
  {
    type = paramString;
  }
  
  public void setUpdatedAt(String paramString)
  {
    updatedAt = paramString;
  }
  
  public void setUpdatedAtRaw(String paramString)
  {
    updatedAtRaw = paramString;
  }
  
  public void setUserId(int paramInt)
  {
    userId = paramInt;
  }
  
  public void setVotedBefore(boolean paramBoolean)
  {
    votedBefore = paramBoolean;
  }
  
  public Comment suitableVoteAction()
  {
    if (isVotedBefore()) {
      return new RevokeVote(this);
    }
    return new Vote(this);
  }
  
  public String toString()
  {
    return "Issue [id=" + id + ", userId=" + userId + ", summary=" + summary + ", type=" + type + ", description=" + description + ", updatedAt=" + updatedAt + ", updatedAtRaw=" + updatedAtRaw + ", createdAt=" + createdAt + ", lat=" + lat + ", lng=" + lng + ", anonymize_reporter=" + anonymize_reporter + ", rating=" + rating + ", bitly=" + bitly + ", minutesSinceCreated=" + minutesSinceCreated + ", address=" + address + ", status=" + status + ", numComments=" + numComments + ", reporterDisplay=" + reporterDisplay + ", commentCountExcludingActivity=" + commentCountExcludingActivity + ", votedBefore=" + votedBefore + ", following=" + following + ", iconSquare=" + iconSquare + ", photoLargeUrl=" + photoLargeUrl + ", photoSmallUrl=" + photoSmallUrl + ", photoSquareUrl=" + photoSquareUrl + ", localImagePath=" + localImagePath + ", createdAtEpoch=" + createdAtEpoch + "]";
  }
  
  public void toggleFollowing()
  {
    if (!isFollowing()) {}
    for (boolean bool = true;; bool = false)
    {
      setFollowing(bool);
      return;
    }
  }
  
  public void updateComment(Comment paramComment)
  {
    if (StringUtils.isNotBlank(paramComment.getComment()))
    {
      setCommentCountExcludingActivity(getCommentCountExcludingActivity() + 1);
      paramComment.setCreatedAtMillis(System.currentTimeMillis());
    }
  }
  
  public void updateVote()
  {
    if (!votedBefore)
    {
      setRating(getRating() + 1);
      if (votedBefore) {
        break label45;
      }
    }
    label45:
    for (boolean bool = true;; bool = false)
    {
      setVotedBefore(bool);
      return;
      setRating(getRating() - 1);
      break;
    }
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    paramParcel.writeInt(id);
    paramParcel.writeInt(scrollPosition);
    paramParcel.writeInt(userId);
    paramParcel.writeString(summary);
    paramParcel.writeString(type);
    paramParcel.writeString(description);
    paramParcel.writeString(updatedAt);
    paramParcel.writeString(updatedAtRaw);
    paramParcel.writeString(createdAt);
    paramParcel.writeDouble(lat);
    paramParcel.writeDouble(lng);
    if (anonymize_reporter)
    {
      paramInt = 1;
      paramParcel.writeByte((byte)paramInt);
      paramParcel.writeInt(rating);
      paramParcel.writeString(bitly);
      paramParcel.writeString(slug);
      paramParcel.writeInt(minutesSinceCreated);
      paramParcel.writeString(address);
      paramParcel.writeString(status);
      paramParcel.writeInt(numComments);
      paramParcel.writeString(reporterDisplay);
      paramParcel.writeInt(commentCountExcludingActivity);
      if (!votedBefore) {
        break label277;
      }
      paramInt = 1;
      label186:
      paramParcel.writeByte((byte)paramInt);
      if (!following) {
        break label282;
      }
    }
    label277:
    label282:
    for (paramInt = i;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      paramParcel.writeString(iconSquare);
      paramParcel.writeString(photoLargeUrl);
      paramParcel.writeString(localImagePath);
      paramParcel.writeString(photoSmallUrl);
      paramParcel.writeString(photoSquareUrl);
      paramParcel.writeString(categoryIcon);
      paramParcel.writeLong(createdAtEpoch);
      paramParcel.writeList(integrationIssues);
      return;
      paramInt = 0;
      break;
      paramInt = 0;
      break label186;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Issue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */