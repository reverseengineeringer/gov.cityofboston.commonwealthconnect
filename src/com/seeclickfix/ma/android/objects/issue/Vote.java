package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.api.SCFService.VoteResultEvent;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;

@DatabaseTable(tableName="comments")
public class Vote
  extends Comment
  implements Parcelable
{
  public static final Parcelable.Creator<Vote> CREATOR = new Parcelable.Creator()
  {
    public Vote createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Vote(paramAnonymousParcel, null);
    }
    
    public Vote[] newArray(int paramAnonymousInt)
    {
      return new Vote[paramAnonymousInt];
    }
  };
  
  public Vote() {}
  
  private Vote(Parcel paramParcel)
  {
    super(paramParcel);
  }
  
  public Vote(Issue paramIssue)
  {
    super("Issue Voted For", paramIssue, "");
  }
  
  public String commentActionTag()
  {
    return "com.seeclickfix.actions.VOTE";
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public SCFService.VoteResultEvent toEvent(SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    return new SCFService.VoteResultEvent(this, paramRetrofitResult);
  }
  
  public void updateCard(IssueCard paramIssueCard, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateCard(paramIssueCard, paramIssueActionReceipt);
    paramIssueCard.recordVote(this, paramIssueActionReceipt);
  }
  
  public void updateIssue(Issue paramIssue, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateIssue(paramIssue, paramIssueActionReceipt);
    paramIssue.updateVote();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Vote
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */