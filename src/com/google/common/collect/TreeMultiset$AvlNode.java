package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.util.Comparator;
import javax.annotation.Nullable;

final class TreeMultiset$AvlNode<E>
  extends Multisets.AbstractEntry<E>
{
  private int distinctElements;
  @Nullable
  private final E elem;
  private int elemCount;
  private int height;
  private AvlNode<E> left;
  private AvlNode<E> pred;
  private AvlNode<E> right;
  private AvlNode<E> succ;
  private long totalCount;
  
  TreeMultiset$AvlNode(@Nullable E paramE, int paramInt)
  {
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      elem = paramE;
      elemCount = paramInt;
      totalCount = paramInt;
      distinctElements = 1;
      height = 1;
      left = null;
      right = null;
      return;
    }
  }
  
  private AvlNode<E> addLeftChild(E paramE, int paramInt)
  {
    left = new AvlNode(paramE, paramInt);
    TreeMultiset.access$1700(pred, left, this);
    height = Math.max(2, height);
    distinctElements += 1;
    totalCount += paramInt;
    return this;
  }
  
  private AvlNode<E> addRightChild(E paramE, int paramInt)
  {
    right = new AvlNode(paramE, paramInt);
    TreeMultiset.access$1700(this, right, succ);
    height = Math.max(2, height);
    distinctElements += 1;
    totalCount += paramInt;
    return this;
  }
  
  private int balanceFactor()
  {
    return height(left) - height(right);
  }
  
  @Nullable
  private AvlNode<E> ceiling(Comparator<? super E> paramComparator, E paramE)
  {
    int i = paramComparator.compare(paramE, elem);
    if (i < 0) {
      if (left != null) {}
    }
    while (i == 0)
    {
      return this;
      return (AvlNode)Objects.firstNonNull(left.ceiling(paramComparator, paramE), this);
    }
    if (right == null) {}
    for (paramComparator = null;; paramComparator = right.ceiling(paramComparator, paramE)) {
      return paramComparator;
    }
  }
  
  private AvlNode<E> deleteMe()
  {
    int i = elemCount;
    elemCount = 0;
    TreeMultiset.access$1800(pred, succ);
    if (left == null) {
      return right;
    }
    if (right == null) {
      return left;
    }
    if (left.height >= right.height)
    {
      localAvlNode = pred;
      left = left.removeMax(localAvlNode);
      right = right;
      distinctElements -= 1;
      totalCount -= i;
      return localAvlNode.rebalance();
    }
    AvlNode localAvlNode = succ;
    right = right.removeMin(localAvlNode);
    left = left;
    distinctElements -= 1;
    totalCount -= i;
    return localAvlNode.rebalance();
  }
  
  @Nullable
  private AvlNode<E> floor(Comparator<? super E> paramComparator, E paramE)
  {
    int i = paramComparator.compare(paramE, elem);
    if (i > 0) {
      if (right != null) {}
    }
    while (i == 0)
    {
      return this;
      return (AvlNode)Objects.firstNonNull(right.floor(paramComparator, paramE), this);
    }
    if (left == null) {}
    for (paramComparator = null;; paramComparator = left.floor(paramComparator, paramE)) {
      return paramComparator;
    }
  }
  
  private static int height(@Nullable AvlNode<?> paramAvlNode)
  {
    if (paramAvlNode == null) {
      return 0;
    }
    return height;
  }
  
  private AvlNode<E> rebalance()
  {
    switch (balanceFactor())
    {
    default: 
      recomputeHeight();
      return this;
    case -2: 
      if (right.balanceFactor() > 0) {
        right = right.rotateRight();
      }
      return rotateLeft();
    }
    if (left.balanceFactor() < 0) {
      left = left.rotateLeft();
    }
    return rotateRight();
  }
  
  private void recompute()
  {
    recomputeMultiset();
    recomputeHeight();
  }
  
  private void recomputeHeight()
  {
    height = (Math.max(height(left), height(right)) + 1);
  }
  
  private void recomputeMultiset()
  {
    distinctElements = (TreeMultiset.distinctElements(left) + 1 + TreeMultiset.distinctElements(right));
    totalCount = (elemCount + totalCount(left) + totalCount(right));
  }
  
  private AvlNode<E> removeMax(AvlNode<E> paramAvlNode)
  {
    if (right == null) {
      return left;
    }
    right = right.removeMax(paramAvlNode);
    distinctElements -= 1;
    totalCount -= elemCount;
    return rebalance();
  }
  
  private AvlNode<E> removeMin(AvlNode<E> paramAvlNode)
  {
    if (left == null) {
      return right;
    }
    left = left.removeMin(paramAvlNode);
    distinctElements -= 1;
    totalCount -= elemCount;
    return rebalance();
  }
  
  private AvlNode<E> rotateLeft()
  {
    if (right != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      AvlNode localAvlNode = right;
      right = left;
      left = this;
      totalCount = totalCount;
      distinctElements = distinctElements;
      recompute();
      localAvlNode.recomputeHeight();
      return localAvlNode;
    }
  }
  
  private AvlNode<E> rotateRight()
  {
    if (left != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      AvlNode localAvlNode = left;
      left = right;
      right = this;
      totalCount = totalCount;
      distinctElements = distinctElements;
      recompute();
      localAvlNode.recomputeHeight();
      return localAvlNode;
    }
  }
  
  private static long totalCount(@Nullable AvlNode<?> paramAvlNode)
  {
    if (paramAvlNode == null) {
      return 0L;
    }
    return totalCount;
  }
  
  AvlNode<E> add(Comparator<? super E> paramComparator, @Nullable E paramE, int paramInt, int[] paramArrayOfInt)
  {
    int i = paramComparator.compare(paramE, elem);
    AvlNode localAvlNode;
    if (i < 0)
    {
      localAvlNode = left;
      if (localAvlNode == null)
      {
        paramArrayOfInt[0] = 0;
        paramComparator = addLeftChild(paramE, paramInt);
      }
    }
    do
    {
      do
      {
        return paramComparator;
        i = height;
        left = localAvlNode.add(paramComparator, paramE, paramInt, paramArrayOfInt);
        if (paramArrayOfInt[0] == 0) {
          distinctElements += 1;
        }
        totalCount += paramInt;
        paramComparator = this;
      } while (left.height == i);
      return rebalance();
      if (i <= 0) {
        break;
      }
      localAvlNode = right;
      if (localAvlNode == null)
      {
        paramArrayOfInt[0] = 0;
        return addRightChild(paramE, paramInt);
      }
      i = height;
      right = localAvlNode.add(paramComparator, paramE, paramInt, paramArrayOfInt);
      if (paramArrayOfInt[0] == 0) {
        distinctElements += 1;
      }
      totalCount += paramInt;
      paramComparator = this;
    } while (right.height == i);
    return rebalance();
    paramArrayOfInt[0] = elemCount;
    if (elemCount + paramInt <= 2147483647L) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      elemCount += paramInt;
      totalCount += paramInt;
      return this;
    }
  }
  
  public int count(Comparator<? super E> paramComparator, E paramE)
  {
    int i = paramComparator.compare(paramE, elem);
    if (i < 0) {
      if (left != null) {}
    }
    do
    {
      return 0;
      return left.count(paramComparator, paramE);
      if (i <= 0) {
        break;
      }
    } while (right == null);
    return right.count(paramComparator, paramE);
    return elemCount;
  }
  
  public int getCount()
  {
    return elemCount;
  }
  
  public E getElement()
  {
    return (E)elem;
  }
  
  AvlNode<E> remove(Comparator<? super E> paramComparator, @Nullable E paramE, int paramInt, int[] paramArrayOfInt)
  {
    int i = paramComparator.compare(paramE, elem);
    AvlNode localAvlNode;
    if (i < 0)
    {
      localAvlNode = left;
      if (localAvlNode == null) {
        paramArrayOfInt[0] = 0;
      }
      for (;;)
      {
        return this;
        left = localAvlNode.remove(paramComparator, paramE, paramInt, paramArrayOfInt);
        if (paramArrayOfInt[0] > 0)
        {
          if (paramInt < paramArrayOfInt[0]) {
            break label101;
          }
          distinctElements -= 1;
        }
        label101:
        for (totalCount -= paramArrayOfInt[0]; paramArrayOfInt[0] != 0; totalCount -= paramInt) {
          return rebalance();
        }
      }
    }
    if (i > 0)
    {
      localAvlNode = right;
      if (localAvlNode == null)
      {
        paramArrayOfInt[0] = 0;
        return this;
      }
      right = localAvlNode.remove(paramComparator, paramE, paramInt, paramArrayOfInt);
      if (paramArrayOfInt[0] > 0)
      {
        if (paramInt < paramArrayOfInt[0]) {
          break label196;
        }
        distinctElements -= 1;
      }
      label196:
      for (totalCount -= paramArrayOfInt[0];; totalCount -= paramInt) {
        return rebalance();
      }
    }
    paramArrayOfInt[0] = elemCount;
    if (paramInt >= elemCount) {
      return deleteMe();
    }
    elemCount -= paramInt;
    totalCount -= paramInt;
    return this;
  }
  
  AvlNode<E> setCount(Comparator<? super E> paramComparator, @Nullable E paramE, int paramInt1, int paramInt2, int[] paramArrayOfInt)
  {
    int i = paramComparator.compare(paramE, elem);
    AvlNode localAvlNode;
    if (i < 0)
    {
      localAvlNode = left;
      if (localAvlNode == null)
      {
        paramArrayOfInt[0] = 0;
        paramComparator = this;
        if (paramInt1 == 0)
        {
          paramComparator = this;
          if (paramInt2 > 0) {
            paramComparator = addLeftChild(paramE, paramInt2);
          }
        }
      }
    }
    label125:
    label260:
    label285:
    do
    {
      do
      {
        do
        {
          return paramComparator;
          left = localAvlNode.setCount(paramComparator, paramE, paramInt1, paramInt2, paramArrayOfInt);
          if (paramArrayOfInt[0] == paramInt1) {
            if ((paramInt2 != 0) || (paramArrayOfInt[0] == 0)) {
              break label125;
            }
          }
          for (distinctElements -= 1;; distinctElements += 1) {
            do
            {
              totalCount += paramInt2 - paramArrayOfInt[0];
              return rebalance();
            } while ((paramInt2 <= 0) || (paramArrayOfInt[0] != 0));
          }
          if (i <= 0) {
            break label285;
          }
          localAvlNode = right;
          if (localAvlNode != null) {
            break;
          }
          paramArrayOfInt[0] = 0;
          paramComparator = this;
        } while (paramInt1 != 0);
        paramComparator = this;
      } while (paramInt2 <= 0);
      return addRightChild(paramE, paramInt2);
      right = localAvlNode.setCount(paramComparator, paramE, paramInt1, paramInt2, paramArrayOfInt);
      if (paramArrayOfInt[0] == paramInt1) {
        if ((paramInt2 != 0) || (paramArrayOfInt[0] == 0)) {
          break label260;
        }
      }
      for (distinctElements -= 1;; distinctElements += 1) {
        do
        {
          totalCount += paramInt2 - paramArrayOfInt[0];
          return rebalance();
        } while ((paramInt2 <= 0) || (paramArrayOfInt[0] != 0));
      }
      paramArrayOfInt[0] = elemCount;
      paramComparator = this;
    } while (paramInt1 != elemCount);
    if (paramInt2 == 0) {
      return deleteMe();
    }
    totalCount += paramInt2 - elemCount;
    elemCount = paramInt2;
    return this;
  }
  
  AvlNode<E> setCount(Comparator<? super E> paramComparator, @Nullable E paramE, int paramInt, int[] paramArrayOfInt)
  {
    int i = paramComparator.compare(paramE, elem);
    AvlNode localAvlNode;
    if (i < 0)
    {
      localAvlNode = left;
      if (localAvlNode == null)
      {
        paramArrayOfInt[0] = 0;
        paramComparator = this;
        if (paramInt > 0) {
          paramComparator = addLeftChild(paramE, paramInt);
        }
      }
    }
    do
    {
      return paramComparator;
      left = localAvlNode.setCount(paramComparator, paramE, paramInt, paramArrayOfInt);
      if ((paramInt == 0) && (paramArrayOfInt[0] != 0)) {}
      for (distinctElements -= 1;; distinctElements += 1) {
        do
        {
          totalCount += paramInt - paramArrayOfInt[0];
          return rebalance();
        } while ((paramInt <= 0) || (paramArrayOfInt[0] != 0));
      }
      if (i <= 0) {
        break label243;
      }
      localAvlNode = right;
      if (localAvlNode != null) {
        break;
      }
      paramArrayOfInt[0] = 0;
      paramComparator = this;
    } while (paramInt <= 0);
    return addRightChild(paramE, paramInt);
    right = localAvlNode.setCount(paramComparator, paramE, paramInt, paramArrayOfInt);
    if ((paramInt == 0) && (paramArrayOfInt[0] != 0)) {}
    for (distinctElements -= 1;; distinctElements += 1) {
      do
      {
        totalCount += paramInt - paramArrayOfInt[0];
        return rebalance();
      } while ((paramInt <= 0) || (paramArrayOfInt[0] != 0));
    }
    label243:
    paramArrayOfInt[0] = elemCount;
    if (paramInt == 0) {
      return deleteMe();
    }
    totalCount += paramInt - elemCount;
    elemCount = paramInt;
    return this;
  }
  
  public String toString()
  {
    return Multisets.immutableEntry(getElement(), getCount()).toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeMultiset.AvlNode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */