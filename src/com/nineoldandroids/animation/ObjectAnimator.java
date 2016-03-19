package com.nineoldandroids.animation;

import android.view.View;
import com.nineoldandroids.util.Property;
import com.nineoldandroids.view.animation.AnimatorProxy;
import java.util.HashMap;
import java.util.Map;

public final class ObjectAnimator
  extends ValueAnimator
{
  private static final boolean DBG = false;
  private static final Map<String, Property> PROXY_PROPERTIES = new HashMap();
  private Property mProperty;
  private String mPropertyName;
  private Object mTarget;
  
  static
  {
    PROXY_PROPERTIES.put("alpha", PreHoneycombCompat.ALPHA);
    PROXY_PROPERTIES.put("pivotX", PreHoneycombCompat.PIVOT_X);
    PROXY_PROPERTIES.put("pivotY", PreHoneycombCompat.PIVOT_Y);
    PROXY_PROPERTIES.put("translationX", PreHoneycombCompat.TRANSLATION_X);
    PROXY_PROPERTIES.put("translationY", PreHoneycombCompat.TRANSLATION_Y);
    PROXY_PROPERTIES.put("rotation", PreHoneycombCompat.ROTATION);
    PROXY_PROPERTIES.put("rotationX", PreHoneycombCompat.ROTATION_X);
    PROXY_PROPERTIES.put("rotationY", PreHoneycombCompat.ROTATION_Y);
    PROXY_PROPERTIES.put("scaleX", PreHoneycombCompat.SCALE_X);
    PROXY_PROPERTIES.put("scaleY", PreHoneycombCompat.SCALE_Y);
    PROXY_PROPERTIES.put("scrollX", PreHoneycombCompat.SCROLL_X);
    PROXY_PROPERTIES.put("scrollY", PreHoneycombCompat.SCROLL_Y);
    PROXY_PROPERTIES.put("x", PreHoneycombCompat.X);
    PROXY_PROPERTIES.put("y", PreHoneycombCompat.Y);
  }
  
  public ObjectAnimator() {}
  
  private <T> ObjectAnimator(T paramT, Property<T, ?> paramProperty)
  {
    mTarget = paramT;
    setProperty(paramProperty);
  }
  
  private ObjectAnimator(Object paramObject, String paramString)
  {
    mTarget = paramObject;
    setPropertyName(paramString);
  }
  
  public static <T> ObjectAnimator ofFloat(T paramT, Property<T, Float> paramProperty, float... paramVarArgs)
  {
    paramT = new ObjectAnimator(paramT, paramProperty);
    paramT.setFloatValues(paramVarArgs);
    return paramT;
  }
  
  public static ObjectAnimator ofFloat(Object paramObject, String paramString, float... paramVarArgs)
  {
    paramObject = new ObjectAnimator(paramObject, paramString);
    ((ObjectAnimator)paramObject).setFloatValues(paramVarArgs);
    return (ObjectAnimator)paramObject;
  }
  
  public static <T> ObjectAnimator ofInt(T paramT, Property<T, Integer> paramProperty, int... paramVarArgs)
  {
    paramT = new ObjectAnimator(paramT, paramProperty);
    paramT.setIntValues(paramVarArgs);
    return paramT;
  }
  
  public static ObjectAnimator ofInt(Object paramObject, String paramString, int... paramVarArgs)
  {
    paramObject = new ObjectAnimator(paramObject, paramString);
    ((ObjectAnimator)paramObject).setIntValues(paramVarArgs);
    return (ObjectAnimator)paramObject;
  }
  
  public static <T, V> ObjectAnimator ofObject(T paramT, Property<T, V> paramProperty, TypeEvaluator<V> paramTypeEvaluator, V... paramVarArgs)
  {
    paramT = new ObjectAnimator(paramT, paramProperty);
    paramT.setObjectValues(paramVarArgs);
    paramT.setEvaluator(paramTypeEvaluator);
    return paramT;
  }
  
  public static ObjectAnimator ofObject(Object paramObject, String paramString, TypeEvaluator paramTypeEvaluator, Object... paramVarArgs)
  {
    paramObject = new ObjectAnimator(paramObject, paramString);
    ((ObjectAnimator)paramObject).setObjectValues(paramVarArgs);
    ((ObjectAnimator)paramObject).setEvaluator(paramTypeEvaluator);
    return (ObjectAnimator)paramObject;
  }
  
  public static ObjectAnimator ofPropertyValuesHolder(Object paramObject, PropertyValuesHolder... paramVarArgs)
  {
    ObjectAnimator localObjectAnimator = new ObjectAnimator();
    mTarget = paramObject;
    localObjectAnimator.setValues(paramVarArgs);
    return localObjectAnimator;
  }
  
  void animateValue(float paramFloat)
  {
    super.animateValue(paramFloat);
    int j = mValues.length;
    int i = 0;
    while (i < j)
    {
      mValues[i].setAnimatedValue(mTarget);
      i += 1;
    }
  }
  
  public ObjectAnimator clone()
  {
    return (ObjectAnimator)super.clone();
  }
  
  public String getPropertyName()
  {
    return mPropertyName;
  }
  
  public Object getTarget()
  {
    return mTarget;
  }
  
  void initAnimation()
  {
    if (!mInitialized)
    {
      if ((mProperty == null) && (AnimatorProxy.NEEDS_PROXY) && ((mTarget instanceof View)) && (PROXY_PROPERTIES.containsKey(mPropertyName))) {
        setProperty((Property)PROXY_PROPERTIES.get(mPropertyName));
      }
      int j = mValues.length;
      int i = 0;
      while (i < j)
      {
        mValues[i].setupSetterAndGetter(mTarget);
        i += 1;
      }
      super.initAnimation();
    }
  }
  
  public ObjectAnimator setDuration(long paramLong)
  {
    super.setDuration(paramLong);
    return this;
  }
  
  public void setFloatValues(float... paramVarArgs)
  {
    if ((mValues == null) || (mValues.length == 0))
    {
      if (mProperty != null)
      {
        setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofFloat(mProperty, paramVarArgs) });
        return;
      }
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofFloat(mPropertyName, paramVarArgs) });
      return;
    }
    super.setFloatValues(paramVarArgs);
  }
  
  public void setIntValues(int... paramVarArgs)
  {
    if ((mValues == null) || (mValues.length == 0))
    {
      if (mProperty != null)
      {
        setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofInt(mProperty, paramVarArgs) });
        return;
      }
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofInt(mPropertyName, paramVarArgs) });
      return;
    }
    super.setIntValues(paramVarArgs);
  }
  
  public void setObjectValues(Object... paramVarArgs)
  {
    if ((mValues == null) || (mValues.length == 0))
    {
      if (mProperty != null)
      {
        setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofObject(mProperty, (TypeEvaluator)null, paramVarArgs) });
        return;
      }
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofObject(mPropertyName, (TypeEvaluator)null, paramVarArgs) });
      return;
    }
    super.setObjectValues(paramVarArgs);
  }
  
  public void setProperty(Property paramProperty)
  {
    if (mValues != null)
    {
      PropertyValuesHolder localPropertyValuesHolder = mValues[0];
      String str = localPropertyValuesHolder.getPropertyName();
      localPropertyValuesHolder.setProperty(paramProperty);
      mValuesMap.remove(str);
      mValuesMap.put(mPropertyName, localPropertyValuesHolder);
    }
    if (mProperty != null) {
      mPropertyName = paramProperty.getName();
    }
    mProperty = paramProperty;
    mInitialized = false;
  }
  
  public void setPropertyName(String paramString)
  {
    if (mValues != null)
    {
      PropertyValuesHolder localPropertyValuesHolder = mValues[0];
      String str = localPropertyValuesHolder.getPropertyName();
      localPropertyValuesHolder.setPropertyName(paramString);
      mValuesMap.remove(str);
      mValuesMap.put(paramString, localPropertyValuesHolder);
    }
    mPropertyName = paramString;
    mInitialized = false;
  }
  
  public void setTarget(Object paramObject)
  {
    if (mTarget != paramObject)
    {
      Object localObject = mTarget;
      mTarget = paramObject;
      if ((localObject == null) || (paramObject == null) || (localObject.getClass() != paramObject.getClass())) {}
    }
    else
    {
      return;
    }
    mInitialized = false;
  }
  
  public void setupEndValues()
  {
    initAnimation();
    int j = mValues.length;
    int i = 0;
    while (i < j)
    {
      mValues[i].setupEndValue(mTarget);
      i += 1;
    }
  }
  
  public void setupStartValues()
  {
    initAnimation();
    int j = mValues.length;
    int i = 0;
    while (i < j)
    {
      mValues[i].setupStartValue(mTarget);
      i += 1;
    }
  }
  
  public void start()
  {
    super.start();
  }
  
  public String toString()
  {
    String str1 = "ObjectAnimator@" + Integer.toHexString(hashCode()) + ", target " + mTarget;
    String str2 = str1;
    if (mValues != null)
    {
      int i = 0;
      for (;;)
      {
        str2 = str1;
        if (i >= mValues.length) {
          break;
        }
        str1 = str1 + "\n    " + mValues[i].toString();
        i += 1;
      }
    }
    return str2;
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.animation.ObjectAnimator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */