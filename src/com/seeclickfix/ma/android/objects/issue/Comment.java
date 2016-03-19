package com.seeclickfix.ma.android.objects.issue;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.common.base.Objects;
import com.google.common.base.Strings;
import com.google.gson.annotations.SerializedName;
import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.api.SCFService.IssueActionEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.date.DateUtil;
import com.seeclickfix.ma.android.fragments.NoticeItem;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.objects.user.User;
import com.seeclickfix.ma.android.services.CommentUploadService;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.entity.mime.content.FileBody;
import retrofit.mime.TypedFile;
import retrofit.mime.TypedOutput;
import retrofit.mime.TypedString;

@DatabaseTable(tableName="comments")
public class Comment
  implements Parcelable
{
  public static final Parcelable.Creator<Comment> CREATOR = new Parcelable.Creator()
  {
    public Comment createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Comment(paramAnonymousParcel);
    }
    
    public Comment[] newArray(int paramAnonymousInt)
    {
      return new Comment[paramAnonymousInt];
    }
  };
  @SerializedName("id")
  @DatabaseField(columnName="api_id")
  private int apiID;
  @DatabaseField(columnName="text")
  protected String comment;
  @SerializedName("comment_image_path")
  @DatabaseField(columnName="image_url")
  protected String commentImagePath;
  @SerializedName("comment_type")
  @DatabaseField(columnName="type")
  protected String commentType;
  @SerializedName("created_at")
  @DatabaseField(columnName="date_created")
  protected String createdAt;
  @DatabaseField(columnName="id", generatedId=true)
  private transient int dbID;
  @DatabaseField(columnName="email")
  protected String email;
  @SerializedName("issue_id")
  @DatabaseField(columnName="issue_api_id")
  protected int issueId;
  private boolean moderated = false;
  @DatabaseField(columnName="name")
  protected String name;
  private NoticeItem notice = null;
  @SerializedName("small_comment_image_path")
  @DatabaseField(columnName="image_small_url")
  protected String smallCommentImagePath;
  @SerializedName("square_comment_image_path")
  @DatabaseField(columnName="image_square_url")
  protected String squareCommentImagePath;
  @SerializedName("send_email")
  private boolean subscribeEmailNotification = true;
  @SerializedName("updated_at")
  @DatabaseField(columnName="date_updated")
  protected String updatedAt;
  private User user;
  @SerializedName("video_path")
  @DatabaseField(columnName="video_path")
  protected String videoPath;
  @SerializedName("youtube_url")
  @DatabaseField(columnName="youtube_url")
  protected String youtubeUrl;
  
  public Comment() {}
  
  protected Comment(Parcel paramParcel)
  {
    apiID = paramParcel.readInt();
    dbID = paramParcel.readInt();
    name = paramParcel.readString();
    comment = paramParcel.readString();
    email = paramParcel.readString();
    commentType = paramParcel.readString();
    createdAt = paramParcel.readString();
    updatedAt = paramParcel.readString();
    issueId = paramParcel.readInt();
    youtubeUrl = paramParcel.readString();
    commentImagePath = paramParcel.readString();
    smallCommentImagePath = paramParcel.readString();
    squareCommentImagePath = paramParcel.readString();
    if (paramParcel.readByte() != 0) {}
    for (;;)
    {
      subscribeEmailNotification = bool;
      return;
      bool = false;
    }
  }
  
  public Comment(Issue paramIssue, String paramString)
  {
    this("Comment", paramIssue, paramString);
  }
  
  protected Comment(String paramString1, Issue paramIssue, String paramString2)
  {
    setCommentType(paramString1);
    if (paramIssue != null) {
      setIssueId(paramIssue.getId());
    }
    setComment(paramString2);
  }
  
  public static String commentTypeTag()
  {
    return "Comment";
  }
  
  public static Comment paramsToComment(PageParams paramPageParams, Issue paramIssue)
  {
    String str = (String)Objects.firstNonNull(paramPageParams.getActionExtra(), "com.seeclickfix.actions.NOP");
    label52:
    int i;
    switch (str.hashCode())
    {
    default: 
      i = -1;
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        return new Nop(paramIssue);
        if (!str.equals("com.seeclickfix.actions.VOTE")) {
          break label52;
        }
        i = 0;
        continue;
        if (!str.equals("com.seeclickfix.actions.ADD_WATCHER")) {
          break label52;
        }
        i = 1;
        continue;
        if (!str.equals("com.seeclickfix.actions.CHANGE_STATUS")) {
          break label52;
        }
        i = 2;
      }
    }
    return new Vote(paramIssue);
    return new Follow(paramIssue);
    return new Transition(paramIssue, paramPageParams.getTransition());
  }
  
  public void attachUser(AuthUser paramAuthUser)
  {
    if (paramAuthUser != null)
    {
      setEmail(paramAuthUser.getEmail());
      setName(paramAuthUser.getDisplayName());
      return;
    }
    setEmail("");
    setName("");
  }
  
  public String commentActionTag()
  {
    return "com.seeclickfix.actions.COMMENT";
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void executeAction()
  {
    Context localContext = MyApplication.instance.getApplicationContext();
    attachUser(AuthManager.authenticatedUser());
    Intent localIntent = new Intent("com.seeclickfix.actions.UPLOAD_COMMENT");
    localIntent.setClass(localContext, CommentUploadService.class);
    localIntent.putExtra("comment_bundle", this);
    localContext.startService(localIntent);
  }
  
  public int getApiID()
  {
    return apiID;
  }
  
  public String getComment()
  {
    return Strings.nullToEmpty(comment);
  }
  
  public String getCommentImagePath()
  {
    return commentImagePath;
  }
  
  public String getCommentType()
  {
    return commentType;
  }
  
  public String getCreatedAt()
  {
    return createdAt;
  }
  
  public String getCreatedAtShort()
  {
    return DateUtil.formatDateString(createdAt);
  }
  
  public int getDbID()
  {
    return dbID;
  }
  
  public String getEmail()
  {
    return email;
  }
  
  public PageParams getIssueDetailsParams(Issue paramIssue)
  {
    PageParams localPageParams = new PageParams();
    localPageParams.setActionExtra(commentActionTag());
    localPageParams.setDataParcel(paramIssue);
    return localPageParams;
  }
  
  public int getIssueId()
  {
    return issueId;
  }
  
  public String getName()
  {
    return name;
  }
  
  public NoticeItem getNotice()
  {
    return notice;
  }
  
  public String getSmallCommentImagePath()
  {
    return smallCommentImagePath;
  }
  
  public String getSquareCommentImagePath()
  {
    return squareCommentImagePath;
  }
  
  public TypedFile getTypedFile(String paramString)
  {
    TypedFile localTypedFile = null;
    if (paramString != null)
    {
      paramString = new File(paramString);
      localTypedFile = new TypedFile(new FileBody(paramString).getMimeType(), paramString);
    }
    return localTypedFile;
  }
  
  public String getUpdatedAt()
  {
    return updatedAt;
  }
  
  public User getUser()
  {
    return user;
  }
  
  public String getVideoPath()
  {
    return videoPath;
  }
  
  public String getYoutubeUrl()
  {
    return Strings.nullToEmpty(youtubeUrl);
  }
  
  public boolean isAssociatedWith(Issue paramIssue)
  {
    return issueId == paramIssue.getId();
  }
  
  public boolean isEmpty()
  {
    return Strings.isNullOrEmpty(comment);
  }
  
  public boolean isModerated()
  {
    return moderated;
  }
  
  public boolean isSubscribeEmailNotification()
  {
    return subscribeEmailNotification;
  }
  
  public Map<String, TypedOutput> partMap()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("image", typedImageFile());
    localHashMap.put("video", typedVideoFile());
    localHashMap.put("youtube_url", new TypedString(getYoutubeUrl()));
    localHashMap.put("comment", new TypedString(getComment()));
    return localHashMap;
  }
  
  public void setApiID(int paramInt)
  {
    apiID = paramInt;
  }
  
  public void setComment(String paramString)
  {
    comment = paramString;
  }
  
  public void setCommentImagePath(String paramString)
  {
    commentImagePath = paramString;
    if (getComment().isEmpty()) {
      setComment(new File(paramString).getName());
    }
  }
  
  public void setCommentType(String paramString)
  {
    commentType = paramString;
  }
  
  public void setCreatedAt(String paramString)
  {
    createdAt = paramString;
  }
  
  public void setCreatedAtMillis(long paramLong)
  {
    createdAt = DateUtil.formatMilliDateToISO(Long.valueOf(paramLong));
  }
  
  public void setDbID(int paramInt)
  {
    dbID = paramInt;
  }
  
  public void setEmail(String paramString)
  {
    email = paramString;
  }
  
  public void setIssueId(int paramInt)
  {
    issueId = paramInt;
  }
  
  public void setModerated(boolean paramBoolean)
  {
    moderated = paramBoolean;
  }
  
  public void setName(String paramString)
  {
    name = paramString;
  }
  
  public void setNotice(NoticeItem paramNoticeItem)
  {
    notice = paramNoticeItem;
  }
  
  public void setSmallCommentImagePath(String paramString)
  {
    smallCommentImagePath = paramString;
  }
  
  public void setSquareCommentImagePath(String paramString)
  {
    squareCommentImagePath = paramString;
  }
  
  public void setSubscribeEmailNotification(boolean paramBoolean)
  {
    subscribeEmailNotification = paramBoolean;
  }
  
  public void setUpdatedAt(String paramString)
  {
    updatedAt = paramString;
  }
  
  public void setUser(User paramUser)
  {
    user = paramUser;
  }
  
  public void setVideoPath(String paramString)
  {
    videoPath = paramString;
  }
  
  public void setYoutubeUrl(String paramString)
  {
    youtubeUrl = paramString;
  }
  
  public void synch(SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    if (paramRetrofitResult.isSuccess()) {
      updateFrom((SCFService.IssueActionReceipt)paramRetrofitResult.getReceipt());
    }
  }
  
  public SCFService.IssueActionEvent toEvent(SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    return new SCFService.IssueActionEvent(this, paramRetrofitResult);
  }
  
  public String toString()
  {
    return "Comment [dbID=" + dbID + ", apiID=" + apiID + ", issueId=" + issueId + ", name=" + name + ", comment=" + comment + ", email=" + email + ", commentType=" + commentType + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", youtubeUrl=" + youtubeUrl + ", commentImagePath=" + commentImagePath + ", smallCommentImagePath=" + smallCommentImagePath + ", squareCommentImagePath=" + squareCommentImagePath + ", videoPath=" + videoPath + ", subscribeEmailNotification=" + subscribeEmailNotification + ", user=" + user + "]";
  }
  
  public TypedFile typedImageFile()
  {
    return getTypedFile(getCommentImagePath());
  }
  
  public TypedFile typedVideoFile()
  {
    return getTypedFile(getVideoPath());
  }
  
  public void updateCard(IssueCard paramIssueCard, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    paramIssueCard.updateComment(this, paramIssueActionReceipt);
  }
  
  public void updateFrom(SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    if (paramIssueActionReceipt.isModerated().booleanValue()) {
      setModerated(true);
    }
  }
  
  public void updateIssue(Issue paramIssue, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    paramIssue.updateComment(this);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(apiID);
    paramParcel.writeInt(dbID);
    paramParcel.writeString(name);
    paramParcel.writeString(comment);
    paramParcel.writeString(email);
    paramParcel.writeString(commentType);
    paramParcel.writeString(createdAt);
    paramParcel.writeString(updatedAt);
    paramParcel.writeInt(issueId);
    paramParcel.writeString(youtubeUrl);
    paramParcel.writeString(commentImagePath);
    paramParcel.writeString(smallCommentImagePath);
    paramParcel.writeString(squareCommentImagePath);
    if (subscribeEmailNotification) {}
    for (paramInt = 1;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Comment
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */