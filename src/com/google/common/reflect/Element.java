package com.google.common.reflect;

import com.google.common.base.Preconditions;
import java.lang.annotation.Annotation;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Member;
import java.lang.reflect.Modifier;
import javax.annotation.Nullable;

class Element
  extends AccessibleObject
  implements Member
{
  private final AccessibleObject accessibleObject;
  private final Member member;
  
  <M extends AccessibleObject,  extends Member> Element(M paramM)
  {
    Preconditions.checkNotNull(paramM);
    accessibleObject = paramM;
    member = ((Member)paramM);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Element))
    {
      paramObject = (Element)paramObject;
      bool1 = bool2;
      if (getOwnerType().equals(((Element)paramObject).getOwnerType()))
      {
        bool1 = bool2;
        if (member.equals(member)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public final <A extends Annotation> A getAnnotation(Class<A> paramClass)
  {
    return accessibleObject.getAnnotation(paramClass);
  }
  
  public final Annotation[] getAnnotations()
  {
    return accessibleObject.getAnnotations();
  }
  
  public final Annotation[] getDeclaredAnnotations()
  {
    return accessibleObject.getDeclaredAnnotations();
  }
  
  public Class<?> getDeclaringClass()
  {
    return member.getDeclaringClass();
  }
  
  public final int getModifiers()
  {
    return member.getModifiers();
  }
  
  public final String getName()
  {
    return member.getName();
  }
  
  public TypeToken<?> getOwnerType()
  {
    return TypeToken.of(getDeclaringClass());
  }
  
  public int hashCode()
  {
    return member.hashCode();
  }
  
  public final boolean isAbstract()
  {
    return Modifier.isAbstract(getModifiers());
  }
  
  public final boolean isAccessible()
  {
    return accessibleObject.isAccessible();
  }
  
  public final boolean isAnnotationPresent(Class<? extends Annotation> paramClass)
  {
    return accessibleObject.isAnnotationPresent(paramClass);
  }
  
  public final boolean isFinal()
  {
    return Modifier.isFinal(getModifiers());
  }
  
  public final boolean isNative()
  {
    return Modifier.isNative(getModifiers());
  }
  
  public final boolean isPackagePrivate()
  {
    return (!isPrivate()) && (!isPublic()) && (!isProtected());
  }
  
  public final boolean isPrivate()
  {
    return Modifier.isPrivate(getModifiers());
  }
  
  public final boolean isProtected()
  {
    return Modifier.isProtected(getModifiers());
  }
  
  public final boolean isPublic()
  {
    return Modifier.isPublic(getModifiers());
  }
  
  public final boolean isStatic()
  {
    return Modifier.isStatic(getModifiers());
  }
  
  public final boolean isSynchronized()
  {
    return Modifier.isSynchronized(getModifiers());
  }
  
  public final boolean isSynthetic()
  {
    return member.isSynthetic();
  }
  
  final boolean isTransient()
  {
    return Modifier.isTransient(getModifiers());
  }
  
  final boolean isVolatile()
  {
    return Modifier.isVolatile(getModifiers());
  }
  
  public final void setAccessible(boolean paramBoolean)
    throws SecurityException
  {
    accessibleObject.setAccessible(paramBoolean);
  }
  
  public String toString()
  {
    return member.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Element
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */