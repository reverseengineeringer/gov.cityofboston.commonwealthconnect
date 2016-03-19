package com.seeclickfix.ma.android.adapters;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.objects.report.RequestType;
import java.util.Iterator;
import java.util.List;

public class CategorySpinnerAdapter
  extends BaseAdapter
  implements SpinnerAdapter
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "CategorySpinnerAdapter";
  private Context c;
  private List<RequestType> list;
  
  public CategorySpinnerAdapter(Context paramContext)
  {
    c = paramContext;
  }
  
  private View getBlankView(RequestType paramRequestType, View paramView, ViewGroup paramViewGroup)
  {
    paramRequestType = ViewUtil.inflate(paramViewGroup.getContext(), 2130903133, paramViewGroup);
    paramRequestType.setEnabled(false);
    return paramRequestType;
  }
  
  private View getClickableView(RequestType paramRequestType, View paramView, ViewGroup paramViewGroup)
  {
    paramView = ViewUtil.inflate(paramViewGroup.getContext(), 2130903131, paramViewGroup);
    paramView.setEnabled(true);
    paramViewGroup = (TextView)paramView.findViewById(2131362158);
    TextView localTextView = (TextView)paramView.findViewById(2131362157);
    paramViewGroup.setText(paramRequestType.getTitle());
    localTextView.setText(paramRequestType.getHeaderTitle());
    return paramView;
  }
  
  private View getNormalView(RequestType paramRequestType, View paramView, ViewGroup paramViewGroup)
  {
    paramView = ViewUtil.inflate(paramViewGroup.getContext(), 2130903132, paramViewGroup);
    paramView.setEnabled(true);
    ((TextView)paramView.findViewById(2131362158)).setText(paramRequestType.getTitle());
    return paramView;
  }
  
  public int getCount()
  {
    if (list == null) {
      return 0;
    }
    return list.size();
  }
  
  public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    RequestType localRequestType = (RequestType)getItem(paramInt);
    String str = localRequestType.getViewType();
    paramInt = -1;
    switch (str.hashCode())
    {
    default: 
      switch (paramInt)
      {
      default: 
        paramView = getNormalView(localRequestType, paramView, paramViewGroup);
      }
      break;
    }
    for (;;)
    {
      paramView.setTag(localRequestType);
      return paramView;
      if (!str.equals("req_type_blank_view")) {
        break;
      }
      paramInt = 0;
      break;
      if (!str.equals("req_type_button_view")) {
        break;
      }
      paramInt = 1;
      break;
      if (!str.equals("req_type_normal_view")) {
        break;
      }
      paramInt = 2;
      break;
      paramView = getBlankView(localRequestType, paramView, paramViewGroup);
      continue;
      paramView = getClickableView(localRequestType, paramView, paramViewGroup);
    }
  }
  
  public Object getItem(int paramInt)
  {
    if (list == null) {
      return Integer.valueOf(0);
    }
    return list.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getItemViewType(int paramInt)
  {
    return 0;
  }
  
  public List<RequestType> getList()
  {
    return list;
  }
  
  public int getSelectionById(String paramString)
  {
    Iterator localIterator = list.iterator();
    while (localIterator.hasNext())
    {
      RequestType localRequestType = (RequestType)localIterator.next();
      if (paramString.equals(localRequestType.getApiId())) {
        return list.indexOf(localRequestType);
      }
    }
    return 0;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    RequestType localRequestType = (RequestType)getItem(paramInt);
    View localView = paramView;
    if (paramView == null) {
      localView = ViewUtil.inflate(paramViewGroup.getContext(), 2130903132, paramViewGroup);
    }
    ((TextView)localView.findViewById(2131362158)).setText(localRequestType.getTitle());
    localView.setTag(localRequestType);
    return localView;
  }
  
  public int getViewTypeCount()
  {
    return 0;
  }
  
  public boolean hasStableIds()
  {
    return false;
  }
  
  public boolean isEmpty()
  {
    return (list == null) || (list.size() <= 0);
  }
  
  public void setList(List<RequestType> paramList)
  {
    list = paramList;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.CategorySpinnerAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */