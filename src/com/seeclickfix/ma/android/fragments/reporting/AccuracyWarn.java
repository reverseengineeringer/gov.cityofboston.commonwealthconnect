package com.seeclickfix.ma.android.fragments.reporting;

import android.content.Context;
import android.view.ViewGroup;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.anim.Transitions;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;

public class AccuracyWarn
{
  @Inject
  Context context;
  
  public String getAlertMsg()
  {
    return DedicatedAppManager.getDedicatedApp(context).getAccuracyLabelText();
  }
  
  public void hideAlert(ViewGroup paramViewGroup)
  {
    paramViewGroup.removeAllViews();
    paramViewGroup.setVisibility(8);
  }
  
  public boolean shouldShowWarning()
  {
    DedicatedApp localDedicatedApp = DedicatedAppManager.getDedicatedApp(context);
    if (!localDedicatedApp.getIsDedicatedApp()) {
      return false;
    }
    return StringUtils.isNotEmpty(localDedicatedApp.getAccuracyLabelText());
  }
  
  public void showAlert(ViewGroup paramViewGroup)
  {
    if (paramViewGroup.getVisibility() == 8)
    {
      paramViewGroup.removeAllViews();
      ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(context, 2130903119, paramViewGroup);
      ((TextView)localViewGroup.findViewById(2131362109)).setText(getAlertMsg());
      paramViewGroup.addView(localViewGroup);
      paramViewGroup.setVisibility(0);
      paramViewGroup.startAnimation(Transitions.fadeIn(context));
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.AccuracyWarn
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */