package com.seeclickfix.ma.android.adapters;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.volley.toolbox.ImageLoader.ImageContainer;

class FeedAdapter$CommentViewHolder
  implements TypedViewHolder
{
  TextView dateTextView;
  TextView descriptionTextView;
  View headerBg;
  ImageView icon;
  ImageLoader.ImageContainer imageReqContainer;
  Object itemObj;
  ViewGroup mainBtn;
  int position;
  TextView statusTextView;
  ImageView userIcon;
  TextView usernameTextView;
  final int viewType = 3;
  
  public int getType()
  {
    return 3;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.FeedAdapter.CommentViewHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */