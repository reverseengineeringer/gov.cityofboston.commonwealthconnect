package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.BitSet;
import java.util.Deque;
import java.util.Iterator;

@Beta
@GwtCompatible(emulated=true)
public abstract class BinaryTreeTraverser<T>
  extends TreeTraverser<T>
{
  private static <T> void pushIfPresent(Deque<T> paramDeque, Optional<T> paramOptional)
  {
    if (paramOptional.isPresent()) {
      paramDeque.addLast(paramOptional.get());
    }
  }
  
  public final Iterable<T> children(final T paramT)
  {
    Preconditions.checkNotNull(paramT);
    new FluentIterable()
    {
      public Iterator<T> iterator()
      {
        new AbstractIterator()
        {
          boolean doneLeft;
          boolean doneRight;
          
          protected T computeNext()
          {
            Optional localOptional;
            if (!doneLeft)
            {
              doneLeft = true;
              localOptional = leftChild(val$root);
              if (localOptional.isPresent()) {
                return (T)localOptional.get();
              }
            }
            if (!doneRight)
            {
              doneRight = true;
              localOptional = rightChild(val$root);
              if (localOptional.isPresent()) {
                return (T)localOptional.get();
              }
            }
            return (T)endOfData();
          }
        };
      }
    };
  }
  
  public final FluentIterable<T> inOrderTraversal(final T paramT)
  {
    Preconditions.checkNotNull(paramT);
    new FluentIterable()
    {
      public UnmodifiableIterator<T> iterator()
      {
        return new BinaryTreeTraverser.InOrderIterator(BinaryTreeTraverser.this, paramT);
      }
    };
  }
  
  public abstract Optional<T> leftChild(T paramT);
  
  UnmodifiableIterator<T> postOrderIterator(T paramT)
  {
    return new PostOrderIterator(paramT);
  }
  
  UnmodifiableIterator<T> preOrderIterator(T paramT)
  {
    return new PreOrderIterator(paramT);
  }
  
  public abstract Optional<T> rightChild(T paramT);
  
  private final class InOrderIterator
    extends AbstractIterator<T>
  {
    private final BitSet hasExpandedLeft = new BitSet();
    private final Deque<T> stack = new ArrayDeque();
    
    InOrderIterator()
    {
      Object localObject;
      stack.addLast(localObject);
    }
    
    protected T computeNext()
    {
      while (!stack.isEmpty())
      {
        Object localObject = stack.getLast();
        if (hasExpandedLeft.get(stack.size() - 1))
        {
          stack.removeLast();
          hasExpandedLeft.clear(stack.size());
          BinaryTreeTraverser.pushIfPresent(stack, rightChild(localObject));
          return (T)localObject;
        }
        hasExpandedLeft.set(stack.size() - 1);
        BinaryTreeTraverser.pushIfPresent(stack, leftChild(localObject));
      }
      return (T)endOfData();
    }
  }
  
  private final class PostOrderIterator
    extends UnmodifiableIterator<T>
  {
    private final BitSet hasExpanded;
    private final Deque<T> stack = new ArrayDeque();
    
    PostOrderIterator()
    {
      Object localObject;
      stack.addLast(localObject);
      hasExpanded = new BitSet();
    }
    
    public boolean hasNext()
    {
      return !stack.isEmpty();
    }
    
    public T next()
    {
      for (;;)
      {
        Object localObject = stack.getLast();
        if (hasExpanded.get(stack.size() - 1))
        {
          stack.removeLast();
          hasExpanded.clear(stack.size());
          return (T)localObject;
        }
        hasExpanded.set(stack.size() - 1);
        BinaryTreeTraverser.pushIfPresent(stack, rightChild(localObject));
        BinaryTreeTraverser.pushIfPresent(stack, leftChild(localObject));
      }
    }
  }
  
  private final class PreOrderIterator
    extends UnmodifiableIterator<T>
    implements PeekingIterator<T>
  {
    private final Deque<T> stack = new ArrayDeque();
    
    PreOrderIterator()
    {
      Object localObject;
      stack.addLast(localObject);
    }
    
    public boolean hasNext()
    {
      return !stack.isEmpty();
    }
    
    public T next()
    {
      Object localObject = stack.removeLast();
      BinaryTreeTraverser.pushIfPresent(stack, rightChild(localObject));
      BinaryTreeTraverser.pushIfPresent(stack, leftChild(localObject));
      return (T)localObject;
    }
    
    public T peek()
    {
      return (T)stack.getLast();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.BinaryTreeTraverser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */