package com.seeclickfix.ma.android.fragments;

import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.widget.AutoCompleteTextView;
import com.seeclickfix.ma.android.adapters.CityCursorAdapter;
import com.seeclickfix.ma.android.providers.DataProvider;

class PlacesFrag$2
  implements LoaderManager.LoaderCallbacks<Cursor>
{
  PlacesFrag$2(PlacesFrag paramPlacesFrag) {}
  
  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    PlacesFrag.access$002(this$0, new CityCursorAdapter(this$0.getActivity(), null, 0));
    paramBundle = this$0.getActivity().getApplicationContext();
    return new CursorLoader(paramBundle, DataProvider.getSearchCitiesUri(paramBundle), new String[] { "_id", "name", "state", "population" }, null, null, null);
  }
  
  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    if (this$0.getActivity() == null) {
      return;
    }
    try
    {
      if (PlacesFrag.access$000(this$0) != null)
      {
        PlacesFrag.access$000(this$0).swapCursor(paramCursor);
        PlacesFrag.access$100(this$0).setAdapter(PlacesFrag.access$000(this$0));
        PlacesFrag.access$100(this$0).setOnItemClickListener(this$0.autoCompleteListener);
        return;
      }
      PlacesFrag.access$002(this$0, new CityCursorAdapter(this$0.getActivity(), paramCursor, 0));
      PlacesFrag.access$100(this$0).setAdapter(PlacesFrag.access$000(this$0));
      PlacesFrag.access$100(this$0).setOnItemClickListener(this$0.autoCompleteListener);
      return;
    }
    catch (Exception paramLoader) {}
  }
  
  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
    if (PlacesFrag.access$000(this$0) != null)
    {
      PlacesFrag.access$000(this$0).swapCursor(null);
      PlacesFrag.access$002(this$0, null);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */