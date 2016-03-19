package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.CheckBox;
import com.seeclickfix.ma.android.SeeclickfixActivity;
import com.seeclickfix.ma.android.objects.issue.Comment;
import com.seeclickfix.ma.android.objects.issue.Follow;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.user.User;
import com.seeclickfix.ma.android.util.FormUtil;

class IssueDetailsFrag$3
  implements View.OnClickListener
{
  IssueDetailsFrag$3(IssueDetailsFrag paramIssueDetailsFrag) {}
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131361951: 
      View localView = IssueDetailsFrag.access$400(this$0).findViewById(2131361951);
      localView.setEnabled(false);
      localView.setVisibility(8);
      FormUtil.hideKeyboard(paramView);
      IssueDetailsFrag.access$500(this$0, this$0.buildComment());
      return;
    case 2131361932: 
      IssueDetailsFrag.access$600(this$0).setEnabled(false);
      IssueDetailsFrag.access$500(this$0, IssueDetailsFrag.access$000(this$0).suitableVoteAction());
      return;
    case 2131361927: 
      IssueDetailsFrag.access$700(this$0).setEnabled(false);
      IssueDetailsFrag.access$500(this$0, new Follow(IssueDetailsFrag.access$000(this$0)));
      return;
    case 2131361931: 
      this$0.doScrollToBottom();
      return;
    case 2131361949: 
      this$0.launchCamera();
      return;
    case 2131361950: 
      this$0.launchGallery();
      return;
    case 2131361945: 
      this$0.clearMedia();
      return;
    case 2131362115: 
      paramView = (Comment)paramView.getTag();
      this$0.launchImageViewer(paramView.getCommentImagePath(), paramView.getSmallCommentImagePath(), IssueDetailsFrag.access$000(this$0).getSummary(), paramView.getComment(), paramView.getUser().getAvatarSquareImage(), paramView.getUser().getName());
      return;
    case 2131361925: 
      this$0.launchImageViewer(IssueDetailsFrag.access$000(this$0).getPhotoLargeUrl(), IssueDetailsFrag.access$000(this$0).getPhotoSmallUrl(), IssueDetailsFrag.access$000(this$0).getSummary(), IssueDetailsFrag.access$000(this$0).getDescription(), null, IssueDetailsFrag.access$000(this$0).getReporterDisplay());
      return;
    case 2131361935: 
      this$0.showMapLarge();
      return;
    }
    ((SeeclickfixActivity)this$0.getActivity()).showFlagDialog("issue", IssueDetailsFrag.access$000(this$0).getId());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */