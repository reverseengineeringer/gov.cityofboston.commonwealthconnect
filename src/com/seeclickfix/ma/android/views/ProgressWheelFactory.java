package com.seeclickfix.ma.android.views;

import android.view.ViewGroup;
import android.widget.ProgressBar;
import com.alostpacket.pajamalib.utils.ViewUtil;

public class ProgressWheelFactory
{
  public static void addPorgreesWheel(ViewGroup paramViewGroup)
  {
    paramViewGroup.addView((ProgressBar)ViewUtil.inflate(paramViewGroup.getContext(), 2130903107, paramViewGroup));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.ProgressWheelFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */