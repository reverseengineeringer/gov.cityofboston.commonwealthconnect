package com.seeclickfix.ma.android.dialogs;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.PrefsUtil;

public class OneTimeWarnDialog
  extends DialogFragment
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "OneTimeWarnDialog";
  private CheckBox cb;
  private int iconResId;
  private ClickListener listener;
  private int msgResId;
  private int prefLabelResId;
  private String prefName;
  private int titleResId;
  
  public static boolean followWarning(Fragment paramFragment, Runnable paramRunnable1, Runnable paramRunnable2)
  {
    return warning("Pref:WARN_FOLLOW", 2131492996, 2131492995, 2131492944, 2130837727, paramFragment, paramRunnable1, paramRunnable2);
  }
  
  public static OneTimeWarnDialog newInstance(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    OneTimeWarnDialog localOneTimeWarnDialog = new OneTimeWarnDialog();
    Bundle localBundle = new Bundle();
    localBundle.putString("pref_name", paramString);
    localBundle.putInt("PREF_LABEL_TEXT_ID", paramInt3);
    localBundle.putInt("title", paramInt1);
    localBundle.putInt("message", paramInt2);
    localBundle.putInt("icon", paramInt1);
    localOneTimeWarnDialog.setArguments(localBundle);
    return localOneTimeWarnDialog;
  }
  
  protected static boolean shouldShowDialog(String paramString, Context paramContext)
  {
    return PrefsUtil.getBoolean(paramString, true, paramContext);
  }
  
  public static boolean statusChangeWarning(Fragment paramFragment, Runnable paramRunnable1, Runnable paramRunnable2)
  {
    return warning("Pref:WARN_STATUS_CHANGE", 2131493180, 2131493179, 2131492944, 2130837727, paramFragment, paramRunnable1, paramRunnable2);
  }
  
  private void updatePref()
  {
    if (cb.isChecked())
    {
      PrefsUtil.putBoolean(prefName, true, getActivity());
      return;
    }
    PrefsUtil.putBoolean(prefName, false, getActivity());
  }
  
  static boolean warning(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, Fragment paramFragment, Runnable paramRunnable1, final Runnable paramRunnable2)
  {
    if (shouldShowDialog(paramString, paramFragment.getActivity()))
    {
      paramString = newInstance(paramString, paramInt1, paramInt2, paramInt3, paramInt4);
      paramString.setClickListener(new ClickListener()
      {
        public void onNegativeClick()
        {
          paramRunnable2.run();
        }
        
        public void onPositiveClick()
        {
          val$positive.run();
        }
      });
      paramString.show(paramFragment.getFragmentManager(), null);
      return false;
    }
    paramRunnable1.run();
    return true;
  }
  
  public static boolean watchAreaWarning(Fragment paramFragment, Runnable paramRunnable1, Runnable paramRunnable2)
  {
    return warning("Pref:warn_watch_area", 2131493104, 2131493103, 2131492944, 2130837727, paramFragment, paramRunnable1, paramRunnable2);
  }
  
  protected void doNegativeClick()
  {
    updatePref();
    if (listener != null) {
      listener.onNegativeClick();
    }
  }
  
  protected void doPositiveClick()
  {
    updatePref();
    if (listener != null) {
      listener.onPositiveClick();
    }
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    doNegativeClick();
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    titleResId = getArguments().getInt("title");
    msgResId = getArguments().getInt("message");
    iconResId = getArguments().getInt("icon");
    prefName = getArguments().getString("pref_name");
    prefLabelResId = getArguments().getInt("PREF_LABEL_TEXT_ID");
    Object localObject = new FrameLayout(getActivity());
    paramBundle = new AlertDialog.Builder(getActivity()).setTitle(titleResId).setView((View)localObject).setPositiveButton(2131493071, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        doPositiveClick();
      }
    }).setNegativeButton(2131492885, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        doNegativeClick();
      }
    }).setOnCancelListener(new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        doNegativeClick();
        paramAnonymousDialogInterface.dismiss();
      }
    }).create();
    localObject = (ViewGroup)paramBundle.getLayoutInflater().inflate(2130903074, (ViewGroup)localObject);
    cb = ((CheckBox)((ViewGroup)localObject).findViewById(2131361882));
    localObject = (TextView)((ViewGroup)localObject).findViewById(2131361880);
    cb.setText(prefLabelResId);
    ((TextView)localObject).setText(msgResId);
    return paramBundle;
  }
  
  public void setClickListener(ClickListener paramClickListener)
  {
    listener = paramClickListener;
  }
  
  public static abstract interface ClickListener
  {
    public abstract void onNegativeClick();
    
    public abstract void onPositiveClick();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */