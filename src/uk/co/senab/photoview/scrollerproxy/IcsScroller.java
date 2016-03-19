package uk.co.senab.photoview.scrollerproxy;

import android.annotation.TargetApi;
import android.content.Context;
import android.widget.OverScroller;

@TargetApi(14)
public class IcsScroller
  extends GingerScroller
{
  public IcsScroller(Context paramContext)
  {
    super(paramContext);
  }
  
  public boolean computeScrollOffset()
  {
    return mScroller.computeScrollOffset();
  }
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.scrollerproxy.IcsScroller
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */