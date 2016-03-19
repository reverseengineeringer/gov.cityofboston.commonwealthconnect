package com.seeclickfix.ma.android.net;

import android.content.Context;
import android.database.Cursor;
import android.support.v4.content.AsyncTaskLoader;

public abstract class AbstractSimpleCursorLoader
  extends AsyncTaskLoader<Cursor>
{
  private Cursor mCursor;
  
  public AbstractSimpleCursorLoader(Context paramContext)
  {
    super(paramContext);
  }
  
  public void deliverResult(Cursor paramCursor)
  {
    if (isReset()) {
      if (paramCursor != null) {
        paramCursor.close();
      }
    }
    Cursor localCursor;
    do
    {
      return;
      localCursor = mCursor;
      mCursor = paramCursor;
      super.deliverResult(paramCursor);
    } while ((localCursor == null) || (localCursor == paramCursor) || (localCursor.isClosed()));
    localCursor.close();
  }
  
  public void forceLoad()
  {
    onForceLoad();
  }
  
  public abstract Cursor loadInBackground();
  
  public void onCanceled(Cursor paramCursor)
  {
    if ((paramCursor != null) && (!paramCursor.isClosed())) {
      paramCursor.close();
    }
  }
  
  protected void onReset()
  {
    super.onReset();
    onStopLoading();
    if ((mCursor != null) && (!mCursor.isClosed())) {
      mCursor.close();
    }
    mCursor = null;
  }
  
  protected void onStartLoading()
  {
    if (mCursor != null) {
      deliverResult(mCursor);
    }
    if ((takeContentChanged()) || (mCursor == null)) {
      forceLoad();
    }
  }
  
  protected void onStopLoading()
  {
    cancelLoad();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.AbstractSimpleCursorLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */