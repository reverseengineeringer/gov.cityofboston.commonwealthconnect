package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.activities.WebviewActivity;
import com.seeclickfix.ma.android.anim.Transitions;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import com.seeclickfix.ma.android.util.CollectionUtil;
import java.util.Iterator;
import java.util.List;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;

public class OutsideAreaHelper
{
  @Inject
  Context context;
  
  private View.OnClickListener getButtonClickListener()
  {
    new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = paramAnonymousView.getContext();
        Intent localIntent = new Intent("android.intent.action.VIEW");
        localIntent.putExtra("webview_uri", getAlertButtonUri());
        localIntent.setClass(paramAnonymousView, WebviewActivity.class);
        localIntent.setFlags(268435456);
        paramAnonymousView.startActivity(localIntent);
      }
    };
  }
  
  public String getAlertButtonUri()
  {
    return DedicatedAppManager.getDedicatedApp(context).getReportAlertButtonUri();
  }
  
  public String getAlertMsg()
  {
    return DedicatedAppManager.getDedicatedApp(context).getReportAlertMessage();
  }
  
  public void hideAlert(ViewGroup paramViewGroup)
  {
    paramViewGroup.removeAllViews();
    paramViewGroup.setVisibility(8);
  }
  
  public boolean shouldShowButton()
  {
    return getAlertButtonUri() != null;
  }
  
  public boolean shouldShowWarning(List<RequestWatchArea> paramList)
  {
    DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(context);
    boolean bool1;
    if (!localDedicatedApp.getIsDedicatedApp()) {
      bool1 = false;
    }
    boolean bool2;
    do
    {
      do
      {
        return bool1;
        bool2 = StringUtils.isNotEmpty(localDedicatedApp.getReportAlertMessage());
        bool1 = bool2;
      } while (!CollectionUtil.isNotNullOrEmpty(paramList));
      bool1 = bool2;
    } while (!bool2);
    paramList = paramList.iterator();
    do
    {
      bool1 = bool2;
      if (!paramList.hasNext()) {
        break;
      }
    } while (!((RequestWatchArea)paramList.next()).getIncludesPoint());
    return false;
  }
  
  public void showAlert(ViewGroup paramViewGroup)
  {
    if (paramViewGroup.getVisibility() == 8)
    {
      DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(context);
      paramViewGroup.removeAllViews();
      ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(context, 2130903120, paramViewGroup);
      ((TextView)localViewGroup.findViewById(2131362110)).setText(getAlertMsg());
      if (shouldShowButton())
      {
        Object localObject = (TextView)localViewGroup.findViewById(2131362111);
        ((TextView)localObject).setText(localDedicatedApp.getReportAlertBodyText());
        ((TextView)localObject).setVisibility(0);
        localObject = (Button)localViewGroup.findViewById(2131362112);
        ((Button)localObject).setText(localDedicatedApp.getReportAlertButtonText());
        ((Button)localObject).setOnClickListener(getButtonClickListener());
        ((Button)localObject).setVisibility(0);
      }
      paramViewGroup.addView(localViewGroup);
      paramViewGroup.setVisibility(0);
      paramViewGroup.startAnimation(Transitions.fadeIn(context));
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.OutsideAreaHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */