package com.seeclickfix.ma.android.adapters;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentPagerAdapter;
import com.seeclickfix.ma.android.fragments.UnboxingFrag;
import java.util.ArrayList;

public class UnboxingPagerAdapter
  extends FragmentPagerAdapter
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "FragPageAdapter";
  private final int MAX_FRAGS = 3;
  ArrayList<Fragment> frags;
  int numFrags = 0;
  
  public UnboxingPagerAdapter(Fragment paramFragment)
  {
    super(paramFragment.getChildFragmentManager());
  }
  
  public int getCount()
  {
    return 3;
  }
  
  public Fragment getItem(int paramInt)
  {
    Fragment localFragment = UnboxingFrag.newInstance();
    Bundle localBundle = new Bundle();
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("position is inalid");
    case 0: 
      paramInt = 2130903098;
    }
    for (;;)
    {
      localBundle.putInt("unboxing_layout_id", paramInt);
      localFragment.setArguments(localBundle);
      numFrags += 1;
      return localFragment;
      paramInt = 2130903099;
      continue;
      paramInt = 2130903100;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.adapters.UnboxingPagerAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */