package com.nineoldandroids.animation;

import android.view.View;
import com.nineoldandroids.util.IntProperty;
import com.nineoldandroids.view.animation.AnimatorProxy;

final class PreHoneycombCompat$12
  extends IntProperty<View>
{
  PreHoneycombCompat$12(String paramString)
  {
    super(paramString);
  }
  
  public Integer get(View paramView)
  {
    return Integer.valueOf(AnimatorProxy.wrap(paramView).getScrollY());
  }
  
  public void setValue(View paramView, int paramInt)
  {
    AnimatorProxy.wrap(paramView).setScrollY(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.animation.PreHoneycombCompat.12
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */