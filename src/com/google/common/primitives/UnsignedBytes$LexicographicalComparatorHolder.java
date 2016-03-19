package com.google.common.primitives;

import com.google.common.annotations.VisibleForTesting;
import java.lang.reflect.Field;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import java.util.Comparator;
import sun.misc.Unsafe;

@VisibleForTesting
class UnsignedBytes$LexicographicalComparatorHolder
{
  static final Comparator<byte[]> BEST_COMPARATOR = getBestComparator();
  static final String UNSAFE_COMPARATOR_NAME = LexicographicalComparatorHolder.class.getName() + "$UnsafeComparator";
  
  static Comparator<byte[]> getBestComparator()
  {
    try
    {
      Comparator localComparator = (Comparator)Class.forName(UNSAFE_COMPARATOR_NAME).getEnumConstants()[0];
      return localComparator;
    }
    catch (Throwable localThrowable) {}
    return UnsignedBytes.lexicographicalComparatorJavaImpl();
  }
  
  static enum PureJavaComparator
    implements Comparator<byte[]>
  {
    INSTANCE;
    
    private PureJavaComparator() {}
    
    public int compare(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    {
      int j = Math.min(paramArrayOfByte1.length, paramArrayOfByte2.length);
      int i = 0;
      while (i < j)
      {
        int k = UnsignedBytes.compare(paramArrayOfByte1[i], paramArrayOfByte2[i]);
        if (k != 0) {
          return k;
        }
        i += 1;
      }
      return paramArrayOfByte1.length - paramArrayOfByte2.length;
    }
  }
  
  @VisibleForTesting
  static enum UnsafeComparator
    implements Comparator<byte[]>
  {
    static final boolean BIG_ENDIAN;
    static final int BYTE_ARRAY_BASE_OFFSET;
    static final Unsafe theUnsafe;
    
    static
    {
      $VALUES = new UnsafeComparator[] { INSTANCE };
      BIG_ENDIAN = ByteOrder.nativeOrder().equals(ByteOrder.BIG_ENDIAN);
      theUnsafe = getUnsafe();
      BYTE_ARRAY_BASE_OFFSET = theUnsafe.arrayBaseOffset(byte[].class);
      if (theUnsafe.arrayIndexScale(byte[].class) != 1) {
        throw new AssertionError();
      }
    }
    
    private UnsafeComparator() {}
    
    private static Unsafe getUnsafe()
    {
      try
      {
        Unsafe localUnsafe1 = Unsafe.getUnsafe();
        return localUnsafe1;
      }
      catch (SecurityException localSecurityException)
      {
        try
        {
          Unsafe localUnsafe2 = (Unsafe)AccessController.doPrivileged(new PrivilegedExceptionAction()
          {
            public Unsafe run()
              throws Exception
            {
              Field[] arrayOfField = Unsafe.class.getDeclaredFields();
              int j = arrayOfField.length;
              int i = 0;
              while (i < j)
              {
                Object localObject = arrayOfField[i];
                ((Field)localObject).setAccessible(true);
                localObject = ((Field)localObject).get(null);
                if (Unsafe.class.isInstance(localObject)) {
                  return (Unsafe)Unsafe.class.cast(localObject);
                }
                i += 1;
              }
              throw new NoSuchFieldError("the Unsafe");
            }
          });
          return localUnsafe2;
        }
        catch (PrivilegedActionException localPrivilegedActionException)
        {
          throw new RuntimeException("Could not initialize intrinsics", localPrivilegedActionException.getCause());
        }
      }
    }
    
    public int compare(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
    {
      int m = Math.min(paramArrayOfByte1.length, paramArrayOfByte2.length);
      int j = m / 8;
      int i = 0;
      while (i < j * 8)
      {
        long l1 = theUnsafe.getLong(paramArrayOfByte1, BYTE_ARRAY_BASE_OFFSET + i);
        long l2 = theUnsafe.getLong(paramArrayOfByte2, BYTE_ARRAY_BASE_OFFSET + i);
        if (l1 != l2)
        {
          if (BIG_ENDIAN)
          {
            i = UnsignedLongs.compare(l1, l2);
            return i;
          }
          i = Long.numberOfTrailingZeros(l1 ^ l2) & 0xFFFFFFF8;
          return (int)((l1 >>> i & 0xFF) - (l2 >>> i & 0xFF));
        }
        i += 8;
      }
      j *= 8;
      for (;;)
      {
        if (j >= m) {
          break label166;
        }
        int k = UnsignedBytes.compare(paramArrayOfByte1[j], paramArrayOfByte2[j]);
        i = k;
        if (k != 0) {
          break;
        }
        j += 1;
      }
      label166:
      return paramArrayOfByte1.length - paramArrayOfByte2.length;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.primitives.UnsignedBytes.LexicographicalComparatorHolder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */