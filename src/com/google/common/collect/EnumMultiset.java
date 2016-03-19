package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Collection;
import java.util.EnumMap;
import java.util.Iterator;

@GwtCompatible(emulated=true)
public final class EnumMultiset<E extends Enum<E>>
  extends AbstractMapBasedMultiset<E>
{
  @GwtIncompatible("Not needed in emulated source")
  private static final long serialVersionUID = 0L;
  private transient Class<E> type;
  
  private EnumMultiset(Class<E> paramClass)
  {
    super(WellBehavedMap.wrap(new EnumMap(paramClass)));
    type = paramClass;
  }
  
  public static <E extends Enum<E>> EnumMultiset<E> create(Class<E> paramClass)
  {
    return new EnumMultiset(paramClass);
  }
  
  public static <E extends Enum<E>> EnumMultiset<E> create(Iterable<E> paramIterable)
  {
    Object localObject = paramIterable.iterator();
    Preconditions.checkArgument(((Iterator)localObject).hasNext(), "EnumMultiset constructor passed empty Iterable");
    localObject = new EnumMultiset(((Enum)((Iterator)localObject).next()).getDeclaringClass());
    Iterables.addAll((Collection)localObject, paramIterable);
    return (EnumMultiset<E>)localObject;
  }
  
  public static <E extends Enum<E>> EnumMultiset<E> create(Iterable<E> paramIterable, Class<E> paramClass)
  {
    paramClass = create(paramClass);
    Iterables.addAll(paramClass, paramIterable);
    return paramClass;
  }
  
  @GwtIncompatible("java.io.ObjectInputStream")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    type = ((Class)paramObjectInputStream.readObject());
    setBackingMap(WellBehavedMap.wrap(new EnumMap(type)));
    Serialization.populateMultiset(this, paramObjectInputStream);
  }
  
  @GwtIncompatible("java.io.ObjectOutputStream")
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    paramObjectOutputStream.writeObject(type);
    Serialization.writeMultiset(this, paramObjectOutputStream);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.EnumMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */