package com.commonsware.cwac.loaderex;

import android.annotation.TargetApi;
import android.content.AsyncTaskLoader;
import android.content.Context;
import android.database.Cursor;

@TargetApi(11)
public abstract class AbstractCursorLoader
  extends AsyncTaskLoader<Cursor>
{
  Cursor lastCursor = null;
  
  public AbstractCursorLoader(Context paramContext)
  {
    super(paramContext);
  }
  
  protected abstract Cursor buildCursor();
  
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
      localCursor = lastCursor;
      lastCursor = paramCursor;
      if (isStarted()) {
        super.deliverResult(paramCursor);
      }
    } while ((localCursor == null) || (localCursor == paramCursor) || (localCursor.isClosed()));
    localCursor.close();
  }
  
  public Cursor loadInBackground()
  {
    Cursor localCursor = buildCursor();
    if (localCursor != null) {
      localCursor.getCount();
    }
    return localCursor;
  }
  
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
    if ((lastCursor != null) && (!lastCursor.isClosed())) {
      lastCursor.close();
    }
    lastCursor = null;
  }
  
  protected void onStartLoading()
  {
    if (lastCursor != null) {
      deliverResult(lastCursor);
    }
    if ((takeContentChanged()) || (lastCursor == null)) {
      forceLoad();
    }
  }
  
  protected void onStopLoading()
  {
    cancelLoad();
  }
}

/* Location:
 * Qualified Name:     com.commonsware.cwac.loaderex.AbstractCursorLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */