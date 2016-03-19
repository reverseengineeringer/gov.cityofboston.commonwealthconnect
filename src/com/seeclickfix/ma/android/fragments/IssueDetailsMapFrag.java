package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.map.MapOptionsFactory;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.views.ColorMarkers;
import javax.inject.Inject;

public class IssueDetailsMapFrag
  extends BaseFrag
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IssueDetailsMapFrag";
  private Context c;
  private TextView headerText;
  private TextView headerText2;
  private Issue issue;
  private GoogleMap mMap;
  private SupportMapFragment mMapFragment;
  @Inject
  public MapHelper mapHelper;
  private View topBar;
  
  private GoogleMapOptions getMapOptions()
  {
    GoogleMapOptions localGoogleMapOptions = MapOptionsFactory.getStandardOptions();
    localGoogleMapOptions.scrollGesturesEnabled(true);
    localGoogleMapOptions.zoomGesturesEnabled(true);
    localGoogleMapOptions.zoomControlsEnabled(true);
    return localGoogleMapOptions;
  }
  
  private void initMap()
  {
    mMapFragment = mapHelper.initMap(this, 2131361956, getMapOptions());
  }
  
  private void setReferences()
  {
    headerText = ((TextView)rootFrag.findViewById(2131361954));
    headerText2 = ((TextView)rootFrag.findViewById(2131361955));
    topBar = rootFrag.findViewById(2131361953);
  }
  
  private void setUpMapIfNeeded()
  {
    if (mMap == null)
    {
      mMap = mMapFragment.getMap();
      if (mMap == null) {}
    }
  }
  
  private void showContent()
  {
    String str1 = issue.getSummary();
    String str2 = issue.getAddress();
    headerText.setText(str1);
    headerText2.setText(str2);
    topBar.setVisibility(0);
    showMarker();
    updateMapCamera();
  }
  
  private void showMarker()
  {
    double d1 = issue.getLat();
    double d2 = issue.getLng();
    LatLng localLatLng = new LatLng(Double.valueOf(d1).doubleValue(), Double.valueOf(d2).doubleValue());
    MarkerOptions localMarkerOptions = new MarkerOptions();
    localMarkerOptions.position(localLatLng);
    localMarkerOptions.title(issue.getSummary());
    localMarkerOptions.icon(ColorMarkers.getPinByStatus(issue.getStatus(), c));
    mMap.addMarker(localMarkerOptions).showInfoWindow();
  }
  
  private void updateMapCamera()
  {
    CameraUpdate localCameraUpdate = CameraUpdateFactory.newLatLngZoom(new LatLng(issue.getLat(), issue.getLng()), 16.0F);
    mMap.animateCamera(localCameraUpdate, 500, null);
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903084, paramViewGroup, false));
    MyApplication.inject(this);
    initMap();
    return rootFrag;
  }
  
  public void onResume()
  {
    super.onResume();
    c = getActivity().getApplicationContext();
    setReferences();
    setUpMapIfNeeded();
    issue = ((Issue)getArguments().getParcelable("issue_bundle"));
    showContent();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsMapFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */