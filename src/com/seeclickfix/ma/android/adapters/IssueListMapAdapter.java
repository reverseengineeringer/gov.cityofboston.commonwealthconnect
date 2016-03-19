package com.seeclickfix.ma.android.adapters;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.seeclickfix.ma.android.cache.IssueLruObjectCache;
import com.seeclickfix.ma.android.objects.issue.Issue;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class IssueListMapAdapter
  extends BaseAdapter
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IssueListMapAdapter";
  private Context c;
  private IssueLruObjectCache issueCache;
  @SuppressLint({"UseSparseArrays"})
  private Map<Integer, Integer> issueIdsMap = new HashMap();
  private Set<Issue> issueSet = new HashSet();
  
  public IssueListMapAdapter(Context paramContext)
  {
    c = paramContext;
    issueCache = IssueLruObjectCache.getInstance("ISSUES");
  }
  
  public void appendList(List<Issue> paramList)
  {
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      Issue localIssue = (Issue)paramList.next();
      issueSet.add(localIssue);
    }
  }
  
  public List<Issue> getAllAsList()
  {
    return new ArrayList(issueSet);
  }
  
  public int getCount()
  {
    return issueIdsMap.size();
  }
  
  public int getIssueCount()
  {
    return issueIdsMap.size();
  }
  
  public Object getItem(int paramInt)
  {
    return issueCache.get(issueIdsMap.get(Integer.valueOf(paramInt)));
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = ViewUtil.inflate(c, 2130903126, paramViewGroup);
    paramViewGroup = new IssueViewHolder();
    titleTextView = ((TextView)paramView.findViewById(2131362136));
    descriptionTextView = ((TextView)paramView.findViewById(2131362138));
    paramView.setTag(paramViewGroup);
    return paramView;
  }
  
  public void pruneByBounds(LatLngBounds paramLatLngBounds)
  {
    int i = 0;
    Object localObject = new ArrayList();
    Iterator localIterator = issueSet.iterator();
    while (localIterator.hasNext())
    {
      Issue localIssue = (Issue)localIterator.next();
      if (!paramLatLngBounds.contains(new LatLng(localIssue.getLat(), localIssue.getLng())))
      {
        ((List)localObject).add(localIssue);
        i += 1;
      }
    }
    paramLatLngBounds = ((List)localObject).iterator();
    while (paramLatLngBounds.hasNext())
    {
      localObject = (Issue)paramLatLngBounds.next();
      issueSet.remove(localObject);
    }
  }
  
  static class IssueViewHolder
  {
    TextView descriptionTextView;
    ImageView icon;
    TextView titleTextView;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.IssueListMapAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */