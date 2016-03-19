package com.seeclickfix.ma.android.loaders;

import android.content.Context;
import android.support.v4.content.AsyncTaskLoader;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.tasks.CancellableTask;
import java.util.List;

public class PlaceAsyncLoader
  extends AsyncTaskLoader<List<Place>>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "PlaceAsyncLoader";
  private List<Place> list;
  private CancellableTask<List<Place>> task;
  
  public PlaceAsyncLoader(Context paramContext, CancellableTask<List<Place>> paramCancellableTask)
  {
    super(paramContext);
    task = paramCancellableTask;
  }
  
  public List<Place> loadInBackground()
  {
    try
    {
      list = ((List)task.call());
      return list;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.loaders.PlaceAsyncLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */