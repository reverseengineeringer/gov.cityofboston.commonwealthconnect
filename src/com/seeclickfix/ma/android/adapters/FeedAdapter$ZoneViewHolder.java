package com.seeclickfix.ma.android.adapters;

import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.seeclickfix.ma.android.views.ResizableGridView;

class FeedAdapter$ZoneViewHolder
  implements TypedViewHolder
{
  ViewGroup bgColorContainer;
  TextView descriptionTextView;
  TextView disclaimerTextView;
  ResizableGridView gridView;
  ImageView icon;
  ImageLoader.ImageContainer imageReqContainer;
  TextView titleTextView;
  final int viewType = 1;
  
  public int getType()
  {
    return 1;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.ZoneViewHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */