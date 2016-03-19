package com.seeclickfix.ma.android.location;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import com.google.common.base.Function;
import com.google.common.collect.Ordering;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.io.IOUtils;

public class TestLocationList
{
  static Function<PresetLocation, String> getPlaceName = new Function()
  {
    public String apply(PresetLocation paramAnonymousPresetLocation)
    {
      return paramAnonymousPresetLocation.name();
    }
  };
  private static List<PresetLocation> presetLocations = new ArrayList();
  
  public static List<PresetLocation> getPresetLocations(Context paramContext)
  {
    if (!presetLocations.isEmpty()) {
      return presetLocations;
    }
    try
    {
      paramContext = IOUtils.toString(paramContext.getResources().getAssets().open("json/test_locations.json"), "UTF-8");
      paramContext = new DeserializeResponse().getJavaObject(paramContext, PresetLocation.class);
      presetLocations = Ordering.natural().onResultOf(getPlaceName).sortedCopy(paramContext);
      return presetLocations;
    }
    catch (IOException paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.TestLocationList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */