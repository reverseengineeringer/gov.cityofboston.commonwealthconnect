package com.seeclickfix.ma.android;

import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.TextView;
import com.actionbarsherlock.app.ActionBar;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.style.StyleUtil;

class SeeclickfixActivity$DrawerItemClickListener
  implements AdapterView.OnItemClickListener
{
  private SeeclickfixActivity$DrawerItemClickListener(SeeclickfixActivity paramSeeclickfixActivity) {}
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = (PageParams)paramView.getTag();
    paramView = this$0.getSupportActionBar();
    paramView.show();
    paramView.setTitle(paramAdapterView.getDisplayName());
    paramView = new Bundle();
    paramView.putParcelable("page_params", paramAdapterView);
    try
    {
      paramInt = Resources.getSystem().getIdentifier("action_bar_title", "id", "android");
      TextView localTextView = (TextView)this$0.findViewById(paramInt);
      StyleUtil.setActionBarSubBasic(paramAdapterView.getDisplayName(), localTextView, this$0.getApplicationContext());
      SeeclickfixActivity.access$000(this$0);
      SeeclickfixActivity.access$100(this$0, paramAdapterView.getTag(), paramAdapterView.getFragClass(), paramView);
      if (!SeeclickfixActivity.access$200(this$0)) {
        SeeclickfixActivity.access$300(this$0);
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.SeeclickfixActivity.DrawerItemClickListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */