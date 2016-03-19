package com.seeclickfix.ma.android.fragments;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.android.volley.Response.ErrorListener;
import com.android.volley.VolleyError;

class IssueDetailsFrag$6
  implements Response.ErrorListener
{
  IssueDetailsFrag$6(IssueDetailsFrag paramIssueDetailsFrag) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */