package com.seeclickfix.ma.android.fragments;

import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.google.android.gms.maps.GoogleMap.InfoWindowAdapter;
import com.google.android.gms.maps.model.Marker;
import com.seeclickfix.ma.android.media.icons.ImageUrl;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.style.color.StatusColor;
import java.util.Map;

class IssuesMapFrag$15
  implements GoogleMap.InfoWindowAdapter
{
  IssuesMapFrag$15(IssuesMapFrag paramIssuesMapFrag) {}
  
  public View getInfoContents(Marker paramMarker)
  {
    if (this$0.getActivity() == null) {
      paramMarker = null;
    }
    View localView;
    Issue localIssue;
    ImageView localImageView;
    String str;
    do
    {
      return paramMarker;
      localView = this$0.getActivity().getLayoutInflater().inflate(2130903108, null);
      ((TextView)localView.findViewById(2131362087)).setText(paramMarker.getTitle());
      localIssue = (Issue)IssuesMapFrag.access$1600(this$0).get(paramMarker.getId());
      localImageView = (ImageView)localView.findViewById(2131362086);
      localImageView.bringToFront();
      str = ImageUrl.getSmallUrlForIssue(localIssue, null);
      paramMarker = localView;
    } while (str.contains("no-image"));
    if (IssuesMapFrag.access$1700(this$0) != null) {
      IssuesMapFrag.access$1700(this$0).cancelRequest();
    }
    localImageView.setBackgroundColor(StatusColor.getBackground(localIssue.getStatus(), IssuesMapFrag.access$1800(this$0)));
    IssuesMapFrag.access$1900(this$0, str, localImageView);
    return localView;
  }
  
  public View getInfoWindow(Marker paramMarker)
  {
    return null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag.15
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */