package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.seeclickfix.ma.android.adapters.UnboxingPagerAdapter;
import com.seeclickfix.ma.android.events.UnboxingContinueEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.viewpagerindicator.CirclePageIndicator;

public class UnboxingPagerFrag
  extends BaseFrag
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final int SWIPE_MAX_OFF_PATH = 250;
  private static final int SWIPE_MIN_DISTANCE = 120;
  private static final int SWIPE_THRESHOLD_VELOCITY = 200;
  private static final String TAG = "PagerFrag";
  private final int MAX_PAGES = 3;
  private Context c;
  private CirclePageIndicator circlePageIndicator;
  private ImageButton continueBtn;
  private int currentPage = 0;
  private GestureDetector gestureDetector;
  View.OnTouchListener gestureListener;
  UnboxingPagerAdapter mAdapter;
  ViewPager mPager;
  private ViewPager.OnPageChangeListener pageChangeListener;
  private TextView skipBtn;
  
  private void advanceToHome()
  {
    postEvent(new UnboxingContinueEvent());
  }
  
  private void setCurrentPage(int paramInt)
  {
    if (paramInt <= 0)
    {
      currentPage = 0;
      mPager.setCurrentItem(currentPage);
      return;
    }
    if (paramInt >= 3)
    {
      advanceToHome();
      return;
    }
    currentPage = paramInt;
    mPager.setCurrentItem(currentPage);
  }
  
  private void setSwipeListener()
  {
    rootFrag.setOverScrollMode(0);
    gestureDetector = new GestureDetector(new MyGestureDetector());
    gestureListener = new View.OnTouchListener()
    {
      public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
      {
        return gestureDetector.onTouchEvent(paramAnonymousMotionEvent);
      }
    };
    mPager.setOnTouchListener(gestureListener);
  }
  
  private void setupListeners()
  {
    skipBtn = ((TextView)rootFrag.findViewById(2131362081));
    skipBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        paramAnonymousView = ObjectAnimator.ofFloat(skipBtn, "alpha", new float[] { 0.0F, 1.0F });
        paramAnonymousView.setDuration(50L);
        paramAnonymousView.start();
        UnboxingPagerFrag.this.advanceToHome();
      }
    });
    pageChangeListener = new ViewPager.OnPageChangeListener()
    {
      public void onPageScrollStateChanged(int paramAnonymousInt) {}
      
      public void onPageScrolled(int paramAnonymousInt1, float paramAnonymousFloat, int paramAnonymousInt2) {}
      
      public void onPageSelected(int paramAnonymousInt)
      {
        if (paramAnonymousInt <= 0) {
          UnboxingPagerFrag.access$202(UnboxingPagerFrag.this, 0);
        }
        while (paramAnonymousInt >= 3) {
          return;
        }
        UnboxingPagerFrag.access$202(UnboxingPagerFrag.this, paramAnonymousInt);
      }
    };
  }
  
  public void checkForFinishSwipe()
  {
    if (currentPage >= 2) {
      advanceToHome();
    }
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public boolean getShouldShowActionBar()
  {
    return false;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
    mAdapter = new UnboxingPagerAdapter(this);
    mPager = ((ViewPager)rootFrag.findViewById(2131362078));
    circlePageIndicator = ((CirclePageIndicator)rootFrag.findViewById(2131362080));
    setupListeners();
    mPager.setAdapter(mAdapter);
    circlePageIndicator.setViewPager(mPager, 0);
    circlePageIndicator.setOnPageChangeListener(pageChangeListener);
    setSwipeListener();
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903102, paramViewGroup, false));
    return rootFrag;
  }
  
  public void onResume()
  {
    super.onResume();
    getSherlockActivity().getSupportActionBar().hide();
  }
  
  class MyGestureDetector
    extends GestureDetector.SimpleOnGestureListener
  {
    MyGestureDetector() {}
    
    public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      try
      {
        if (Math.abs(paramMotionEvent1.getY() - paramMotionEvent2.getY()) > 250.0F) {
          return false;
        }
        if ((paramMotionEvent1.getX() - paramMotionEvent2.getX() > 120.0F) && (Math.abs(paramFloat1) > 200.0F))
        {
          checkForFinishSwipe();
          return false;
        }
        if (paramMotionEvent2.getX() - paramMotionEvent1.getX() > 120.0F)
        {
          paramFloat1 = Math.abs(paramFloat1);
          if (paramFloat1 <= 200.0F) {}
        }
        return false;
      }
      catch (Exception paramMotionEvent1) {}
      return false;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.UnboxingPagerFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */