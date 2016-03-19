package net.sqlcipher;

import android.database.CrossProcessCursor;
import android.database.CursorWindow;

public class CrossProcessCursorWrapper
  extends CursorWrapper
  implements CrossProcessCursor
{
  public CrossProcessCursorWrapper(Cursor paramCursor)
  {
    super(paramCursor);
  }
  
  public void fillWindow(int paramInt, CursorWindow paramCursorWindow)
  {
    if ((paramInt < 0) || (paramInt > getCount())) {
      return;
    }
    paramCursorWindow.acquireReference();
    for (;;)
    {
      try
      {
        moveToPosition(paramInt - 1);
        paramCursorWindow.clear();
        paramCursorWindow.setStartPosition(paramInt);
        int i = getColumnCount();
        paramCursorWindow.setNumColumns(i);
        if ((moveToNext()) && (paramCursorWindow.allocRow()))
        {
          paramInt = 0;
          if (paramInt >= i) {
            continue;
          }
          String str = getString(paramInt);
          if (str == null) {
            continue;
          }
          if (paramCursorWindow.putString(str, getPosition(), paramInt)) {
            break label134;
          }
          paramCursorWindow.freeLastRow();
        }
      }
      catch (IllegalStateException localIllegalStateException)
      {
        return;
        if (!paramCursorWindow.putNull(getPosition(), paramInt))
        {
          paramCursorWindow.freeLastRow();
          continue;
        }
      }
      finally
      {
        paramCursorWindow.releaseReference();
      }
      label134:
      paramInt += 1;
    }
  }
  
  public CursorWindow getWindow()
  {
    return null;
  }
  
  public boolean onMove(int paramInt1, int paramInt2)
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.CrossProcessCursorWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */