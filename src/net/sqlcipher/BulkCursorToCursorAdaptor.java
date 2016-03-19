package net.sqlcipher;

import android.database.CharArrayBuffer;
import android.database.ContentObserver;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.Log;
import java.util.HashMap;
import java.util.Map;

public final class BulkCursorToCursorAdaptor
  extends AbstractWindowedCursor
{
  private static final String TAG = "BulkCursor";
  private IBulkCursor mBulkCursor;
  private String[] mColumns;
  private int mCount;
  private AbstractCursor.SelfContentObserver mObserverBridge;
  private boolean mWantsAllOnMoveCalls;
  
  public static int findRowIdColumnIndex(String[] paramArrayOfString)
  {
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      if (paramArrayOfString[i].equals("_id")) {
        return i;
      }
      i += 1;
    }
    return -1;
  }
  
  public void close()
  {
    super.close();
    try
    {
      mBulkCursor.close();
      mWindow = null;
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        Log.w("BulkCursor", "Remote process exception when closing");
      }
    }
  }
  
  public boolean commitUpdates(Map<? extends Long, ? extends Map<String, Object>> paramMap)
  {
    if (!supportsUpdates())
    {
      Log.e("BulkCursor", "commitUpdates not supported on this cursor, did you include the _id column?");
      return false;
    }
    localHashMap = mUpdatedRows;
    if (paramMap != null) {}
    try
    {
      mUpdatedRows.putAll(paramMap);
      return mUpdatedRows.size() > 0;
    }
    finally
    {
      try
      {
        boolean bool = mBulkCursor.updateRows(mUpdatedRows);
        if (bool == true)
        {
          mUpdatedRows.clear();
          onChange(true);
        }
        return bool;
      }
      catch (RemoteException paramMap)
      {
        Log.e("BulkCursor", "Unable to commit updates because the remote process is dead");
      }
      paramMap = finally;
    }
  }
  
  public void copyStringToBuffer(int paramInt, CharArrayBuffer paramCharArrayBuffer) {}
  
  public void deactivate()
  {
    super.deactivate();
    try
    {
      mBulkCursor.deactivate();
      mWindow = null;
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        Log.w("BulkCursor", "Remote process exception when deactivating");
      }
    }
  }
  
  public boolean deleteRow()
  {
    try
    {
      boolean bool2 = mBulkCursor.deleteRow(mPos);
      boolean bool1 = bool2;
      if (bool2)
      {
        mWindow = null;
        mCount = mBulkCursor.count();
        if (mPos < mCount)
        {
          int i = mPos;
          mPos = -1;
          moveToPosition(i);
        }
        for (;;)
        {
          onChange(true);
          return bool2;
          mPos = mCount;
        }
      }
      return bool1;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("BulkCursor", "Unable to delete row because the remote process is dead");
      bool1 = false;
    }
  }
  
  public String[] getColumnNames()
  {
    if (mColumns == null) {}
    try
    {
      mColumns = mBulkCursor.getColumnNames();
      return mColumns;
    }
    catch (RemoteException localRemoteException)
    {
      Log.e("BulkCursor", "Unable to fetch column names because the remote process is dead");
    }
    return null;
  }
  
  public int getCount()
  {
    return mCount;
  }
  
  public Bundle getExtras()
  {
    try
    {
      Bundle localBundle = mBulkCursor.getExtras();
      return localBundle;
    }
    catch (RemoteException localRemoteException)
    {
      throw new RuntimeException(localRemoteException);
    }
  }
  
  public IContentObserver getObserver()
  {
    try
    {
      if (mObserverBridge == null) {
        mObserverBridge = new AbstractCursor.SelfContentObserver(this);
      }
      return null;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean onMove(int paramInt1, int paramInt2)
  {
    for (;;)
    {
      try
      {
        if (mWindow != null)
        {
          if ((paramInt2 < mWindow.getStartPosition()) || (paramInt2 >= mWindow.getStartPosition() + mWindow.getNumRows()))
          {
            mWindow = mBulkCursor.getWindow(paramInt2);
            if (mWindow != null) {
              break;
            }
            return false;
          }
          if (!mWantsAllOnMoveCalls) {
            continue;
          }
          mBulkCursor.onMove(paramInt2);
          continue;
        }
        mWindow = mBulkCursor.getWindow(paramInt2);
      }
      catch (RemoteException localRemoteException)
      {
        Log.e("BulkCursor", "Unable to get window because the remote process is dead");
        return false;
      }
    }
    return true;
  }
  
  public void registerContentObserver(ContentObserver paramContentObserver) {}
  
  public void registerDataSetObserver(DataSetObserver paramDataSetObserver) {}
  
  public boolean requery()
  {
    try
    {
      int i = mCount;
      mCount = mBulkCursor.requery(getObserver(), new CursorWindow(false));
      if (mCount != -1)
      {
        mPos = -1;
        mWindow = null;
        super.requery();
        return true;
      }
      deactivate();
      return false;
    }
    catch (Exception localException)
    {
      Log.e("BulkCursor", "Unable to requery because the remote process exception " + localException.getMessage());
      deactivate();
    }
    return false;
  }
  
  public Bundle respond(Bundle paramBundle)
  {
    try
    {
      paramBundle = mBulkCursor.respond(paramBundle);
      return paramBundle;
    }
    catch (RemoteException paramBundle)
    {
      Log.w("BulkCursor", "respond() threw RemoteException, returning an empty bundle.", paramBundle);
    }
    return Bundle.EMPTY;
  }
  
  public void set(IBulkCursor paramIBulkCursor)
  {
    mBulkCursor = paramIBulkCursor;
    try
    {
      mCount = mBulkCursor.count();
      mWantsAllOnMoveCalls = mBulkCursor.getWantsAllOnMoveCalls();
      mColumns = mBulkCursor.getColumnNames();
      mRowIdColumnIndex = findRowIdColumnIndex(mColumns);
      return;
    }
    catch (RemoteException paramIBulkCursor)
    {
      Log.e("BulkCursor", "Setup failed because the remote process is dead");
    }
  }
  
  public void set(IBulkCursor paramIBulkCursor, int paramInt1, int paramInt2)
  {
    mBulkCursor = paramIBulkCursor;
    mColumns = null;
    mCount = paramInt1;
    mRowIdColumnIndex = paramInt2;
  }
  
  public void unregisterContentObserver(ContentObserver paramContentObserver) {}
  
  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver) {}
}

/* Location:
 * Qualified Name:     net.sqlcipher.BulkCursorToCursorAdaptor
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */