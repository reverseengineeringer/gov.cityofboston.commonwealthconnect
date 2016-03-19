package com.seeclickfix.ma.android.adapters;

import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import com.android.volley.toolbox.ImageLoader.ImageContainer;

class FeedAdapter$IssueViewHolder
  implements TypedViewHolder
{
  CheckBox commentBtn;
  TextView dateTextView;
  TextView descriptionTextView;
  CheckBox flagBtn;
  ImageView icon;
  ImageLoader.ImageContainer imageReqContainer;
  Object itemObj;
  TextView locationTextView;
  ViewGroup mainBtn;
  int position;
  CheckBox starCheckbox;
  ViewGroup statusContainer;
  Spinner statusSpinner;
  TextView statusTextView;
  TextView titleTextView;
  ImageView userIcon;
  TextView usernameTextView;
  final int viewType = 2;
  CheckBox voteBtn;
  
  public int getType()
  {
    return 2;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.IssueViewHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */