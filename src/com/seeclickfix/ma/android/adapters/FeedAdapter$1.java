package com.seeclickfix.ma.android.adapters;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.net.Uri;
import android.telephony.PhoneNumberUtils;
import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.activities.WebviewActivity;
import com.seeclickfix.ma.android.objects.zone.MobileButtonsWithDefaults;

class FeedAdapter$1
  implements View.OnClickListener
{
  FeedAdapter$1(FeedAdapter paramFeedAdapter) {}
  
  public void onClick(View paramView)
  {
    Object localObject = (MobileButtonsWithDefaults)paramView.getTag();
    String str = ((MobileButtonsWithDefaults)localObject).getAction();
    localObject = ((MobileButtonsWithDefaults)localObject).getUri();
    Intent localIntent = new Intent();
    try
    {
      if (str.equalsIgnoreCase("Web View"))
      {
        localIntent.setAction("android.intent.action.VIEW");
        localIntent.putExtra("webview_uri", (String)localObject);
        localIntent.setClass(FeedAdapter.access$000(this$0), WebviewActivity.class);
        localIntent.setFlags(268435456);
        FeedAdapter.access$000(this$0).startActivity(localIntent);
        return;
      }
      if (str.equalsIgnoreCase("Content Handler"))
      {
        localIntent.setAction("android.intent.action.DIAL");
        localIntent.setData(Uri.parse((String)localObject));
        localIntent.setFlags(268435456);
        FeedAdapter.access$000(this$0).startActivity(localIntent);
        return;
      }
    }
    catch (ActivityNotFoundException paramView)
    {
      paramView = new AlertDialog.Builder(FeedAdapter.access$200(this$0));
      paramView.setPositiveButton(2131493071, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          paramAnonymousDialogInterface.dismiss();
        }
      });
      if (str.equalsIgnoreCase("Content Handler"))
      {
        str = PhoneNumberUtils.formatNumber(((String)localObject).replace("tel:", ""));
        paramView.setMessage(FeedAdapter.access$000(this$0).getString(2131492937, new Object[] { str })).setTitle(FeedAdapter.access$000(this$0).getString(2131492938));
      }
      for (;;)
      {
        paramView.create().show();
        return;
        if (str.equalsIgnoreCase("Browser"))
        {
          localIntent.setAction("android.intent.action.VIEW");
          localIntent.setData(Uri.parse((String)localObject));
          localIntent.setFlags(268435456);
          FeedAdapter.access$000(this$0).startActivity(localIntent);
          return;
        }
        if (str.equalsIgnoreCase("Local Window Login"))
        {
          FeedAdapter.access$100(this$0, (String)localObject, paramView);
          return;
        }
        if (!str.equalsIgnoreCase("Local Window")) {
          break;
        }
        FeedAdapter.access$100(this$0, (String)localObject, paramView);
        return;
        paramView.setMessage(FeedAdapter.access$000(this$0).getString(2131492935)).setTitle(FeedAdapter.access$000(this$0).getString(2131492936));
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */