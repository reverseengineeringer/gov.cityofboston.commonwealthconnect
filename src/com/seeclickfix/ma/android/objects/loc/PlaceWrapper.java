package com.seeclickfix.ma.android.objects.loc;

import com.google.gson.annotations.SerializedName;
import com.seeclickfix.ma.android.objects.ErrorResponse;
import java.util.List;

public class PlaceWrapper
{
  @SerializedName("errors")
  List<ErrorResponse> errors;
  @SerializedName("metadata")
  PlaceMetadata placeMetadata;
  @SerializedName("places")
  List<Place> placesList;
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.loc.PlaceWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */