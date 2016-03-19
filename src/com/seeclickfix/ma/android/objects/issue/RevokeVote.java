package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.j256.ormlite.table.DatabaseTable;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.api.SCFService.RevokeVoteResultEvent;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;

@DatabaseTable(tableName="comments")
public class RevokeVote
  extends Comment
  implements Parcelable
{
  public static final Parcelable.Creator<RevokeVote> CREATOR = new Parcelable.Creator()
  {
    public RevokeVote createFromParcel(Parcel paramAnonymousParcel)
    {
      return new RevokeVote(paramAnonymousParcel, null);
    }
    
    public RevokeVote[] newArray(int paramAnonymousInt)
    {
      return new RevokeVote[paramAnonymousInt];
    }
  };
  
  public RevokeVote() {}
  
  private RevokeVote(Parcel paramParcel)
  {
    super(paramParcel);
  }
  
  public RevokeVote(Issue paramIssue)
  {
    super("Issue Revoked Vote For", paramIssue, "");
  }
  
  public String commentActionTag()
  {
    return "com.seeclickfix.actions.VOTE";
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public SCFService.RevokeVoteResultEvent toEvent(SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    return new SCFService.RevokeVoteResultEvent(this, paramRetrofitResult);
  }
  
  public void updateCard(IssueCard paramIssueCard, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateCard(paramIssueCard, paramIssueActionReceipt);
    paramIssueCard.revokeVote(this, paramIssueActionReceipt);
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
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.RevokeVote
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */