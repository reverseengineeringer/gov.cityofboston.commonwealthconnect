package com.seeclickfix.ma.android;

import com.seeclickfix.ma.android.fragments.NoticeItem;

public class IssueModel
{
  NoticeItem notice = new NoticeItem();
  int noticeIssue = 0;
  
  public NoticeItem getNotice()
  {
    return notice;
  }
  
  public int getNoticeIssue()
  {
    return noticeIssue;
  }
  
  public void setNotice(NoticeItem paramNoticeItem)
  {
    notice = paramNoticeItem;
  }
  
  public void setNoticeIssue(int paramInt)
  {
    noticeIssue = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.IssueModel
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */