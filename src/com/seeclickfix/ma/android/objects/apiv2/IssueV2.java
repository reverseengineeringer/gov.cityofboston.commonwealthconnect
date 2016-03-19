package com.seeclickfix.ma.android.objects.apiv2;

import com.google.gson.annotations.SerializedName;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class IssueV2
{
  private static final boolean D = false;
  private static final String TAG = "Issue2";
  @SerializedName("acknowledged_at")
  private Date acknowledgedAt;
  private String address;
  private boolean anonymize_reporter;
  private User assignee;
  @SerializedName("closed_at")
  private Date closedAt;
  @SerializedName("comment_url")
  private String commentUrl;
  private List<Comment> comments;
  @SerializedName("comments_count")
  private int commentsCount;
  @SerializedName("created_at")
  private Date createdAt;
  private String description;
  @SerializedName("html_url")
  private String htmlUrl;
  private int id;
  private double lat;
  private double lng;
  private Map<String, String> media;
  private List<Question> questions;
  private int rating = 0;
  private List<RemoteIntegration> remoteIntegrations;
  private User reporter;
  @SerializedName("shortened_url")
  private String shortenedUrl;
  private String status;
  private String summary;
  @SerializedName("updated_at")
  private Date updatedAt;
  @SerializedName("url")
  private String url;
  @SerializedName("current_user_relationship")
  private Map<String, Boolean> userRelationships;
  private List<Vote> votes;
  @SerializedName("votes_count")
  private int votesCount;
  
  public static String getTag()
  {
    return "Issue2";
  }
  
  public static boolean isD()
  {
    return false;
  }
  
  public static String toISO8601(Date paramDate)
  {
    return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.US).format(paramDate);
  }
  
  public Date getAcknowledgedAt()
  {
    return acknowledgedAt;
  }
  
  public String getAddress()
  {
    return address;
  }
  
  public boolean getAnonymizeReporter()
  {
    return anonymize_reporter;
  }
  
  public User getAssignee()
  {
    return assignee;
  }
  
  public Date getClosedAt()
  {
    return closedAt;
  }
  
  public String getCommentUrl()
  {
    return commentUrl;
  }
  
  public List<Comment> getComments()
  {
    return comments;
  }
  
  public int getCommentsCount()
  {
    return commentsCount;
  }
  
  public Date getCreatedAt()
  {
    return createdAt;
  }
  
  public String getCreatedAtLocal()
  {
    return DateFormat.getDateTimeInstance().format(getCreatedAt());
  }
  
  public String getDescription()
  {
    return description;
  }
  
  public String getHtmlUrl()
  {
    return htmlUrl;
  }
  
  public int getId()
  {
    return id;
  }
  
  public double getLat()
  {
    return lat;
  }
  
  public double getLng()
  {
    return lng;
  }
  
  public Map<String, String> getMedia()
  {
    return media;
  }
  
  public List<Question> getQuestions()
  {
    return questions;
  }
  
  public int getRating()
  {
    return rating;
  }
  
  public List<RemoteIntegration> getRemoteIntegrations()
  {
    return remoteIntegrations;
  }
  
  public User getReporter()
  {
    return reporter;
  }
  
  public String getShortenedUrl()
  {
    return shortenedUrl;
  }
  
  public String getStatus()
  {
    return status;
  }
  
  public String getSummary()
  {
    return summary;
  }
  
  public Date getUpdatedAt()
  {
    return updatedAt;
  }
  
  public String getUpdatedAtLocal()
  {
    return DateFormat.getDateTimeInstance().format(getUpdatedAt());
  }
  
  public String getUrl()
  {
    return url;
  }
  
  public Map<String, Boolean> getUserRelationships()
  {
    return userRelationships;
  }
  
  public List<Vote> getVotes()
  {
    return votes;
  }
  
  public int getVotesCount()
  {
    return votesCount;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.apiv2.IssueV2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */