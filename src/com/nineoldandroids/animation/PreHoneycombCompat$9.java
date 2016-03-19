package com.nineoldandroids.animation;

import android.view.View;
import com.nineoldandroids.util.FloatProperty;
import com.nineoldandroids.view.animation.AnimatorProxy;

final class PreHoneycombCompat$9
  extends FloatProperty<View>
{
  PreHoneycombCompat$9(String paramString)
  {
    super(paramString);
  }
  
  public Float get(View paramView)
  {
    return Float.valueOf(AnimatorProxy.wrap(paramView).getScaleX());
  }
  
  public void setValue(View paramView, float paramFloat)
  {
    AnimatorProxy.wrap(paramView).setScaleX(paramFloat);
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.animation.PreHoneycombCompat.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */