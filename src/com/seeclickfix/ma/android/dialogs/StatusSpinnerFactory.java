package com.seeclickfix.ma.android.dialogs;

import android.content.Context;
import android.content.res.Resources;
import android.widget.Spinner;
import com.seeclickfix.ma.android.adapters.StatusSpinnerAdapter;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.config.mappings.StatusMap;
import com.seeclickfix.ma.android.objects.issue.Issue;
import java.util.List;

public class StatusSpinnerFactory
{
  private Spinner getSpinner(Issue paramIssue, Context paramContext)
  {
    Spinner localSpinner = new Spinner(paramContext);
    localSpinner.setPrompt(paramContext.getResources().getString(2131492962));
    localSpinner.setTag(paramIssue);
    return localSpinner;
  }
  
  private StatusSpinnerAdapter getStatusSpinnerAdapter(List<String> paramList)
  {
    StatusSpinnerAdapter localStatusSpinnerAdapter = new StatusSpinnerAdapter();
    localStatusSpinnerAdapter.setDisplayList(StatusMap.getDisplayForList(paramList));
    localStatusSpinnerAdapter.setKeyList(paramList);
    return localStatusSpinnerAdapter;
  }
  
  public Spinner buildSpinner(Issue paramIssue, boolean paramBoolean, Context paramContext)
  {
    List localList = StatusMap.statusListForIssue(paramIssue, AuthManager.authenticatedUser(), paramBoolean);
    if (localList.size() < 2) {
      return null;
    }
    paramContext = getSpinner(paramIssue, paramContext);
    paramContext.setAdapter(getStatusSpinnerAdapter(localList));
    paramContext.setSelection(localList.indexOf(paramIssue.getStatus()), true);
    return paramContext;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.StatusSpinnerFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */