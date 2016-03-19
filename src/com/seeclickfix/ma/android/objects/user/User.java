package com.seeclickfix.ma.android.objects.user;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.gson.annotations.SerializedName;

public class User
  implements Parcelable
{
  public static final Parcelable.Creator<User> CREATOR = new Parcelable.Creator()
  {
    public User createFromParcel(Parcel paramAnonymousParcel)
    {
      return new User(paramAnonymousParcel);
    }
    
    public User[] newArray(int paramAnonymousInt)
    {
      return new User[paramAnonymousInt];
    }
  };
  @SerializedName("public_filename")
  protected String avatarLargeUrl;
  @SerializedName("square_image")
  protected String avatarSquareImage;
  @SerializedName("civic_points")
  protected int civicPoints;
  @SerializedName("closed_issue_count")
  protected int closedIssueCount;
  @SerializedName("comments_count")
  protected int commentCount;
  @SerializedName("following_issue_count")
  private int followedIssueCount;
  protected int id;
  protected String name;
  @SerializedName("place_id")
  protected int placeId;
  @SerializedName("reported_issue_count")
  private int reportedIssueCount;
  @SerializedName("voted_issue_count")
  protected int votedIssueCount;
  @SerializedName("witty_title")
  protected String wittyTitle;
  
  protected User(Parcel paramParcel)
  {
    name = paramParcel.readString();
    id = paramParcel.readInt();
    placeId = paramParcel.readInt();
    civicPoints = paramParcel.readInt();
    wittyTitle = paramParcel.readString();
    votedIssueCount = paramParcel.readInt();
    followedIssueCount = paramParcel.readInt();
    reportedIssueCount = paramParcel.readInt();
    commentCount = paramParcel.readInt();
    closedIssueCount = paramParcel.readInt();
    avatarLargeUrl = paramParcel.readString();
    avatarSquareImage = paramParcel.readString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String getAvatarLargeUrl()
  {
    return avatarLargeUrl;
  }
  
  public String getAvatarSquareImage()
  {
    return avatarSquareImage;
  }
  
  public int getCivicPoints()
  {
    return civicPoints;
  }
  
  public int getClosedIssueCount()
  {
    return closedIssueCount;
  }
  
  public int getCommentCount()
  {
    return commentCount;
  }
  
  public int getFollowedIssueCount()
  {
    return followedIssueCount;
  }
  
  public int getId()
  {
    return id;
  }
  
  public String getName()
  {
    return name;
  }
  
  public int getPlaceId()
  {
    return placeId;
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
  
  public void setAvatarLargeUrl(String paramString)
  {
    avatarLargeUrl = paramString;
  }
  
  public void setAvatarSquareImage(String paramString)
  {
    avatarSquareImage = paramString;
  }
  
  public void setCivicPoints(int paramInt)
  {
    civicPoints = paramInt;
  }
  
  public void setClosedIssueCount(int paramInt)
  {
    closedIssueCount = paramInt;
  }
  
  public void setCommentCount(int paramInt)
  {
    commentCount = paramInt;
  }
  
  public void setFollowedIssueCount(int paramInt)
  {
    followedIssueCount = paramInt;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setName(String paramString)
  {
    name = paramString;
  }
  
  public void setPlaceId(int paramInt)
  {
    placeId = paramInt;
  }
  
  public void setReportedIssueCount(int paramInt)
  {
    reportedIssueCount = paramInt;
  }
  
  public void setVotedIssueCount(int paramInt)
  {
    votedIssueCount = paramInt;
  }
  
  public void setWittyTitle(String paramString)
  {
    wittyTitle = paramString;
  }
  
  public String toString()
  {
    return "User [name=" + name + ", id=" + id + ", placeId=" + placeId + ", civicPoints=" + civicPoints + ", wittyTitle=" + wittyTitle + ", votedIssueCount=" + votedIssueCount + ", reportedIssueCount=" + reportedIssueCount + ", commentCount=" + commentCount + ", closedIssueCount=" + closedIssueCount + ", avatarLargeUrl=" + avatarLargeUrl + ", avatarSquareImage=" + avatarSquareImage + "]";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(name);
    paramParcel.writeInt(id);
    paramParcel.writeInt(placeId);
    paramParcel.writeInt(civicPoints);
    paramParcel.writeString(wittyTitle);
    paramParcel.writeInt(votedIssueCount);
    paramParcel.writeInt(followedIssueCount);
    paramParcel.writeInt(reportedIssueCount);
    paramParcel.writeInt(commentCount);
    paramParcel.writeInt(closedIssueCount);
    paramParcel.writeString(avatarLargeUrl);
    paramParcel.writeString(avatarSquareImage);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.user.User
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */