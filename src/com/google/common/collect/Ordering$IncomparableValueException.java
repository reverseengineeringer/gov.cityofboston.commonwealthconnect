package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;

@VisibleForTesting
class Ordering$IncomparableValueException
  extends ClassCastException
{
  private static final long serialVersionUID = 0L;
  final Object value;
  
  Ordering$IncomparableValueException(Object paramObject)
  {
    super("Cannot compare value: " + paramObject);
    value = paramObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Ordering.IncomparableValueException
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */