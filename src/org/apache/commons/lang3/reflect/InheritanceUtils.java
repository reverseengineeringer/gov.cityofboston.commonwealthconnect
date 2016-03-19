package org.apache.commons.lang3.reflect;

import org.apache.commons.lang3.BooleanUtils;

public class InheritanceUtils
{
  public static int distance(Class<?> paramClass1, Class<?> paramClass2)
  {
    if ((paramClass1 == null) || (paramClass2 == null)) {}
    int i;
    do
    {
      return -1;
      if (paramClass1.equals(paramClass2)) {
        return 0;
      }
      paramClass1 = paramClass1.getSuperclass();
      i = BooleanUtils.toInteger(paramClass2.equals(paramClass1));
      if (i == 1) {
        return i;
      }
      i += distance(paramClass1, paramClass2);
    } while (i <= 0);
    return i + 1;
  }
}

/* Location:
 * Qualified Name:     org.apache.commons.lang3.reflect.InheritanceUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */