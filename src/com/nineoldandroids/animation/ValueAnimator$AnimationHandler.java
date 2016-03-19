package com.nineoldandroids.animation;

import android.os.Handler;
import android.os.Message;
import android.view.animation.AnimationUtils;
import java.util.ArrayList;

class ValueAnimator$AnimationHandler
  extends Handler
{
  public void handleMessage(Message paramMessage)
  {
    int j = 1;
    int i = 1;
    ArrayList localArrayList1 = (ArrayList)ValueAnimator.access$000().get();
    ArrayList localArrayList2 = (ArrayList)ValueAnimator.access$100().get();
    switch (what)
    {
    }
    label112:
    label151:
    long l;
    do
    {
      return;
      paramMessage = (ArrayList)ValueAnimator.access$200().get();
      if ((localArrayList1.size() > 0) || (localArrayList2.size() > 0)) {
        i = 0;
      }
      j = i;
      ValueAnimator localValueAnimator;
      if (paramMessage.size() > 0)
      {
        localObject = (ArrayList)paramMessage.clone();
        paramMessage.clear();
        k = ((ArrayList)localObject).size();
        j = 0;
        if (j < k)
        {
          localValueAnimator = (ValueAnimator)((ArrayList)localObject).get(j);
          if (ValueAnimator.access$300(localValueAnimator) != 0L) {
            break label151;
          }
          ValueAnimator.access$400(localValueAnimator);
        }
        for (;;)
        {
          j += 1;
          break label112;
          break;
          localArrayList2.add(localValueAnimator);
        }
      }
      l = AnimationUtils.currentAnimationTimeMillis();
      Object localObject = (ArrayList)ValueAnimator.access$500().get();
      paramMessage = (ArrayList)ValueAnimator.access$600().get();
      int k = localArrayList2.size();
      i = 0;
      while (i < k)
      {
        localValueAnimator = (ValueAnimator)localArrayList2.get(i);
        if (ValueAnimator.access$700(localValueAnimator, l)) {
          ((ArrayList)localObject).add(localValueAnimator);
        }
        i += 1;
      }
      k = ((ArrayList)localObject).size();
      if (k > 0)
      {
        i = 0;
        while (i < k)
        {
          localValueAnimator = (ValueAnimator)((ArrayList)localObject).get(i);
          ValueAnimator.access$400(localValueAnimator);
          ValueAnimator.access$802(localValueAnimator, true);
          localArrayList2.remove(localValueAnimator);
          i += 1;
        }
        ((ArrayList)localObject).clear();
      }
      i = localArrayList1.size();
      k = 0;
      while (k < i)
      {
        localObject = (ValueAnimator)localArrayList1.get(k);
        if (((ValueAnimator)localObject).animationFrame(l)) {
          paramMessage.add(localObject);
        }
        if (localArrayList1.size() == i)
        {
          k += 1;
        }
        else
        {
          i -= 1;
          paramMessage.remove(localObject);
        }
      }
      if (paramMessage.size() > 0)
      {
        i = 0;
        while (i < paramMessage.size())
        {
          ValueAnimator.access$900((ValueAnimator)paramMessage.get(i));
          i += 1;
        }
        paramMessage.clear();
      }
    } while ((j == 0) || ((localArrayList1.isEmpty()) && (localArrayList2.isEmpty())));
    sendEmptyMessageDelayed(1, Math.max(0L, ValueAnimator.access$1000() - (AnimationUtils.currentAnimationTimeMillis() - l)));
  }
}

/* Location:
 * Qualified Name:     com.nineoldandroids.animation.ValueAnimator.AnimationHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */