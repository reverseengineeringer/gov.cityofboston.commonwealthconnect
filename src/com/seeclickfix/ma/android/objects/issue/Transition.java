package com.seeclickfix.ma.android.objects.issue;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.seeclickfix.ma.android.api.SCFService.ChangeStatusEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueActionEvent;
import com.seeclickfix.ma.android.api.SCFService.IssueActionReceipt;
import com.seeclickfix.ma.android.api.SCFService.RetrofitResult;
import com.seeclickfix.ma.android.config.mappings.StatusMap;
import com.seeclickfix.ma.android.fragments.interfaces.IssueCard;
import com.seeclickfix.ma.android.objects.PageParams;

public class Transition
  extends Comment
{
  public static final Parcelable.Creator<Transition> CREATOR = new Parcelable.Creator()
  {
    public Transition createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Transition(paramAnonymousParcel, null);
    }
    
    public Transition[] newArray(int paramAnonymousInt)
    {
      return new Transition[paramAnonymousInt];
    }
  };
  
  public Transition() {}
  
  private Transition(Parcel paramParcel)
  {
    super(paramParcel);
  }
  
  public Transition(Issue paramIssue, String paramString)
  {
    super(paramString, paramIssue, StatusMap.getStateDisplayString(StatusMap.getStatusString(paramString)));
  }
  
  public Transition(Issue paramIssue, String paramString1, String paramString2)
  {
    super(paramString2, paramIssue, paramString1);
  }
  
  public static Transition fromStatus(Issue paramIssue, String paramString)
  {
    return new Transition(paramIssue, StatusMap.getStateDisplayString(paramString), StatusMap.getActionString(paramString));
  }
  
  public String commentActionTag()
  {
    return "com.seeclickfix.actions.CHANGE_STATUS";
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public PageParams getIssueDetailsParams(Issue paramIssue)
  {
    paramIssue = super.getIssueDetailsParams(paramIssue);
    paramIssue.setTransition(getTransition());
    return paramIssue;
  }
  
  public String getTransition()
  {
    return getCommentType();
  }
  
  public SCFService.IssueActionEvent toEvent(SCFService.RetrofitResult<SCFService.IssueActionReceipt> paramRetrofitResult)
  {
    return new SCFService.ChangeStatusEvent(this, paramRetrofitResult);
  }
  
  public void updateCard(IssueCard paramIssueCard, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateCard(paramIssueCard, paramIssueActionReceipt);
    paramIssueCard.updateStatus(this, paramIssueActionReceipt);
  }
  
  public void updateIssue(Issue paramIssue, SCFService.IssueActionReceipt paramIssueActionReceipt)
  {
    super.updateIssue(paramIssue, paramIssueActionReceipt);
    paramIssue.setStatus(paramIssueActionReceipt.getStatus());
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.issue.Transition
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */