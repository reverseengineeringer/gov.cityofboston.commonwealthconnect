package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.SpinnerAdapter;
import com.seeclickfix.ma.android.util.VU;
import java.io.Serializable;
import java.util.List;

public class StatusSpinnerAdapter
  extends BaseAdapter
  implements SpinnerAdapter
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "StatusSpinnerAdapter";
  private List<String> displayList;
  private List<String> keyList;
  
  public int getCount()
  {
    if (displayList == null) {
      return 0;
    }
    return displayList.size();
  }
  
  public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = (String)getItem(paramInt);
    String str = (String)getItemState(paramInt);
    paramViewGroup = VU.inflate(paramViewGroup, 2130903140);
    paramViewGroup.setEnabled(true);
    VU.setText(paramViewGroup, 2131362163, paramView);
    paramViewGroup.setTag(str);
    return paramViewGroup;
  }
  
  public Object getItem(int paramInt)
  {
    if (displayList == null) {
      return Integer.valueOf(0);
    }
    return (Serializable)displayList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public Object getItemState(int paramInt)
  {
    if (keyList == null) {
      return Integer.valueOf(0);
    }
    return (Serializable)keyList.get(paramInt);
  }
  
  public int getItemViewType(int paramInt)
  {
    return 1;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    View localView = paramView;
    if (paramView == null) {
      localView = VU.inflate(paramViewGroup, 2130903138);
    }
    paramViewGroup.setEnabled(true);
    VU.setText(localView, 2131362163, (String)getItem(paramInt));
    localView.setTag((String)getItemState(paramInt));
    return localView;
  }
  
  public int getViewTypeCount()
  {
    return 1;
  }
  
  public boolean hasStableIds()
  {
    return true;
  }
  
  public boolean isEmpty()
  {
    return (displayList == null) || (displayList.size() <= 0);
  }
  
  public void setDisplayList(List<String> paramList)
  {
    displayList = paramList;
  }
  
  public void setKeyList(List<String> paramList)
  {
    keyList = paramList;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.StatusSpinnerAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */