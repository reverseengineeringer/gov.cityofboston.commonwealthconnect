package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.File;
import java.io.FilenameFilter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Nullable;

@Beta
public final class PatternFilenameFilter
  implements FilenameFilter
{
  private final Pattern pattern;
  
  public PatternFilenameFilter(String paramString)
  {
    this(Pattern.compile(paramString));
  }
  
  public PatternFilenameFilter(Pattern paramPattern)
  {
    pattern = ((Pattern)Preconditions.checkNotNull(paramPattern));
  }
  
  public boolean accept(@Nullable File paramFile, String paramString)
  {
    return pattern.matcher(paramString).matches();
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.PatternFilenameFilter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */