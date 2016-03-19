package com.google.common.base;

import com.google.common.annotations.GwtCompatible;
import java.util.Collections;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible
final class Present<T>
  extends Optional<T>
{
  private static final long serialVersionUID = 0L;
  private final T reference;
  
  Present(T paramT)
  {
    reference = paramT;
  }
  
  public Set<T> asSet()
  {
    return Collections.singleton(reference);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Present))
    {
      paramObject = (Present)paramObject;
      return reference.equals(reference);
    }
    return false;
  }
  
  public T get()
  {
    return (T)reference;
  }
  
  public int hashCode()
  {
    return 1502476572 + reference.hashCode();
  }
  
  public boolean isPresent()
  {
    return true;
  }
  
  public Optional<T> or(Optional<? extends T> paramOptional)
  {
    Preconditions.checkNotNull(paramOptional);
    return this;
  }
  
  public T or(Supplier<? extends T> paramSupplier)
  {
    Preconditions.checkNotNull(paramSupplier);
    return (T)reference;
  }
  
  public T or(T paramT)
  {
    Preconditions.checkNotNull(paramT, "use Optional.orNull() instead of Optional.or(null)");
    return (T)reference;
  }
  
  public T orNull()
  {
    return (T)reference;
  }
  
  public String toString()
  {
    return "Optional.of(" + reference + ")";
  }
  
  public <V> Optional<V> transform(Function<? super T, V> paramFunction)
  {
    return new Present(Preconditions.checkNotNull(paramFunction.apply(reference), "the Function passed to Optional.transform() must not return null."));
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Present
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */