package com.seeclickfix.ma.android.fragments;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.android.volley.Response.ErrorListener;
import com.android.volley.VolleyError;
import com.seeclickfix.ma.android.dialogs.ErrorDialog;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;

class FeedFrag$6
  implements Response.ErrorListener
{
  FeedFrag$6(FeedFrag paramFeedFrag) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    FeedFrag.access$102(this$0, false);
    if ("NOT_LOGGED_IN_MY_REPORTS".equals(paramVolleyError.getMessage())) {
      this$0.showMustLogInForMyReports();
    }
    for (;;)
    {
      this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
      return;
      if ("NOT_LOGGED_IN_MY_COMMENTS".equals(paramVolleyError.getMessage()))
      {
        this$0.showMustLogInForMyComment();
      }
      else
      {
        this$0.setFragState(BaseFrag.FragState.ERROR);
        FeedFrag.access$600(this$0).showErrorPanel(2131492980, 2131492967, 2130837778, 2131492978, new Runnable()
        {
          public void run()
          {
            this$0.setFragState(BaseFrag.FragState.BUSY);
            this$0.startLoading();
          }
        });
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */