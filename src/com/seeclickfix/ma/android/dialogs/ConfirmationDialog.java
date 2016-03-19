package com.seeclickfix.ma.android.dialogs;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.seeclickfix.ma.android.fragments.NoticeItem;

public abstract class ConfirmationDialog
  extends DialogFragment
{
  private int titleResId;
  
  public static ConfirmationDialog newInstance(int paramInt1, int paramInt2, String paramString, Runnable paramRunnable)
  {
    paramRunnable = new ConfirmationDialog()
    {
      protected Runnable afterConfirm()
      {
        return val$afterConfirm;
      }
    };
    Bundle localBundle = new Bundle();
    localBundle.putInt("title", paramInt1);
    localBundle.putInt("message", paramInt2);
    localBundle.putString("message2", paramString);
    paramRunnable.setArguments(localBundle);
    return paramRunnable;
  }
  
  public static void show(int paramInt1, int paramInt2, String paramString, Fragment paramFragment, Runnable paramRunnable)
  {
    newInstance(paramInt1, paramInt2, paramString, paramRunnable).show(paramFragment.getFragmentManager(), null);
  }
  
  public static void showNotice(Fragment paramFragment, NoticeItem paramNoticeItem, Runnable paramRunnable)
  {
    show(paramNoticeItem.getTitle(), paramNoticeItem.getBody(), paramNoticeItem.getExtra(), paramFragment, paramRunnable);
  }
  
  protected abstract Runnable afterConfirm();
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    int i = getArguments().getInt("title");
    int j = getArguments().getInt("message");
    paramBundle = getArguments().getString("message2");
    Object localObject = new FrameLayout(getActivity());
    AlertDialog localAlertDialog = new AlertDialog.Builder(getActivity()).setTitle(i).setView((View)localObject).setPositiveButton(2131493071, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface.dismiss();
        afterConfirm().run();
      }
    }).setOnCancelListener(new DialogInterface.OnCancelListener()
    {
      public void onCancel(DialogInterface paramAnonymousDialogInterface)
      {
        paramAnonymousDialogInterface.dismiss();
        afterConfirm().run();
      }
    }).create();
    localObject = (ViewGroup)localAlertDialog.getLayoutInflater().inflate(2130903067, (ViewGroup)localObject);
    ((TextView)((ViewGroup)localObject).findViewById(2131361870)).setText(j);
    ((TextView)((ViewGroup)localObject).findViewById(2131361871)).setText(Html.fromHtml(paramBundle));
    return localAlertDialog;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.ConfirmationDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */