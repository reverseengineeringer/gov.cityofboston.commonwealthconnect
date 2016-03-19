package com.nineoldandroids.animation;

import android.util.Log;
import com.nineoldandroids.util.FloatProperty;
import com.nineoldandroids.util.Property;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class PropertyValuesHolder$FloatPropertyValuesHolder
  extends PropertyValuesHolder
{
  float mFloatAnimatedValue;
  FloatKeyframeSet mFloatKeyframeSet;
  private FloatProperty mFloatProperty;
  
  public PropertyValuesHolder$FloatPropertyValuesHolder(Property paramProperty, FloatKeyframeSet paramFloatKeyframeSet)
  {
    super(paramProperty, null);
    mValueType = Float.TYPE;
    mKeyframeSet = paramFloatKeyframeSet;
    mFloatKeyframeSet = ((FloatKeyframeSet)mKeyframeSet);
    if ((paramProperty instanceof FloatProperty)) {
      mFloatProperty = ((FloatProperty)mProperty);
    }
  }
  
  public PropertyValuesHolder$FloatPropertyValuesHolder(Property paramProperty, float... paramVarArgs)
  {
    super(paramProperty, null);
    setFloatValues(paramVarArgs);
    if ((paramProperty instanceof FloatProperty)) {
      mFloatProperty = ((FloatProperty)mProperty);
    }
  }
  
  public PropertyValuesHolder$FloatPropertyValuesHolder(String paramString, FloatKeyframeSet paramFloatKeyframeSet)
  {
    super(paramString, null);
    mValueType = Float.TYPE;
    mKeyframeSet = paramFloatKeyframeSet;
    mFloatKeyframeSet = ((FloatKeyframeSet)mKeyframeSet);
  }
  
  public PropertyValuesHolder$FloatPropertyValuesHolder(String paramString, float... paramVarArgs)
  {
    super(paramString, null);
    setFloatValues(paramVarArgs);
  }
  
  void calculateValue(float paramFloat)
  {
    mFloatAnimatedValue = mFloatKeyframeSet.getFloatValue(paramFloat);
  }
  
  public FloatPropertyValuesHolder clone()
  {
    FloatPropertyValuesHolder localFloatPropertyValuesHolder = (FloatPropertyValuesHolder)super.clone();
    mFloatKeyframeSet = ((FloatKeyframeSet)mKeyframeSet);
    return localFloatPropertyValuesHolder;
  }
  
  Object getAnimatedValue()
  {
    return Float.valueOf(mFloatAnimatedValue);
  }
  
  void setAnimatedValue(Object paramObject)
  {
    if (mFloatProperty != null) {
      mFloatProperty.setValue(paramObject, mFloatAnimatedValue);
    }
    do
    {
      return;
      if (mProperty != null)
      {
        mProperty.set(paramObject, Float.valueOf(mFloatAnimatedValue));
        return;
      }
    } while (mSetter == null);
    try
    {
      mTmpValueArray[0] = Float.valueOf(mFloatAnimatedValue);
      mSetter.invoke(paramObject, mTmpValueArray);
      return;
    }
    catch (InvocationTargetException paramObject)
    {
      Log.e("PropertyValuesHolder", ((InvocationTargetException)paramObject).toString());
      return;
    }
    catch (IllegalAccessException paramObject)
    {
      Log.e("PropertyValuesHolder", ((IllegalAccessException)paramObject).toString());
    }
  }
  
  public void setFloatValues(float... paramVarArgs)
  {
    super.setFloatValues(paramVarArgs);
    mFloatKeyframeSet = ((FloatKeyframeSet)mKeyframeSet);
  }
  
  void setupSetter(Class paramClass)
  {
    if (mProperty != null) {
      return;
    }
    super.setupSetter(paramClass);
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.animation.PropertyValuesHolder.FloatPropertyValuesHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */