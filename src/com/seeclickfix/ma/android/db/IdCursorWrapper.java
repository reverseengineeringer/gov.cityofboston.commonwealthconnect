package com.seeclickfix.ma.android.db;

import android.database.Cursor;
import android.database.CursorWrapper;

public class IdCursorWrapper
  extends CursorWrapper
{
  private int idColumnIndex;
  
  public IdCursorWrapper(Cursor paramCursor, int paramInt)
  {
    super(paramCursor);
    idColumnIndex = paramInt;
  }
  
  public IdCursorWrapper(Cursor paramCursor, String paramString)
  {
    super(paramCursor);
    idColumnIndex = paramCursor.getColumnIndex(paramString);
  }
  
  public int getColumnIndex(String paramString)
  {
    int j = super.getColumnIndex(paramString);
    int i = j;
    if (j < 0)
    {
      i = j;
      if ("_id".equals(paramString)) {
        i = idColumnIndex;
      }
    }
    return i;
  }
  
  public int getColumnIndexOrThrow(String paramString)
    throws IllegalArgumentException
  {
    int i = getColumnIndex(paramString);
    if (i >= 0) {
      return i;
    }
    return super.getColumnIndexOrThrow(paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.IdCursorWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */