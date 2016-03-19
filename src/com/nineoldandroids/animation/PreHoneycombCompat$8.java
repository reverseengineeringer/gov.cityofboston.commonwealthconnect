package com.nineoldandroids.animation;

import android.view.View;
import com.nineoldandroids.util.FloatProperty;
import com.nineoldandroids.view.animation.AnimatorProxy;

final class PreHoneycombCompat$8
  extends FloatProperty<View>
{
  PreHoneycombCompat$8(String paramString)
  {
    super(paramString);
  }
  
  public Float get(View paramView)
  {
    return Float.valueOf(AnimatorProxy.wrap(paramView).getRotationY());
  }
  
  public void setValue(View paramView, float paramFloat)
  {
    AnimatorProxy.wrap(paramView).setRotationY(paramFloat);
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.animation.PreHoneycombCompat.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */