package com.seeclickfix.ma.android.fragments;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.location.Location;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.LocationSource.OnLocationChangedListener;
import com.google.android.gms.maps.MapsInitializer;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.LatLngBounds.Builder;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorListenerAdapter;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import com.nineoldandroids.view.ViewHelper;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.adapters.CityCursorAdapter;
import com.seeclickfix.ma.android.anim.Transitions;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import com.seeclickfix.ma.android.db.InsertSinglePlace;
import com.seeclickfix.ma.android.dialogs.ProgressWheelDialog;
import com.seeclickfix.ma.android.events.LocationConnectedEvent;
import com.seeclickfix.ma.android.events.LocationTimeoutEvent;
import com.seeclickfix.ma.android.events.LocationUpdateEvent;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.OnPlaceAddedListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnPlaceMapListener;
import com.seeclickfix.ma.android.fragments.interfaces.PlaceMapLauncher;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.map.MapOptionsFactory;
import com.seeclickfix.ma.android.loaders.PlaceAsyncLoader;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.location.LocationValidator;
import com.seeclickfix.ma.android.location.LocationValidator.Stratigies.PrecisionStrategyEnum;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.PageParamsFactory;
import com.seeclickfix.ma.android.objects.loc.City;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.providers.DataProvider;
import com.seeclickfix.ma.android.tasks.GetPlaceBySearchTask;
import com.seeclickfix.ma.android.tasks.GetPlacesTask;
import com.seeclickfix.ma.android.util.FormUtil;
import com.seeclickfix.ma.android.views.ColorMarkers;
import com.seeclickfix.ma.android.views.ToastFactory;
import com.seeclickfix.ma.android.views.swipe.SwipeDismissTouchListener;
import com.seeclickfix.ma.android.views.swipe.SwipeDismissTouchListener.OnDismissCallback;
import com.squareup.otto.Subscribe;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.inject.Inject;

@SuppressLint({"HandlerLeak"})
public class PlacesFrag
  extends BaseFrag
  implements LocationSource.OnLocationChangedListener, LoaderManager.LoaderCallbacks<List<Place>>, OnPlaceMapListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "PlacesFrag";
  private static int autoCompLoaderId = 800;
  private static int loaderID = 600;
  AdapterView.OnItemClickListener autoCompleteListener = new AdapterView.OnItemClickListener()
  {
    public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      paramAnonymousAdapterView = (City)paramAnonymousView.getTag();
      FormUtil.hideKeyboard(searchAutoTextView);
      search(name + "+" + state);
      searchAutoTextView.setText(name + ", " + state);
    }
  };
  LoaderManager.LoaderCallbacks<Cursor> autocompleteLoaderCallbacks = new LoaderManager.LoaderCallbacks()
  {
    public Loader<Cursor> onCreateLoader(int paramAnonymousInt, Bundle paramAnonymousBundle)
    {
      PlacesFrag.access$002(PlacesFrag.this, new CityCursorAdapter(getActivity(), null, 0));
      paramAnonymousBundle = getActivity().getApplicationContext();
      return new CursorLoader(paramAnonymousBundle, DataProvider.getSearchCitiesUri(paramAnonymousBundle), new String[] { "_id", "name", "state", "population" }, null, null, null);
    }
    
    public void onLoadFinished(Loader<Cursor> paramAnonymousLoader, Cursor paramAnonymousCursor)
    {
      if (getActivity() == null) {
        return;
      }
      try
      {
        if (cityAdapter != null)
        {
          cityAdapter.swapCursor(paramAnonymousCursor);
          searchAutoTextView.setAdapter(cityAdapter);
          searchAutoTextView.setOnItemClickListener(autoCompleteListener);
          return;
        }
        PlacesFrag.access$002(PlacesFrag.this, new CityCursorAdapter(getActivity(), paramAnonymousCursor, 0));
        searchAutoTextView.setAdapter(cityAdapter);
        searchAutoTextView.setOnItemClickListener(autoCompleteListener);
        return;
      }
      catch (Exception paramAnonymousLoader) {}
    }
    
    public void onLoaderReset(Loader<Cursor> paramAnonymousLoader)
    {
      if (cityAdapter != null)
      {
        cityAdapter.swapCursor(null);
        PlacesFrag.access$002(PlacesFrag.this, null);
      }
    }
  };
  private View.OnClickListener btnListener;
  private Context c;
  private CityCursorAdapter cityAdapter;
  Runnable delayedUpdatePositions = new Runnable()
  {
    public void run()
    {
      PlacesFrag.this.updatePlacePositions();
    }
  };
  private View.OnFocusChangeListener focusListener;
  Handler handler = new Handler() {};
  private TextView homePlaceLabel;
  private Location lastKnownLocation;
  @Inject
  LocationAdapter locationAdapter;
  private GoogleMap mMap;
  private SupportMapFragment mMapFragment;
  private ImageButton mSearchBtn;
  private View mapBtnCard;
  @Inject
  MapHelper mapHelper;
  private Set<Marker> markerSet;
  private SwipeDismissTouchListener.OnDismissCallback onDimissCallback = new SwipeDismissTouchListener.OnDismissCallback()
  {
    public void onDismiss(View paramAnonymousView, Object paramAnonymousObject)
    {
      ViewGroup localViewGroup = (ViewGroup)paramAnonymousView.getParent();
      paramAnonymousObject = (Place)paramAnonymousObject;
      localViewGroup.removeView(paramAnonymousView);
      ignorePlace((Place)paramAnonymousObject);
    }
  };
  private ViewGroup placeContainer;
  View.OnClickListener placeRowClickListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      CheckBox localCheckBox = (CheckBox)paramAnonymousView.findViewById(2131362154);
      paramAnonymousView = (Place)paramAnonymousView.getTag();
      if (!paramAnonymousView.isSelected()) {}
      for (boolean bool = true;; bool = false)
      {
        paramAnonymousView.setSelected(bool);
        localCheckBox.toggle();
        if (!paramAnonymousView.isSelected()) {
          break;
        }
        addPlace(paramAnonymousView);
        return;
      }
      removePlace(paramAnonymousView);
    }
  };
  private AsyncTask<String, Void, Place> placeSearchTask;
  private ProgressWheelDialog progWheelDiag;
  private ProgressBar progressWheel;
  private AutoCompleteTextView searchAutoTextView;
  private Set<Place> selectedPlacesSet;
  private TextView.OnEditorActionListener serachListener;
  private List<Place> sortedPlaces;
  
  private void addSwipeListener(View paramView, ViewGroup paramViewGroup)
  {
    paramView.setOnTouchListener(new SwipeDismissTouchListener(paramView, paramView.getTag(), onDimissCallback));
  }
  
  private void animateMap(Location paramLocation)
  {
    paramLocation = CameraUpdateFactory.newLatLngZoom(new LatLng(paramLocation.getLatitude(), paramLocation.getLongitude()), 12.0F);
    mMap.animateCamera(paramLocation, 500, null);
  }
  
  private void clearGmapObject()
  {
    if (mMap != null)
    {
      mMap.stopAnimation();
      mMap.clear();
      mMap = null;
    }
  }
  
  private void clearReferences()
  {
    if (markerSet != null)
    {
      removeAllMarkers();
      markerSet.clear();
      markerSet = null;
    }
    clearGmapObject();
    if (selectedPlacesSet != null) {
      selectedPlacesSet = null;
    }
  }
  
  private void createListeners()
  {
    btnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (paramAnonymousView.getId() == 2131361997) {
          showMapFull();
        }
        while (paramAnonymousView.getId() != 2131362002) {
          return;
        }
        doSearch();
      }
    };
    serachListener = new TextView.OnEditorActionListener()
    {
      public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
      {
        if (paramAnonymousInt == 6)
        {
          doSearch();
          return true;
        }
        return false;
      }
    };
    focusListener = new View.OnFocusChangeListener()
    {
      public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
      {
        if ((paramAnonymousView.getId() == 2131362003) && (paramAnonymousBoolean)) {
          ((ScrollView)rootFrag).smoothScrollTo(0, ((View)searchAutoTextView.getParent()).getTop());
        }
      }
    };
  }
  
  private GoogleMapOptions getMapOptions()
  {
    Object localObject = locationAdapter.getLastLocationIfAvailable();
    if (localObject != null) {}
    for (localObject = MapOptionsFactory.getMiniMapOptions((Location)localObject);; localObject = MapOptionsFactory.getStandardOptions())
    {
      ((GoogleMapOptions)localObject).zoomGesturesEnabled(false);
      ((GoogleMapOptions)localObject).scrollGesturesEnabled(false);
      ((GoogleMapOptions)localObject).zoomControlsEnabled(false);
      return (GoogleMapOptions)localObject;
    }
  }
  
  private void initMap()
  {
    mMapFragment = mapHelper.initMap(this, 2131361998, getMapOptions());
  }
  
  private void performDismiss(final View paramView)
  {
    if (paramView == null) {
      return;
    }
    final ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    final int i = paramView.getHeight();
    ValueAnimator localValueAnimator = ValueAnimator.ofInt(new int[] { i, 1 }).setDuration(300L);
    localValueAnimator.addListener(new AnimatorListenerAdapter()
    {
      public void onAnimationEnd(Animator paramAnonymousAnimator)
      {
        PlacesFrag.this.updatePlacePositions();
        ViewHelper.setAlpha(paramView, 1.0F);
        ViewHelper.setTranslationX(paramView, 0.0F);
        localLayoutParamsheight = i;
        paramView.setLayoutParams(localLayoutParams);
        placeContainer.removeView(paramView);
        sortedPlaces.remove(paramView.getTag());
        placeContainer.post(delayedUpdatePositions);
      }
    });
    localValueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
    {
      public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
      {
        localLayoutParamsheight = ((Integer)paramAnonymousValueAnimator.getAnimatedValue()).intValue();
        paramView.setLayoutParams(localLayoutParams);
      }
    });
    localValueAnimator.start();
  }
  
  private void processLocation(Location paramLocation)
  {
    if (paramLocation != null)
    {
      lastKnownLocation = paramLocation;
      locationAdapter.stopActiveLocationUpdates();
      setupLoader();
    }
  }
  
  private void removeAllMarkers()
  {
    if (markerSet != null)
    {
      Iterator localIterator = markerSet.iterator();
      while (localIterator.hasNext()) {
        ((Marker)localIterator.next()).remove();
      }
    }
  }
  
  private void removeMapListeners()
  {
    if (mMap == null)
    {
      mMap = mMapFragment.getMap();
      if (mMap != null) {
        mMap.setLocationSource(null);
      }
      return;
    }
    mMap.setLocationSource(null);
  }
  
  private void setListeners()
  {
    searchAutoTextView.setOnEditorActionListener(serachListener);
    searchAutoTextView.setOnFocusChangeListener(focusListener);
    mSearchBtn.setOnClickListener(btnListener);
    mapBtnCard.setOnClickListener(btnListener);
  }
  
  private void setReferences()
  {
    progressWheel = ((ProgressBar)rootFrag.findViewById(2131362007));
    homePlaceLabel = ((TextView)rootFrag.findViewById(2131362006));
    placeContainer = ((ViewGroup)rootFrag.findViewById(2131362008));
    mapBtnCard = ((ViewGroup)rootFrag.findViewById(2131361997));
    searchAutoTextView = ((AutoCompleteTextView)rootFrag.findViewById(2131362003));
    mSearchBtn = ((ImageButton)rootFrag.findViewById(2131362002));
  }
  
  private void setUpMapIfNeeded()
  {
    if (mMap == null)
    {
      mMap = mMapFragment.getMap();
      if (mMap != null)
      {
        mMap.setMyLocationEnabled(true);
        mMap.setLocationSource(locationAdapter);
      }
      return;
    }
    mMap.setMyLocationEnabled(true);
    mMap.setLocationSource(locationAdapter);
  }
  
  @SuppressLint({"DefaultLocale"})
  private void setupLoader()
  {
    Loader localLoader = getActivity().getSupportLoaderManager().getLoader(loaderID);
    if (LocaleManager.getIsUS(c)) {
      getActivity().getSupportLoaderManager().initLoader(autoCompLoaderId, null, autocompleteLoaderCallbacks).startLoading();
    }
    if ((sortedPlaces != null) && (sortedPlaces.size() > 0))
    {
      showPlaces(sortedPlaces);
      return;
    }
    if (localLoader == null)
    {
      getActivity().getSupportLoaderManager().initLoader(loaderID, null, this).forceLoad();
      return;
    }
    if (localLoader.isReset())
    {
      getActivity().getSupportLoaderManager().initLoader(loaderID, null, this).forceLoad();
      return;
    }
    if (localLoader.isAbandoned())
    {
      getActivity().getSupportLoaderManager().getLoader(loaderID).reset();
      getActivity().getSupportLoaderManager().initLoader(loaderID, null, this).forceLoad();
      return;
    }
    if (localLoader.isStarted())
    {
      getActivity().getSupportLoaderManager().initLoader(loaderID, null, this).forceLoad();
      return;
    }
    getActivity().getSupportLoaderManager().initLoader(loaderID, null, this).forceLoad();
  }
  
  private void showPlaces(List<Place> paramList)
  {
    sortedPlaces = paramList;
    placeContainer.removeAllViews();
    if (markerSet != null)
    {
      removeAllMarkers();
      markerSet.clear();
      markerSet = new HashSet();
    }
    if (mMap == null) {
      return;
    }
    mMap.clear();
    selectedPlacesSet = new HashSet();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      Place localPlace = (Place)paramList.next();
      if (localPlace.getApiId() != -1)
      {
        ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(c, 2130903130, placeContainer);
        TextView localTextView1 = (TextView)localViewGroup.findViewById(2131362155);
        TextView localTextView2 = (TextView)localViewGroup.findViewById(2131362156);
        CheckBox localCheckBox = (CheckBox)localViewGroup.findViewById(2131362154);
        if (localPlace.isSelected())
        {
          localCheckBox.setChecked(true);
          if (selectedPlacesSet == null) {
            selectedPlacesSet = new HashSet();
          }
          selectedPlacesSet.add(localPlace);
          addMarkerForPlace(localPlace);
        }
        localTextView2.setText(localPlace.getState());
        localTextView1.setText(localPlace.getName());
        localViewGroup.setTag(localPlace);
        localViewGroup.setOnClickListener(placeRowClickListener);
        addSwipeListener(localViewGroup, placeContainer);
        placeContainer.addView(localViewGroup);
      }
    }
    progressWheel.setVisibility(8);
    homePlaceLabel.setText(getString(2131493006));
    updateCameraForPlaces(selectedPlacesSet);
    placeContainer.post(delayedUpdatePositions);
  }
  
  private void showSinglePlace(Place paramPlace)
  {
    showSinglePlaceAt(paramPlace, 0);
  }
  
  private void showSinglePlaceAt(final Place paramPlace, int paramInt)
  {
    if (paramPlace.getApiId() == -1) {
      return;
    }
    if (paramPlace.getIgnored())
    {
      localViewGroup = (ViewGroup)ViewUtil.inflate(c, 2130903141, placeContainer);
      localTextView1 = (TextView)localViewGroup.findViewById(2131362155);
      localTextView2 = (TextView)localViewGroup.findViewById(2131362156);
      localObject = (Button)localViewGroup.findViewById(2131362164);
      localTextView1.setText(paramPlace.getName());
      localTextView2.setText(2131493075);
      ((Button)localObject).setTag(paramPlace);
      ((Button)localObject).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramAnonymousView = (Place)paramAnonymousView.getTag();
          undo(paramAnonymousView);
        }
      });
      localViewGroup.setTag(paramPlace);
      placeContainer.addView(localViewGroup, paramPlace.getListPosition());
      placeContainer.post(delayedUpdatePositions);
      handler.postDelayed(new Runnable()
      {
        public void run()
        {
          try
          {
            if (paramPlace.getIgnored())
            {
              PlacesFrag.this.updatePlacePositions();
              View localView = getPlaceRowByTag(paramPlace);
              localView.setTag(paramPlace);
              PlacesFrag.this.performDismiss(localView);
            }
            return;
          }
          catch (Exception localException) {}
        }
      }, 5000L);
      return;
    }
    ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(c, 2130903130, placeContainer);
    TextView localTextView1 = (TextView)localViewGroup.findViewById(2131362155);
    TextView localTextView2 = (TextView)localViewGroup.findViewById(2131362156);
    Object localObject = (CheckBox)localViewGroup.findViewById(2131362154);
    if (paramPlace.isSelected())
    {
      ((CheckBox)localObject).setChecked(true);
      if (selectedPlacesSet == null) {
        selectedPlacesSet = new HashSet();
      }
      selectedPlacesSet.add(paramPlace);
      addMarkerForPlace(paramPlace);
    }
    localTextView2.setText(paramPlace.getState());
    localTextView1.setText(paramPlace.getName());
    localViewGroup.setTag(paramPlace);
    localViewGroup.setOnClickListener(placeRowClickListener);
    paramPlace = placeContainer.getChildAt(0);
    placeContainer.addView(localViewGroup, paramInt);
    addSwipeListener(localViewGroup, placeContainer);
    if (paramPlace != null)
    {
      paramInt = paramPlace.getHeight();
      localViewGroup.setAnimation(Transitions.dropDown(c, localViewGroup, paramInt, true));
    }
    updateCameraForPlaces(selectedPlacesSet);
    placeContainer.post(delayedUpdatePositions);
  }
  
  private void updateCameraForPlaces(Collection<Place> paramCollection)
  {
    if (paramCollection == null) {}
    do
    {
      return;
      if ((mMap != null) || (paramCollection.size() == 1))
      {
        paramCollection = (Place)paramCollection.iterator().next();
        localObject = new Location("Manual Place Code");
        ((Location)localObject).setLatitude(paramCollection.getPlaceLat());
        ((Location)localObject).setLongitude(paramCollection.getPlaceLng());
        animateMap((Location)localObject);
        return;
      }
    } while (paramCollection.size() < 1);
    Object localObject = new LatLngBounds.Builder();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      Place localPlace = (Place)paramCollection.next();
      if (localPlace.getApiId() != -1)
      {
        double d1 = localPlace.getPlaceLat();
        double d2 = localPlace.getPlaceLng();
        ((LatLngBounds.Builder)localObject).include(new LatLng(Double.valueOf(d1).doubleValue(), Double.valueOf(d2).doubleValue()));
      }
    }
    try
    {
      updateMapCamera(((LatLngBounds.Builder)localObject).build());
      return;
    }
    catch (Exception paramCollection) {}
  }
  
  private void updateMapCamera(final LatLngBounds paramLatLngBounds)
  {
    if (paramLatLngBounds == null) {
      return;
    }
    paramLatLngBounds = CameraUpdateFactory.newLatLngBounds(paramLatLngBounds, getResources().getInteger(2131427339));
    handler.post(new Runnable()
    {
      public void run()
      {
        mMap.animateCamera(paramLatLngBounds, 500, null);
      }
    });
  }
  
  private void updatePlacePositions()
  {
    int i = 0;
    for (;;)
    {
      if (i < placeContainer.getChildCount())
      {
        Place localPlace = (Place)placeContainer.getChildAt(i).getTag();
        try
        {
          localPlace.setListPosition(i);
          i += 1;
        }
        catch (Exception localException)
        {
          for (;;) {}
        }
      }
    }
  }
  
  protected void addMarkerForPlace(Place paramPlace)
  {
    LatLng localLatLng = new LatLng(paramPlace.getPlaceLat(), paramPlace.getPlaceLng());
    MarkerOptions localMarkerOptions = new MarkerOptions();
    localMarkerOptions.position(localLatLng);
    localMarkerOptions.title(paramPlace.getName());
    localMarkerOptions.icon(ColorMarkers.getPinByStatus("Closed", c));
    paramPlace = mMap.addMarker(localMarkerOptions);
    paramPlace.getId();
    if (markerSet == null) {
      markerSet = new HashSet();
    }
    markerSet.add(paramPlace);
  }
  
  void addPlace(Place paramPlace)
  {
    addPlaceAt(paramPlace, 0);
  }
  
  void addPlaceAt(Place paramPlace, int paramInt)
  {
    addPlaceToSet(paramPlace);
    addMarkerForPlace(paramPlace);
    addPlaceToNav(paramPlace);
    updateCameraForPlaces(selectedPlacesSet);
    paramPlace = getString(2131493079, new Object[] { paramPlace.getName() });
    ToastFactory.showCenteredShortToast(getActivity(), paramPlace);
  }
  
  protected void addPlaceToNav(final Place paramPlace)
  {
    paramPlace = new Runnable()
    {
      public void run()
      {
        try
        {
          InsertSinglePlace.creatOrUpdate(c, paramPlace);
          ((OnPlaceAddedListener)getActivity()).onPlaceAdded(paramPlace);
          return;
        }
        catch (SQLException localSQLException) {}
      }
    };
    handler.post(paramPlace);
  }
  
  void addPlaceToSet(Place paramPlace)
  {
    if (selectedPlacesSet == null) {
      selectedPlacesSet = new HashSet(5);
    }
    paramPlace.setSelected(true);
    selectedPlacesSet.add(paramPlace);
  }
  
  protected void doSearch()
  {
    Object localObject = (EditText)rootFrag.findViewById(2131362003);
    FormUtil.hideKeyboard((View)localObject);
    localObject = ((EditText)localObject).getText().toString();
    if ((localObject != null) && (((String)localObject).length() > 0)) {
      search((String)localObject);
    }
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  protected View getPlaceRowByTag(Place paramPlace)
  {
    int i = 0;
    while (i < placeContainer.getChildCount()) {
      try
      {
        View localView = placeContainer.getChildAt(i);
        boolean bool = paramPlace.equals((Place)localView.getTag());
        if (bool) {
          return localView;
        }
      }
      catch (Exception localException)
      {
        i += 1;
      }
    }
    return null;
  }
  
  protected void hideProgressWheelDialog()
  {
    if (progWheelDiag != null) {
      progWheelDiag.dismiss();
    }
  }
  
  protected void ignorePlace(Place paramPlace)
  {
    paramPlace.setIgnored(true);
    removePlace(paramPlace);
    showSinglePlaceAt(paramPlace, paramPlace.getListPosition());
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    c = getActivity().getApplicationContext();
    setReferences();
    createListeners();
    setListeners();
    initMap();
    setHasOptionsMenu(true);
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
  }
  
  public Loader<List<Place>> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    paramBundle = new GetPlacesTask(c, null, lastKnownLocation);
    return new PlaceAsyncLoader(c, paramBundle);
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenu.clear();
    paramMenuInflater.inflate(2131623938, paramMenu);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903090, paramViewGroup, false));
    MyApplication.inject(this);
    MapsInitializer.initialize(getActivity());
    return rootFrag;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    clearReferences();
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    clearReferences();
    unSubscribeFromEventBus();
  }
  
  public void onLoadFinished(Loader<List<Place>> paramLoader, List<Place> paramList)
  {
    if (getActivity() == null) {}
    while (!isVisible()) {
      return;
    }
    try
    {
      showPlaces(paramList);
      return;
    }
    catch (Exception paramLoader) {}
  }
  
  public void onLoaderReset(Loader<List<Place>> paramLoader) {}
  
  public void onLocationChanged(Location paramLocation)
  {
    removeMapListeners();
  }
  
  @Subscribe
  public void onLocationConnectedEvent(LocationConnectedEvent paramLocationConnectedEvent)
  {
    if ((paramLocationConnectedEvent != null) && (getActivity() != null))
    {
      if (LocationValidator.isPrecise(LocationValidator.Stratigies.PrecisionStrategyEnum.CLOSE_AND_RECENT, paramLocationConnectedEvent.getLastKnownLocation())) {
        processLocation(paramLocationConnectedEvent.getLastKnownLocation());
      }
    }
    else {
      return;
    }
    locationAdapter.startHighAccuracyLocationUpdates();
  }
  
  @Subscribe
  public void onLocationTimeoutEvent(LocationTimeoutEvent paramLocationTimeoutEvent)
  {
    processLocation(paramLocationTimeoutEvent.getLocation());
  }
  
  @Subscribe
  public void onLocationUpdate(LocationUpdateEvent paramLocationUpdateEvent)
  {
    processLocation(paramLocationUpdateEvent.getLocation());
  }
  
  public void onMapPlaceCancel() {}
  
  public void onMapPlaceSaved(PageParams paramPageParams)
  {
    try
    {
      Place localPlace = (Place)paramPageParams.getParcel();
      if (sortedPlaces == null) {}
      for (paramPageParams = new ArrayList();; paramPageParams = sortedPlaces)
      {
        sortedPlaces = paramPageParams;
        sortedPlaces.add(0, localPlace);
        showSinglePlace(localPlace);
        return;
      }
      return;
    }
    catch (Exception paramPageParams) {}
  }
  
  public void onResume()
  {
    super.onResume();
    setUpMapIfNeeded();
    subscribeToEventBus();
    locationAdapter.startHighAccuracyLocationUpdates();
  }
  
  public void onStop()
  {
    super.onStop();
    if (placeSearchTask != null) {
      placeSearchTask.cancel(true);
    }
    try
    {
      handler.removeCallbacksAndMessages(null);
      unSubscribeFromEventBus();
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  void removeMarkerForPlace(Place paramPlace)
  {
    if ((paramPlace != null) && (markerSet != null)) {}
    try
    {
      Iterator localIterator = markerSet.iterator();
      while (localIterator.hasNext())
      {
        Marker localMarker = (Marker)localIterator.next();
        if (localMarker.getTitle().equals(paramPlace.getName())) {
          localMarker.remove();
        }
      }
      return;
    }
    catch (Exception paramPlace) {}
  }
  
  void removePlace(Place paramPlace)
  {
    removeMarkerForPlace(paramPlace);
    removePlaceFromSet(paramPlace);
    removePlaceFromNav(paramPlace);
    updateCameraForPlaces(selectedPlacesSet);
  }
  
  protected void removePlaceFromNav(final Place paramPlace)
  {
    paramPlace = new Runnable()
    {
      public void run()
      {
        try
        {
          InsertSinglePlace.creatOrUpdate(c, paramPlace);
          ((OnPlaceAddedListener)getActivity()).onPlaceRemoved(paramPlace);
          return;
        }
        catch (SQLException localSQLException) {}
      }
    };
    handler.post(paramPlace);
  }
  
  void removePlaceFromSet(Place paramPlace)
  {
    paramPlace.setSelected(false);
    if (selectedPlacesSet != null) {
      selectedPlacesSet.remove(paramPlace);
    }
  }
  
  protected void search(final String paramString)
  {
    placeSearchTask = new AsyncTask()
    {
      protected Place doInBackground(String... paramAnonymousVarArgs)
      {
        paramAnonymousVarArgs = new GetPlaceBySearchTask(c, null, lastKnownLocation, paramAnonymousVarArgs[0]).call();
        try
        {
          paramAnonymousVarArgs = (Place)paramAnonymousVarArgs.get(0);
          return paramAnonymousVarArgs;
        }
        catch (Exception paramAnonymousVarArgs) {}
        return null;
      }
      
      protected void onPostExecute(Place paramAnonymousPlace)
      {
        if (getActivity() == null) {
          return;
        }
        super.onPostExecute(paramAnonymousPlace);
        hideProgressWheelDialog();
        if ((paramAnonymousPlace != null) && (paramAnonymousPlace.getName() != null))
        {
          PlacesFrag localPlacesFrag = PlacesFrag.this;
          if (sortedPlaces == null) {}
          for (Object localObject = new ArrayList();; localObject = sortedPlaces)
          {
            PlacesFrag.access$502(localPlacesFrag, (List)localObject);
            sortedPlaces.add(0, paramAnonymousPlace);
            searchAutoTextView.setText("");
            PlacesFrag.this.showSinglePlace(paramAnonymousPlace);
            return;
          }
        }
        paramAnonymousPlace = getString(2131493176, new Object[] { paramString });
        ToastFactory.showCenteredShortToast(getActivity(), paramAnonymousPlace);
      }
      
      protected void onPreExecute()
      {
        super.onPreExecute();
        showProgressWheelDialog();
      }
    };
    placeSearchTask.execute(new String[] { paramString });
  }
  
  protected void showMapFull()
  {
    PageParams localPageParams = PageParamsFactory.getPlacesParams(getActivity().getApplicationContext());
    localPageParams.setParcel(lastKnownLocation);
    ((PlaceMapLauncher)getSherlockActivity()).launchPlacesMap(this, localPageParams);
  }
  
  protected void showProgressWheelDialog()
  {
    String str = getString(2131493177);
    progWheelDiag = new ProgressWheelDialog();
    progWheelDiag.setMessage(str);
    progWheelDiag.show(getActivity().getSupportFragmentManager(), null);
  }
  
  protected void undo(Place paramPlace)
  {
    try
    {
      paramPlace.setIgnored(false);
      placeContainer.removeViewAt(paramPlace.getListPosition());
      showSinglePlaceAt(paramPlace, paramPlace.getListPosition());
      return;
    }
    catch (Exception paramPlace) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */