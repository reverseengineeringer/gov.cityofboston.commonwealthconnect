package com.google.common.util.concurrent;

import com.google.common.base.Function;
import java.util.Map.Entry;

class ServiceManager$ServiceManagerState$4
  implements Function<Map.Entry<Service, Long>, Long>
{
  ServiceManager$ServiceManagerState$4(ServiceManager.ServiceManagerState paramServiceManagerState) {}
  
  public Long apply(Map.Entry<Service, Long> paramEntry)
  {
    return (Long)paramEntry.getValue();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager.ServiceManagerState.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */