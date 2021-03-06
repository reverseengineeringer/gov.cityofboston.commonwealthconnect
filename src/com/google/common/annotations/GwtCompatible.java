package com.google.common.annotations;

import java.lang.annotation.Annotation;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Retention(RetentionPolicy.CLASS)
@Target({java.lang.annotation.ElementType.TYPE, java.lang.annotation.ElementType.METHOD})
@GwtCompatible
public @interface GwtCompatible
{
  boolean emulated() default false;
  
  boolean serializable() default false;
}

/* Location:
 * Qualified Name:     com.google.common.annotations.GwtCompatible
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */