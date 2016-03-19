package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.location.Address;
import android.location.Location;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnCameraChangeListener;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.GoogleMap.OnMapLongClickListener;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.CameraPosition.Builder;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.dialogs.NamePlaceDialog;
import com.seeclickfix.ma.android.events.LocationUpdateEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.OnMapBackKeyListener;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.map.MapOptionsFactory;
import com.seeclickfix.ma.android.location.AddressLocalizer;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.tasks.ReverseGeocodeTask;
import com.seeclickfix.ma.android.views.ColorMarkers;
import com.seeclickfix.ma.android.views.ToastFactory;
import com.squareup.otto.Subscribe;
import javax.inject.Inject;

public class PlacesMapFrag
  extends BaseFrag
  implements OnMapBackKeyListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "PlacesMapFrag";
  private Context c;
  private CameraPosition camPosition;
  SafeListener<Address> geocodeListener = new SafeListener(this, new SimpleListener()
  {
    public void onFailure(SimpleListener.Code paramAnonymousCode) {}
    
    public void onSuccess(Address paramAnonymousAddress)
    {
      if (marker != null)
      {
        paramAnonymousAddress = AddressLocalizer.getAddressString(paramAnonymousAddress);
        marker.setTitle(paramAnonymousAddress);
        marker.showInfoWindow();
      }
    }
  });
  @Inject
  LocationAdapter locationAdapter;
  private GoogleMap mMap;
  private SupportMapFragment mMapFragment;
  private GoogleMap.OnMapClickListener mapClickListener;
  @Inject
  MapHelper mapHelper;
  private GoogleMap.OnMapLongClickListener mapLongClickListener;
  private Marker marker;
  private LatLng markerLatLng;
  private NamePlaceDialog namePlaceDialog;
  private PageParams pageParams;
  private Button saveBtn;
  private View.OnClickListener saveBtnListener;
  
  private void attachListeners()
  {
    saveBtn.setOnClickListener(saveBtnListener);
  }
  
  private GoogleMapOptions getMapOptions()
  {
    Object localObject = locationAdapter.getLastLocationIfAvailable();
    if (localObject != null) {}
    for (localObject = MapOptionsFactory.getMiniMapOptions((Location)localObject);; localObject = MapOptionsFactory.getStandardOptions())
    {
      ((GoogleMapOptions)localObject).scrollGesturesEnabled(true);
      ((GoogleMapOptions)localObject).zoomGesturesEnabled(true);
      ((GoogleMapOptions)localObject).zoomControlsEnabled(true);
      camPosition = ((CameraPosition)getArguments().getParcelable("cam_position"));
      if (camPosition != null) {
        ((GoogleMapOptions)localObject).camera(camPosition);
      }
      return (GoogleMapOptions)localObject;
    }
  }
  
  private void handleClick(LatLng paramLatLng)
  {
    markerLatLng = paramLatLng;
    if (marker != null) {
      marker.remove();
    }
    mMap.clear();
    setMarker(paramLatLng);
    updateCamPosition();
  }
  
  private void initMap()
  {
    mMapFragment = mapHelper.initMap(this, 2131362012, getMapOptions());
  }
  
  private void setMarker(LatLng paramLatLng)
  {
    if (paramLatLng == null) {
      return;
    }
    MarkerOptions localMarkerOptions = new MarkerOptions();
    localMarkerOptions.position(paramLatLng);
    localMarkerOptions.icon(ColorMarkers.getPinByStatus("Acknowledged", c));
    marker = mMap.addMarker(localMarkerOptions);
    ReverseGeocodeTask.launch("PlacesMapFrag", paramLatLng, this, geocodeListener);
    pageParams.setParcel(paramLatLng);
  }
  
  private void setReferences()
  {
    saveBtn = ((Button)rootFrag.findViewById(2131362010));
  }
  
  private void setUpMapIfNeeded()
  {
    if (mMap == null)
    {
      mMap = mMapFragment.getMap();
      if (mMap != null) {
        setupMap();
      }
      return;
    }
    setupMap();
  }
  
  private void setupListeners()
  {
    saveBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        save();
      }
    };
    mapClickListener = new GoogleMap.OnMapClickListener()
    {
      public void onMapClick(LatLng paramAnonymousLatLng)
      {
        PlacesMapFrag.this.handleClick(paramAnonymousLatLng);
      }
    };
    mapLongClickListener = new GoogleMap.OnMapLongClickListener()
    {
      public void onMapLongClick(LatLng paramAnonymousLatLng)
      {
        PlacesMapFrag.this.handleClick(paramAnonymousLatLng);
      }
    };
  }
  
  private void setupMap()
  {
    mMap.setMyLocationEnabled(false);
    if (camPosition == null)
    {
      mMap.setMyLocationEnabled(true);
      mMap.setLocationSource(locationAdapter);
    }
    for (;;)
    {
      mMap.setMyLocationEnabled(true);
      mMap.setOnMapClickListener(mapClickListener);
      mMap.setOnMapLongClickListener(mapLongClickListener);
      mMap.setOnCameraChangeListener(new GoogleMap.OnCameraChangeListener()
      {
        public void onCameraChange(CameraPosition paramAnonymousCameraPosition)
        {
          PlacesMapFrag.access$202(PlacesMapFrag.this, paramAnonymousCameraPosition);
        }
      });
      setMarker(markerLatLng);
      return;
      CameraUpdate localCameraUpdate = CameraUpdateFactory.newLatLngZoom(camPosition.target, camPosition.zoom);
      mMap.animateCamera(localCameraUpdate, 500, null);
    }
  }
  
  private void updateCamPosition()
  {
    camPosition = new CameraPosition.Builder().target(new LatLng(marker.getPosition().latitude, marker.getPosition().longitude)).zoom(mMap.getCameraPosition().zoom).tilt(mMap.getCameraPosition().tilt).bearing(mMap.getCameraPosition().bearing).build();
    mMap.animateCamera(CameraUpdateFactory.newCameraPosition(camPosition));
  }
  
  protected LatLng getMarkerFromParcel(PageParams paramPageParams)
  {
    if (paramPageParams == null) {
      return null;
    }
    paramPageParams = paramPageParams.getParcel();
    if ((paramPageParams instanceof LatLng)) {
      return (LatLng)paramPageParams;
    }
    return null;
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public void onBackKey()
  {
    getActivity().getSupportFragmentManager().popBackStack();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903091, paramViewGroup, false));
    MyApplication.inject(this);
    initMap();
    return rootFrag;
  }
  
  @Subscribe
  public void onLocationChangedEvent(LocationUpdateEvent paramLocationUpdateEvent)
  {
    if (paramLocationUpdateEvent.getLocation() != null)
    {
      mMap.setMyLocationEnabled(true);
      mMap.setOnMapClickListener(mapClickListener);
      locationAdapter.stopActiveLocationUpdates();
    }
  }
  
  public void onResume()
  {
    super.onResume();
    pageParams = ((PageParams)getArguments().getParcelable("page_params"));
    markerLatLng = getMarkerFromParcel(pageParams);
    c = getActivity().getApplicationContext();
    setReferences();
    setupListeners();
    setUpMapIfNeeded();
    attachListeners();
    subscribeToEventBus();
    locationAdapter.startHighAccuracyLocationUpdates();
  }
  
  public void onStop()
  {
    super.onStop();
    getArguments().putParcelable("cam_position", camPosition);
  }
  
  protected void save()
  {
    if (markerLatLng == null)
    {
      ToastFactory.showCenteredShortToast(getActivity(), 2131493112);
      return;
    }
    namePlaceDialog = NamePlaceDialog.newInstance(2131493015, 2131493013, 2130837773, markerLatLng, pageParams);
    namePlaceDialog.show(getActivity().getSupportFragmentManager(), null);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesMapFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */