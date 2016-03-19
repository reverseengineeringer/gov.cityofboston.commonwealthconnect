package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.Collection;

class StandardTable$Column$KeySet
  extends Maps.KeySet<R, V>
{
  StandardTable$Column$KeySet(StandardTable.Column paramColumn)
  {
    super(paramColumn);
  }
  
  public boolean contains(Object paramObject)
  {
    return this$1.this$0.contains(paramObject, this$1.columnKey);
  }
  
  public boolean remove(Object paramObject)
  {
    return this$1.this$0.remove(paramObject, this$1.columnKey) != null;
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return this$1.removeFromColumnIf(Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramCollection))));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.Column.KeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */