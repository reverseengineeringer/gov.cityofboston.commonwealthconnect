package com.seeclickfix.ma.android.objects.modules;

import com.seeclickfix.ma.android.fragments.AboutFrag;
import com.seeclickfix.ma.android.fragments.FeedFrag;
import com.seeclickfix.ma.android.fragments.PlacesFrag;
import com.seeclickfix.ma.android.fragments.PlacesMapFrag;
import com.seeclickfix.ma.android.fragments.ReportFragment;
import com.seeclickfix.ma.android.fragments.ReportMapFrag;
import dagger.Module;

@Module(complete=false, includes={LocationAdapterModule.class}, injects={FeedFrag.class, PlacesFrag.class, PlacesMapFrag.class, ReportFragment.class, ReportMapFrag.class, AboutFrag.class})
public class LocationUsingFragModule {}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.LocationUsingFragModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */