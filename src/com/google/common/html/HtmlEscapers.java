package com.google.common.html;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.escape.Escaper;
import com.google.common.escape.Escapers;
import com.google.common.escape.Escapers.Builder;

@Beta
@GwtCompatible
public final class HtmlEscapers
{
  private static final Escaper HTML_ESCAPER = Escapers.builder().addEscape('"', "&quot;").addEscape('\'', "&#39;").addEscape('&', "&amp;").addEscape('<', "&lt;").addEscape('>', "&gt;").build();
  
  public static Escaper htmlEscaper()
  {
    return HTML_ESCAPER;
  }
}

/* Location:
 * Qualified Name:     com.google.common.html.HtmlEscapers
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */