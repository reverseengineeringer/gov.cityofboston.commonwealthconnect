package com.seeclickfix.ma.android.fragments;

import android.os.AsyncTask;
import android.widget.AutoCompleteTextView;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.tasks.GetPlaceBySearchTask;
import com.seeclickfix.ma.android.views.ToastFactory;
import java.util.ArrayList;
import java.util.List;

class PlacesFrag$7
  extends AsyncTask<String, Void, Place>
{
  PlacesFrag$7(PlacesFrag paramPlacesFrag, String paramString) {}
  
  protected Place doInBackground(String... paramVarArgs)
  {
    paramVarArgs = new GetPlaceBySearchTask(PlacesFrag.access$300(this$0), null, PlacesFrag.access$400(this$0), paramVarArgs[0]).call();
    try
    {
      paramVarArgs = (Place)paramVarArgs.get(0);
      return paramVarArgs;
    }
    catch (Exception paramVarArgs) {}
    return null;
  }
  
  protected void onPostExecute(Place paramPlace)
  {
    if (this$0.getActivity() == null) {
      return;
    }
    super.onPostExecute(paramPlace);
    this$0.hideProgressWheelDialog();
    if ((paramPlace != null) && (paramPlace.getName() != null))
    {
      PlacesFrag localPlacesFrag = this$0;
      if (PlacesFrag.access$500(this$0) == null) {}
      for (Object localObject = new ArrayList();; localObject = PlacesFrag.access$500(this$0))
      {
        PlacesFrag.access$502(localPlacesFrag, (List)localObject);
        PlacesFrag.access$500(this$0).add(0, paramPlace);
        PlacesFrag.access$100(this$0).setText("");
        PlacesFrag.access$600(this$0, paramPlace);
        return;
      }
    }
    paramPlace = this$0.getString(2131493176, new Object[] { val$name });
    ToastFactory.showCenteredShortToast(this$0.getActivity(), paramPlace);
  }
  
  protected void onPreExecute()
  {
    super.onPreExecute();
    this$0.showProgressWheelDialog();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */