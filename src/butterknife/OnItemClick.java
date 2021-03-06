package butterknife;

import butterknife.internal.ListenerClass;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@ListenerClass("android.widget.AdapterView.OnItemClickListener")
@Retention(RetentionPolicy.CLASS)
@Target({java.lang.annotation.ElementType.METHOD})
public @interface OnItemClick
{
  int[] value();
}

/* Location:
 * Qualified Name:     butterknife.OnItemClick
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */