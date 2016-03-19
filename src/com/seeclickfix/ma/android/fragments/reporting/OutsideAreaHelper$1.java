package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.activities.WebviewActivity;

class OutsideAreaHelper$1
  implements View.OnClickListener
{
  OutsideAreaHelper$1(OutsideAreaHelper paramOutsideAreaHelper) {}
  
  public void onClick(View paramView)
  {
    paramView = paramView.getContext();
    Intent localIntent = new Intent("android.intent.action.VIEW");
    localIntent.putExtra("webview_uri", this$0.getAlertButtonUri());
    localIntent.setClass(paramView, WebviewActivity.class);
    localIntent.setFlags(268435456);
    paramView.startActivity(localIntent);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */