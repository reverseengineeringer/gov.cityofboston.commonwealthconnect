package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnStatusChangeListener;
import com.seeclickfix.ma.android.objects.issue.Issue;

class FeedAdapter$9
  implements AdapterView.OnItemSelectedListener
{
  private String newStatusState;
  
  FeedAdapter$9(FeedAdapter paramFeedAdapter) {}
  
  public void onItemSelected(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    newStatusState = ((String)((StatusSpinnerAdapter)paramAdapterView.getAdapter()).getItemState(paramInt));
    paramView = (Issue)paramAdapterView.getTag();
    if (newStatusState.equals(paramView.getStatus())) {}
    while (FeedAdapter.access$800(this$0) == null) {
      return;
    }
    paramAdapterView = (ViewGroup)paramAdapterView.getParent();
    FeedAdapter.access$800(this$0).onStatusChange(paramView, newStatusState);
  }
  
  public void onNothingSelected(AdapterView<?> paramAdapterView) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */