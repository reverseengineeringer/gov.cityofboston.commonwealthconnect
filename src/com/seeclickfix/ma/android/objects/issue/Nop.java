package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.seeclickfix.ma.android.api.SCFService.IssueActionEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;

public class Nop
  extends Comment
  implements Parcelable
{
  public static final Parcelable.Creator<Nop> CREATOR = new Parcelable.Creator()
  {
    public Nop createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Nop(paramAnonymousParcel, null);
    }
    
    public Nop[] newArray(int paramAnonymousInt)
    {
      return new Nop[paramAnonymousInt];
    }
  };
  
  private Nop(Parcel paramParcel)
  {
    super(paramParcel);
  }
  
  public Nop(Issue paramIssue)
  {
    super("Nop", paramIssue, "");
  }
  
  public String commentActionTag()
  {
    return "com.seeclickfix.actions.NOP";
  }
  
  public void executeAction() {}
  
  public SCFService.IssueActionEvent toEvent(SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    return null;
  }
  
  public void updateCard(IssueCard paramIssueCard, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateCard(paramIssueCard, paramIssueActionReceipt);
  }
  
  public void updateIssue(Issue paramIssue, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateIssue(paramIssue, paramIssueActionReceipt);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Nop
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */