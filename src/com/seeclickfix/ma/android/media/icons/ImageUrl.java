package com.seeclickfix.ma.android.media.icons;

import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.util.StringUtil;

public class ImageUrl
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ImageUrl";
  
  public static String getSmallUrlForIssue(Issue paramIssue, String paramString)
  {
    paramString = null;
    if (paramIssue.getPhotoSmallUrl() != null) {
      paramString = paramIssue.getPhotoSmallUrl();
    }
    do
    {
      return paramString;
      if (paramIssue.getCategoryIcon() != null) {
        return paramIssue.getCategoryIcon();
      }
    } while (paramIssue.getIconSquare() == null);
    return paramIssue.getIconSquare();
  }
  
  public static String getUrlForIssue(Issue paramIssue, String paramString)
  {
    String str = null;
    if (paramIssue.getPhotoLargeUrl() != null) {
      str = paramIssue.getPhotoLargeUrl();
    }
    for (;;)
    {
      paramIssue = str;
      if (str != null) {
        paramIssue = paramString + StringUtil.getFileNameFromUrl(str);
      }
      return paramIssue;
      if (paramIssue.getPhotoSmallUrl() != null) {
        str = paramIssue.getPhotoSmallUrl();
      } else if (paramIssue.getCategoryIcon() != null) {
        str = paramIssue.getCategoryIcon();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.icons.ImageUrl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */