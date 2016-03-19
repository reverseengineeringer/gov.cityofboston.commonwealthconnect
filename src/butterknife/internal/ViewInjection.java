package butterknife.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

final class ViewInjection
{
  private final Set<FieldBinding> fieldBindings = new LinkedHashSet();
  private final int id;
  private final Map<Listener, MethodBinding> methodBindings = new LinkedHashMap();
  
  ViewInjection(int paramInt)
  {
    id = paramInt;
  }
  
  public void addFieldBinding(FieldBinding paramFieldBinding)
  {
    fieldBindings.add(paramFieldBinding);
  }
  
  public void addMethodBinding(Listener paramListener, MethodBinding paramMethodBinding)
  {
    MethodBinding localMethodBinding = (MethodBinding)methodBindings.get(paramListener);
    if (localMethodBinding != null) {
      throw new IllegalStateException("View " + id + " already has method binding for " + paramListener.getType() + " on " + localMethodBinding.getName());
    }
    methodBindings.put(paramListener, paramMethodBinding);
  }
  
  public Collection<FieldBinding> getFieldBindings()
  {
    return fieldBindings;
  }
  
  public int getId()
  {
    return id;
  }
  
  public Map<Listener, MethodBinding> getMethodBindings()
  {
    return Collections.unmodifiableMap(new LinkedHashMap(methodBindings));
  }
  
  public List<Binding> getRequiredBindings()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = fieldBindings.iterator();
    Object localObject;
    while (localIterator.hasNext())
    {
      localObject = (FieldBinding)localIterator.next();
      if (((FieldBinding)localObject).isRequired()) {
        localArrayList.add(localObject);
      }
    }
    localIterator = methodBindings.values().iterator();
    while (localIterator.hasNext())
    {
      localObject = (MethodBinding)localIterator.next();
      if (((MethodBinding)localObject).isRequired()) {
        localArrayList.add(localObject);
      }
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     butterknife.internal.ViewInjection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */