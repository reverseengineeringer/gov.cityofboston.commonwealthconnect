package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import com.google.common.collect.Sets;
import java.util.Set;

class ServiceManager$ServiceManagerState$1
  implements Supplier<Set<Service>>
{
  ServiceManager$ServiceManagerState$1(ServiceManager.ServiceManagerState paramServiceManagerState) {}
  
  public Set<Service> get()
  {
    return Sets.newLinkedHashSet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager.ServiceManagerState.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */