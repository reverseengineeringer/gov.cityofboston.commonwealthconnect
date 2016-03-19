package com.seeclickfix.ma.android.views;

import android.content.Context;
import android.view.View;
import android.widget.AdapterView;
import android.widget.BaseAdapter;

public class MarkerOverlay
  extends AdapterView<BaseAdapter>
{
  private BaseAdapter adapter;
  private int selectedPosition;
  
  public MarkerOverlay(Context paramContext)
  {
    super(paramContext);
  }
  
  public BaseAdapter getAdapter()
  {
    return adapter;
  }
  
  public View getSelectedView()
  {
    return null;
  }
  
  public void setAdapter(BaseAdapter paramBaseAdapter)
  {
    adapter = paramBaseAdapter;
  }
  
  public void setSelection(int paramInt)
  {
    selectedPosition = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.MarkerOverlay
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */