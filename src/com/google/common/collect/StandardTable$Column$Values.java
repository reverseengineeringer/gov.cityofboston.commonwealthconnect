package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.Collection;

class StandardTable$Column$Values
  extends Maps.Values<R, V>
{
  StandardTable$Column$Values(StandardTable.Column paramColumn)
  {
    super(paramColumn);
  }
  
  public boolean remove(Object paramObject)
  {
    return (paramObject != null) && (this$1.removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.equalTo(paramObject))));
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return this$1.removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.in(paramCollection)));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return this$1.removeFromColumnIf(Maps.valuePredicateOnEntries(Predicates.not(Predicates.in(paramCollection))));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.Column.Values
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */