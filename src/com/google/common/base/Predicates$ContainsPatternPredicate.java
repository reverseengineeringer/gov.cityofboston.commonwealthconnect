package com.google.common.base;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Nullable;

@GwtIncompatible("Only used by other GWT-incompatible code.")
class Predicates$ContainsPatternPredicate
  implements Predicate<CharSequence>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Pattern pattern;
  
  Predicates$ContainsPatternPredicate(Pattern paramPattern)
  {
    pattern = ((Pattern)Preconditions.checkNotNull(paramPattern));
  }
  
  public boolean apply(CharSequence paramCharSequence)
  {
    return pattern.matcher(paramCharSequence).find();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof ContainsPatternPredicate))
    {
      paramObject = (ContainsPatternPredicate)paramObject;
      bool1 = bool2;
      if (Objects.equal(pattern.pattern(), pattern.pattern()))
      {
        bool1 = bool2;
        if (Objects.equal(Integer.valueOf(pattern.flags()), Integer.valueOf(pattern.flags()))) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { pattern.pattern(), Integer.valueOf(pattern.flags()) });
  }
  
  public String toString()
  {
    String str = Objects.toStringHelper(pattern).add("pattern", pattern.pattern()).add("pattern.flags", pattern.flags()).toString();
    return "Predicates.contains(" + str + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Predicates.ContainsPatternPredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */