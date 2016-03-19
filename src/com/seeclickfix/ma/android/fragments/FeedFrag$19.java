package com.seeclickfix.ma.android.fragments;

import com.android.volley.NoConnectionError;
import com.android.volley.Response.ErrorListener;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.seeclickfix.ma.android.dialogs.ErrorDialog;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;

class FeedFrag$19
  implements Response.ErrorListener
{
  FeedFrag$19(FeedFrag paramFeedFrag) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    if (this$0.getActivity() == null) {
      return;
    }
    int i;
    int j;
    if ((paramVolleyError instanceof TimeoutError))
    {
      i = 2131492980;
      j = 2131492967;
    }
    for (;;)
    {
      this$0.setFragState(BaseFrag.FragState.ERROR);
      FeedFrag.access$600(this$0).showErrorPanel(i, j, 2130837778, 2131492978, new Runnable()
      {
        public void run()
        {
          this$0.setFragState(BaseFrag.FragState.BUSY);
          FeedFrag.access$1600(this$0);
        }
      });
      return;
      if ((paramVolleyError instanceof NoConnectionError))
      {
        i = 2131492972;
        j = 2131492972;
      }
      else
      {
        i = 2131492933;
        j = 2131492932;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.19
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */