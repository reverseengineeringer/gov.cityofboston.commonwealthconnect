package butterknife;

import butterknife.internal.ListenerClass;
import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@ListenerClass("android.widget.TextView.OnEditorActionListener")
@Retention(RetentionPolicy.CLASS)
@Target({java.lang.annotation.ElementType.METHOD})
public @interface OnEditorAction
{
  int[] value();
}

/* Location:
 * Qualified Name:     butterknife.OnEditorAction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */