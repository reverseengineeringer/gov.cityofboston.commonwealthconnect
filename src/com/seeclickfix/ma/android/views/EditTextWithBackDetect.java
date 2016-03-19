package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.widget.EditText;

public class EditTextWithBackDetect
  extends EditText
{
  private EditTextImeBackListener mOnImeBack;
  
  public EditTextWithBackDetect(Context paramContext)
  {
    super(paramContext);
  }
  
  public EditTextWithBackDetect(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public EditTextWithBackDetect(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public boolean onKeyPreIme(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramKeyEvent.getKeyCode() == 4) && (paramKeyEvent.getAction() == 1) && (mOnImeBack != null)) {
      mOnImeBack.onImeBack(this, getText().toString());
    }
    return super.dispatchKeyEvent(paramKeyEvent);
  }
  
  public void setOnEditTextImeBackListener(EditTextImeBackListener paramEditTextImeBackListener)
  {
    mOnImeBack = paramEditTextImeBackListener;
  }
  
  public static abstract interface EditTextImeBackListener
  {
    public abstract void onImeBack(EditTextWithBackDetect paramEditTextWithBackDetect, String paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.EditTextWithBackDetect
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */