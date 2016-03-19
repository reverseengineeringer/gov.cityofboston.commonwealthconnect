package com.seeclickfix.ma.android.style.color;

import android.content.Context;
import android.content.res.Resources;
import com.seeclickfix.ma.android.config.mappings.StatusMap;
import java.util.List;

public class StatusColor
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "StatusColor";
  private static int cardDarkHeaderGrey;
  private static int cardHeaderGrey;
  private static int scfBlue;
  private static int scfDarkBlue;
  private static int scfDarkGreen;
  private static int scfDarkOrange;
  private static int scfGreen;
  private static int scfOrange;
  private static List<String> statusStates;
  
  public static int getBackground(String paramString, Context paramContext)
  {
    if (cardHeaderGrey <= 0) {
      initColorsAndStrings(paramContext);
    }
    int i = 0;
    if (paramString == null) {
      return cardHeaderGrey;
    }
    if (paramString.equals(statusStates.get(0))) {
      i = scfOrange;
    }
    for (;;)
    {
      return i;
      if (paramString.equals(statusStates.get(1))) {
        i = scfBlue;
      } else if (paramString.equals(statusStates.get(2))) {
        i = scfGreen;
      } else if (paramString.equals(statusStates.get(3))) {
        i = scfBlue;
      }
    }
  }
  
  public static int getForeground(String paramString, Context paramContext)
  {
    if (cardHeaderGrey <= 0) {
      initColorsAndStrings(paramContext);
    }
    int i = 0;
    if (paramString == null) {
      return cardHeaderGrey;
    }
    if (paramString.equals(statusStates.get(0))) {
      i = scfDarkOrange;
    }
    for (;;)
    {
      return i;
      if (paramString.equals(statusStates.get(1))) {
        i = scfDarkBlue;
      } else if (paramString.equals(statusStates.get(2))) {
        i = scfDarkGreen;
      } else if (paramString.equals(statusStates.get(3))) {
        i = scfDarkBlue;
      }
    }
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
    statusStates = StatusMap.getStatusStateKeys();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.style.color.StatusColor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */