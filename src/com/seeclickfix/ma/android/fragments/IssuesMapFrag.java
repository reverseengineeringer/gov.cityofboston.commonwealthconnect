package com.seeclickfix.ma.android.fragments;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.CancelableCallback;
import com.google.android.gms.maps.GoogleMap.InfoWindowAdapter;
import com.google.android.gms.maps.GoogleMap.OnCameraChangeListener;
import com.google.android.gms.maps.GoogleMap.OnInfoWindowClickListener;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.GoogleMap.OnMarkerClickListener;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.Projection;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.LatLngBounds.Builder;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.VisibleRegion;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.adapters.IssueListMapAdapter;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.HomeButtonsInterface;
import com.seeclickfix.ma.android.fragments.interfaces.Titled;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.map.MapOptionsFactory;
import com.seeclickfix.ma.android.media.icons.ImageUrl;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.style.color.StatusColor;
import com.seeclickfix.ma.android.tasks.GetIssuesMapTask;
import com.seeclickfix.ma.android.tasks.GetIssuesTask;
import com.seeclickfix.ma.android.views.ColorMarkers;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.inject.Inject;
import org.json.JSONArray;

public class IssuesMapFrag
  extends BaseFrag
  implements Titled, GoogleMap.OnMarkerClickListener, GoogleMap.OnInfoWindowClickListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "IssuesMapFrag";
  private static Marker markerSelected;
  private IssueListMapAdapter adapter;
  private Context c;
  GoogleMap.OnCameraChangeListener camChangeListener = new GoogleMap.OnCameraChangeListener()
  {
    public void onCameraChange(CameraPosition paramAnonymousCameraPosition)
    {
      mMap.setOnCameraChangeListener(null);
      getArguments().putParcelable("cam_position", paramAnonymousCameraPosition);
      IssuesMapFrag.access$1302(IssuesMapFrag.this, true);
      IssuesMapFrag.access$002(IssuesMapFrag.this, paramAnonymousCameraPosition);
      handler.postDelayed(reloadDelay, 20L);
    }
  };
  Response.ErrorListener errorListener = new Response.ErrorListener()
  {
    public void onErrorResponse(VolleyError paramAnonymousVolleyError)
    {
      IssuesMapFrag.access$1302(IssuesMapFrag.this, false);
      setCamListener(20);
    }
  };
  private GetIssuesMapTask getIssueMapTask;
  private GetIssuesTask getIssueTask;
  private GetIssuesMapTask getIssueTask2;
  private GetIssuesMapTask getIssueTask3;
  private GetIssuesMapTask getIssueTask4;
  private GetIssuesMapTask getIssueTask5;
  private Handler handler;
  private ImageLoader.ImageContainer imageReqContainer;
  private GoogleMap.InfoWindowAdapter infowWinAdapter = new GoogleMap.InfoWindowAdapter()
  {
    public View getInfoContents(Marker paramAnonymousMarker)
    {
      if (getActivity() == null) {
        paramAnonymousMarker = null;
      }
      View localView;
      Issue localIssue;
      ImageView localImageView;
      String str;
      do
      {
        return paramAnonymousMarker;
        localView = getActivity().getLayoutInflater().inflate(2130903108, null);
        ((TextView)localView.findViewById(2131362087)).setText(paramAnonymousMarker.getTitle());
        localIssue = (Issue)markersMap.get(paramAnonymousMarker.getId());
        localImageView = (ImageView)localView.findViewById(2131362086);
        localImageView.bringToFront();
        str = ImageUrl.getSmallUrlForIssue(localIssue, null);
        paramAnonymousMarker = localView;
      } while (str.contains("no-image"));
      if (imageReqContainer != null) {
        imageReqContainer.cancelRequest();
      }
      localImageView.setBackgroundColor(StatusColor.getBackground(localIssue.getStatus(), c));
      IssuesMapFrag.this.loadIconForView(str, localImageView);
      return localView;
    }
    
    public View getInfoWindow(Marker paramAnonymousMarker)
    {
      return null;
    }
  };
  private boolean isReloading = false;
  Response.Listener<JSONArray> listener = new Response.Listener()
  {
    public void onResponse(JSONArray paramAnonymousJSONArray)
    {
      if (getSherlockActivity() == null) {
        return;
      }
      paramAnonymousJSONArray = new DeserializeResponse().getJavaObject(paramAnonymousJSONArray.toString(), Issue.class);
      adapter.appendList(paramAnonymousJSONArray);
      IssuesMapFrag.this.handleListLoaded();
    }
  };
  private ImageLoader mImageLoader;
  private GoogleMap mMap;
  private SupportMapFragment mMapFragment;
  GoogleMap.CancelableCallback mapAnimationCallback = new GoogleMap.CancelableCallback()
  {
    public void onCancel()
    {
      setCamListener(200);
    }
    
    public void onFinish()
    {
      setCamListener(100);
    }
  };
  GoogleMap.OnMapClickListener mapClickListener = new GoogleMap.OnMapClickListener()
  {
    public void onMapClick(LatLng paramAnonymousLatLng)
    {
      if (IssuesMapFrag.markerSelected != null)
      {
        IssuesMapFrag.markerSelected.hideInfoWindow();
        IssuesMapFrag.access$1502(null);
        getArguments().putInt("issue_id", -1);
      }
    }
  };
  private ViewGroup mapContainer;
  @Inject
  MapHelper mapHelper;
  @SuppressLint({"UseSparseArrays"})
  private Map<Integer, Marker> markerHashMap = new HashMap();
  private Map<String, Issue> markersMap = new HashMap();
  private CameraPosition newCamPosition;
  private int page = 0;
  private Place place;
  private CameraPosition previousCamPosition;
  private int previousIssueId;
  Runnable reload1 = new Runnable()
  {
    public void run()
    {
      if (getSherlockActivity() == null) {
        return;
      }
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
      CameraPosition localCameraPosition = newCamPosition;
      IssuesMapFrag.access$102(IssuesMapFrag.this, 1);
      IssuesMapFrag.access$202(IssuesMapFrag.this, new GetIssuesMapTask(getActivity().getApplicationContext(), place, reloadListener, errorListener, target.latitude, target.longitude, zoom, page));
      getIssueMapTask.execute();
    }
  };
  Runnable reload2 = new Runnable()
  {
    public void run()
    {
      if (getSherlockActivity() == null) {
        return;
      }
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
      CameraPosition localCameraPosition = newCamPosition;
      IssuesMapFrag.access$102(IssuesMapFrag.this, 2);
      IssuesMapFrag.access$402(IssuesMapFrag.this, new GetIssuesMapTask(getActivity().getApplicationContext(), place, reloadListener, errorListener, target.latitude, target.longitude, zoom, page));
      getIssueTask2.execute();
    }
  };
  Runnable reload3 = new Runnable()
  {
    public void run()
    {
      if (getSherlockActivity() == null) {
        return;
      }
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
      CameraPosition localCameraPosition = newCamPosition;
      IssuesMapFrag.access$102(IssuesMapFrag.this, 3);
      IssuesMapFrag.access$502(IssuesMapFrag.this, new GetIssuesMapTask(getActivity().getApplicationContext(), place, reloadListener, errorListener, target.latitude, target.longitude, zoom, page));
      getIssueTask3.execute();
    }
  };
  Runnable reload4 = new Runnable()
  {
    public void run()
    {
      if (getSherlockActivity() == null) {
        return;
      }
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
      CameraPosition localCameraPosition = newCamPosition;
      IssuesMapFrag.access$102(IssuesMapFrag.this, 4);
      IssuesMapFrag.access$602(IssuesMapFrag.this, new GetIssuesMapTask(getActivity().getApplicationContext(), place, reloadListener, errorListener, target.latitude, target.longitude, zoom, page));
      getIssueTask4.execute();
    }
  };
  Runnable reload5 = new Runnable()
  {
    public void run()
    {
      if (getSherlockActivity() == null) {
        return;
      }
      getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
      CameraPosition localCameraPosition = newCamPosition;
      IssuesMapFrag.access$102(IssuesMapFrag.this, 5);
      IssuesMapFrag.access$702(IssuesMapFrag.this, new GetIssuesMapTask(getActivity().getApplicationContext(), place, reloadListener, errorListener, target.latitude, target.longitude, zoom, page));
      getIssueTask5.execute();
    }
  };
  Runnable reloadDelay = new Runnable()
  {
    public void run()
    {
      IssuesMapFrag.this.reload();
    }
  };
  Response.Listener<JSONArray> reloadListener = new Response.Listener()
  {
    public void onResponse(JSONArray paramAnonymousJSONArray)
    {
      if (getSherlockActivity() == null) {
        return;
      }
      paramAnonymousJSONArray = new DeserializeResponse().getJavaObject(paramAnonymousJSONArray.toString(), Issue.class);
      LatLngBounds localLatLngBounds = mMap.getProjection().getVisibleRegion().latLngBounds;
      adapter.appendList(paramAnonymousJSONArray);
      adapter.pruneByBounds(localLatLngBounds);
      IssuesMapFrag.this.pruneByBounds(localLatLngBounds);
      IssuesMapFrag.this.handleListLoaded();
    }
  };
  Runnable removeMapDelayed = new Runnable()
  {
    public void run() {}
  };
  private int selectedIssueId = -1;
  Runnable setCamListener = new Runnable()
  {
    public void run()
    {
      mMap.setOnCameraChangeListener(camChangeListener);
    }
  };
  
  private void clearMarkers()
  {
    if (markerHashMap != null)
    {
      Iterator localIterator = markerHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        Integer localInteger = (Integer)localIterator.next();
        ((Marker)markerHashMap.get(localInteger)).remove();
      }
      markerHashMap.clear();
      markersMap = new HashMap();
    }
    if (markersMap != null)
    {
      markersMap.clear();
      markersMap = new HashMap();
    }
    if (mMap != null) {
      mMap.clear();
    }
  }
  
  private void extractArgs()
  {
    previousCamPosition = ((CameraPosition)getArguments().getParcelable("cam_position"));
    place = ((Place)getArguments().getParcelable("place_bundle"));
    setSelectedMarker(getArguments().getInt("issue_id", -1));
  }
  
  private GoogleMapOptions getMapOptions()
  {
    Object localObject = new LatLng(place.getPlaceLat(), place.getPlaceLng());
    if (previousCamPosition == null) {}
    for (localObject = CameraPosition.fromLatLngZoom((LatLng)localObject, 10.0F);; localObject = previousCamPosition)
    {
      GoogleMapOptions localGoogleMapOptions = MapOptionsFactory.getStandardOptions();
      localGoogleMapOptions.camera((CameraPosition)localObject);
      localGoogleMapOptions.scrollGesturesEnabled(true);
      localGoogleMapOptions.zoomGesturesEnabled(true);
      localGoogleMapOptions.zoomControlsEnabled(true);
      return localGoogleMapOptions;
    }
  }
  
  private void handleListLoaded()
  {
    getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
    showMarkersFromList(adapter.getAllAsList());
    setCamListener(500);
  }
  
  private void initMap()
  {
    mMapFragment = mapHelper.initMap(this, 2131361961, getMapOptions());
  }
  
  private void killHandler()
  {
    if (handler != null) {
      handler.removeCallbacksAndMessages(null);
    }
  }
  
  private void loadIconForView(String paramString, ImageView paramImageView)
  {
    if (imageReqContainer != null) {
      imageReqContainer.cancelRequest();
    }
    imageReqContainer = mImageLoader.get(paramString, ImageLoader.getImageListener(paramImageView, 2130837848, 2130837848), 48, 48);
  }
  
  private void pruneByBounds(LatLngBounds paramLatLngBounds)
  {
    int i = 0;
    Object localObject = new ArrayList();
    Iterator localIterator = markerHashMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Marker localMarker = (Marker)localEntry.getValue();
      if ((!localMarker.isInfoWindowShown()) && (!paramLatLngBounds.contains(localMarker.getPosition())))
      {
        localMarker.remove();
        ((List)localObject).add(localEntry.getKey());
        i += 1;
      }
    }
    paramLatLngBounds = ((List)localObject).iterator();
    while (paramLatLngBounds.hasNext())
    {
      localObject = (Integer)paramLatLngBounds.next();
      markerHashMap.remove(localObject);
    }
  }
  
  private void reload()
  {
    if (getIssueMapTask != null) {
      getIssueMapTask.cancel();
    }
    handler.removeCallbacks(reloadDelay);
    handler.removeCallbacks(setCamListener);
    handler.removeCallbacks(reload1);
    handler.removeCallbacks(reload2);
    handler.removeCallbacks(reload3);
    handler.removeCallbacks(reload4);
    handler.removeCallbacks(reload5);
    handler.postDelayed(reload1, 10L);
    handler.postDelayed(reload2, 110L);
    handler.postDelayed(reload3, 210L);
    handler.postDelayed(reload4, 310L);
    handler.postDelayed(reload5, 410L);
  }
  
  private void setReferences()
  {
    mapContainer = ((ViewGroup)rootFrag.findViewById(2131361961));
    mapContainer.setVisibility(0);
  }
  
  private void setSelectedMarker(int paramInt)
  {
    if (paramInt != -1)
    {
      Iterator localIterator = markerHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        Marker localMarker = (Marker)localEntry.getValue();
        if (((Integer)localEntry.getKey()).intValue() == paramInt) {
          markerSelected = localMarker;
        }
      }
    }
  }
  
  private void setUpMapIfNeeded()
  {
    if (mMap == null)
    {
      mMap = mMapFragment.getMap();
      if (mMap != null)
      {
        mMap.setOnMarkerClickListener(this);
        mMap.setOnMapClickListener(mapClickListener);
        mMap.setInfoWindowAdapter(infowWinAdapter);
      }
    }
  }
  
  private void setupAdapterAndListView()
  {
    adapter = new IssueListMapAdapter(c);
  }
  
  @SuppressLint({"HandlerLeak"})
  private void setupHandler()
  {
    handler = new Handler()
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        switch (what)
        {
        default: 
          return;
        }
        IssuesMapFrag.this.handleListLoaded();
      }
    };
  }
  
  private void showMap()
  {
    try
    {
      mapContainer.setVisibility(0);
      mapContainer.requestLayout();
      return;
    }
    catch (Exception localException) {}
  }
  
  private void showMarkersFromList(List<Issue> paramList)
  {
    previousIssueId = getArguments().getInt("issue_id", -1);
    LatLngBounds.Builder localBuilder = new LatLngBounds.Builder();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      Issue localIssue = (Issue)paramList.next();
      double d1 = localIssue.getLat();
      double d2 = localIssue.getLng();
      LatLng localLatLng = new LatLng(Double.valueOf(d1).doubleValue(), Double.valueOf(d2).doubleValue());
      Object localObject = new MarkerOptions();
      ((MarkerOptions)localObject).position(localLatLng);
      ((MarkerOptions)localObject).title(localIssue.getSummary());
      ((MarkerOptions)localObject).icon(ColorMarkers.getPinByStatus(localIssue.getStatus(), c));
      if (!markerHashMap.containsKey(Integer.valueOf(localIssue.getId())))
      {
        localObject = mMap.addMarker((MarkerOptions)localObject);
        markersMap.put(((Marker)localObject).getId(), localIssue);
        markerHashMap.put(Integer.valueOf(localIssue.getId()), localObject);
        if (previousIssueId == localIssue.getId()) {
          ((Marker)localObject).showInfoWindow();
        }
      }
      localBuilder.include(localLatLng);
    }
    try
    {
      mMap.setOnInfoWindowClickListener(this);
      updateMapCamera(localBuilder.build());
      return;
    }
    catch (Exception paramList)
    {
      while (getSherlockActivity() == null) {}
    }
  }
  
  private void startLoading()
  {
    if (previousCamPosition != null)
    {
      isReloading = true;
      newCamPosition = previousCamPosition;
      reload();
      return;
    }
    getIssueTask = new GetIssuesTask(getActivity().getApplicationContext(), place, listener, errorListener, 0);
    getIssueTask.execute();
  }
  
  private void stopVolley()
  {
    if (getIssueTask != null) {
      getIssueTask.cancel();
    }
    if (getIssueMapTask != null) {
      getIssueMapTask.cancel();
    }
    if (getIssueTask2 != null) {
      getIssueTask2.cancel();
    }
    if (getIssueTask3 != null) {
      getIssueTask3.cancel();
    }
    if (getIssueTask4 != null) {
      getIssueTask4.cancel();
    }
    if (getIssueTask5 != null) {
      getIssueTask5.cancel();
    }
  }
  
  private void updateMapCamera(LatLngBounds paramLatLngBounds)
  {
    if (isReloading) {
      return;
    }
    if (paramLatLngBounds == null) {}
    for (paramLatLngBounds = CameraUpdateFactory.newLatLngZoom(new LatLng(place.getPlaceLat(), place.getPlaceLng()), 15.8F);; paramLatLngBounds = CameraUpdateFactory.newLatLngBounds(paramLatLngBounds, getResources().getInteger(2131427338)))
    {
      mMap.setOnCameraChangeListener(null);
      mMap.animateCamera(paramLatLngBounds, 500, mapAnimationCallback);
      return;
    }
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public String getTitle()
  {
    return place.getName();
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    setHasOptionsMenu(true);
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenu.clear();
    paramMenuInflater.inflate(2131623940, paramMenu);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903086, paramViewGroup, false));
    MyApplication.inject(this);
    extractArgs();
    initMap();
    return rootFrag;
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    clearMarkers();
  }
  
  public void onInfoWindowClick(Marker paramMarker)
  {
    paramMarker = new Runnable()
    {
      public void run()
      {
        ((HomeButtonsInterface)getActivity()).onClickButton(4, val$issueClicked);
      }
    };
    handler.postDelayed(removeMapDelayed, 50L);
    handler.postDelayed(paramMarker, 100L);
  }
  
  public boolean onMarkerClick(Marker paramMarker)
  {
    selectedIssueId = ((Issue)markersMap.get(paramMarker.getId())).getId();
    getArguments().putInt("issue_id", selectedIssueId);
    markerSelected = paramMarker;
    return false;
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 2131362182)
    {
      getActivity().getSupportFragmentManager().popBackStack();
      return true;
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  public void onPause()
  {
    super.onPause();
    getArguments().putParcelable("cam_position", mMap.getCameraPosition());
    clearMarkers();
  }
  
  public void onResume()
  {
    super.onResume();
    c = getActivity().getApplicationContext();
    place = ((Place)getArguments().getParcelable("place_bundle"));
    setReferences();
    setupAdapterAndListView();
    setUpMapIfNeeded();
    setupHandler();
    startLoading();
    mImageLoader = VolleyRequestQueue.getInstance(c).getImageLoader();
  }
  
  public void onStop()
  {
    super.onStop();
    clearMarkers();
    killHandler();
    stopVolley();
  }
  
  protected void popThisFragment()
  {
    getSherlockActivity().getSupportFragmentManager().popBackStack();
  }
  
  protected void setCamListener(int paramInt)
  {
    if (!place.isMyReports()) {
      handler.postDelayed(setCamListener, paramInt);
    }
  }
  
  public void setPlace(Place paramPlace)
  {
    place = paramPlace;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */