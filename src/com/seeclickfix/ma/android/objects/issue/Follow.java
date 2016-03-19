package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.seeclickfix.ma.android.api.SCFService.FollowResultEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;

public class Follow
  extends Comment
  implements Parcelable
{
  public static final Parcelable.Creator<Follow> CREATOR = new Parcelable.Creator()
  {
    public Follow createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Follow(paramAnonymousParcel, null);
    }
    
    public Follow[] newArray(int paramAnonymousInt)
    {
      return new Follow[paramAnonymousInt];
    }
  };
  
  private Follow(Parcel paramParcel)
  {
    super(paramParcel);
  }
  
  public Follow(Issue paramIssue)
  {
    super("Watcher Added", paramIssue, "");
  }
  
  public String commentActionTag()
  {
    return "com.seeclickfix.actions.ADD_WATCHER";
  }
  
  public SCFService.FollowResultEvent toEvent(SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    return new SCFService.FollowResultEvent(this, paramRetrofitResult);
  }
  
  public void updateCard(IssueCard paramIssueCard, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateCard(paramIssueCard, paramIssueActionReceipt);
    paramIssueCard.updateFollow(this, paramIssueActionReceipt);
  }
  
  public void updateIssue(Issue paramIssue, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateIssue(paramIssue, paramIssueActionReceipt);
    paramIssue.setFollowing(true);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Follow
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */