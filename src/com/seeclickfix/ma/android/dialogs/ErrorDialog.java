package com.seeclickfix.ma.android.dialogs;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.widget.Button;
import android.widget.TextView;

public class ErrorDialog
{
  private final View errorView;
  
  public ErrorDialog(View paramView)
  {
    errorView = paramView;
  }
  
  private void buildErrorPanel(int paramInt1, int paramInt2, int paramInt3, final Runnable paramRunnable)
  {
    TextView localTextView = (TextView)errorView.findViewById(2131362128);
    Button localButton = (Button)errorView.findViewById(2131362129);
    localButton.setCompoundDrawablesWithIntrinsicBounds(paramInt2, 0, 0, 0);
    localButton.setText(paramInt3);
    localTextView.setText(paramInt1);
    localButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramRunnable.run();
      }
    });
    errorView.setOnTouchListener(new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        return true;
      }
    });
  }
  
  public void showErrorPanel(int paramInt1, int paramInt2, int paramInt3, int paramInt4, Runnable paramRunnable)
  {
    buildErrorPanel(paramInt2, 2130837778, 2131492978, paramRunnable);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.ErrorDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */