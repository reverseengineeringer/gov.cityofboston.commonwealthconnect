package org.apache.commons.lang3;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.BitSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.commons.lang3.mutable.MutableInt;

public class ArrayUtils
{
  public static final boolean[] EMPTY_BOOLEAN_ARRAY;
  public static final Boolean[] EMPTY_BOOLEAN_OBJECT_ARRAY;
  public static final byte[] EMPTY_BYTE_ARRAY;
  public static final Byte[] EMPTY_BYTE_OBJECT_ARRAY;
  public static final Character[] EMPTY_CHARACTER_OBJECT_ARRAY = new Character[0];
  public static final char[] EMPTY_CHAR_ARRAY;
  public static final Class<?>[] EMPTY_CLASS_ARRAY;
  public static final double[] EMPTY_DOUBLE_ARRAY;
  public static final Double[] EMPTY_DOUBLE_OBJECT_ARRAY;
  public static final float[] EMPTY_FLOAT_ARRAY;
  public static final Float[] EMPTY_FLOAT_OBJECT_ARRAY;
  public static final Integer[] EMPTY_INTEGER_OBJECT_ARRAY;
  public static final int[] EMPTY_INT_ARRAY;
  public static final long[] EMPTY_LONG_ARRAY;
  public static final Long[] EMPTY_LONG_OBJECT_ARRAY;
  public static final Object[] EMPTY_OBJECT_ARRAY = new Object[0];
  public static final short[] EMPTY_SHORT_ARRAY;
  public static final Short[] EMPTY_SHORT_OBJECT_ARRAY;
  public static final String[] EMPTY_STRING_ARRAY;
  public static final int INDEX_NOT_FOUND = -1;
  
  static
  {
    EMPTY_CLASS_ARRAY = new Class[0];
    EMPTY_STRING_ARRAY = new String[0];
    EMPTY_LONG_ARRAY = new long[0];
    EMPTY_LONG_OBJECT_ARRAY = new Long[0];
    EMPTY_INT_ARRAY = new int[0];
    EMPTY_INTEGER_OBJECT_ARRAY = new Integer[0];
    EMPTY_SHORT_ARRAY = new short[0];
    EMPTY_SHORT_OBJECT_ARRAY = new Short[0];
    EMPTY_BYTE_ARRAY = new byte[0];
    EMPTY_BYTE_OBJECT_ARRAY = new Byte[0];
    EMPTY_DOUBLE_ARRAY = new double[0];
    EMPTY_DOUBLE_OBJECT_ARRAY = new Double[0];
    EMPTY_FLOAT_ARRAY = new float[0];
    EMPTY_FLOAT_OBJECT_ARRAY = new Float[0];
    EMPTY_BOOLEAN_ARRAY = new boolean[0];
    EMPTY_BOOLEAN_OBJECT_ARRAY = new Boolean[0];
    EMPTY_CHAR_ARRAY = new char[0];
  }
  
  private static Object add(Object paramObject1, int paramInt, Object paramObject2, Class<?> paramClass)
  {
    if (paramObject1 == null)
    {
      if (paramInt != 0) {
        throw new IndexOutOfBoundsException("Index: " + paramInt + ", Length: 0");
      }
      paramObject1 = Array.newInstance(paramClass, 1);
      Array.set(paramObject1, 0, paramObject2);
      return paramObject1;
    }
    int i = Array.getLength(paramObject1);
    if ((paramInt > i) || (paramInt < 0)) {
      throw new IndexOutOfBoundsException("Index: " + paramInt + ", Length: " + i);
    }
    paramClass = Array.newInstance(paramClass, i + 1);
    System.arraycopy(paramObject1, 0, paramClass, 0, paramInt);
    Array.set(paramClass, paramInt, paramObject2);
    if (paramInt < i) {
      System.arraycopy(paramObject1, paramInt, paramClass, paramInt + 1, i - paramInt);
    }
    return paramClass;
  }
  
  public static byte[] add(byte[] paramArrayOfByte, byte paramByte)
  {
    paramArrayOfByte = (byte[])copyArrayGrow1(paramArrayOfByte, Byte.TYPE);
    paramArrayOfByte[(paramArrayOfByte.length - 1)] = paramByte;
    return paramArrayOfByte;
  }
  
  public static byte[] add(byte[] paramArrayOfByte, int paramInt, byte paramByte)
  {
    return (byte[])add(paramArrayOfByte, paramInt, Byte.valueOf(paramByte), Byte.TYPE);
  }
  
  public static char[] add(char[] paramArrayOfChar, char paramChar)
  {
    paramArrayOfChar = (char[])copyArrayGrow1(paramArrayOfChar, Character.TYPE);
    paramArrayOfChar[(paramArrayOfChar.length - 1)] = paramChar;
    return paramArrayOfChar;
  }
  
  public static char[] add(char[] paramArrayOfChar, int paramInt, char paramChar)
  {
    return (char[])add(paramArrayOfChar, paramInt, Character.valueOf(paramChar), Character.TYPE);
  }
  
  public static double[] add(double[] paramArrayOfDouble, double paramDouble)
  {
    paramArrayOfDouble = (double[])copyArrayGrow1(paramArrayOfDouble, Double.TYPE);
    paramArrayOfDouble[(paramArrayOfDouble.length - 1)] = paramDouble;
    return paramArrayOfDouble;
  }
  
  public static double[] add(double[] paramArrayOfDouble, int paramInt, double paramDouble)
  {
    return (double[])add(paramArrayOfDouble, paramInt, Double.valueOf(paramDouble), Double.TYPE);
  }
  
  public static float[] add(float[] paramArrayOfFloat, float paramFloat)
  {
    paramArrayOfFloat = (float[])copyArrayGrow1(paramArrayOfFloat, Float.TYPE);
    paramArrayOfFloat[(paramArrayOfFloat.length - 1)] = paramFloat;
    return paramArrayOfFloat;
  }
  
  public static float[] add(float[] paramArrayOfFloat, int paramInt, float paramFloat)
  {
    return (float[])add(paramArrayOfFloat, paramInt, Float.valueOf(paramFloat), Float.TYPE);
  }
  
  public static int[] add(int[] paramArrayOfInt, int paramInt)
  {
    paramArrayOfInt = (int[])copyArrayGrow1(paramArrayOfInt, Integer.TYPE);
    paramArrayOfInt[(paramArrayOfInt.length - 1)] = paramInt;
    return paramArrayOfInt;
  }
  
  public static int[] add(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    return (int[])add(paramArrayOfInt, paramInt1, Integer.valueOf(paramInt2), Integer.TYPE);
  }
  
  public static long[] add(long[] paramArrayOfLong, int paramInt, long paramLong)
  {
    return (long[])add(paramArrayOfLong, paramInt, Long.valueOf(paramLong), Long.TYPE);
  }
  
  public static long[] add(long[] paramArrayOfLong, long paramLong)
  {
    paramArrayOfLong = (long[])copyArrayGrow1(paramArrayOfLong, Long.TYPE);
    paramArrayOfLong[(paramArrayOfLong.length - 1)] = paramLong;
    return paramArrayOfLong;
  }
  
  public static <T> T[] add(T[] paramArrayOfT, int paramInt, T paramT)
  {
    if (paramArrayOfT != null) {}
    for (Class localClass = paramArrayOfT.getClass().getComponentType();; localClass = paramT.getClass())
    {
      return (Object[])add(paramArrayOfT, paramInt, paramT, localClass);
      if (paramT == null) {
        break;
      }
    }
    throw new IllegalArgumentException("Array and element cannot both be null");
  }
  
  public static <T> T[] add(T[] paramArrayOfT, T paramT)
  {
    if (paramArrayOfT != null) {}
    for (Class localClass = paramArrayOfT.getClass();; localClass = paramT.getClass())
    {
      paramArrayOfT = (Object[])copyArrayGrow1(paramArrayOfT, localClass);
      paramArrayOfT[(paramArrayOfT.length - 1)] = paramT;
      return paramArrayOfT;
      if (paramT == null) {
        break;
      }
    }
    throw new IllegalArgumentException("Arguments cannot both be null");
  }
  
  public static short[] add(short[] paramArrayOfShort, int paramInt, short paramShort)
  {
    return (short[])add(paramArrayOfShort, paramInt, Short.valueOf(paramShort), Short.TYPE);
  }
  
  public static short[] add(short[] paramArrayOfShort, short paramShort)
  {
    paramArrayOfShort = (short[])copyArrayGrow1(paramArrayOfShort, Short.TYPE);
    paramArrayOfShort[(paramArrayOfShort.length - 1)] = paramShort;
    return paramArrayOfShort;
  }
  
  public static boolean[] add(boolean[] paramArrayOfBoolean, int paramInt, boolean paramBoolean)
  {
    return (boolean[])add(paramArrayOfBoolean, paramInt, Boolean.valueOf(paramBoolean), Boolean.TYPE);
  }
  
  public static boolean[] add(boolean[] paramArrayOfBoolean, boolean paramBoolean)
  {
    paramArrayOfBoolean = (boolean[])copyArrayGrow1(paramArrayOfBoolean, Boolean.TYPE);
    paramArrayOfBoolean[(paramArrayOfBoolean.length - 1)] = paramBoolean;
    return paramArrayOfBoolean;
  }
  
  public static byte[] addAll(byte[] paramArrayOfByte1, byte... paramVarArgs)
  {
    if (paramArrayOfByte1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfByte1);
    }
    byte[] arrayOfByte = new byte[paramArrayOfByte1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfByte1, 0, arrayOfByte, 0, paramArrayOfByte1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfByte, paramArrayOfByte1.length, paramVarArgs.length);
    return arrayOfByte;
  }
  
  public static char[] addAll(char[] paramArrayOfChar1, char... paramVarArgs)
  {
    if (paramArrayOfChar1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfChar1);
    }
    char[] arrayOfChar = new char[paramArrayOfChar1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfChar1, 0, arrayOfChar, 0, paramArrayOfChar1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfChar, paramArrayOfChar1.length, paramVarArgs.length);
    return arrayOfChar;
  }
  
  public static double[] addAll(double[] paramArrayOfDouble1, double... paramVarArgs)
  {
    if (paramArrayOfDouble1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfDouble1);
    }
    double[] arrayOfDouble = new double[paramArrayOfDouble1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfDouble1, 0, arrayOfDouble, 0, paramArrayOfDouble1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfDouble, paramArrayOfDouble1.length, paramVarArgs.length);
    return arrayOfDouble;
  }
  
  public static float[] addAll(float[] paramArrayOfFloat1, float... paramVarArgs)
  {
    if (paramArrayOfFloat1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfFloat1);
    }
    float[] arrayOfFloat = new float[paramArrayOfFloat1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfFloat1, 0, arrayOfFloat, 0, paramArrayOfFloat1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfFloat, paramArrayOfFloat1.length, paramVarArgs.length);
    return arrayOfFloat;
  }
  
  public static int[] addAll(int[] paramArrayOfInt1, int... paramVarArgs)
  {
    if (paramArrayOfInt1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfInt1);
    }
    int[] arrayOfInt = new int[paramArrayOfInt1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfInt1, 0, arrayOfInt, 0, paramArrayOfInt1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfInt, paramArrayOfInt1.length, paramVarArgs.length);
    return arrayOfInt;
  }
  
  public static long[] addAll(long[] paramArrayOfLong1, long... paramVarArgs)
  {
    if (paramArrayOfLong1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfLong1);
    }
    long[] arrayOfLong = new long[paramArrayOfLong1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfLong1, 0, arrayOfLong, 0, paramArrayOfLong1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfLong, paramArrayOfLong1.length, paramVarArgs.length);
    return arrayOfLong;
  }
  
  public static <T> T[] addAll(T[] paramArrayOfT1, T... paramVarArgs)
  {
    if (paramArrayOfT1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfT1);
    }
    Class localClass = paramArrayOfT1.getClass().getComponentType();
    Object[] arrayOfObject = (Object[])Array.newInstance(localClass, paramArrayOfT1.length + paramVarArgs.length);
    System.arraycopy(paramArrayOfT1, 0, arrayOfObject, 0, paramArrayOfT1.length);
    try
    {
      System.arraycopy(paramVarArgs, 0, arrayOfObject, paramArrayOfT1.length, paramVarArgs.length);
      return arrayOfObject;
    }
    catch (ArrayStoreException paramArrayOfT1)
    {
      paramVarArgs = paramVarArgs.getClass().getComponentType();
      if (!localClass.isAssignableFrom(paramVarArgs)) {
        throw new IllegalArgumentException("Cannot store " + paramVarArgs.getName() + " in an array of " + localClass.getName(), paramArrayOfT1);
      }
      throw paramArrayOfT1;
    }
  }
  
  public static short[] addAll(short[] paramArrayOfShort1, short... paramVarArgs)
  {
    if (paramArrayOfShort1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfShort1);
    }
    short[] arrayOfShort = new short[paramArrayOfShort1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfShort1, 0, arrayOfShort, 0, paramArrayOfShort1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfShort, paramArrayOfShort1.length, paramVarArgs.length);
    return arrayOfShort;
  }
  
  public static boolean[] addAll(boolean[] paramArrayOfBoolean1, boolean... paramVarArgs)
  {
    if (paramArrayOfBoolean1 == null) {
      return clone(paramVarArgs);
    }
    if (paramVarArgs == null) {
      return clone(paramArrayOfBoolean1);
    }
    boolean[] arrayOfBoolean = new boolean[paramArrayOfBoolean1.length + paramVarArgs.length];
    System.arraycopy(paramArrayOfBoolean1, 0, arrayOfBoolean, 0, paramArrayOfBoolean1.length);
    System.arraycopy(paramVarArgs, 0, arrayOfBoolean, paramArrayOfBoolean1.length, paramVarArgs.length);
    return arrayOfBoolean;
  }
  
  public static byte[] clone(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return null;
    }
    return (byte[])paramArrayOfByte.clone();
  }
  
  public static char[] clone(char[] paramArrayOfChar)
  {
    if (paramArrayOfChar == null) {
      return null;
    }
    return (char[])paramArrayOfChar.clone();
  }
  
  public static double[] clone(double[] paramArrayOfDouble)
  {
    if (paramArrayOfDouble == null) {
      return null;
    }
    return (double[])paramArrayOfDouble.clone();
  }
  
  public static float[] clone(float[] paramArrayOfFloat)
  {
    if (paramArrayOfFloat == null) {
      return null;
    }
    return (float[])paramArrayOfFloat.clone();
  }
  
  public static int[] clone(int[] paramArrayOfInt)
  {
    if (paramArrayOfInt == null) {
      return null;
    }
    return (int[])paramArrayOfInt.clone();
  }
  
  public static long[] clone(long[] paramArrayOfLong)
  {
    if (paramArrayOfLong == null) {
      return null;
    }
    return (long[])paramArrayOfLong.clone();
  }
  
  public static <T> T[] clone(T[] paramArrayOfT)
  {
    if (paramArrayOfT == null) {
      return null;
    }
    return (Object[])paramArrayOfT.clone();
  }
  
  public static short[] clone(short[] paramArrayOfShort)
  {
    if (paramArrayOfShort == null) {
      return null;
    }
    return (short[])paramArrayOfShort.clone();
  }
  
  public static boolean[] clone(boolean[] paramArrayOfBoolean)
  {
    if (paramArrayOfBoolean == null) {
      return null;
    }
    return (boolean[])paramArrayOfBoolean.clone();
  }
  
  public static boolean contains(byte[] paramArrayOfByte, byte paramByte)
  {
    return indexOf(paramArrayOfByte, paramByte) != -1;
  }
  
  public static boolean contains(char[] paramArrayOfChar, char paramChar)
  {
    return indexOf(paramArrayOfChar, paramChar) != -1;
  }
  
  public static boolean contains(double[] paramArrayOfDouble, double paramDouble)
  {
    return indexOf(paramArrayOfDouble, paramDouble) != -1;
  }
  
  public static boolean contains(double[] paramArrayOfDouble, double paramDouble1, double paramDouble2)
  {
    boolean bool = false;
    if (indexOf(paramArrayOfDouble, paramDouble1, 0, paramDouble2) != -1) {
      bool = true;
    }
    return bool;
  }
  
  public static boolean contains(float[] paramArrayOfFloat, float paramFloat)
  {
    return indexOf(paramArrayOfFloat, paramFloat) != -1;
  }
  
  public static boolean contains(int[] paramArrayOfInt, int paramInt)
  {
    return indexOf(paramArrayOfInt, paramInt) != -1;
  }
  
  public static boolean contains(long[] paramArrayOfLong, long paramLong)
  {
    return indexOf(paramArrayOfLong, paramLong) != -1;
  }
  
  public static boolean contains(Object[] paramArrayOfObject, Object paramObject)
  {
    return indexOf(paramArrayOfObject, paramObject) != -1;
  }
  
  public static boolean contains(short[] paramArrayOfShort, short paramShort)
  {
    return indexOf(paramArrayOfShort, paramShort) != -1;
  }
  
  public static boolean contains(boolean[] paramArrayOfBoolean, boolean paramBoolean)
  {
    return indexOf(paramArrayOfBoolean, paramBoolean) != -1;
  }
  
  private static Object copyArrayGrow1(Object paramObject, Class<?> paramClass)
  {
    if (paramObject != null)
    {
      int i = Array.getLength(paramObject);
      paramClass = Array.newInstance(paramObject.getClass().getComponentType(), i + 1);
      System.arraycopy(paramObject, 0, paramClass, 0, i);
      return paramClass;
    }
    return Array.newInstance(paramClass, 1);
  }
  
  public static int getLength(Object paramObject)
  {
    if (paramObject == null) {
      return 0;
    }
    return Array.getLength(paramObject);
  }
  
  public static int hashCode(Object paramObject)
  {
    return new HashCodeBuilder().append(paramObject).toHashCode();
  }
  
  public static int indexOf(byte[] paramArrayOfByte, byte paramByte)
  {
    return indexOf(paramArrayOfByte, paramByte, 0);
  }
  
  public static int indexOf(byte[] paramArrayOfByte, byte paramByte, int paramInt)
  {
    if (paramArrayOfByte == null)
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfByte.length) {
        break label40;
      }
      i = paramInt;
      if (paramByte == paramArrayOfByte[paramInt]) {
        break;
      }
      paramInt += 1;
    }
    label40:
    return -1;
  }
  
  public static int indexOf(char[] paramArrayOfChar, char paramChar)
  {
    return indexOf(paramArrayOfChar, paramChar, 0);
  }
  
  public static int indexOf(char[] paramArrayOfChar, char paramChar, int paramInt)
  {
    if (paramArrayOfChar == null)
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfChar.length) {
        break label40;
      }
      i = paramInt;
      if (paramChar == paramArrayOfChar[paramInt]) {
        break;
      }
      paramInt += 1;
    }
    label40:
    return -1;
  }
  
  public static int indexOf(double[] paramArrayOfDouble, double paramDouble)
  {
    return indexOf(paramArrayOfDouble, paramDouble, 0);
  }
  
  public static int indexOf(double[] paramArrayOfDouble, double paramDouble1, double paramDouble2)
  {
    return indexOf(paramArrayOfDouble, paramDouble1, 0, paramDouble2);
  }
  
  public static int indexOf(double[] paramArrayOfDouble, double paramDouble, int paramInt)
  {
    if (isEmpty(paramArrayOfDouble))
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfDouble.length) {
        break label50;
      }
      i = paramInt;
      if (paramDouble == paramArrayOfDouble[paramInt]) {
        break;
      }
      paramInt += 1;
    }
    label50:
    return -1;
  }
  
  public static int indexOf(double[] paramArrayOfDouble, double paramDouble1, int paramInt, double paramDouble2)
  {
    if (isEmpty(paramArrayOfDouble))
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfDouble.length) {
        break label64;
      }
      if (paramArrayOfDouble[paramInt] >= paramDouble1 - paramDouble2)
      {
        i = paramInt;
        if (paramArrayOfDouble[paramInt] <= paramDouble1 + paramDouble2) {
          break;
        }
      }
      paramInt += 1;
    }
    label64:
    return -1;
  }
  
  public static int indexOf(float[] paramArrayOfFloat, float paramFloat)
  {
    return indexOf(paramArrayOfFloat, paramFloat, 0);
  }
  
  public static int indexOf(float[] paramArrayOfFloat, float paramFloat, int paramInt)
  {
    if (isEmpty(paramArrayOfFloat))
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfFloat.length) {
        break label44;
      }
      i = paramInt;
      if (paramFloat == paramArrayOfFloat[paramInt]) {
        break;
      }
      paramInt += 1;
    }
    label44:
    return -1;
  }
  
  public static int indexOf(int[] paramArrayOfInt, int paramInt)
  {
    return indexOf(paramArrayOfInt, paramInt, 0);
  }
  
  public static int indexOf(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    if (paramArrayOfInt == null)
    {
      i = -1;
      return i;
    }
    int i = paramInt2;
    if (paramInt2 < 0) {
      i = 0;
    }
    paramInt2 = i;
    for (;;)
    {
      if (paramInt2 >= paramArrayOfInt.length) {
        break label40;
      }
      i = paramInt2;
      if (paramInt1 == paramArrayOfInt[paramInt2]) {
        break;
      }
      paramInt2 += 1;
    }
    label40:
    return -1;
  }
  
  public static int indexOf(long[] paramArrayOfLong, long paramLong)
  {
    return indexOf(paramArrayOfLong, paramLong, 0);
  }
  
  public static int indexOf(long[] paramArrayOfLong, long paramLong, int paramInt)
  {
    if (paramArrayOfLong == null)
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfLong.length) {
        break label47;
      }
      i = paramInt;
      if (paramLong == paramArrayOfLong[paramInt]) {
        break;
      }
      paramInt += 1;
    }
    label47:
    return -1;
  }
  
  public static int indexOf(Object[] paramArrayOfObject, Object paramObject)
  {
    return indexOf(paramArrayOfObject, paramObject, 0);
  }
  
  public static int indexOf(Object[] paramArrayOfObject, Object paramObject, int paramInt)
  {
    if (paramArrayOfObject == null)
    {
      paramInt = -1;
      return paramInt;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    if (paramObject == null) {
      for (;;)
      {
        if (i >= paramArrayOfObject.length) {
          break label80;
        }
        paramInt = i;
        if (paramArrayOfObject[i] == null) {
          break;
        }
        i += 1;
      }
    }
    if (paramArrayOfObject.getClass().getComponentType().isInstance(paramObject)) {
      for (;;)
      {
        if (i >= paramArrayOfObject.length) {
          break label80;
        }
        paramInt = i;
        if (paramObject.equals(paramArrayOfObject[i])) {
          break;
        }
        i += 1;
      }
    }
    label80:
    return -1;
  }
  
  public static int indexOf(short[] paramArrayOfShort, short paramShort)
  {
    return indexOf(paramArrayOfShort, paramShort, 0);
  }
  
  public static int indexOf(short[] paramArrayOfShort, short paramShort, int paramInt)
  {
    if (paramArrayOfShort == null)
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfShort.length) {
        break label40;
      }
      i = paramInt;
      if (paramShort == paramArrayOfShort[paramInt]) {
        break;
      }
      paramInt += 1;
    }
    label40:
    return -1;
  }
  
  public static int indexOf(boolean[] paramArrayOfBoolean, boolean paramBoolean)
  {
    return indexOf(paramArrayOfBoolean, paramBoolean, 0);
  }
  
  public static int indexOf(boolean[] paramArrayOfBoolean, boolean paramBoolean, int paramInt)
  {
    if (isEmpty(paramArrayOfBoolean))
    {
      i = -1;
      return i;
    }
    int i = paramInt;
    if (paramInt < 0) {
      i = 0;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt >= paramArrayOfBoolean.length) {
        break label43;
      }
      i = paramInt;
      if (paramBoolean == paramArrayOfBoolean[paramInt]) {
        break;
      }
      paramInt += 1;
    }
    label43:
    return -1;
  }
  
  public static boolean isEmpty(byte[] paramArrayOfByte)
  {
    return (paramArrayOfByte == null) || (paramArrayOfByte.length == 0);
  }
  
  public static boolean isEmpty(char[] paramArrayOfChar)
  {
    return (paramArrayOfChar == null) || (paramArrayOfChar.length == 0);
  }
  
  public static boolean isEmpty(double[] paramArrayOfDouble)
  {
    return (paramArrayOfDouble == null) || (paramArrayOfDouble.length == 0);
  }
  
  public static boolean isEmpty(float[] paramArrayOfFloat)
  {
    return (paramArrayOfFloat == null) || (paramArrayOfFloat.length == 0);
  }
  
  public static boolean isEmpty(int[] paramArrayOfInt)
  {
    return (paramArrayOfInt == null) || (paramArrayOfInt.length == 0);
  }
  
  public static boolean isEmpty(long[] paramArrayOfLong)
  {
    return (paramArrayOfLong == null) || (paramArrayOfLong.length == 0);
  }
  
  public static boolean isEmpty(Object[] paramArrayOfObject)
  {
    return (paramArrayOfObject == null) || (paramArrayOfObject.length == 0);
  }
  
  public static boolean isEmpty(short[] paramArrayOfShort)
  {
    return (paramArrayOfShort == null) || (paramArrayOfShort.length == 0);
  }
  
  public static boolean isEmpty(boolean[] paramArrayOfBoolean)
  {
    return (paramArrayOfBoolean == null) || (paramArrayOfBoolean.length == 0);
  }
  
  @Deprecated
  public static boolean isEquals(Object paramObject1, Object paramObject2)
  {
    return new EqualsBuilder().append(paramObject1, paramObject2).isEquals();
  }
  
  public static boolean isNotEmpty(byte[] paramArrayOfByte)
  {
    return (paramArrayOfByte != null) && (paramArrayOfByte.length != 0);
  }
  
  public static boolean isNotEmpty(char[] paramArrayOfChar)
  {
    return (paramArrayOfChar != null) && (paramArrayOfChar.length != 0);
  }
  
  public static boolean isNotEmpty(double[] paramArrayOfDouble)
  {
    return (paramArrayOfDouble != null) && (paramArrayOfDouble.length != 0);
  }
  
  public static boolean isNotEmpty(float[] paramArrayOfFloat)
  {
    return (paramArrayOfFloat != null) && (paramArrayOfFloat.length != 0);
  }
  
  public static boolean isNotEmpty(int[] paramArrayOfInt)
  {
    return (paramArrayOfInt != null) && (paramArrayOfInt.length != 0);
  }
  
  public static boolean isNotEmpty(long[] paramArrayOfLong)
  {
    return (paramArrayOfLong != null) && (paramArrayOfLong.length != 0);
  }
  
  public static <T> boolean isNotEmpty(T[] paramArrayOfT)
  {
    return (paramArrayOfT != null) && (paramArrayOfT.length != 0);
  }
  
  public static boolean isNotEmpty(short[] paramArrayOfShort)
  {
    return (paramArrayOfShort != null) && (paramArrayOfShort.length != 0);
  }
  
  public static boolean isNotEmpty(boolean[] paramArrayOfBoolean)
  {
    return (paramArrayOfBoolean != null) && (paramArrayOfBoolean.length != 0);
  }
  
  public static boolean isSameLength(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    return ((paramArrayOfByte1 != null) || (paramArrayOfByte2 == null) || (paramArrayOfByte2.length <= 0)) && ((paramArrayOfByte2 != null) || (paramArrayOfByte1 == null) || (paramArrayOfByte1.length <= 0)) && ((paramArrayOfByte1 == null) || (paramArrayOfByte2 == null) || (paramArrayOfByte1.length == paramArrayOfByte2.length));
  }
  
  public static boolean isSameLength(char[] paramArrayOfChar1, char[] paramArrayOfChar2)
  {
    return ((paramArrayOfChar1 != null) || (paramArrayOfChar2 == null) || (paramArrayOfChar2.length <= 0)) && ((paramArrayOfChar2 != null) || (paramArrayOfChar1 == null) || (paramArrayOfChar1.length <= 0)) && ((paramArrayOfChar1 == null) || (paramArrayOfChar2 == null) || (paramArrayOfChar1.length == paramArrayOfChar2.length));
  }
  
  public static boolean isSameLength(double[] paramArrayOfDouble1, double[] paramArrayOfDouble2)
  {
    return ((paramArrayOfDouble1 != null) || (paramArrayOfDouble2 == null) || (paramArrayOfDouble2.length <= 0)) && ((paramArrayOfDouble2 != null) || (paramArrayOfDouble1 == null) || (paramArrayOfDouble1.length <= 0)) && ((paramArrayOfDouble1 == null) || (paramArrayOfDouble2 == null) || (paramArrayOfDouble1.length == paramArrayOfDouble2.length));
  }
  
  public static boolean isSameLength(float[] paramArrayOfFloat1, float[] paramArrayOfFloat2)
  {
    return ((paramArrayOfFloat1 != null) || (paramArrayOfFloat2 == null) || (paramArrayOfFloat2.length <= 0)) && ((paramArrayOfFloat2 != null) || (paramArrayOfFloat1 == null) || (paramArrayOfFloat1.length <= 0)) && ((paramArrayOfFloat1 == null) || (paramArrayOfFloat2 == null) || (paramArrayOfFloat1.length == paramArrayOfFloat2.length));
  }
  
  public static boolean isSameLength(int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    return ((paramArrayOfInt1 != null) || (paramArrayOfInt2 == null) || (paramArrayOfInt2.length <= 0)) && ((paramArrayOfInt2 != null) || (paramArrayOfInt1 == null) || (paramArrayOfInt1.length <= 0)) && ((paramArrayOfInt1 == null) || (paramArrayOfInt2 == null) || (paramArrayOfInt1.length == paramArrayOfInt2.length));
  }
  
  public static boolean isSameLength(long[] paramArrayOfLong1, long[] paramArrayOfLong2)
  {
    return ((paramArrayOfLong1 != null) || (paramArrayOfLong2 == null) || (paramArrayOfLong2.length <= 0)) && ((paramArrayOfLong2 != null) || (paramArrayOfLong1 == null) || (paramArrayOfLong1.length <= 0)) && ((paramArrayOfLong1 == null) || (paramArrayOfLong2 == null) || (paramArrayOfLong1.length == paramArrayOfLong2.length));
  }
  
  public static boolean isSameLength(Object[] paramArrayOfObject1, Object[] paramArrayOfObject2)
  {
    return ((paramArrayOfObject1 != null) || (paramArrayOfObject2 == null) || (paramArrayOfObject2.length <= 0)) && ((paramArrayOfObject2 != null) || (paramArrayOfObject1 == null) || (paramArrayOfObject1.length <= 0)) && ((paramArrayOfObject1 == null) || (paramArrayOfObject2 == null) || (paramArrayOfObject1.length == paramArrayOfObject2.length));
  }
  
  public static boolean isSameLength(short[] paramArrayOfShort1, short[] paramArrayOfShort2)
  {
    return ((paramArrayOfShort1 != null) || (paramArrayOfShort2 == null) || (paramArrayOfShort2.length <= 0)) && ((paramArrayOfShort2 != null) || (paramArrayOfShort1 == null) || (paramArrayOfShort1.length <= 0)) && ((paramArrayOfShort1 == null) || (paramArrayOfShort2 == null) || (paramArrayOfShort1.length == paramArrayOfShort2.length));
  }
  
  public static boolean isSameLength(boolean[] paramArrayOfBoolean1, boolean[] paramArrayOfBoolean2)
  {
    return ((paramArrayOfBoolean1 != null) || (paramArrayOfBoolean2 == null) || (paramArrayOfBoolean2.length <= 0)) && ((paramArrayOfBoolean2 != null) || (paramArrayOfBoolean1 == null) || (paramArrayOfBoolean1.length <= 0)) && ((paramArrayOfBoolean1 == null) || (paramArrayOfBoolean2 == null) || (paramArrayOfBoolean1.length == paramArrayOfBoolean2.length));
  }
  
  public static boolean isSameType(Object paramObject1, Object paramObject2)
  {
    if ((paramObject1 == null) || (paramObject2 == null)) {
      throw new IllegalArgumentException("The Array must not be null");
    }
    return paramObject1.getClass().getName().equals(paramObject2.getClass().getName());
  }
  
  public static int lastIndexOf(byte[] paramArrayOfByte, byte paramByte)
  {
    return lastIndexOf(paramArrayOfByte, paramByte, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(byte[] paramArrayOfByte, byte paramByte, int paramInt)
  {
    if (paramArrayOfByte == null)
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfByte.length) {
      i = paramArrayOfByte.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label49;
      }
      i = paramInt;
      if (paramByte == paramArrayOfByte[paramInt]) {
        break;
      }
      paramInt -= 1;
    }
    label49:
    return -1;
  }
  
  public static int lastIndexOf(char[] paramArrayOfChar, char paramChar)
  {
    return lastIndexOf(paramArrayOfChar, paramChar, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(char[] paramArrayOfChar, char paramChar, int paramInt)
  {
    if (paramArrayOfChar == null)
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfChar.length) {
      i = paramArrayOfChar.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label49;
      }
      i = paramInt;
      if (paramChar == paramArrayOfChar[paramInt]) {
        break;
      }
      paramInt -= 1;
    }
    label49:
    return -1;
  }
  
  public static int lastIndexOf(double[] paramArrayOfDouble, double paramDouble)
  {
    return lastIndexOf(paramArrayOfDouble, paramDouble, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(double[] paramArrayOfDouble, double paramDouble1, double paramDouble2)
  {
    return lastIndexOf(paramArrayOfDouble, paramDouble1, Integer.MAX_VALUE, paramDouble2);
  }
  
  public static int lastIndexOf(double[] paramArrayOfDouble, double paramDouble, int paramInt)
  {
    if (isEmpty(paramArrayOfDouble))
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfDouble.length) {
      i = paramArrayOfDouble.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label59;
      }
      i = paramInt;
      if (paramDouble == paramArrayOfDouble[paramInt]) {
        break;
      }
      paramInt -= 1;
    }
    label59:
    return -1;
  }
  
  public static int lastIndexOf(double[] paramArrayOfDouble, double paramDouble1, int paramInt, double paramDouble2)
  {
    if (isEmpty(paramArrayOfDouble))
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfDouble.length) {
      i = paramArrayOfDouble.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label73;
      }
      if (paramArrayOfDouble[paramInt] >= paramDouble1 - paramDouble2)
      {
        i = paramInt;
        if (paramArrayOfDouble[paramInt] <= paramDouble1 + paramDouble2) {
          break;
        }
      }
      paramInt -= 1;
    }
    label73:
    return -1;
  }
  
  public static int lastIndexOf(float[] paramArrayOfFloat, float paramFloat)
  {
    return lastIndexOf(paramArrayOfFloat, paramFloat, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(float[] paramArrayOfFloat, float paramFloat, int paramInt)
  {
    if (isEmpty(paramArrayOfFloat))
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfFloat.length) {
      i = paramArrayOfFloat.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label53;
      }
      i = paramInt;
      if (paramFloat == paramArrayOfFloat[paramInt]) {
        break;
      }
      paramInt -= 1;
    }
    label53:
    return -1;
  }
  
  public static int lastIndexOf(int[] paramArrayOfInt, int paramInt)
  {
    return lastIndexOf(paramArrayOfInt, paramInt, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    if (paramArrayOfInt == null)
    {
      i = -1;
      return i;
    }
    if (paramInt2 < 0) {
      return -1;
    }
    int i = paramInt2;
    if (paramInt2 >= paramArrayOfInt.length) {
      i = paramArrayOfInt.length - 1;
    }
    paramInt2 = i;
    for (;;)
    {
      if (paramInt2 < 0) {
        break label49;
      }
      i = paramInt2;
      if (paramInt1 == paramArrayOfInt[paramInt2]) {
        break;
      }
      paramInt2 -= 1;
    }
    label49:
    return -1;
  }
  
  public static int lastIndexOf(long[] paramArrayOfLong, long paramLong)
  {
    return lastIndexOf(paramArrayOfLong, paramLong, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(long[] paramArrayOfLong, long paramLong, int paramInt)
  {
    if (paramArrayOfLong == null)
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfLong.length) {
      i = paramArrayOfLong.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label56;
      }
      i = paramInt;
      if (paramLong == paramArrayOfLong[paramInt]) {
        break;
      }
      paramInt -= 1;
    }
    label56:
    return -1;
  }
  
  public static int lastIndexOf(Object[] paramArrayOfObject, Object paramObject)
  {
    return lastIndexOf(paramArrayOfObject, paramObject, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(Object[] paramArrayOfObject, Object paramObject, int paramInt)
  {
    if (paramArrayOfObject == null)
    {
      paramInt = -1;
      return paramInt;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfObject.length) {
      i = paramArrayOfObject.length - 1;
    }
    if (paramObject == null) {
      for (;;)
      {
        if (i < 0) {
          break label87;
        }
        paramInt = i;
        if (paramArrayOfObject[i] == null) {
          break;
        }
        i -= 1;
      }
    }
    if (paramArrayOfObject.getClass().getComponentType().isInstance(paramObject)) {
      for (;;)
      {
        if (i < 0) {
          break label87;
        }
        paramInt = i;
        if (paramObject.equals(paramArrayOfObject[i])) {
          break;
        }
        i -= 1;
      }
    }
    label87:
    return -1;
  }
  
  public static int lastIndexOf(short[] paramArrayOfShort, short paramShort)
  {
    return lastIndexOf(paramArrayOfShort, paramShort, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(short[] paramArrayOfShort, short paramShort, int paramInt)
  {
    if (paramArrayOfShort == null)
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfShort.length) {
      i = paramArrayOfShort.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label49;
      }
      i = paramInt;
      if (paramShort == paramArrayOfShort[paramInt]) {
        break;
      }
      paramInt -= 1;
    }
    label49:
    return -1;
  }
  
  public static int lastIndexOf(boolean[] paramArrayOfBoolean, boolean paramBoolean)
  {
    return lastIndexOf(paramArrayOfBoolean, paramBoolean, Integer.MAX_VALUE);
  }
  
  public static int lastIndexOf(boolean[] paramArrayOfBoolean, boolean paramBoolean, int paramInt)
  {
    if (isEmpty(paramArrayOfBoolean))
    {
      i = -1;
      return i;
    }
    if (paramInt < 0) {
      return -1;
    }
    int i = paramInt;
    if (paramInt >= paramArrayOfBoolean.length) {
      i = paramArrayOfBoolean.length - 1;
    }
    paramInt = i;
    for (;;)
    {
      if (paramInt < 0) {
        break label52;
      }
      i = paramInt;
      if (paramBoolean == paramArrayOfBoolean[paramInt]) {
        break;
      }
      paramInt -= 1;
    }
    label52:
    return -1;
  }
  
  public static byte[] nullToEmpty(byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte;
    if (paramArrayOfByte != null)
    {
      arrayOfByte = paramArrayOfByte;
      if (paramArrayOfByte.length != 0) {}
    }
    else
    {
      arrayOfByte = EMPTY_BYTE_ARRAY;
    }
    return arrayOfByte;
  }
  
  public static char[] nullToEmpty(char[] paramArrayOfChar)
  {
    char[] arrayOfChar;
    if (paramArrayOfChar != null)
    {
      arrayOfChar = paramArrayOfChar;
      if (paramArrayOfChar.length != 0) {}
    }
    else
    {
      arrayOfChar = EMPTY_CHAR_ARRAY;
    }
    return arrayOfChar;
  }
  
  public static double[] nullToEmpty(double[] paramArrayOfDouble)
  {
    double[] arrayOfDouble;
    if (paramArrayOfDouble != null)
    {
      arrayOfDouble = paramArrayOfDouble;
      if (paramArrayOfDouble.length != 0) {}
    }
    else
    {
      arrayOfDouble = EMPTY_DOUBLE_ARRAY;
    }
    return arrayOfDouble;
  }
  
  public static float[] nullToEmpty(float[] paramArrayOfFloat)
  {
    float[] arrayOfFloat;
    if (paramArrayOfFloat != null)
    {
      arrayOfFloat = paramArrayOfFloat;
      if (paramArrayOfFloat.length != 0) {}
    }
    else
    {
      arrayOfFloat = EMPTY_FLOAT_ARRAY;
    }
    return arrayOfFloat;
  }
  
  public static int[] nullToEmpty(int[] paramArrayOfInt)
  {
    int[] arrayOfInt;
    if (paramArrayOfInt != null)
    {
      arrayOfInt = paramArrayOfInt;
      if (paramArrayOfInt.length != 0) {}
    }
    else
    {
      arrayOfInt = EMPTY_INT_ARRAY;
    }
    return arrayOfInt;
  }
  
  public static long[] nullToEmpty(long[] paramArrayOfLong)
  {
    long[] arrayOfLong;
    if (paramArrayOfLong != null)
    {
      arrayOfLong = paramArrayOfLong;
      if (paramArrayOfLong.length != 0) {}
    }
    else
    {
      arrayOfLong = EMPTY_LONG_ARRAY;
    }
    return arrayOfLong;
  }
  
  public static Boolean[] nullToEmpty(Boolean[] paramArrayOfBoolean)
  {
    Boolean[] arrayOfBoolean;
    if (paramArrayOfBoolean != null)
    {
      arrayOfBoolean = paramArrayOfBoolean;
      if (paramArrayOfBoolean.length != 0) {}
    }
    else
    {
      arrayOfBoolean = EMPTY_BOOLEAN_OBJECT_ARRAY;
    }
    return arrayOfBoolean;
  }
  
  public static Byte[] nullToEmpty(Byte[] paramArrayOfByte)
  {
    Byte[] arrayOfByte;
    if (paramArrayOfByte != null)
    {
      arrayOfByte = paramArrayOfByte;
      if (paramArrayOfByte.length != 0) {}
    }
    else
    {
      arrayOfByte = EMPTY_BYTE_OBJECT_ARRAY;
    }
    return arrayOfByte;
  }
  
  public static Character[] nullToEmpty(Character[] paramArrayOfCharacter)
  {
    Character[] arrayOfCharacter;
    if (paramArrayOfCharacter != null)
    {
      arrayOfCharacter = paramArrayOfCharacter;
      if (paramArrayOfCharacter.length != 0) {}
    }
    else
    {
      arrayOfCharacter = EMPTY_CHARACTER_OBJECT_ARRAY;
    }
    return arrayOfCharacter;
  }
  
  public static Class<?>[] nullToEmpty(Class<?>[] paramArrayOfClass)
  {
    Object localObject;
    if (paramArrayOfClass != null)
    {
      localObject = paramArrayOfClass;
      if (paramArrayOfClass.length != 0) {}
    }
    else
    {
      localObject = EMPTY_CLASS_ARRAY;
    }
    return (Class<?>[])localObject;
  }
  
  public static Double[] nullToEmpty(Double[] paramArrayOfDouble)
  {
    Double[] arrayOfDouble;
    if (paramArrayOfDouble != null)
    {
      arrayOfDouble = paramArrayOfDouble;
      if (paramArrayOfDouble.length != 0) {}
    }
    else
    {
      arrayOfDouble = EMPTY_DOUBLE_OBJECT_ARRAY;
    }
    return arrayOfDouble;
  }
  
  public static Float[] nullToEmpty(Float[] paramArrayOfFloat)
  {
    Float[] arrayOfFloat;
    if (paramArrayOfFloat != null)
    {
      arrayOfFloat = paramArrayOfFloat;
      if (paramArrayOfFloat.length != 0) {}
    }
    else
    {
      arrayOfFloat = EMPTY_FLOAT_OBJECT_ARRAY;
    }
    return arrayOfFloat;
  }
  
  public static Integer[] nullToEmpty(Integer[] paramArrayOfInteger)
  {
    Integer[] arrayOfInteger;
    if (paramArrayOfInteger != null)
    {
      arrayOfInteger = paramArrayOfInteger;
      if (paramArrayOfInteger.length != 0) {}
    }
    else
    {
      arrayOfInteger = EMPTY_INTEGER_OBJECT_ARRAY;
    }
    return arrayOfInteger;
  }
  
  public static Long[] nullToEmpty(Long[] paramArrayOfLong)
  {
    Long[] arrayOfLong;
    if (paramArrayOfLong != null)
    {
      arrayOfLong = paramArrayOfLong;
      if (paramArrayOfLong.length != 0) {}
    }
    else
    {
      arrayOfLong = EMPTY_LONG_OBJECT_ARRAY;
    }
    return arrayOfLong;
  }
  
  public static Object[] nullToEmpty(Object[] paramArrayOfObject)
  {
    Object[] arrayOfObject;
    if (paramArrayOfObject != null)
    {
      arrayOfObject = paramArrayOfObject;
      if (paramArrayOfObject.length != 0) {}
    }
    else
    {
      arrayOfObject = EMPTY_OBJECT_ARRAY;
    }
    return arrayOfObject;
  }
  
  public static Short[] nullToEmpty(Short[] paramArrayOfShort)
  {
    Short[] arrayOfShort;
    if (paramArrayOfShort != null)
    {
      arrayOfShort = paramArrayOfShort;
      if (paramArrayOfShort.length != 0) {}
    }
    else
    {
      arrayOfShort = EMPTY_SHORT_OBJECT_ARRAY;
    }
    return arrayOfShort;
  }
  
  public static String[] nullToEmpty(String[] paramArrayOfString)
  {
    String[] arrayOfString;
    if (paramArrayOfString != null)
    {
      arrayOfString = paramArrayOfString;
      if (paramArrayOfString.length != 0) {}
    }
    else
    {
      arrayOfString = EMPTY_STRING_ARRAY;
    }
    return arrayOfString;
  }
  
  public static short[] nullToEmpty(short[] paramArrayOfShort)
  {
    short[] arrayOfShort;
    if (paramArrayOfShort != null)
    {
      arrayOfShort = paramArrayOfShort;
      if (paramArrayOfShort.length != 0) {}
    }
    else
    {
      arrayOfShort = EMPTY_SHORT_ARRAY;
    }
    return arrayOfShort;
  }
  
  public static boolean[] nullToEmpty(boolean[] paramArrayOfBoolean)
  {
    boolean[] arrayOfBoolean;
    if (paramArrayOfBoolean != null)
    {
      arrayOfBoolean = paramArrayOfBoolean;
      if (paramArrayOfBoolean.length != 0) {}
    }
    else
    {
      arrayOfBoolean = EMPTY_BOOLEAN_ARRAY;
    }
    return arrayOfBoolean;
  }
  
  private static Object remove(Object paramObject, int paramInt)
  {
    int i = getLength(paramObject);
    if ((paramInt < 0) || (paramInt >= i)) {
      throw new IndexOutOfBoundsException("Index: " + paramInt + ", Length: " + i);
    }
    Object localObject = Array.newInstance(paramObject.getClass().getComponentType(), i - 1);
    System.arraycopy(paramObject, 0, localObject, 0, paramInt);
    if (paramInt < i - 1) {
      System.arraycopy(paramObject, paramInt + 1, localObject, paramInt, i - paramInt - 1);
    }
    return localObject;
  }
  
  public static byte[] remove(byte[] paramArrayOfByte, int paramInt)
  {
    return (byte[])remove(paramArrayOfByte, paramInt);
  }
  
  public static char[] remove(char[] paramArrayOfChar, int paramInt)
  {
    return (char[])remove(paramArrayOfChar, paramInt);
  }
  
  public static double[] remove(double[] paramArrayOfDouble, int paramInt)
  {
    return (double[])remove(paramArrayOfDouble, paramInt);
  }
  
  public static float[] remove(float[] paramArrayOfFloat, int paramInt)
  {
    return (float[])remove(paramArrayOfFloat, paramInt);
  }
  
  public static int[] remove(int[] paramArrayOfInt, int paramInt)
  {
    return (int[])remove(paramArrayOfInt, paramInt);
  }
  
  public static long[] remove(long[] paramArrayOfLong, int paramInt)
  {
    return (long[])remove(paramArrayOfLong, paramInt);
  }
  
  public static <T> T[] remove(T[] paramArrayOfT, int paramInt)
  {
    return (Object[])remove(paramArrayOfT, paramInt);
  }
  
  public static short[] remove(short[] paramArrayOfShort, int paramInt)
  {
    return (short[])remove(paramArrayOfShort, paramInt);
  }
  
  public static boolean[] remove(boolean[] paramArrayOfBoolean, int paramInt)
  {
    return (boolean[])remove(paramArrayOfBoolean, paramInt);
  }
  
  static Object removeAll(Object paramObject, BitSet paramBitSet)
  {
    int m = getLength(paramObject);
    int i = paramBitSet.cardinality();
    Object localObject = Array.newInstance(paramObject.getClass().getComponentType(), m - i);
    int j = 0;
    for (i = 0;; i = k)
    {
      int n = paramBitSet.nextSetBit(j);
      if (n == -1) {
        break;
      }
      int i1 = n - j;
      k = i;
      if (i1 > 0)
      {
        System.arraycopy(paramObject, j, localObject, i, i1);
        k = i + i1;
      }
      j = paramBitSet.nextClearBit(n);
    }
    int k = m - j;
    if (k > 0) {
      System.arraycopy(paramObject, j, localObject, i, k);
    }
    return localObject;
  }
  
  static Object removeAll(Object paramObject, int... paramVarArgs)
  {
    int j = getLength(paramObject);
    int m = 0;
    int i = 0;
    int k;
    int n;
    if (isNotEmpty(paramVarArgs))
    {
      Arrays.sort(paramVarArgs);
      m = paramVarArgs.length;
      k = j;
      for (;;)
      {
        n = m - 1;
        m = i;
        if (n < 0) {
          break;
        }
        int i1 = paramVarArgs[n];
        if ((i1 < 0) || (i1 >= j)) {
          throw new IndexOutOfBoundsException("Index: " + i1 + ", Length: " + j);
        }
        m = n;
        if (i1 < k)
        {
          i += 1;
          k = i1;
          m = n;
        }
      }
    }
    Object localObject = Array.newInstance(paramObject.getClass().getComponentType(), j - m);
    if (m < j)
    {
      k = j;
      j -= m;
      i = paramVarArgs.length - 1;
      while (i >= 0)
      {
        n = paramVarArgs[i];
        m = j;
        if (k - n > 1)
        {
          k = k - n - 1;
          m = j - k;
          System.arraycopy(paramObject, n + 1, localObject, m, k);
        }
        k = n;
        i -= 1;
        j = m;
      }
      if (k > 0) {
        System.arraycopy(paramObject, 0, localObject, 0, k);
      }
    }
    return localObject;
  }
  
  public static byte[] removeAll(byte[] paramArrayOfByte, int... paramVarArgs)
  {
    return (byte[])removeAll(paramArrayOfByte, clone(paramVarArgs));
  }
  
  public static char[] removeAll(char[] paramArrayOfChar, int... paramVarArgs)
  {
    return (char[])removeAll(paramArrayOfChar, clone(paramVarArgs));
  }
  
  public static double[] removeAll(double[] paramArrayOfDouble, int... paramVarArgs)
  {
    return (double[])removeAll(paramArrayOfDouble, clone(paramVarArgs));
  }
  
  public static float[] removeAll(float[] paramArrayOfFloat, int... paramVarArgs)
  {
    return (float[])removeAll(paramArrayOfFloat, clone(paramVarArgs));
  }
  
  public static int[] removeAll(int[] paramArrayOfInt1, int... paramVarArgs)
  {
    return (int[])removeAll(paramArrayOfInt1, clone(paramVarArgs));
  }
  
  public static long[] removeAll(long[] paramArrayOfLong, int... paramVarArgs)
  {
    return (long[])removeAll(paramArrayOfLong, clone(paramVarArgs));
  }
  
  public static <T> T[] removeAll(T[] paramArrayOfT, int... paramVarArgs)
  {
    return (Object[])removeAll(paramArrayOfT, clone(paramVarArgs));
  }
  
  public static short[] removeAll(short[] paramArrayOfShort, int... paramVarArgs)
  {
    return (short[])removeAll(paramArrayOfShort, clone(paramVarArgs));
  }
  
  public static boolean[] removeAll(boolean[] paramArrayOfBoolean, int... paramVarArgs)
  {
    return (boolean[])removeAll(paramArrayOfBoolean, clone(paramVarArgs));
  }
  
  public static byte[] removeElement(byte[] paramArrayOfByte, byte paramByte)
  {
    int i = indexOf(paramArrayOfByte, paramByte);
    if (i == -1) {
      return clone(paramArrayOfByte);
    }
    return remove(paramArrayOfByte, i);
  }
  
  public static char[] removeElement(char[] paramArrayOfChar, char paramChar)
  {
    int i = indexOf(paramArrayOfChar, paramChar);
    if (i == -1) {
      return clone(paramArrayOfChar);
    }
    return remove(paramArrayOfChar, i);
  }
  
  public static double[] removeElement(double[] paramArrayOfDouble, double paramDouble)
  {
    int i = indexOf(paramArrayOfDouble, paramDouble);
    if (i == -1) {
      return clone(paramArrayOfDouble);
    }
    return remove(paramArrayOfDouble, i);
  }
  
  public static float[] removeElement(float[] paramArrayOfFloat, float paramFloat)
  {
    int i = indexOf(paramArrayOfFloat, paramFloat);
    if (i == -1) {
      return clone(paramArrayOfFloat);
    }
    return remove(paramArrayOfFloat, i);
  }
  
  public static int[] removeElement(int[] paramArrayOfInt, int paramInt)
  {
    paramInt = indexOf(paramArrayOfInt, paramInt);
    if (paramInt == -1) {
      return clone(paramArrayOfInt);
    }
    return remove(paramArrayOfInt, paramInt);
  }
  
  public static long[] removeElement(long[] paramArrayOfLong, long paramLong)
  {
    int i = indexOf(paramArrayOfLong, paramLong);
    if (i == -1) {
      return clone(paramArrayOfLong);
    }
    return remove(paramArrayOfLong, i);
  }
  
  public static <T> T[] removeElement(T[] paramArrayOfT, Object paramObject)
  {
    int i = indexOf(paramArrayOfT, paramObject);
    if (i == -1) {
      return clone(paramArrayOfT);
    }
    return remove(paramArrayOfT, i);
  }
  
  public static short[] removeElement(short[] paramArrayOfShort, short paramShort)
  {
    int i = indexOf(paramArrayOfShort, paramShort);
    if (i == -1) {
      return clone(paramArrayOfShort);
    }
    return remove(paramArrayOfShort, i);
  }
  
  public static boolean[] removeElement(boolean[] paramArrayOfBoolean, boolean paramBoolean)
  {
    int i = indexOf(paramArrayOfBoolean, paramBoolean);
    if (i == -1) {
      return clone(paramArrayOfBoolean);
    }
    return remove(paramArrayOfBoolean, i);
  }
  
  public static byte[] removeElements(byte[] paramArrayOfByte1, byte... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfByte1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfByte1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Byte.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label204:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Byte)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label204;
        }
        j = indexOf(paramArrayOfByte1, ((Byte)localObject3).byteValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (byte[])removeAll(paramArrayOfByte1, paramVarArgs);
  }
  
  public static char[] removeElements(char[] paramArrayOfChar1, char... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfChar1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfChar1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Character.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label204:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Character)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label204;
        }
        j = indexOf(paramArrayOfChar1, ((Character)localObject3).charValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (char[])removeAll(paramArrayOfChar1, paramVarArgs);
  }
  
  public static double[] removeElements(double[] paramArrayOfDouble1, double... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfDouble1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfDouble1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Double.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label204:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Double)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label204;
        }
        j = indexOf(paramArrayOfDouble1, ((Double)localObject3).doubleValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (double[])removeAll(paramArrayOfDouble1, paramVarArgs);
  }
  
  public static float[] removeElements(float[] paramArrayOfFloat1, float... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfFloat1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfFloat1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Float.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label204:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Float)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label204;
        }
        j = indexOf(paramArrayOfFloat1, ((Float)localObject3).floatValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (float[])removeAll(paramArrayOfFloat1, paramVarArgs);
  }
  
  public static int[] removeElements(int[] paramArrayOfInt1, int... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfInt1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfInt1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Integer.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label204:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Integer)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label204;
        }
        j = indexOf(paramArrayOfInt1, ((Integer)localObject3).intValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (int[])removeAll(paramArrayOfInt1, paramVarArgs);
  }
  
  public static long[] removeElements(long[] paramArrayOfLong1, long... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfLong1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfLong1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Long.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label204:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Long)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label204;
        }
        j = indexOf(paramArrayOfLong1, ((Long)localObject3).longValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (long[])removeAll(paramArrayOfLong1, paramVarArgs);
  }
  
  public static <T> T[] removeElements(T[] paramArrayOfT1, T... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfT1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfT1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = paramVarArgs[i];
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label195:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = ((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label195;
        }
        j = indexOf(paramArrayOfT1, localObject3, j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (Object[])removeAll(paramArrayOfT1, paramVarArgs);
  }
  
  public static short[] removeElements(short[] paramArrayOfShort1, short... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfShort1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfShort1);
    }
    Object localObject1 = new HashMap(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Short.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label204:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Short)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label204;
        }
        j = indexOf(paramArrayOfShort1, ((Short)localObject3).shortValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (short[])removeAll(paramArrayOfShort1, paramVarArgs);
  }
  
  public static boolean[] removeElements(boolean[] paramArrayOfBoolean1, boolean... paramVarArgs)
  {
    if ((isEmpty(paramArrayOfBoolean1)) || (isEmpty(paramVarArgs))) {
      return clone(paramArrayOfBoolean1);
    }
    Object localObject1 = new HashMap(2);
    int j = paramVarArgs.length;
    int i = 0;
    Object localObject2;
    Object localObject3;
    if (i < j)
    {
      localObject2 = Boolean.valueOf(paramVarArgs[i]);
      localObject3 = (MutableInt)((HashMap)localObject1).get(localObject2);
      if (localObject3 == null) {
        ((HashMap)localObject1).put(localObject2, new MutableInt(1));
      }
      for (;;)
      {
        i += 1;
        break;
        ((MutableInt)localObject3).increment();
      }
    }
    paramVarArgs = new BitSet();
    localObject1 = ((HashMap)localObject1).entrySet().iterator();
    label203:
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (Map.Entry)((Iterator)localObject1).next();
      localObject3 = (Boolean)((Map.Entry)localObject2).getKey();
      j = 0;
      i = 0;
      int k = ((MutableInt)((Map.Entry)localObject2).getValue()).intValue();
      for (;;)
      {
        if (i >= k) {
          break label203;
        }
        j = indexOf(paramArrayOfBoolean1, ((Boolean)localObject3).booleanValue(), j);
        if (j < 0) {
          break;
        }
        paramVarArgs.set(j);
        i += 1;
        j += 1;
      }
    }
    return (boolean[])removeAll(paramArrayOfBoolean1, paramVarArgs);
  }
  
  public static void reverse(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return;
    }
    reverse(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public static void reverse(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramArrayOfByte == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfByte.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        int i = paramArrayOfByte[paramInt2];
        paramArrayOfByte[paramInt2] = paramArrayOfByte[paramInt1];
        paramArrayOfByte[paramInt1] = i;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(char[] paramArrayOfChar)
  {
    if (paramArrayOfChar == null) {
      return;
    }
    reverse(paramArrayOfChar, 0, paramArrayOfChar.length);
  }
  
  public static void reverse(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfChar == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfChar.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        int i = paramArrayOfChar[paramInt2];
        paramArrayOfChar[paramInt2] = paramArrayOfChar[paramInt1];
        paramArrayOfChar[paramInt1] = i;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(double[] paramArrayOfDouble)
  {
    if (paramArrayOfDouble == null) {
      return;
    }
    reverse(paramArrayOfDouble, 0, paramArrayOfDouble.length);
  }
  
  public static void reverse(double[] paramArrayOfDouble, int paramInt1, int paramInt2)
  {
    if (paramArrayOfDouble == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfDouble.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        double d = paramArrayOfDouble[paramInt2];
        paramArrayOfDouble[paramInt2] = paramArrayOfDouble[paramInt1];
        paramArrayOfDouble[paramInt1] = d;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(float[] paramArrayOfFloat)
  {
    if (paramArrayOfFloat == null) {
      return;
    }
    reverse(paramArrayOfFloat, 0, paramArrayOfFloat.length);
  }
  
  public static void reverse(float[] paramArrayOfFloat, int paramInt1, int paramInt2)
  {
    if (paramArrayOfFloat == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfFloat.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        float f = paramArrayOfFloat[paramInt2];
        paramArrayOfFloat[paramInt2] = paramArrayOfFloat[paramInt1];
        paramArrayOfFloat[paramInt1] = f;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(int[] paramArrayOfInt)
  {
    if (paramArrayOfInt == null) {
      return;
    }
    reverse(paramArrayOfInt, 0, paramArrayOfInt.length);
  }
  
  public static void reverse(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    if (paramArrayOfInt == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfInt.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        int i = paramArrayOfInt[paramInt2];
        paramArrayOfInt[paramInt2] = paramArrayOfInt[paramInt1];
        paramArrayOfInt[paramInt1] = i;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(long[] paramArrayOfLong)
  {
    if (paramArrayOfLong == null) {
      return;
    }
    reverse(paramArrayOfLong, 0, paramArrayOfLong.length);
  }
  
  public static void reverse(long[] paramArrayOfLong, int paramInt1, int paramInt2)
  {
    if (paramArrayOfLong == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfLong.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        long l = paramArrayOfLong[paramInt2];
        paramArrayOfLong[paramInt2] = paramArrayOfLong[paramInt1];
        paramArrayOfLong[paramInt1] = l;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject == null) {
      return;
    }
    reverse(paramArrayOfObject, 0, paramArrayOfObject.length);
  }
  
  public static void reverse(Object[] paramArrayOfObject, int paramInt1, int paramInt2)
  {
    if (paramArrayOfObject == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfObject.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        Object localObject = paramArrayOfObject[paramInt2];
        paramArrayOfObject[paramInt2] = paramArrayOfObject[paramInt1];
        paramArrayOfObject[paramInt1] = localObject;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(short[] paramArrayOfShort)
  {
    if (paramArrayOfShort == null) {
      return;
    }
    reverse(paramArrayOfShort, 0, paramArrayOfShort.length);
  }
  
  public static void reverse(short[] paramArrayOfShort, int paramInt1, int paramInt2)
  {
    if (paramArrayOfShort == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfShort.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        int i = paramArrayOfShort[paramInt2];
        paramArrayOfShort[paramInt2] = paramArrayOfShort[paramInt1];
        paramArrayOfShort[paramInt1] = i;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static void reverse(boolean[] paramArrayOfBoolean)
  {
    if (paramArrayOfBoolean == null) {
      return;
    }
    reverse(paramArrayOfBoolean, 0, paramArrayOfBoolean.length);
  }
  
  public static void reverse(boolean[] paramArrayOfBoolean, int paramInt1, int paramInt2)
  {
    if (paramArrayOfBoolean == null) {
      return;
    }
    if (paramInt1 < 0) {
      paramInt1 = 0;
    }
    for (;;)
    {
      paramInt2 = Math.min(paramArrayOfBoolean.length, paramInt2) - 1;
      while (paramInt2 > paramInt1)
      {
        int i = paramArrayOfBoolean[paramInt2];
        paramArrayOfBoolean[paramInt2] = paramArrayOfBoolean[paramInt1];
        paramArrayOfBoolean[paramInt1] = i;
        paramInt2 -= 1;
        paramInt1 += 1;
      }
      break;
    }
  }
  
  public static byte[] subarray(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramArrayOfByte == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfByte.length) {
      paramInt1 = paramArrayOfByte.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_BYTE_ARRAY;
    }
    byte[] arrayOfByte = new byte[paramInt1];
    System.arraycopy(paramArrayOfByte, i, arrayOfByte, 0, paramInt1);
    return arrayOfByte;
  }
  
  public static char[] subarray(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    if (paramArrayOfChar == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfChar.length) {
      paramInt1 = paramArrayOfChar.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_CHAR_ARRAY;
    }
    char[] arrayOfChar = new char[paramInt1];
    System.arraycopy(paramArrayOfChar, i, arrayOfChar, 0, paramInt1);
    return arrayOfChar;
  }
  
  public static double[] subarray(double[] paramArrayOfDouble, int paramInt1, int paramInt2)
  {
    if (paramArrayOfDouble == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfDouble.length) {
      paramInt1 = paramArrayOfDouble.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_DOUBLE_ARRAY;
    }
    double[] arrayOfDouble = new double[paramInt1];
    System.arraycopy(paramArrayOfDouble, i, arrayOfDouble, 0, paramInt1);
    return arrayOfDouble;
  }
  
  public static float[] subarray(float[] paramArrayOfFloat, int paramInt1, int paramInt2)
  {
    if (paramArrayOfFloat == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfFloat.length) {
      paramInt1 = paramArrayOfFloat.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_FLOAT_ARRAY;
    }
    float[] arrayOfFloat = new float[paramInt1];
    System.arraycopy(paramArrayOfFloat, i, arrayOfFloat, 0, paramInt1);
    return arrayOfFloat;
  }
  
  public static int[] subarray(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    if (paramArrayOfInt == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfInt.length) {
      paramInt1 = paramArrayOfInt.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_INT_ARRAY;
    }
    int[] arrayOfInt = new int[paramInt1];
    System.arraycopy(paramArrayOfInt, i, arrayOfInt, 0, paramInt1);
    return arrayOfInt;
  }
  
  public static long[] subarray(long[] paramArrayOfLong, int paramInt1, int paramInt2)
  {
    if (paramArrayOfLong == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfLong.length) {
      paramInt1 = paramArrayOfLong.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_LONG_ARRAY;
    }
    long[] arrayOfLong = new long[paramInt1];
    System.arraycopy(paramArrayOfLong, i, arrayOfLong, 0, paramInt1);
    return arrayOfLong;
  }
  
  public static <T> T[] subarray(T[] paramArrayOfT, int paramInt1, int paramInt2)
  {
    if (paramArrayOfT == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfT.length) {
      paramInt1 = paramArrayOfT.length;
    }
    paramInt1 -= i;
    Object localObject = paramArrayOfT.getClass().getComponentType();
    if (paramInt1 <= 0) {
      return (Object[])Array.newInstance((Class)localObject, 0);
    }
    localObject = (Object[])Array.newInstance((Class)localObject, paramInt1);
    System.arraycopy(paramArrayOfT, i, localObject, 0, paramInt1);
    return (T[])localObject;
  }
  
  public static short[] subarray(short[] paramArrayOfShort, int paramInt1, int paramInt2)
  {
    if (paramArrayOfShort == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfShort.length) {
      paramInt1 = paramArrayOfShort.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_SHORT_ARRAY;
    }
    short[] arrayOfShort = new short[paramInt1];
    System.arraycopy(paramArrayOfShort, i, arrayOfShort, 0, paramInt1);
    return arrayOfShort;
  }
  
  public static boolean[] subarray(boolean[] paramArrayOfBoolean, int paramInt1, int paramInt2)
  {
    if (paramArrayOfBoolean == null) {
      return null;
    }
    int i = paramInt1;
    if (paramInt1 < 0) {
      i = 0;
    }
    paramInt1 = paramInt2;
    if (paramInt2 > paramArrayOfBoolean.length) {
      paramInt1 = paramArrayOfBoolean.length;
    }
    paramInt1 -= i;
    if (paramInt1 <= 0) {
      return EMPTY_BOOLEAN_ARRAY;
    }
    boolean[] arrayOfBoolean = new boolean[paramInt1];
    System.arraycopy(paramArrayOfBoolean, i, arrayOfBoolean, 0, paramInt1);
    return arrayOfBoolean;
  }
  
  public static <T> T[] toArray(T... paramVarArgs)
  {
    return paramVarArgs;
  }
  
  public static Map<Object, Object> toMap(Object[] paramArrayOfObject)
  {
    if (paramArrayOfObject == null) {
      localObject = null;
    }
    HashMap localHashMap;
    int i;
    do
    {
      return (Map<Object, Object>)localObject;
      localHashMap = new HashMap((int)(paramArrayOfObject.length * 1.5D));
      i = 0;
      localObject = localHashMap;
    } while (i >= paramArrayOfObject.length);
    Object localObject = paramArrayOfObject[i];
    if ((localObject instanceof Map.Entry))
    {
      localObject = (Map.Entry)localObject;
      localHashMap.put(((Map.Entry)localObject).getKey(), ((Map.Entry)localObject).getValue());
    }
    for (;;)
    {
      i += 1;
      break;
      if (!(localObject instanceof Object[])) {
        break label161;
      }
      Object[] arrayOfObject = (Object[])localObject;
      if (arrayOfObject.length < 2) {
        throw new IllegalArgumentException("Array element " + i + ", '" + localObject + "', has a length less than 2");
      }
      localHashMap.put(arrayOfObject[0], arrayOfObject[1]);
    }
    label161:
    throw new IllegalArgumentException("Array element " + i + ", '" + localObject + "', is neither of type Map.Entry nor an Array");
  }
  
  public static Boolean[] toObject(boolean[] paramArrayOfBoolean)
  {
    if (paramArrayOfBoolean == null) {
      localObject = null;
    }
    Boolean[] arrayOfBoolean;
    int i;
    do
    {
      return (Boolean[])localObject;
      if (paramArrayOfBoolean.length == 0) {
        return EMPTY_BOOLEAN_OBJECT_ARRAY;
      }
      arrayOfBoolean = new Boolean[paramArrayOfBoolean.length];
      i = 0;
      localObject = arrayOfBoolean;
    } while (i >= paramArrayOfBoolean.length);
    if (paramArrayOfBoolean[i] != 0) {}
    for (Object localObject = Boolean.TRUE;; localObject = Boolean.FALSE)
    {
      arrayOfBoolean[i] = localObject;
      i += 1;
      break;
    }
  }
  
  public static Byte[] toObject(byte[] paramArrayOfByte)
  {
    Object localObject;
    if (paramArrayOfByte == null)
    {
      localObject = null;
      return (Byte[])localObject;
    }
    if (paramArrayOfByte.length == 0) {
      return EMPTY_BYTE_OBJECT_ARRAY;
    }
    Byte[] arrayOfByte = new Byte[paramArrayOfByte.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfByte;
      if (i >= paramArrayOfByte.length) {
        break;
      }
      arrayOfByte[i] = Byte.valueOf(paramArrayOfByte[i]);
      i += 1;
    }
  }
  
  public static Character[] toObject(char[] paramArrayOfChar)
  {
    Object localObject;
    if (paramArrayOfChar == null)
    {
      localObject = null;
      return (Character[])localObject;
    }
    if (paramArrayOfChar.length == 0) {
      return EMPTY_CHARACTER_OBJECT_ARRAY;
    }
    Character[] arrayOfCharacter = new Character[paramArrayOfChar.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfCharacter;
      if (i >= paramArrayOfChar.length) {
        break;
      }
      arrayOfCharacter[i] = Character.valueOf(paramArrayOfChar[i]);
      i += 1;
    }
  }
  
  public static Double[] toObject(double[] paramArrayOfDouble)
  {
    Object localObject;
    if (paramArrayOfDouble == null)
    {
      localObject = null;
      return (Double[])localObject;
    }
    if (paramArrayOfDouble.length == 0) {
      return EMPTY_DOUBLE_OBJECT_ARRAY;
    }
    Double[] arrayOfDouble = new Double[paramArrayOfDouble.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfDouble;
      if (i >= paramArrayOfDouble.length) {
        break;
      }
      arrayOfDouble[i] = Double.valueOf(paramArrayOfDouble[i]);
      i += 1;
    }
  }
  
  public static Float[] toObject(float[] paramArrayOfFloat)
  {
    Object localObject;
    if (paramArrayOfFloat == null)
    {
      localObject = null;
      return (Float[])localObject;
    }
    if (paramArrayOfFloat.length == 0) {
      return EMPTY_FLOAT_OBJECT_ARRAY;
    }
    Float[] arrayOfFloat = new Float[paramArrayOfFloat.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfFloat;
      if (i >= paramArrayOfFloat.length) {
        break;
      }
      arrayOfFloat[i] = Float.valueOf(paramArrayOfFloat[i]);
      i += 1;
    }
  }
  
  public static Integer[] toObject(int[] paramArrayOfInt)
  {
    Object localObject;
    if (paramArrayOfInt == null)
    {
      localObject = null;
      return (Integer[])localObject;
    }
    if (paramArrayOfInt.length == 0) {
      return EMPTY_INTEGER_OBJECT_ARRAY;
    }
    Integer[] arrayOfInteger = new Integer[paramArrayOfInt.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfInteger;
      if (i >= paramArrayOfInt.length) {
        break;
      }
      arrayOfInteger[i] = Integer.valueOf(paramArrayOfInt[i]);
      i += 1;
    }
  }
  
  public static Long[] toObject(long[] paramArrayOfLong)
  {
    Object localObject;
    if (paramArrayOfLong == null)
    {
      localObject = null;
      return (Long[])localObject;
    }
    if (paramArrayOfLong.length == 0) {
      return EMPTY_LONG_OBJECT_ARRAY;
    }
    Long[] arrayOfLong = new Long[paramArrayOfLong.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfLong;
      if (i >= paramArrayOfLong.length) {
        break;
      }
      arrayOfLong[i] = Long.valueOf(paramArrayOfLong[i]);
      i += 1;
    }
  }
  
  public static Short[] toObject(short[] paramArrayOfShort)
  {
    Object localObject;
    if (paramArrayOfShort == null)
    {
      localObject = null;
      return (Short[])localObject;
    }
    if (paramArrayOfShort.length == 0) {
      return EMPTY_SHORT_OBJECT_ARRAY;
    }
    Short[] arrayOfShort = new Short[paramArrayOfShort.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfShort;
      if (i >= paramArrayOfShort.length) {
        break;
      }
      arrayOfShort[i] = Short.valueOf(paramArrayOfShort[i]);
      i += 1;
    }
  }
  
  public static byte[] toPrimitive(Byte[] paramArrayOfByte)
  {
    Object localObject;
    if (paramArrayOfByte == null)
    {
      localObject = null;
      return (byte[])localObject;
    }
    if (paramArrayOfByte.length == 0) {
      return EMPTY_BYTE_ARRAY;
    }
    byte[] arrayOfByte = new byte[paramArrayOfByte.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfByte;
      if (i >= paramArrayOfByte.length) {
        break;
      }
      arrayOfByte[i] = paramArrayOfByte[i].byteValue();
      i += 1;
    }
  }
  
  public static byte[] toPrimitive(Byte[] paramArrayOfByte, byte paramByte)
  {
    if (paramArrayOfByte == null) {
      localObject = null;
    }
    byte[] arrayOfByte;
    int j;
    do
    {
      return (byte[])localObject;
      if (paramArrayOfByte.length == 0) {
        return EMPTY_BYTE_ARRAY;
      }
      arrayOfByte = new byte[paramArrayOfByte.length];
      j = 0;
      localObject = arrayOfByte;
    } while (j >= paramArrayOfByte.length);
    Object localObject = paramArrayOfByte[j];
    if (localObject == null) {}
    for (int i = paramByte;; i = ((Byte)localObject).byteValue())
    {
      arrayOfByte[j] = i;
      j += 1;
      break;
    }
  }
  
  public static char[] toPrimitive(Character[] paramArrayOfCharacter)
  {
    Object localObject;
    if (paramArrayOfCharacter == null)
    {
      localObject = null;
      return (char[])localObject;
    }
    if (paramArrayOfCharacter.length == 0) {
      return EMPTY_CHAR_ARRAY;
    }
    char[] arrayOfChar = new char[paramArrayOfCharacter.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfChar;
      if (i >= paramArrayOfCharacter.length) {
        break;
      }
      arrayOfChar[i] = paramArrayOfCharacter[i].charValue();
      i += 1;
    }
  }
  
  public static char[] toPrimitive(Character[] paramArrayOfCharacter, char paramChar)
  {
    if (paramArrayOfCharacter == null) {
      localObject = null;
    }
    char[] arrayOfChar;
    int j;
    do
    {
      return (char[])localObject;
      if (paramArrayOfCharacter.length == 0) {
        return EMPTY_CHAR_ARRAY;
      }
      arrayOfChar = new char[paramArrayOfCharacter.length];
      j = 0;
      localObject = arrayOfChar;
    } while (j >= paramArrayOfCharacter.length);
    Object localObject = paramArrayOfCharacter[j];
    if (localObject == null) {}
    for (int i = paramChar;; i = ((Character)localObject).charValue())
    {
      arrayOfChar[j] = i;
      j += 1;
      break;
    }
  }
  
  public static double[] toPrimitive(Double[] paramArrayOfDouble)
  {
    Object localObject;
    if (paramArrayOfDouble == null)
    {
      localObject = null;
      return (double[])localObject;
    }
    if (paramArrayOfDouble.length == 0) {
      return EMPTY_DOUBLE_ARRAY;
    }
    double[] arrayOfDouble = new double[paramArrayOfDouble.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfDouble;
      if (i >= paramArrayOfDouble.length) {
        break;
      }
      arrayOfDouble[i] = paramArrayOfDouble[i].doubleValue();
      i += 1;
    }
  }
  
  public static double[] toPrimitive(Double[] paramArrayOfDouble, double paramDouble)
  {
    if (paramArrayOfDouble == null) {
      localObject = null;
    }
    double[] arrayOfDouble;
    int i;
    do
    {
      return (double[])localObject;
      if (paramArrayOfDouble.length == 0) {
        return EMPTY_DOUBLE_ARRAY;
      }
      arrayOfDouble = new double[paramArrayOfDouble.length];
      i = 0;
      localObject = arrayOfDouble;
    } while (i >= paramArrayOfDouble.length);
    Object localObject = paramArrayOfDouble[i];
    if (localObject == null) {}
    for (double d = paramDouble;; d = ((Double)localObject).doubleValue())
    {
      arrayOfDouble[i] = d;
      i += 1;
      break;
    }
  }
  
  public static float[] toPrimitive(Float[] paramArrayOfFloat)
  {
    Object localObject;
    if (paramArrayOfFloat == null)
    {
      localObject = null;
      return (float[])localObject;
    }
    if (paramArrayOfFloat.length == 0) {
      return EMPTY_FLOAT_ARRAY;
    }
    float[] arrayOfFloat = new float[paramArrayOfFloat.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfFloat;
      if (i >= paramArrayOfFloat.length) {
        break;
      }
      arrayOfFloat[i] = paramArrayOfFloat[i].floatValue();
      i += 1;
    }
  }
  
  public static float[] toPrimitive(Float[] paramArrayOfFloat, float paramFloat)
  {
    if (paramArrayOfFloat == null) {
      localObject = null;
    }
    float[] arrayOfFloat;
    int i;
    do
    {
      return (float[])localObject;
      if (paramArrayOfFloat.length == 0) {
        return EMPTY_FLOAT_ARRAY;
      }
      arrayOfFloat = new float[paramArrayOfFloat.length];
      i = 0;
      localObject = arrayOfFloat;
    } while (i >= paramArrayOfFloat.length);
    Object localObject = paramArrayOfFloat[i];
    if (localObject == null) {}
    for (float f = paramFloat;; f = ((Float)localObject).floatValue())
    {
      arrayOfFloat[i] = f;
      i += 1;
      break;
    }
  }
  
  public static int[] toPrimitive(Integer[] paramArrayOfInteger)
  {
    Object localObject;
    if (paramArrayOfInteger == null)
    {
      localObject = null;
      return (int[])localObject;
    }
    if (paramArrayOfInteger.length == 0) {
      return EMPTY_INT_ARRAY;
    }
    int[] arrayOfInt = new int[paramArrayOfInteger.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfInt;
      if (i >= paramArrayOfInteger.length) {
        break;
      }
      arrayOfInt[i] = paramArrayOfInteger[i].intValue();
      i += 1;
    }
  }
  
  public static int[] toPrimitive(Integer[] paramArrayOfInteger, int paramInt)
  {
    if (paramArrayOfInteger == null) {
      localObject = null;
    }
    int[] arrayOfInt;
    int i;
    do
    {
      return (int[])localObject;
      if (paramArrayOfInteger.length == 0) {
        return EMPTY_INT_ARRAY;
      }
      arrayOfInt = new int[paramArrayOfInteger.length];
      i = 0;
      localObject = arrayOfInt;
    } while (i >= paramArrayOfInteger.length);
    Object localObject = paramArrayOfInteger[i];
    if (localObject == null) {}
    for (int j = paramInt;; j = ((Integer)localObject).intValue())
    {
      arrayOfInt[i] = j;
      i += 1;
      break;
    }
  }
  
  public static long[] toPrimitive(Long[] paramArrayOfLong)
  {
    Object localObject;
    if (paramArrayOfLong == null)
    {
      localObject = null;
      return (long[])localObject;
    }
    if (paramArrayOfLong.length == 0) {
      return EMPTY_LONG_ARRAY;
    }
    long[] arrayOfLong = new long[paramArrayOfLong.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfLong;
      if (i >= paramArrayOfLong.length) {
        break;
      }
      arrayOfLong[i] = paramArrayOfLong[i].longValue();
      i += 1;
    }
  }
  
  public static long[] toPrimitive(Long[] paramArrayOfLong, long paramLong)
  {
    if (paramArrayOfLong == null) {
      localObject = null;
    }
    long[] arrayOfLong;
    int i;
    do
    {
      return (long[])localObject;
      if (paramArrayOfLong.length == 0) {
        return EMPTY_LONG_ARRAY;
      }
      arrayOfLong = new long[paramArrayOfLong.length];
      i = 0;
      localObject = arrayOfLong;
    } while (i >= paramArrayOfLong.length);
    Object localObject = paramArrayOfLong[i];
    if (localObject == null) {}
    for (long l = paramLong;; l = ((Long)localObject).longValue())
    {
      arrayOfLong[i] = l;
      i += 1;
      break;
    }
  }
  
  public static short[] toPrimitive(Short[] paramArrayOfShort)
  {
    Object localObject;
    if (paramArrayOfShort == null)
    {
      localObject = null;
      return (short[])localObject;
    }
    if (paramArrayOfShort.length == 0) {
      return EMPTY_SHORT_ARRAY;
    }
    short[] arrayOfShort = new short[paramArrayOfShort.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfShort;
      if (i >= paramArrayOfShort.length) {
        break;
      }
      arrayOfShort[i] = paramArrayOfShort[i].shortValue();
      i += 1;
    }
  }
  
  public static short[] toPrimitive(Short[] paramArrayOfShort, short paramShort)
  {
    if (paramArrayOfShort == null) {
      localObject = null;
    }
    short[] arrayOfShort;
    int j;
    do
    {
      return (short[])localObject;
      if (paramArrayOfShort.length == 0) {
        return EMPTY_SHORT_ARRAY;
      }
      arrayOfShort = new short[paramArrayOfShort.length];
      j = 0;
      localObject = arrayOfShort;
    } while (j >= paramArrayOfShort.length);
    Object localObject = paramArrayOfShort[j];
    if (localObject == null) {}
    for (int i = paramShort;; i = ((Short)localObject).shortValue())
    {
      arrayOfShort[j] = i;
      j += 1;
      break;
    }
  }
  
  public static boolean[] toPrimitive(Boolean[] paramArrayOfBoolean)
  {
    Object localObject;
    if (paramArrayOfBoolean == null)
    {
      localObject = null;
      return (boolean[])localObject;
    }
    if (paramArrayOfBoolean.length == 0) {
      return EMPTY_BOOLEAN_ARRAY;
    }
    boolean[] arrayOfBoolean = new boolean[paramArrayOfBoolean.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfBoolean;
      if (i >= paramArrayOfBoolean.length) {
        break;
      }
      arrayOfBoolean[i] = paramArrayOfBoolean[i].booleanValue();
      i += 1;
    }
  }
  
  public static boolean[] toPrimitive(Boolean[] paramArrayOfBoolean, boolean paramBoolean)
  {
    if (paramArrayOfBoolean == null) {
      localObject = null;
    }
    boolean[] arrayOfBoolean;
    int i;
    do
    {
      return (boolean[])localObject;
      if (paramArrayOfBoolean.length == 0) {
        return EMPTY_BOOLEAN_ARRAY;
      }
      arrayOfBoolean = new boolean[paramArrayOfBoolean.length];
      i = 0;
      localObject = arrayOfBoolean;
    } while (i >= paramArrayOfBoolean.length);
    Object localObject = paramArrayOfBoolean[i];
    if (localObject == null) {}
    for (boolean bool = paramBoolean;; bool = ((Boolean)localObject).booleanValue())
    {
      arrayOfBoolean[i] = bool;
      i += 1;
      break;
    }
  }
  
  public static String toString(Object paramObject)
  {
    return toString(paramObject, "{}");
  }
  
  public static String toString(Object paramObject, String paramString)
  {
    if (paramObject == null) {
      return paramString;
    }
    return new ToStringBuilder(paramObject, ToStringStyle.SIMPLE_STYLE).append(paramObject).toString();
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.ArrayUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */