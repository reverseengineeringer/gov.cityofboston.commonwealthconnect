package com.seeclickfix.ma.android.adapters;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.CursorAdapter;

public class MarkerAdapterView
  extends AdapterView<CursorAdapter>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "MarkerAdapterView";
  private CursorAdapter cursorAdapter;
  
  public MarkerAdapterView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public CursorAdapter getAdapter()
  {
    return cursorAdapter;
  }
  
  public View getSelectedView()
  {
    throw new UnsupportedOperationException("Not supported");
  }
  
  public void setAdapter(CursorAdapter paramCursorAdapter)
  {
    cursorAdapter = paramCursorAdapter;
    removeAllViewsInLayout();
    requestLayout();
  }
  
  public void setSelection(int paramInt) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.MarkerAdapterView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */