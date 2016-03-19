package com.seeclickfix.ma.android.fragments.interfaces;

import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;

public class SafeListener<T>
  extends SimpleListener<T>
{
  private BaseFrag fragment;
  private SimpleListener<T> unsafeListener;
  
  public SafeListener(BaseFrag paramBaseFrag, SimpleListener<T> paramSimpleListener)
  {
    fragment = paramBaseFrag;
    unsafeListener = paramSimpleListener;
  }
  
  public BaseFrag getFragment()
  {
    return fragment;
  }
  
  public boolean isAttached()
  {
    return fragment.getActivity() != null;
  }
  
  public void onFailure(SimpleListener.Code paramCode)
  {
    if (isAttached()) {
      unsafeListener.onFailure(paramCode);
    }
  }
  
  public void onStateChange(SimpleListener.SimpleState paramSimpleState, boolean paramBoolean)
  {
    if (isAttached())
    {
      unsafeListener.onStateChange(paramSimpleState, paramBoolean);
      if (paramSimpleState != SimpleListener.SimpleState.STARTED) {
        break label34;
      }
      getFragment().setFragState(BaseFrag.FragState.BUSY);
    }
    label34:
    while (paramSimpleState != SimpleListener.SimpleState.FINISHED) {
      return;
    }
    if (paramBoolean)
    {
      getFragment().setFragState(BaseFrag.FragState.ACTIVE);
      return;
    }
    getFragment().setFragState(BaseFrag.FragState.ERROR);
  }
  
  public void onSuccess(T paramT)
  {
    if (isAttached()) {
      unsafeListener.onSuccess(paramT);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.interfaces.SafeListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */