package com.actionbarsherlock.internal.nineoldandroids.animation;

public class IntEvaluator
  implements TypeEvaluator<Integer>
{
  public Integer evaluate(float paramFloat, Integer paramInteger1, Integer paramInteger2)
  {
    int i = paramInteger1.intValue();
    return Integer.valueOf((int)(i + (paramInteger2.intValue() - i) * paramFloat));
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.nineoldandroids.animation.IntEvaluator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */