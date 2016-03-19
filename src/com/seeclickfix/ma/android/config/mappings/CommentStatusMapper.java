package com.seeclickfix.ma.android.config.mappings;

import android.content.Context;
import android.content.res.Resources;

public class CommentStatusMapper
{
  private static int cardDarkHeaderGrey;
  private static int cardHeaderGrey;
  private static int scfBlue;
  private static int scfDarkBlue;
  private static int scfDarkGreen;
  private static int scfDarkOrange;
  private static int scfGreen;
  private static int scfOrange;
  
  public static int getBackground(String paramString, Context paramContext)
  {
    if (cardHeaderGrey <= 0) {
      initColorsAndStrings(paramContext);
    }
    if (paramString.equals("Issue Acknowledged")) {
      return scfGreen;
    }
    if (paramString.equals("Issue Closed")) {
      return scfBlue;
    }
    if (paramString.equals("Issue Reopened")) {
      return scfOrange;
    }
    if (paramString.equals("Issue Voted For")) {
      return scfGreen;
    }
    if (paramString.equals("Comment")) {
      return cardHeaderGrey;
    }
    if (paramString.equals("Watcher Added")) {
      return scfGreen;
    }
    if (paramString.equals("Thank You")) {
      return scfGreen;
    }
    return 0;
  }
  
  public static int getColorForCommentType(String paramString, Context paramContext)
  {
    if (cardHeaderGrey <= 0) {
      initColorsAndStrings(paramContext);
    }
    if (paramString.equals("Issue Acknowledged")) {
      return scfDarkGreen;
    }
    if (paramString.equals("Issue Closed")) {
      return scfDarkBlue;
    }
    if (paramString.equals("Issue Reopened")) {
      return scfDarkOrange;
    }
    if (paramString.equals("Issue Voted For")) {
      return scfDarkGreen;
    }
    if (paramString.equals("Comment")) {
      return cardDarkHeaderGrey;
    }
    if (paramString.equals("Watcher Added")) {
      return scfDarkGreen;
    }
    if (paramString.equals("Thank You")) {
      return scfDarkGreen;
    }
    return 0;
  }
  
  public static String getCommentStatus(String paramString, Context paramContext)
  {
    paramContext = paramContext.getResources();
    if (paramString.equals("Issue Acknowledged")) {
      return paramContext.getString(2131492894);
    }
    if (paramString.equals("Issue Closed")) {
      return paramContext.getString(2131492895);
    }
    if (paramString.equals("Issue Reopened")) {
      return paramContext.getString(2131492897);
    }
    if (paramString.equals("Issue Voted For")) {
      return paramContext.getString(2131492899);
    }
    if (paramString.equals("Comment")) {
      return paramContext.getString(2131492896);
    }
    if (paramString.equals("Watcher Added")) {
      return paramContext.getString(2131492900);
    }
    if (paramString.equals("Thank You")) {
      return paramContext.getString(2131492898);
    }
    return "NOT_DISPLAYABLE";
  }
  
  public static String getCommentToast(String paramString, Object paramObject, Context paramContext)
  {
    Resources localResources = paramContext.getResources();
    paramContext = null;
    if (paramString.equals("Issue Acknowledged")) {
      paramContext = localResources.getString(2131492888, new Object[] { paramObject });
    }
    do
    {
      return paramContext;
      if (paramString.equals("Issue Closed")) {
        return localResources.getString(2131492889, new Object[] { paramObject });
      }
      if (paramString.equals("Issue Reopened")) {
        return localResources.getString(2131492891, new Object[] { paramObject });
      }
      if (paramString.equals("Issue Voted For")) {
        return localResources.getString(2131492892, new Object[] { paramObject });
      }
      if (paramString.equals("Comment")) {
        return localResources.getString(2131492890, new Object[] { paramObject });
      }
    } while (!paramString.equals("Watcher Added"));
    return localResources.getString(2131492893, new Object[] { paramObject });
  }
  
  private static void initColorsAndStrings(Context paramContext)
  {
    cardHeaderGrey = paramContext.getResources().getColor(2131230751);
    scfBlue = paramContext.getResources().getColor(2131230750);
    scfOrange = paramContext.getResources().getColor(2131230771);
    scfGreen = paramContext.getResources().getColor(2131230759);
    cardDarkHeaderGrey = paramContext.getResources().getColor(2131230779);
    scfDarkBlue = paramContext.getResources().getColor(2131230777);
    scfDarkOrange = paramContext.getResources().getColor(2131230780);
    scfDarkGreen = paramContext.getResources().getColor(2131230778);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.mappings.CommentStatusMapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */