package com.nineoldandroids.animation;

import android.util.Log;
import com.nineoldandroids.util.IntProperty;
import com.nineoldandroids.util.Property;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class PropertyValuesHolder$IntPropertyValuesHolder
  extends PropertyValuesHolder
{
  int mIntAnimatedValue;
  IntKeyframeSet mIntKeyframeSet;
  private IntProperty mIntProperty;
  
  public PropertyValuesHolder$IntPropertyValuesHolder(Property paramProperty, IntKeyframeSet paramIntKeyframeSet)
  {
    super(paramProperty, null);
    mValueType = Integer.TYPE;
    mKeyframeSet = paramIntKeyframeSet;
    mIntKeyframeSet = ((IntKeyframeSet)mKeyframeSet);
    if ((paramProperty instanceof IntProperty)) {
      mIntProperty = ((IntProperty)mProperty);
    }
  }
  
  public PropertyValuesHolder$IntPropertyValuesHolder(Property paramProperty, int... paramVarArgs)
  {
    super(paramProperty, null);
    setIntValues(paramVarArgs);
    if ((paramProperty instanceof IntProperty)) {
      mIntProperty = ((IntProperty)mProperty);
    }
  }
  
  public PropertyValuesHolder$IntPropertyValuesHolder(String paramString, IntKeyframeSet paramIntKeyframeSet)
  {
    super(paramString, null);
    mValueType = Integer.TYPE;
    mKeyframeSet = paramIntKeyframeSet;
    mIntKeyframeSet = ((IntKeyframeSet)mKeyframeSet);
  }
  
  public PropertyValuesHolder$IntPropertyValuesHolder(String paramString, int... paramVarArgs)
  {
    super(paramString, null);
    setIntValues(paramVarArgs);
  }
  
  void calculateValue(float paramFloat)
  {
    mIntAnimatedValue = mIntKeyframeSet.getIntValue(paramFloat);
  }
  
  public IntPropertyValuesHolder clone()
  {
    IntPropertyValuesHolder localIntPropertyValuesHolder = (IntPropertyValuesHolder)super.clone();
    mIntKeyframeSet = ((IntKeyframeSet)mKeyframeSet);
    return localIntPropertyValuesHolder;
  }
  
  Object getAnimatedValue()
  {
    return Integer.valueOf(mIntAnimatedValue);
  }
  
  void setAnimatedValue(Object paramObject)
  {
    if (mIntProperty != null) {
      mIntProperty.setValue(paramObject, mIntAnimatedValue);
    }
    do
    {
      return;
      if (mProperty != null)
      {
        mProperty.set(paramObject, Integer.valueOf(mIntAnimatedValue));
        return;
      }
    } while (mSetter == null);
    try
    {
      mTmpValueArray[0] = Integer.valueOf(mIntAnimatedValue);
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
  
  public void setIntValues(int... paramVarArgs)
  {
    super.setIntValues(paramVarArgs);
    mIntKeyframeSet = ((IntKeyframeSet)mKeyframeSet);
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
 * Qualified Name:     com.nineoldandroids.animation.PropertyValuesHolder.IntPropertyValuesHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */