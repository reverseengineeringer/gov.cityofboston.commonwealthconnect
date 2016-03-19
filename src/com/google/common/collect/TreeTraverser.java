package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Iterator;
import java.util.Queue;

@Beta
@GwtCompatible(emulated=true)
public abstract class TreeTraverser<T>
{
  public final FluentIterable<T> breadthFirstTraversal(final T paramT)
  {
    Preconditions.checkNotNull(paramT);
    new FluentIterable()
    {
      public UnmodifiableIterator<T> iterator()
      {
        return new TreeTraverser.BreadthFirstIterator(TreeTraverser.this, paramT);
      }
    };
  }
  
  public abstract Iterable<T> children(T paramT);
  
  UnmodifiableIterator<T> postOrderIterator(T paramT)
  {
    return new PostOrderIterator(paramT);
  }
  
  public final FluentIterable<T> postOrderTraversal(final T paramT)
  {
    Preconditions.checkNotNull(paramT);
    new FluentIterable()
    {
      public UnmodifiableIterator<T> iterator()
      {
        return postOrderIterator(paramT);
      }
    };
  }
  
  UnmodifiableIterator<T> preOrderIterator(T paramT)
  {
    return new PreOrderIterator(paramT);
  }
  
  public final FluentIterable<T> preOrderTraversal(final T paramT)
  {
    Preconditions.checkNotNull(paramT);
    new FluentIterable()
    {
      public UnmodifiableIterator<T> iterator()
      {
        return preOrderIterator(paramT);
      }
    };
  }
  
  private final class BreadthFirstIterator
    extends UnmodifiableIterator<T>
    implements PeekingIterator<T>
  {
    private final Queue<T> queue = new ArrayDeque();
    
    BreadthFirstIterator()
    {
      Object localObject;
      queue.add(localObject);
    }
    
    public boolean hasNext()
    {
      return !queue.isEmpty();
    }
    
    public T next()
    {
      Object localObject = queue.remove();
      Iterables.addAll(queue, children(localObject));
      return (T)localObject;
    }
    
    public T peek()
    {
      return (T)queue.element();
    }
  }
  
  private final class PostOrderIterator
    extends AbstractIterator<T>
  {
    private final ArrayDeque<TreeTraverser.PostOrderNode<T>> stack = new ArrayDeque();
    
    PostOrderIterator()
    {
      Object localObject;
      stack.addLast(expand(localObject));
    }
    
    private TreeTraverser.PostOrderNode<T> expand(T paramT)
    {
      return new TreeTraverser.PostOrderNode(paramT, children(paramT).iterator());
    }
    
    protected T computeNext()
    {
      while (!stack.isEmpty())
      {
        Object localObject = (TreeTraverser.PostOrderNode)stack.getLast();
        if (childIterator.hasNext())
        {
          localObject = childIterator.next();
          stack.addLast(expand(localObject));
        }
        else
        {
          stack.removeLast();
          return (T)root;
        }
      }
      return (T)endOfData();
    }
  }
  
  private static final class PostOrderNode<T>
  {
    final Iterator<T> childIterator;
    final T root;
    
    PostOrderNode(T paramT, Iterator<T> paramIterator)
    {
      root = Preconditions.checkNotNull(paramT);
      childIterator = ((Iterator)Preconditions.checkNotNull(paramIterator));
    }
  }
  
  private final class PreOrderIterator
    extends UnmodifiableIterator<T>
  {
    private final Deque<Iterator<T>> stack = new ArrayDeque();
    
    PreOrderIterator()
    {
      Object localObject;
      stack.addLast(Iterators.singletonIterator(Preconditions.checkNotNull(localObject)));
    }
    
    public boolean hasNext()
    {
      return !stack.isEmpty();
    }
    
    public T next()
    {
      Iterator localIterator = (Iterator)stack.getLast();
      Object localObject = Preconditions.checkNotNull(localIterator.next());
      if (!localIterator.hasNext()) {
        stack.removeLast();
      }
      localIterator = children(localObject).iterator();
      if (localIterator.hasNext()) {
        stack.addLast(localIterator);
      }
      return (T)localObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeTraverser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */