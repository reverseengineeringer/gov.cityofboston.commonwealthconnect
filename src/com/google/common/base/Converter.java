package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Iterator;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public abstract class Converter<A, B>
  implements Function<A, B>
{
  private final boolean handleNullAutomatically;
  private transient Converter<B, A> reverse;
  
  protected Converter()
  {
    this(true);
  }
  
  Converter(boolean paramBoolean)
  {
    handleNullAutomatically = paramBoolean;
  }
  
  public static <A, B> Converter<A, B> from(Function<? super A, ? extends B> paramFunction, Function<? super B, ? extends A> paramFunction1)
  {
    return new FunctionBasedConverter(paramFunction, paramFunction1, null);
  }
  
  public static <T> Converter<T, T> identity()
  {
    return IdentityConverter.INSTANCE;
  }
  
  public <C> Converter<A, C> andThen(Converter<B, C> paramConverter)
  {
    return new ConverterComposition(this, (Converter)Preconditions.checkNotNull(paramConverter));
  }
  
  @Deprecated
  @Nullable
  public final B apply(@Nullable A paramA)
  {
    return (B)convert(paramA);
  }
  
  @Nullable
  public final B convert(@Nullable A paramA)
  {
    return (B)correctedDoForward(paramA);
  }
  
  public Iterable<B> convertAll(final Iterable<? extends A> paramIterable)
  {
    Preconditions.checkNotNull(paramIterable, "fromIterable");
    new Iterable()
    {
      public Iterator<B> iterator()
      {
        new Iterator()
        {
          private final Iterator<? extends A> fromIterator = val$fromIterable.iterator();
          
          public boolean hasNext()
          {
            return fromIterator.hasNext();
          }
          
          public B next()
          {
            return (B)convert(fromIterator.next());
          }
          
          public void remove()
          {
            fromIterator.remove();
          }
        };
      }
    };
  }
  
  @Nullable
  A correctedDoBackward(@Nullable B paramB)
  {
    if (handleNullAutomatically)
    {
      if (paramB == null) {
        return null;
      }
      return (A)Preconditions.checkNotNull(doBackward(paramB));
    }
    return (A)doBackward(paramB);
  }
  
  @Nullable
  B correctedDoForward(@Nullable A paramA)
  {
    if (handleNullAutomatically)
    {
      if (paramA == null) {
        return null;
      }
      return (B)Preconditions.checkNotNull(doForward(paramA));
    }
    return (B)doForward(paramA);
  }
  
  protected abstract A doBackward(B paramB);
  
  protected abstract B doForward(A paramA);
  
  public boolean equals(@Nullable Object paramObject)
  {
    return super.equals(paramObject);
  }
  
  public Converter<B, A> reverse()
  {
    Converter localConverter = reverse;
    Object localObject = localConverter;
    if (localConverter == null)
    {
      localObject = new ReverseConverter(this);
      reverse = ((Converter)localObject);
    }
    return (Converter<B, A>)localObject;
  }
  
  private static final class ConverterComposition<A, B, C>
    extends Converter<A, C>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final Converter<A, B> first;
    final Converter<B, C> second;
    
    ConverterComposition(Converter<A, B> paramConverter, Converter<B, C> paramConverter1)
    {
      first = paramConverter;
      second = paramConverter1;
    }
    
    @Nullable
    A correctedDoBackward(@Nullable C paramC)
    {
      return (A)first.correctedDoBackward(second.correctedDoBackward(paramC));
    }
    
    @Nullable
    C correctedDoForward(@Nullable A paramA)
    {
      return (C)second.correctedDoForward(first.correctedDoForward(paramA));
    }
    
    protected A doBackward(C paramC)
    {
      throw new AssertionError();
    }
    
    protected C doForward(A paramA)
    {
      throw new AssertionError();
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof ConverterComposition))
      {
        paramObject = (ConverterComposition)paramObject;
        bool1 = bool2;
        if (first.equals(first))
        {
          bool1 = bool2;
          if (second.equals(second)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public int hashCode()
    {
      return first.hashCode() * 31 + second.hashCode();
    }
    
    public String toString()
    {
      return first + ".andThen(" + second + ")";
    }
  }
  
  private static final class FunctionBasedConverter<A, B>
    extends Converter<A, B>
    implements Serializable
  {
    private final Function<? super B, ? extends A> backwardFunction;
    private final Function<? super A, ? extends B> forwardFunction;
    
    private FunctionBasedConverter(Function<? super A, ? extends B> paramFunction, Function<? super B, ? extends A> paramFunction1)
    {
      forwardFunction = ((Function)Preconditions.checkNotNull(paramFunction));
      backwardFunction = ((Function)Preconditions.checkNotNull(paramFunction1));
    }
    
    protected A doBackward(B paramB)
    {
      return (A)backwardFunction.apply(paramB);
    }
    
    protected B doForward(A paramA)
    {
      return (B)forwardFunction.apply(paramA);
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof FunctionBasedConverter))
      {
        paramObject = (FunctionBasedConverter)paramObject;
        bool1 = bool2;
        if (forwardFunction.equals(forwardFunction))
        {
          bool1 = bool2;
          if (backwardFunction.equals(backwardFunction)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public int hashCode()
    {
      return forwardFunction.hashCode() * 31 + backwardFunction.hashCode();
    }
    
    public String toString()
    {
      return "Converter.from(" + forwardFunction + ", " + backwardFunction + ")";
    }
  }
  
  private static final class IdentityConverter<T>
    extends Converter<T, T>
    implements Serializable
  {
    static final IdentityConverter INSTANCE = new IdentityConverter();
    private static final long serialVersionUID = 0L;
    
    private Object readResolve()
    {
      return INSTANCE;
    }
    
    public <S> Converter<T, S> andThen(Converter<T, S> paramConverter)
    {
      return (Converter)Preconditions.checkNotNull(paramConverter, "otherConverter");
    }
    
    protected T doBackward(T paramT)
    {
      return paramT;
    }
    
    protected T doForward(T paramT)
    {
      return paramT;
    }
    
    public IdentityConverter<T> reverse()
    {
      return this;
    }
    
    public String toString()
    {
      return "Converter.identity()";
    }
  }
  
  private static final class ReverseConverter<A, B>
    extends Converter<B, A>
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final Converter<A, B> original;
    
    ReverseConverter(Converter<A, B> paramConverter)
    {
      original = paramConverter;
    }
    
    @Nullable
    B correctedDoBackward(@Nullable A paramA)
    {
      return (B)original.correctedDoForward(paramA);
    }
    
    @Nullable
    A correctedDoForward(@Nullable B paramB)
    {
      return (A)original.correctedDoBackward(paramB);
    }
    
    protected B doBackward(A paramA)
    {
      throw new AssertionError();
    }
    
    protected A doForward(B paramB)
    {
      throw new AssertionError();
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof ReverseConverter))
      {
        paramObject = (ReverseConverter)paramObject;
        return original.equals(original);
      }
      return false;
    }
    
    public int hashCode()
    {
      return original.hashCode() ^ 0xFFFFFFFF;
    }
    
    public Converter<A, B> reverse()
    {
      return original;
    }
    
    public String toString()
    {
      return original + ".reverse()";
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Converter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */