package com.seeclickfix.ma.android.objects;

import com.seeclickfix.ma.android.objects.types.FeedItem;

public class Separator
  implements FeedItem
{
  private int iconRes;
  private transient int index;
  private String text;
  
  public int getIconRes()
  {
    return iconRes;
  }
  
  public String getText()
  {
    return text;
  }
  
  public int getZeroBasedIndex()
  {
    return index;
  }
  
  public void setIconRes(int paramInt)
  {
    iconRes = paramInt;
  }
  
  public void setText(String paramString)
  {
    text = paramString;
  }
  
  public void setZeroBasedIndex(int paramInt)
  {
    index = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.Separator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */