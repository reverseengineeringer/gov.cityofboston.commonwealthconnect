package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.events.AuthRequiredEvent;
import com.seeclickfix.ma.android.objects.PageParams;

class MeFrag$1
  implements View.OnClickListener
{
  MeFrag$1(MeFrag paramMeFrag) {}
  
  public void onClick(View paramView)
  {
    if (!MeFrag.access$000(this$0))
    {
      MeFrag.access$100(this$0).setActionExtra("com.seeclickfix.actions.SHOW_ME_FRAG");
      MeFrag.access$200(new AuthRequiredEvent(MeFrag.access$100(this$0)));
      return;
    }
    this$0.logout();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.MeFrag.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */