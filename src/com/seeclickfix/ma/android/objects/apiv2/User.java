package com.seeclickfix.ma.android.objects.apiv2;

import com.google.gson.annotations.SerializedName;
import java.util.Map;

public class User
{
  private Map<String, String> avatar;
  @SerializedName("civic_points")
  private int civicPoints;
  @SerializedName("closed_issue_count")
  private int closedIssueCount;
  @SerializedName("comments_count")
  private int commentsCount;
  @SerializedName("following_issue_count")
  private int followingIssueCount;
  private int id;
  @SerializedName("name")
  private String name;
  private Map<String, Boolean> permissions;
  @SerializedName("reported_issue_count")
  private int reportedIssueCount;
  @SerializedName("voted_issue_count")
  private int votedIssueCount;
  @SerializedName("witty_title")
  private String wittyTitle;
  
  public Map<String, String> getAvatar()
  {
    return avatar;
  }
  
  public int getCivicPoints()
  {
    return civicPoints;
  }
  
  public int getClosedIssueCount()
  {
    return closedIssueCount;
  }
  
  public int getCommentsCount()
  {
    return commentsCount;
  }
  
  public int getFollowingIssueCount()
  {
    return followingIssueCount;
  }
  
  public int getId()
  {
    return id;
  }
  
  public String getName()
  {
    return name;
  }
  
  public Map<String, Boolean> getPermissions()
  {
    return permissions;
  }
  
  public int getReportedIssueCount()
  {
    return reportedIssueCount;
  }
  
  public int getVotedIssueCount()
  {
    return votedIssueCount;
  }
  
  public String getWittyTitle()
  {
    return wittyTitle;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.apiv2.User
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */