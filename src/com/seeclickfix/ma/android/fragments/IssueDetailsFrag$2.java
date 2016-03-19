package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.ViewGroup;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.android.volley.Response.ErrorListener;
import com.android.volley.VolleyError;

class IssueDetailsFrag$2
  implements Response.ErrorListener
{
  IssueDetailsFrag$2(IssueDetailsFrag paramIssueDetailsFrag) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
    IssueDetailsFrag.access$300(this$0).findViewById(2131361919).setVisibility(8);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */