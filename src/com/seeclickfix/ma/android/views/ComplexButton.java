package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.seeclickfix.ma.android.R.styleable;

public class ComplexButton
  extends RelativeLayout
{
  private ImageView icon;
  private Drawable iconDrawable;
  private TextView text;
  private String textString;
  
  public ComplexButton(Context paramContext)
  {
    super(paramContext);
    throw new IllegalArgumentException("ComplexButton requires an attribute set");
  }
  
  public ComplexButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    handleAttrs(paramContext, paramAttributeSet);
  }
  
  public ComplexButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    handleAttrs(paramContext, paramAttributeSet);
  }
  
  private void handleAttrs(Context paramContext, AttributeSet paramAttributeSet)
  {
    View.inflate(paramContext, 2130903063, this);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ComplexButton);
    int j = paramContext.getIndexCount();
    int i = 0;
    if (i < j)
    {
      int k = paramContext.getIndex(i);
      switch (k)
      {
      }
      for (;;)
      {
        i += 1;
        break;
        iconDrawable = paramContext.getDrawable(k);
        continue;
        textString = paramContext.getString(k);
      }
    }
    paramContext.recycle();
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    text = ((TextView)findViewById(2131361865));
    icon = ((ImageView)findViewById(2131361862));
    text.setText(textString);
    icon.setImageDrawable(iconDrawable);
  }
  
  public void setText(String paramString)
  {
    text.setText(paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.ComplexButton
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */