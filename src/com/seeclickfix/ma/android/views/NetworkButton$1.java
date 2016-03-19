package com.seeclickfix.ma.android.views;

import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.android.volley.toolbox.ImageLoader.ImageListener;

class NetworkButton$1
  implements ImageLoader.ImageListener
{
  NetworkButton$1(NetworkButton paramNetworkButton, boolean paramBoolean) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    if (NetworkButton.access$000(this$0) != 0) {
      NetworkButton.access$100(this$0, NetworkButton.access$000(this$0));
    }
  }
  
  public void onResponse(final ImageLoader.ImageContainer paramImageContainer, boolean paramBoolean)
  {
    if ((paramBoolean) && (val$isInLayoutPass)) {
      this$0.post(new Runnable()
      {
        public void run()
        {
          onResponse(paramImageContainer, false);
        }
      });
    }
    do
    {
      return;
      if (paramImageContainer.getBitmap() != null)
      {
        NetworkButton.access$200(this$0, paramImageContainer.getBitmap());
        return;
      }
    } while (NetworkButton.access$300(this$0) == 0);
    NetworkButton.access$100(this$0, NetworkButton.access$300(this$0));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.NetworkButton.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */