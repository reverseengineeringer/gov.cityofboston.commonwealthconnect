package com.android.volley.toolbox;

import com.android.volley.VolleyError;

class NetworkImageView$1
  implements ImageLoader.ImageListener
{
  NetworkImageView$1(NetworkImageView paramNetworkImageView, boolean paramBoolean) {}
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    if (NetworkImageView.access$000(this$0) != 0) {
      this$0.setImageResource(NetworkImageView.access$000(this$0));
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
        this$0.setImageBitmap(paramImageContainer.getBitmap());
        return;
      }
    } while (NetworkImageView.access$100(this$0) == 0);
    this$0.setImageResource(NetworkImageView.access$100(this$0));
  }
}

/* Location:
 * Qualified Name:     com.android.volley.toolbox.NetworkImageView.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */