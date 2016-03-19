package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Map;
import javax.annotation.Nullable;

@GwtCompatible
public final class Functions
{
  public static <A, B, C> Function<A, C> compose(Function<B, C> paramFunction, Function<A, ? extends B> paramFunction1)
  {
    return new FunctionComposition(paramFunction, paramFunction1);
  }
  
  public static <E> Function<Object, E> constant(@Nullable E paramE)
  {
    return new ConstantFunction(paramE);
  }
  
  public static <K, V> Function<K, V> forMap(Map<K, V> paramMap)
  {
    return new FunctionForMapNoDefault(paramMap);
  }
  
  public static <K, V> Function<K, V> forMap(Map<K, ? extends V> paramMap, @Nullable V paramV)
  {
    return new ForMapWithDefault(paramMap, paramV);
  }
  
  public static <T> Function<T, Boolean> forPredicate(Predicate<T> paramPredicate)
  {
    return new PredicateFunction(paramPredicate, null);
  }
  
  @Beta
  public static <T> Function<Object, T> forSupplier(Supplier<T> paramSupplier)
  {
    return new SupplierFunction(paramSupplier, null);
  }
  
  public static <E> Function<E, E> identity()
  {
    return IdentityFunction.INSTANCE;
  }
  
  public static Function<Object, String> toStringFunction()
  {
    return ToStringFunction.INSTANCE;
  }
  
  private static class ConstantFunction<E>
    implements Function<Object, E>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final E value;
    
    public ConstantFunction(@Nullable E paramE)
    {
      value = paramE;
    }
    
    public E apply(@Nullable Object paramObject)
    {
      return (E)value;
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof ConstantFunction))
      {
        paramObject = (ConstantFunction)paramObject;
        return Objects.equal(value, value);
      }
      return false;
    }
    
    public int hashCode()
    {
      if (value == null) {
        return 0;
      }
      return value.hashCode();
    }
    
    public String toString()
    {
      return "constant(" + value + ")";
    }
  }
  
  private static class ForMapWithDefault<K, V>
    implements Function<K, V>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final V defaultValue;
    final Map<K, ? extends V> map;
    
    ForMapWithDefault(Map<K, ? extends V> paramMap, @Nullable V paramV)
    {
      map = ((Map)Preconditions.checkNotNull(paramMap));
      defaultValue = paramV;
    }
    
    public V apply(@Nullable K paramK)
    {
      Object localObject = map.get(paramK);
      if ((localObject != null) || (map.containsKey(paramK))) {
        return (V)localObject;
      }
      return (V)defaultValue;
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof ForMapWithDefault))
      {
        paramObject = (ForMapWithDefault)paramObject;
        bool1 = bool2;
        if (map.equals(map))
        {
          bool1 = bool2;
          if (Objects.equal(defaultValue, defaultValue)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public int hashCode()
    {
      return Objects.hashCode(new Object[] { map, defaultValue });
    }
    
    public String toString()
    {
      return "forMap(" + map + ", defaultValue=" + defaultValue + ")";
    }
  }
  
  private static class FunctionComposition<A, B, C>
    implements Function<A, C>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Function<A, ? extends B> f;
    private final Function<B, C> g;
    
    public FunctionComposition(Function<B, C> paramFunction, Function<A, ? extends B> paramFunction1)
    {
      g = ((Function)Preconditions.checkNotNull(paramFunction));
      f = ((Function)Preconditions.checkNotNull(paramFunction1));
    }
    
    public C apply(@Nullable A paramA)
    {
      return (C)g.apply(f.apply(paramA));
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof FunctionComposition))
      {
        paramObject = (FunctionComposition)paramObject;
        bool1 = bool2;
        if (f.equals(f))
        {
          bool1 = bool2;
          if (g.equals(g)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public int hashCode()
    {
      return f.hashCode() ^ g.hashCode();
    }
    
    public String toString()
    {
      return g + "(" + f + ")";
    }
  }
  
  private static class FunctionForMapNoDefault<K, V>
    implements Function<K, V>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final Map<K, V> map;
    
    FunctionForMapNoDefault(Map<K, V> paramMap)
    {
      map = ((Map)Preconditions.checkNotNull(paramMap));
    }
    
    public V apply(@Nullable K paramK)
    {
      Object localObject = map.get(paramK);
      if ((localObject != null) || (map.containsKey(paramK))) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "Key '%s' not present in map", new Object[] { paramK });
        return (V)localObject;
      }
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof FunctionForMapNoDefault))
      {
        paramObject = (FunctionForMapNoDefault)paramObject;
        return map.equals(map);
      }
      return false;
    }
    
    public int hashCode()
    {
      return map.hashCode();
    }
    
    public String toString()
    {
      return "forMap(" + map + ")";
    }
  }
  
  private static enum IdentityFunction
    implements Function<Object, Object>
  {
    INSTANCE;
    
    private IdentityFunction() {}
    
    @Nullable
    public Object apply(@Nullable Object paramObject)
    {
      return paramObject;
    }
    
    public String toString()
    {
      return "identity";
    }
  }
  
  private static class PredicateFunction<T>
    implements Function<T, Boolean>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Predicate<T> predicate;
    
    private PredicateFunction(Predicate<T> paramPredicate)
    {
      predicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
    }
    
    public Boolean apply(@Nullable T paramT)
    {
      return Boolean.valueOf(predicate.apply(paramT));
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof PredicateFunction))
      {
        paramObject = (PredicateFunction)paramObject;
        return predicate.equals(predicate);
      }
      return false;
    }
    
    public int hashCode()
    {
      return predicate.hashCode();
    }
    
    public String toString()
    {
      return "forPredicate(" + predicate + ")";
    }
  }
  
  private static class SupplierFunction<T>
    implements Function<Object, T>, Serializable
  {
    private static final long serialVersionUID = 0L;
    private final Supplier<T> supplier;
    
    private SupplierFunction(Supplier<T> paramSupplier)
    {
      supplier = ((Supplier)Preconditions.checkNotNull(paramSupplier));
    }
    
    public T apply(@Nullable Object paramObject)
    {
      return (T)supplier.get();
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof SupplierFunction))
      {
        paramObject = (SupplierFunction)paramObject;
        return supplier.equals(supplier);
      }
      return false;
    }
    
    public int hashCode()
    {
      return supplier.hashCode();
    }
    
    public String toString()
    {
      return "forSupplier(" + supplier + ")";
    }
  }
  
  private static enum ToStringFunction
    implements Function<Object, String>
  {
    INSTANCE;
    
    private ToStringFunction() {}
    
    public String apply(Object paramObject)
    {
      Preconditions.checkNotNull(paramObject);
      return paramObject.toString();
    }
    
    public String toString()
    {
      return "toString";
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Functions
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */