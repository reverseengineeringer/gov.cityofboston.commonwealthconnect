package com.seeclickfix.ma.android.fragments;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.actionbarsherlock.app.SherlockFragment;

public class UnboxingFrag
  extends SherlockFragment
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "UnboxingFrag";
  private Context c;
  private int layoutId;
  private ViewGroup rootFrag;
  
  public static Fragment newInstance()
  {
    return new UnboxingFrag();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    layoutId = getArguments().getInt("unboxing_layout_id");
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(layoutId, paramViewGroup, false));
    return rootFrag;
  }
  
  public void onDetach()
  {
    super.onDetach();
  }
  
  public void onResume()
  {
    super.onResume();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.UnboxingFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */