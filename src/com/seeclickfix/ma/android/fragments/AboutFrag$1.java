package com.seeclickfix.ma.android.fragments;

import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.seeclickfix.ma.android.SimpleAlertDialog;

class AboutFrag$1
  implements View.OnClickListener
{
  AboutFrag$1(AboutFrag paramAboutFrag) {}
  
  public void onClick(View paramView)
  {
    SimpleAlertDialog.create(GooglePlayServicesUtil.getOpenSourceSoftwareLicenseInfo(this$0.getActivity()), "").show(this$0.getActivity().getSupportFragmentManager(), "legal");
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.AboutFrag.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */