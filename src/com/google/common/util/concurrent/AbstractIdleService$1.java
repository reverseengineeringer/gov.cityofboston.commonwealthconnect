package com.google.common.util.concurrent;

import com.google.common.base.Supplier;

class AbstractIdleService$1
  implements Supplier<String>
{
  AbstractIdleService$1(AbstractIdleService paramAbstractIdleService) {}
  
  public String get()
  {
    return this$0.serviceName() + " " + this$0.state();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractIdleService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */