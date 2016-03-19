package com.actionbarsherlock.internal.nineoldandroids.animation;

import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;

public class PropertyValuesHolder
  implements Cloneable
{
  private static Class[] DOUBLE_VARIANTS;
  private static Class[] FLOAT_VARIANTS;
  private static Class[] INTEGER_VARIANTS;
  private static final TypeEvaluator sFloatEvaluator;
  private static final HashMap<Class, HashMap<String, Method>> sGetterPropertyMap = new HashMap();
  private static final TypeEvaluator sIntEvaluator = new IntEvaluator();
  private static final HashMap<Class, HashMap<String, Method>> sSetterPropertyMap;
  private Object mAnimatedValue;
  private TypeEvaluator mEvaluator;
  private Method mGetter = null;
  KeyframeSet mKeyframeSet = null;
  final ReentrantReadWriteLock mPropertyMapLock = new ReentrantReadWriteLock();
  String mPropertyName;
  Method mSetter = null;
  final Object[] mTmpValueArray = new Object[1];
  Class mValueType;
  
  static
  {
    sFloatEvaluator = new FloatEvaluator();
    FLOAT_VARIANTS = new Class[] { Float.TYPE, Float.class, Double.TYPE, Integer.TYPE, Double.class, Integer.class };
    INTEGER_VARIANTS = new Class[] { Integer.TYPE, Integer.class, Float.TYPE, Double.TYPE, Float.class, Double.class };
    DOUBLE_VARIANTS = new Class[] { Double.TYPE, Double.class, Float.TYPE, Integer.TYPE, Float.class, Integer.class };
    sSetterPropertyMap = new HashMap();
  }
  
  private PropertyValuesHolder(String paramString)
  {
    mPropertyName = paramString;
  }
  
  static String getMethodName(String paramString1, String paramString2)
  {
    if ((paramString2 == null) || (paramString2.length() == 0)) {
      return paramString1;
    }
    char c = Character.toUpperCase(paramString2.charAt(0));
    paramString2 = paramString2.substring(1);
    return paramString1 + c + paramString2;
  }
  
  private Method getPropertyFunction(Class paramClass1, String paramString, Class paramClass2)
  {
    Object localObject = null;
    Method localMethod = null;
    String str = getMethodName(paramString, mPropertyName);
    if (paramClass2 == null) {}
    for (;;)
    {
      try
      {
        localObject = paramClass1.getMethod(str, null);
        return (Method)localObject;
      }
      catch (NoSuchMethodException paramString)
      {
        Log.e("PropertyValuesHolder", paramClass1.getSimpleName() + " - " + "Couldn't find no-arg method for property " + mPropertyName + ": " + paramString);
        localObject = localMethod;
        continue;
      }
      Class[] arrayOfClass = new Class[1];
      int j;
      int i;
      if (mValueType.equals(Float.class))
      {
        paramClass2 = FLOAT_VARIANTS;
        j = paramClass2.length;
        i = 0;
      }
      for (;;)
      {
        if (i >= j) {
          break label224;
        }
        Class localClass = paramClass2[i];
        arrayOfClass[0] = localClass;
        try
        {
          localMethod = paramClass1.getMethod(str, arrayOfClass);
          localObject = localMethod;
          mValueType = localClass;
          return localMethod;
        }
        catch (NoSuchMethodException localNoSuchMethodException)
        {
          i += 1;
        }
        if (mValueType.equals(Integer.class))
        {
          paramClass2 = INTEGER_VARIANTS;
          break;
        }
        if (mValueType.equals(Double.class))
        {
          paramClass2 = DOUBLE_VARIANTS;
          break;
        }
        paramClass2 = new Class[1];
        paramClass2[0] = mValueType;
        break;
      }
      label224:
      Log.e("PropertyValuesHolder", "Couldn't find " + paramString + "ter property " + mPropertyName + " for " + paramClass1.getSimpleName() + " with value type " + mValueType);
    }
  }
  
  public static PropertyValuesHolder ofFloat(String paramString, float... paramVarArgs)
  {
    return new FloatPropertyValuesHolder(paramString, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofInt(String paramString, int... paramVarArgs)
  {
    return new IntPropertyValuesHolder(paramString, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofKeyframe(String paramString, Keyframe... paramVarArgs)
  {
    KeyframeSet localKeyframeSet = KeyframeSet.ofKeyframe(paramVarArgs);
    if ((localKeyframeSet instanceof IntKeyframeSet)) {
      return new IntPropertyValuesHolder(paramString, (IntKeyframeSet)localKeyframeSet);
    }
    if ((localKeyframeSet instanceof FloatKeyframeSet)) {
      return new FloatPropertyValuesHolder(paramString, (FloatKeyframeSet)localKeyframeSet);
    }
    paramString = new PropertyValuesHolder(paramString);
    mKeyframeSet = localKeyframeSet;
    mValueType = paramVarArgs[0].getType();
    return paramString;
  }
  
  public static PropertyValuesHolder ofObject(String paramString, TypeEvaluator paramTypeEvaluator, Object... paramVarArgs)
  {
    paramString = new PropertyValuesHolder(paramString);
    paramString.setObjectValues(paramVarArgs);
    paramString.setEvaluator(paramTypeEvaluator);
    return paramString;
  }
  
  private void setupGetter(Class paramClass)
  {
    mGetter = setupSetterOrGetter(paramClass, sGetterPropertyMap, "get", null);
  }
  
  private Method setupSetterOrGetter(Class paramClass1, HashMap<Class, HashMap<String, Method>> paramHashMap, String paramString, Class paramClass2)
  {
    Method localMethod1 = null;
    try
    {
      mPropertyMapLock.writeLock().lock();
      HashMap localHashMap = (HashMap)paramHashMap.get(paramClass1);
      if (localHashMap != null) {
        localMethod1 = (Method)localHashMap.get(mPropertyName);
      }
      Method localMethod2 = localMethod1;
      if (localMethod1 == null)
      {
        localMethod2 = getPropertyFunction(paramClass1, paramString, paramClass2);
        paramString = localHashMap;
        if (localHashMap == null)
        {
          paramString = new HashMap();
          paramHashMap.put(paramClass1, paramString);
        }
        paramString.put(mPropertyName, localMethod2);
      }
      return localMethod2;
    }
    finally
    {
      mPropertyMapLock.writeLock().unlock();
    }
  }
  
  private void setupValue(Object paramObject, Keyframe paramKeyframe)
  {
    try
    {
      if (mGetter == null) {
        setupGetter(paramObject.getClass());
      }
      paramKeyframe.setValue(mGetter.invoke(paramObject, new Object[0]));
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
  
  void calculateValue(float paramFloat)
  {
    mAnimatedValue = mKeyframeSet.getValue(paramFloat);
  }
  
  public PropertyValuesHolder clone()
  {
    try
    {
      PropertyValuesHolder localPropertyValuesHolder = (PropertyValuesHolder)super.clone();
      mPropertyName = mPropertyName;
      mKeyframeSet = mKeyframeSet.clone();
      mEvaluator = mEvaluator;
      return localPropertyValuesHolder;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException) {}
    return null;
  }
  
  Object getAnimatedValue()
  {
    return mAnimatedValue;
  }
  
  public String getPropertyName()
  {
    return mPropertyName;
  }
  
  void init()
  {
    TypeEvaluator localTypeEvaluator;
    if (mEvaluator == null)
    {
      if (mValueType != Integer.class) {
        break label44;
      }
      localTypeEvaluator = sIntEvaluator;
    }
    for (;;)
    {
      mEvaluator = localTypeEvaluator;
      if (mEvaluator != null) {
        mKeyframeSet.setEvaluator(mEvaluator);
      }
      return;
      label44:
      if (mValueType == Float.class) {
        localTypeEvaluator = sFloatEvaluator;
      } else {
        localTypeEvaluator = null;
      }
    }
  }
  
  void setAnimatedValue(Object paramObject)
  {
    if (mSetter != null) {}
    try
    {
      mTmpValueArray[0] = getAnimatedValue();
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
  
  public void setEvaluator(TypeEvaluator paramTypeEvaluator)
  {
    mEvaluator = paramTypeEvaluator;
    mKeyframeSet.setEvaluator(paramTypeEvaluator);
  }
  
  public void setFloatValues(float... paramVarArgs)
  {
    mValueType = Float.TYPE;
    mKeyframeSet = KeyframeSet.ofFloat(paramVarArgs);
  }
  
  public void setIntValues(int... paramVarArgs)
  {
    mValueType = Integer.TYPE;
    mKeyframeSet = KeyframeSet.ofInt(paramVarArgs);
  }
  
  public void setKeyframes(Keyframe... paramVarArgs)
  {
    int j = paramVarArgs.length;
    Keyframe[] arrayOfKeyframe = new Keyframe[Math.max(j, 2)];
    mValueType = paramVarArgs[0].getType();
    int i = 0;
    while (i < j)
    {
      arrayOfKeyframe[i] = paramVarArgs[i];
      i += 1;
    }
    mKeyframeSet = new KeyframeSet(arrayOfKeyframe);
  }
  
  public void setObjectValues(Object... paramVarArgs)
  {
    mValueType = paramVarArgs[0].getClass();
    mKeyframeSet = KeyframeSet.ofObject(paramVarArgs);
  }
  
  public void setPropertyName(String paramString)
  {
    mPropertyName = paramString;
  }
  
  void setupEndValue(Object paramObject)
  {
    setupValue(paramObject, (Keyframe)mKeyframeSet.mKeyframes.get(mKeyframeSet.mKeyframes.size() - 1));
  }
  
  void setupSetter(Class paramClass)
  {
    mSetter = setupSetterOrGetter(paramClass, sSetterPropertyMap, "set", mValueType);
  }
  
  void setupSetterAndGetter(Object paramObject)
  {
    Class localClass = paramObject.getClass();
    if (mSetter == null) {
      setupSetter(localClass);
    }
    Iterator localIterator = mKeyframeSet.mKeyframes.iterator();
    while (localIterator.hasNext())
    {
      Keyframe localKeyframe = (Keyframe)localIterator.next();
      if (!localKeyframe.hasValue())
      {
        if (mGetter == null) {
          setupGetter(localClass);
        }
        try
        {
          localKeyframe.setValue(mGetter.invoke(paramObject, new Object[0]));
        }
        catch (InvocationTargetException localInvocationTargetException)
        {
          Log.e("PropertyValuesHolder", localInvocationTargetException.toString());
        }
        catch (IllegalAccessException localIllegalAccessException)
        {
          Log.e("PropertyValuesHolder", localIllegalAccessException.toString());
        }
      }
    }
  }
  
  void setupStartValue(Object paramObject)
  {
    setupValue(paramObject, (Keyframe)mKeyframeSet.mKeyframes.get(0));
  }
  
  public String toString()
  {
    return mPropertyName + ": " + mKeyframeSet.toString();
  }
  
  static class FloatPropertyValuesHolder
    extends PropertyValuesHolder
  {
    float mFloatAnimatedValue;
    FloatKeyframeSet mFloatKeyframeSet;
    
    public FloatPropertyValuesHolder(String paramString, FloatKeyframeSet paramFloatKeyframeSet)
    {
      super(null);
      mValueType = Float.TYPE;
      mKeyframeSet = paramFloatKeyframeSet;
      mFloatKeyframeSet = ((FloatKeyframeSet)mKeyframeSet);
    }
    
    public FloatPropertyValuesHolder(String paramString, float... paramVarArgs)
    {
      super(null);
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
      if (mSetter != null) {}
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
      super.setupSetter(paramClass);
    }
  }
  
  static class IntPropertyValuesHolder
    extends PropertyValuesHolder
  {
    int mIntAnimatedValue;
    IntKeyframeSet mIntKeyframeSet;
    
    public IntPropertyValuesHolder(String paramString, IntKeyframeSet paramIntKeyframeSet)
    {
      super(null);
      mValueType = Integer.TYPE;
      mKeyframeSet = paramIntKeyframeSet;
      mIntKeyframeSet = ((IntKeyframeSet)mKeyframeSet);
    }
    
    public IntPropertyValuesHolder(String paramString, int... paramVarArgs)
    {
      super(null);
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
      if (mSetter != null) {}
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
      super.setupSetter(paramClass);
    }
  }
}

/* Location:
 * Qualified Name:     com.actionbarsherlock.internal.nineoldandroids.animation.PropertyValuesHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */