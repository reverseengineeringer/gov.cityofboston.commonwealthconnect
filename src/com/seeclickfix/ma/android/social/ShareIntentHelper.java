package com.seeclickfix.ma.android.social;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.objects.issue.Issue;

public class ShareIntentHelper
{
  public static void shareIssue(Issue paramIssue, Context paramContext)
  {
    Object localObject = paramContext.getResources();
    if (paramIssue.getSummary() == null) {}
    for (String str1 = "";; str1 = paramIssue.getSummary())
    {
      paramIssue = UrlConfig.getIssueShareUrl(paramContext) + paramIssue.getId();
      String str2 = ((Resources)localObject).getString(2131493175);
      localObject = ((Resources)localObject).getString(2131493174);
      Intent localIntent = new Intent("android.intent.action.SEND");
      localIntent.setType("text/plain");
      localIntent.setFlags(268435456);
      localIntent.putExtra("android.intent.extra.TEXT", paramIssue + "\n\n" + str2);
      localIntent.putExtra("android.intent.extra.SUBJECT", str1);
      paramContext.startActivity(Intent.createChooser(localIntent, (CharSequence)localObject));
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.social.ShareIntentHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */