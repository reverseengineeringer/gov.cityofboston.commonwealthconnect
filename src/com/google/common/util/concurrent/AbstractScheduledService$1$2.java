package com.google.common.util.concurrent;

import com.google.common.base.Supplier;

class AbstractScheduledService$1$2
  implements Supplier<String>
{
  AbstractScheduledService$1$2(AbstractScheduledService.1 param1) {}
  
  public String get()
  {
    return this$1.this$0.serviceName() + " " + this$1.state();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService.1.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */