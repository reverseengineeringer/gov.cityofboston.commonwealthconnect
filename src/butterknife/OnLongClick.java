package butterknife;

import butterknife.internal.ListenerClass;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@ListenerClass("android.view.View.OnLongClickListener")
@Retention(RetentionPolicy.CLASS)
@Target({java.lang.annotation.ElementType.METHOD})
public @interface OnLongClick
{
  int[] value();
}

/* Location:
 * Qualified Name:     butterknife.OnLongClick
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */