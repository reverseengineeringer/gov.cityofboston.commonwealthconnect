package android.support.v4.util;

public class CircularArray<E>
{
  private int mCapacityBitmask;
  private E[] mElements;
  private int mHead;
  private int mTail;
  
  public CircularArray()
  {
    this(8);
  }
  
  public CircularArray(int paramInt)
  {
    if (paramInt <= 0) {
      throw new IllegalArgumentException("capacity must be positive");
    }
    int i = paramInt;
    if (Integer.bitCount(paramInt) != 1) {
      i = 1 << Integer.highestOneBit(paramInt) + 1;
    }
    mCapacityBitmask = (i - 1);
    mElements = ((Object[])new Object[i]);
  }
  
  private void doubleCapacity()
  {
    int i = mElements.length;
    int j = i - mHead;
    int k = i << 1;
    if (k < 0) {
      throw new RuntimeException("Too big");
    }
    Object[] arrayOfObject = new Object[k];
    System.arraycopy(mElements, mHead, arrayOfObject, 0, j);
    System.arraycopy(mElements, 0, arrayOfObject, j, mHead);
    mElements = ((Object[])arrayOfObject);
    mHead = 0;
    mTail = i;
    mCapacityBitmask = (k - 1);
  }
  
  public final void addFirst(E paramE)
  {
    mHead = (mHead - 1 & mCapacityBitmask);
    mElements[mHead] = paramE;
    if (mHead == mTail) {
      doubleCapacity();
    }
  }
  
  public final void addLast(E paramE)
  {
    mElements[mTail] = paramE;
    mTail = (mTail + 1 & mCapacityBitmask);
    if (mTail == mHead) {
      doubleCapacity();
    }
  }
  
  public final E get(int paramInt)
  {
    if ((paramInt < 0) || (paramInt >= size())) {
      throw new ArrayIndexOutOfBoundsException();
    }
    int i = mHead;
    int j = mCapacityBitmask;
    return (E)mElements[(i + paramInt & j)];
  }
  
  public final E getFirst()
  {
    if (mHead == mTail) {
      throw new ArrayIndexOutOfBoundsException();
    }
    return (E)mElements[mHead];
  }
  
  public final E getLast()
  {
    if (mHead == mTail) {
      throw new ArrayIndexOutOfBoundsException();
    }
    return (E)mElements[(mTail - 1 & mCapacityBitmask)];
  }
  
  public final boolean isEmpty()
  {
    return mHead == mTail;
  }
  
  public final E popFirst()
  {
    if (mHead == mTail) {
      throw new ArrayIndexOutOfBoundsException();
    }
    Object localObject = mElements[mHead];
    mElements[mHead] = null;
    mHead = (mHead + 1 & mCapacityBitmask);
    return (E)localObject;
  }
  
  public final E popLast()
  {
    if (mHead == mTail) {
      throw new ArrayIndexOutOfBoundsException();
    }
    int i = mTail - 1 & mCapacityBitmask;
    Object localObject = mElements[i];
    mElements[i] = null;
    mTail = i;
    return (E)localObject;
  }
  
  public final int size()
  {
    return mTail - mHead & mCapacityBitmask;
  }
}

/* Location:
 * Qualified Name:     android.support.v4.util.CircularArray
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */