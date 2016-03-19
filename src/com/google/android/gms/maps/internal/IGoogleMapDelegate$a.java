package com.google.android.gms.maps.internal;

import android.location.Location;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.CircleOptions;
import com.google.android.gms.maps.model.GroundOverlayOptions;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.PolylineOptions;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.android.gms.maps.model.internal.IPolylineDelegate;
import com.google.android.gms.maps.model.internal.d;
import com.google.android.gms.maps.model.internal.f;
import com.google.android.gms.maps.model.internal.h;
import com.google.android.gms.maps.model.internal.i;
import com.google.android.gms.maps.model.internal.i.a;
import com.google.android.gms.maps.model.internal.j;
import com.google.android.gms.maps.model.internal.l;
import com.google.android.gms.maps.model.internal.n;
import com.google.android.gms.maps.model.internal.p;
import com.google.android.gms.maps.model.internal.q;
import com.google.android.gms.maps.model.k;
import com.google.android.gms.maps.model.o;
import com.google.android.gms.maps.model.w;

public abstract class IGoogleMapDelegate$a
  extends Binder
  implements IGoogleMapDelegate
{
  public static IGoogleMapDelegate aT(IBinder paramIBinder)
  {
    if (paramIBinder == null) {
      return null;
    }
    IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
    if ((localIInterface != null) && ((localIInterface instanceof IGoogleMapDelegate))) {
      return (IGoogleMapDelegate)localIInterface;
    }
    return new a(paramIBinder);
  }
  
  public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
    throws RemoteException
  {
    int i = 0;
    int j = 0;
    int k = 0;
    boolean bool2 = false;
    int m = 0;
    boolean bool3 = false;
    int n = 0;
    boolean bool1 = false;
    Object localObject3 = null;
    Object localObject4 = null;
    Object localObject5 = null;
    Object localObject6 = null;
    Object localObject8 = null;
    Object localObject9 = null;
    Object localObject7 = null;
    Object localObject10 = null;
    Object localObject11 = null;
    Object localObject12 = null;
    Object localObject13 = null;
    Object localObject14 = null;
    IPolylineDelegate localIPolylineDelegate = null;
    Object localObject2 = null;
    Object localObject1 = null;
    float f;
    switch (paramInt1)
    {
    default: 
      return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
    case 1598968902: 
      paramParcel2.writeString("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      return true;
    case 1: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      paramParcel1 = getCameraPosition();
      paramParcel2.writeNoException();
      if (paramParcel1 != null)
      {
        paramParcel2.writeInt(1);
        paramParcel1.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    case 2: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      f = getMaxZoomLevel();
      paramParcel2.writeNoException();
      paramParcel2.writeFloat(f);
      return true;
    case 3: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      f = getMinZoomLevel();
      paramParcel2.writeNoException();
      paramParcel2.writeFloat(f);
      return true;
    case 4: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      moveCamera(com.google.android.gms.dynamic.d.a.ap(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 5: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      animateCamera(com.google.android.gms.dynamic.d.a.ap(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 6: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      animateCameraWithCallback(com.google.android.gms.dynamic.d.a.ap(paramParcel1.readStrongBinder()), b.a.aR(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 7: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      animateCameraWithDurationAndCallback(com.google.android.gms.dynamic.d.a.ap(paramParcel1.readStrongBinder()), paramParcel1.readInt(), b.a.aR(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 8: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      stopAnimation();
      paramParcel2.writeNoException();
      return true;
    case 9: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = PolylineOptions.CREATOR.dh(paramParcel1);; paramParcel1 = null)
      {
        localIPolylineDelegate = addPolyline(paramParcel1);
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject1;
        if (localIPolylineDelegate != null) {
          paramParcel1 = localIPolylineDelegate.asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      }
    case 10: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = PolygonOptions.CREATOR.dg(paramParcel1);; paramParcel1 = null)
      {
        localObject1 = addPolygon(paramParcel1);
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject3;
        if (localObject1 != null) {
          paramParcel1 = ((com.google.android.gms.maps.model.internal.m)localObject1).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      }
    case 11: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = MarkerOptions.CREATOR.df(paramParcel1);; paramParcel1 = null)
      {
        localObject1 = addMarker(paramParcel1);
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject4;
        if (localObject1 != null) {
          paramParcel1 = ((l)localObject1).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      }
    case 12: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = GroundOverlayOptions.CREATOR.dc(paramParcel1);; paramParcel1 = null)
      {
        localObject1 = addGroundOverlay(paramParcel1);
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject5;
        if (localObject1 != null) {
          paramParcel1 = ((i)localObject1).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      }
    case 13: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = TileOverlayOptions.CREATOR.dn(paramParcel1);; paramParcel1 = null)
      {
        localObject1 = addTileOverlay(paramParcel1);
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject6;
        if (localObject1 != null) {
          paramParcel1 = ((n)localObject1).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      }
    case 14: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      clear();
      paramParcel2.writeNoException();
      return true;
    case 15: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      paramInt1 = getMapType();
      paramParcel2.writeNoException();
      paramParcel2.writeInt(paramInt1);
      return true;
    case 16: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setMapType(paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    case 17: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      bool1 = isTrafficEnabled();
      paramParcel2.writeNoException();
      if (bool1) {}
      for (paramInt1 = 1;; paramInt1 = 0)
      {
        paramParcel2.writeInt(paramInt1);
        return true;
      }
    case 18: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {
        bool1 = true;
      }
      setTrafficEnabled(bool1);
      paramParcel2.writeNoException();
      return true;
    case 19: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      bool1 = isIndoorEnabled();
      paramParcel2.writeNoException();
      paramInt1 = i;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 20: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (bool1 = true;; bool1 = false)
      {
        bool1 = setIndoorEnabled(bool1);
        paramParcel2.writeNoException();
        paramInt1 = j;
        if (bool1) {
          paramInt1 = 1;
        }
        paramParcel2.writeInt(paramInt1);
        return true;
      }
    case 21: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      bool1 = isMyLocationEnabled();
      paramParcel2.writeNoException();
      paramInt1 = k;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 22: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      bool1 = bool2;
      if (paramParcel1.readInt() != 0) {
        bool1 = true;
      }
      setMyLocationEnabled(bool1);
      paramParcel2.writeNoException();
      return true;
    case 23: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      paramParcel1 = getMyLocation();
      paramParcel2.writeNoException();
      if (paramParcel1 != null)
      {
        paramParcel2.writeInt(1);
        paramParcel1.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    case 24: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setLocationSource(ILocationSourceDelegate.a.aW(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 25: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      localObject1 = getUiSettings();
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject8;
      if (localObject1 != null) {
        paramParcel1 = ((IUiSettingsDelegate)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 26: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      localObject1 = getProjection();
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject9;
      if (localObject1 != null) {
        paramParcel1 = ((IProjectionDelegate)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 27: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnCameraChangeListener(f.a.aZ(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 28: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnMapClickListener(j.a.bd(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 29: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnMapLongClickListener(l.a.bf(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 30: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnMarkerClickListener(n.a.bh(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 31: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnMarkerDragListener(o.a.bi(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 32: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnInfoWindowClickListener(h.a.bb(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 33: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setInfoWindowAdapter(d.a.aU(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 35: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = CircleOptions.CREATOR.db(paramParcel1);; paramParcel1 = null)
      {
        localObject1 = addCircle(paramParcel1);
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject7;
        if (localObject1 != null) {
          paramParcel1 = ((h)localObject1).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      }
    case 36: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnMyLocationChangeListener(q.a.bk(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 37: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnMyLocationButtonClickListener(p.a.bj(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 38: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      snapshot(v.a.bq(paramParcel1.readStrongBinder()), com.google.android.gms.dynamic.d.a.ap(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 39: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setPadding(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    case 40: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      bool1 = isBuildingsEnabled();
      paramParcel2.writeNoException();
      paramInt1 = m;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 41: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      bool1 = bool3;
      if (paramParcel1.readInt() != 0) {
        bool1 = true;
      }
      setBuildingsEnabled(bool1);
      paramParcel2.writeNoException();
      return true;
    case 42: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnMapLoadedCallback(k.a.be(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 44: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      localObject1 = getFocusedBuilding();
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject10;
      if (localObject1 != null) {
        paramParcel1 = ((j)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 45: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setOnIndoorStateChangeListener(g.a.ba(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 53: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      getMapAsync(m.a.bg(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 54: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; paramParcel1 = null)
      {
        onCreate(paramParcel1);
        paramParcel2.writeNoException();
        return true;
      }
    case 55: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      onResume();
      paramParcel2.writeNoException();
      return true;
    case 56: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      onPause();
      paramParcel2.writeNoException();
      return true;
    case 57: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      onDestroy();
      paramParcel2.writeNoException();
      return true;
    case 58: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      onLowMemory();
      paramParcel2.writeNoException();
      return true;
    case 59: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      bool1 = useViewLifecycleWhenInFragment();
      paramParcel2.writeNoException();
      paramInt1 = n;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 60: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0) {}
      for (paramParcel1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; paramParcel1 = null)
      {
        onSaveInstanceState(paramParcel1);
        paramParcel2.writeNoException();
        if (paramParcel1 == null) {
          break;
        }
        paramParcel2.writeInt(1);
        paramParcel1.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    case 61: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setContentDescription(paramParcel1.readString());
      paramParcel2.writeNoException();
      return true;
    case 64: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      localObject1 = localObject11;
      if (paramParcel1.readInt() != 0) {
        localObject1 = com.google.android.gms.maps.model.internal.c.CREATOR.dq(paramParcel1);
      }
      moveCamera2((com.google.android.gms.maps.model.internal.c)localObject1);
      paramParcel2.writeNoException();
      return true;
    case 65: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      localObject1 = localObject12;
      if (paramParcel1.readInt() != 0) {
        localObject1 = com.google.android.gms.maps.model.internal.c.CREATOR.dq(paramParcel1);
      }
      animateCamera2((com.google.android.gms.maps.model.internal.c)localObject1);
      paramParcel2.writeNoException();
      return true;
    case 66: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      localObject1 = localObject13;
      if (paramParcel1.readInt() != 0) {
        localObject1 = com.google.android.gms.maps.model.internal.c.CREATOR.dq(paramParcel1);
      }
      animateCameraWithCallback2((com.google.android.gms.maps.model.internal.c)localObject1, b.a.aR(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 67: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      localObject1 = localObject14;
      if (paramParcel1.readInt() != 0) {
        localObject1 = com.google.android.gms.maps.model.internal.c.CREATOR.dq(paramParcel1);
      }
      animateCameraWithDurationAndCallback2((com.google.android.gms.maps.model.internal.c)localObject1, paramParcel1.readInt(), b.a.aR(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 68: 
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      if (paramParcel1.readInt() != 0)
      {
        localObject1 = MarkerOptions.CREATOR.df(paramParcel1);
        if (paramParcel1.readInt() == 0) {
          break label2475;
        }
      }
      for (paramParcel1 = p.CREATOR.ds(paramParcel1);; paramParcel1 = null)
      {
        localObject1 = addMarker2((MarkerOptions)localObject1, paramParcel1);
        paramParcel2.writeNoException();
        paramParcel1 = localIPolylineDelegate;
        if (localObject1 != null) {
          paramParcel1 = ((l)localObject1).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
        localObject1 = null;
        break;
      }
    case 69: 
      label2475:
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
      setInfoWindowRenderer(e.a.aV(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }
    paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IGoogleMapDelegate");
    if (paramParcel1.readInt() != 0)
    {
      localObject1 = GroundOverlayOptions.CREATOR.dc(paramParcel1);
      if (paramParcel1.readInt() == 0) {
        break label2582;
      }
    }
    label2582:
    for (paramParcel1 = com.google.android.gms.maps.model.internal.e.CREATOR.dr(paramParcel1);; paramParcel1 = null)
    {
      localObject1 = addGroundOverlay2((GroundOverlayOptions)localObject1, paramParcel1);
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject2;
      if (localObject1 != null) {
        paramParcel1 = ((i)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
      localObject1 = null;
      break;
    }
  }
  
  private static class a
    implements IGoogleMapDelegate
  {
    private IBinder le;
    
    a(IBinder paramIBinder)
    {
      le = paramIBinder;
    }
    
    /* Error */
    public h addCircle(CircleOptions paramCircleOptions)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +51 -> 66
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 45	com/google/android/gms/maps/model/CircleOptions:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 35
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
      //   52: invokestatic 64	com/google/android/gms/maps/model/internal/h$a:bw	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/h;
      //   55: astore_1
      //   56: aload_3
      //   57: invokevirtual 67	android/os/Parcel:recycle	()V
      //   60: aload_2
      //   61: invokevirtual 67	android/os/Parcel:recycle	()V
      //   64: aload_1
      //   65: areturn
      //   66: aload_2
      //   67: iconst_0
      //   68: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   71: goto -42 -> 29
      //   74: astore_1
      //   75: aload_3
      //   76: invokevirtual 67	android/os/Parcel:recycle	()V
      //   79: aload_2
      //   80: invokevirtual 67	android/os/Parcel:recycle	()V
      //   83: aload_1
      //   84: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	85	0	this	a
      //   0	85	1	paramCircleOptions	CircleOptions
      //   3	77	2	localParcel1	Parcel
      //   7	69	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	74	finally
      //   18	29	74	finally
      //   29	56	74	finally
      //   66	71	74	finally
    }
    
    /* Error */
    public i addGroundOverlay(GroundOverlayOptions paramGroundOverlayOptions)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +51 -> 66
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 73	com/google/android/gms/maps/model/GroundOverlayOptions:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 12
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
      //   52: invokestatic 79	com/google/android/gms/maps/model/internal/i$a:bx	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/i;
      //   55: astore_1
      //   56: aload_3
      //   57: invokevirtual 67	android/os/Parcel:recycle	()V
      //   60: aload_2
      //   61: invokevirtual 67	android/os/Parcel:recycle	()V
      //   64: aload_1
      //   65: areturn
      //   66: aload_2
      //   67: iconst_0
      //   68: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   71: goto -42 -> 29
      //   74: astore_1
      //   75: aload_3
      //   76: invokevirtual 67	android/os/Parcel:recycle	()V
      //   79: aload_2
      //   80: invokevirtual 67	android/os/Parcel:recycle	()V
      //   83: aload_1
      //   84: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	85	0	this	a
      //   0	85	1	paramGroundOverlayOptions	GroundOverlayOptions
      //   3	77	2	localParcel1	Parcel
      //   7	69	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	74	finally
      //   18	29	74	finally
      //   29	56	74	finally
      //   66	71	74	finally
    }
    
    public i addGroundOverlay2(GroundOverlayOptions paramGroundOverlayOptions, com.google.android.gms.maps.model.internal.e parame)
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      for (;;)
      {
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          if (paramGroundOverlayOptions != null)
          {
            localParcel1.writeInt(1);
            paramGroundOverlayOptions.writeToParcel(localParcel1, 0);
            if (parame != null)
            {
              localParcel1.writeInt(1);
              parame.writeToParcel(localParcel1, 0);
              le.transact(70, localParcel1, localParcel2, 0);
              localParcel2.readException();
              paramGroundOverlayOptions = i.a.bx(localParcel2.readStrongBinder());
              return paramGroundOverlayOptions;
            }
          }
          else
          {
            localParcel1.writeInt(0);
            continue;
          }
          localParcel1.writeInt(0);
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
    
    /* Error */
    public l addMarker(MarkerOptions paramMarkerOptions)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +51 -> 66
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 89	com/google/android/gms/maps/model/MarkerOptions:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 11
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
      //   52: invokestatic 95	com/google/android/gms/maps/model/internal/l$a:bA	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/l;
      //   55: astore_1
      //   56: aload_3
      //   57: invokevirtual 67	android/os/Parcel:recycle	()V
      //   60: aload_2
      //   61: invokevirtual 67	android/os/Parcel:recycle	()V
      //   64: aload_1
      //   65: areturn
      //   66: aload_2
      //   67: iconst_0
      //   68: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   71: goto -42 -> 29
      //   74: astore_1
      //   75: aload_3
      //   76: invokevirtual 67	android/os/Parcel:recycle	()V
      //   79: aload_2
      //   80: invokevirtual 67	android/os/Parcel:recycle	()V
      //   83: aload_1
      //   84: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	85	0	this	a
      //   0	85	1	paramMarkerOptions	MarkerOptions
      //   3	77	2	localParcel1	Parcel
      //   7	69	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	74	finally
      //   18	29	74	finally
      //   29	56	74	finally
      //   66	71	74	finally
    }
    
    public l addMarker2(MarkerOptions paramMarkerOptions, p paramp)
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      for (;;)
      {
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          if (paramMarkerOptions != null)
          {
            localParcel1.writeInt(1);
            paramMarkerOptions.writeToParcel(localParcel1, 0);
            if (paramp != null)
            {
              localParcel1.writeInt(1);
              paramp.writeToParcel(localParcel1, 0);
              le.transact(68, localParcel1, localParcel2, 0);
              localParcel2.readException();
              paramMarkerOptions = com.google.android.gms.maps.model.internal.l.a.bA(localParcel2.readStrongBinder());
              return paramMarkerOptions;
            }
          }
          else
          {
            localParcel1.writeInt(0);
            continue;
          }
          localParcel1.writeInt(0);
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
    
    /* Error */
    public com.google.android.gms.maps.model.internal.m addPolygon(PolygonOptions paramPolygonOptions)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +51 -> 66
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 105	com/google/android/gms/maps/model/PolygonOptions:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 10
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
      //   52: invokestatic 111	com/google/android/gms/maps/model/internal/m$a:bB	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/m;
      //   55: astore_1
      //   56: aload_3
      //   57: invokevirtual 67	android/os/Parcel:recycle	()V
      //   60: aload_2
      //   61: invokevirtual 67	android/os/Parcel:recycle	()V
      //   64: aload_1
      //   65: areturn
      //   66: aload_2
      //   67: iconst_0
      //   68: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   71: goto -42 -> 29
      //   74: astore_1
      //   75: aload_3
      //   76: invokevirtual 67	android/os/Parcel:recycle	()V
      //   79: aload_2
      //   80: invokevirtual 67	android/os/Parcel:recycle	()V
      //   83: aload_1
      //   84: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	85	0	this	a
      //   0	85	1	paramPolygonOptions	PolygonOptions
      //   3	77	2	localParcel1	Parcel
      //   7	69	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	74	finally
      //   18	29	74	finally
      //   29	56	74	finally
      //   66	71	74	finally
    }
    
    /* Error */
    public IPolylineDelegate addPolyline(PolylineOptions paramPolylineOptions)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +51 -> 66
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 116	com/google/android/gms/maps/model/PolylineOptions:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 9
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
      //   52: invokestatic 122	com/google/android/gms/maps/model/internal/IPolylineDelegate$a:bC	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/IPolylineDelegate;
      //   55: astore_1
      //   56: aload_3
      //   57: invokevirtual 67	android/os/Parcel:recycle	()V
      //   60: aload_2
      //   61: invokevirtual 67	android/os/Parcel:recycle	()V
      //   64: aload_1
      //   65: areturn
      //   66: aload_2
      //   67: iconst_0
      //   68: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   71: goto -42 -> 29
      //   74: astore_1
      //   75: aload_3
      //   76: invokevirtual 67	android/os/Parcel:recycle	()V
      //   79: aload_2
      //   80: invokevirtual 67	android/os/Parcel:recycle	()V
      //   83: aload_1
      //   84: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	85	0	this	a
      //   0	85	1	paramPolylineOptions	PolylineOptions
      //   3	77	2	localParcel1	Parcel
      //   7	69	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	74	finally
      //   18	29	74	finally
      //   29	56	74	finally
      //   66	71	74	finally
    }
    
    /* Error */
    public n addTileOverlay(TileOverlayOptions paramTileOverlayOptions)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +51 -> 66
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 127	com/google/android/gms/maps/model/TileOverlayOptions:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 13
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 58	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
      //   52: invokestatic 133	com/google/android/gms/maps/model/internal/n$a:bD	(Landroid/os/IBinder;)Lcom/google/android/gms/maps/model/internal/n;
      //   55: astore_1
      //   56: aload_3
      //   57: invokevirtual 67	android/os/Parcel:recycle	()V
      //   60: aload_2
      //   61: invokevirtual 67	android/os/Parcel:recycle	()V
      //   64: aload_1
      //   65: areturn
      //   66: aload_2
      //   67: iconst_0
      //   68: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   71: goto -42 -> 29
      //   74: astore_1
      //   75: aload_3
      //   76: invokevirtual 67	android/os/Parcel:recycle	()V
      //   79: aload_2
      //   80: invokevirtual 67	android/os/Parcel:recycle	()V
      //   83: aload_1
      //   84: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	85	0	this	a
      //   0	85	1	paramTileOverlayOptions	TileOverlayOptions
      //   3	77	2	localParcel1	Parcel
      //   7	69	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	74	finally
      //   18	29	74	finally
      //   29	56	74	finally
      //   66	71	74	finally
    }
    
    /* Error */
    public void animateCamera(com.google.android.gms.dynamic.d paramd)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +42 -> 57
      //   18: aload_1
      //   19: invokeinterface 140 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: iconst_5
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 67	android/os/Parcel:recycle	()V
      //   52: aload_2
      //   53: invokevirtual 67	android/os/Parcel:recycle	()V
      //   56: return
      //   57: aconst_null
      //   58: astore_1
      //   59: goto -34 -> 25
      //   62: astore_1
      //   63: aload_3
      //   64: invokevirtual 67	android/os/Parcel:recycle	()V
      //   67: aload_2
      //   68: invokevirtual 67	android/os/Parcel:recycle	()V
      //   71: aload_1
      //   72: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	73	0	this	a
      //   0	73	1	paramd	com.google.android.gms.dynamic.d
      //   3	65	2	localParcel1	Parcel
      //   7	57	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	62	finally
      //   18	25	62	finally
      //   25	48	62	finally
    }
    
    /* Error */
    public void animateCamera2(com.google.android.gms.maps.model.internal.c paramc)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +42 -> 57
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 148	com/google/android/gms/maps/model/internal/c:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 65
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 67	android/os/Parcel:recycle	()V
      //   52: aload_2
      //   53: invokevirtual 67	android/os/Parcel:recycle	()V
      //   56: return
      //   57: aload_2
      //   58: iconst_0
      //   59: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   62: goto -33 -> 29
      //   65: astore_1
      //   66: aload_3
      //   67: invokevirtual 67	android/os/Parcel:recycle	()V
      //   70: aload_2
      //   71: invokevirtual 67	android/os/Parcel:recycle	()V
      //   74: aload_1
      //   75: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	76	0	this	a
      //   0	76	1	paramc	com.google.android.gms.maps.model.internal.c
      //   3	68	2	localParcel1	Parcel
      //   7	60	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	65	finally
      //   18	29	65	finally
      //   29	48	65	finally
      //   57	62	65	finally
    }
    
    /* Error */
    public void animateCameraWithCallback(com.google.android.gms.dynamic.d paramd, b paramb)
      throws RemoteException
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_3
      //   2: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   5: astore 4
      //   7: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   10: astore 5
      //   12: aload 4
      //   14: ldc 31
      //   16: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   19: aload_1
      //   20: ifnull +68 -> 88
      //   23: aload_1
      //   24: invokeinterface 140 1 0
      //   29: astore_1
      //   30: aload 4
      //   32: aload_1
      //   33: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   36: aload_3
      //   37: astore_1
      //   38: aload_2
      //   39: ifnull +10 -> 49
      //   42: aload_2
      //   43: invokeinterface 153 1 0
      //   48: astore_1
      //   49: aload 4
      //   51: aload_1
      //   52: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   55: aload_0
      //   56: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   59: bipush 6
      //   61: aload 4
      //   63: aload 5
      //   65: iconst_0
      //   66: invokeinterface 51 5 0
      //   71: pop
      //   72: aload 5
      //   74: invokevirtual 54	android/os/Parcel:readException	()V
      //   77: aload 5
      //   79: invokevirtual 67	android/os/Parcel:recycle	()V
      //   82: aload 4
      //   84: invokevirtual 67	android/os/Parcel:recycle	()V
      //   87: return
      //   88: aconst_null
      //   89: astore_1
      //   90: goto -60 -> 30
      //   93: astore_1
      //   94: aload 5
      //   96: invokevirtual 67	android/os/Parcel:recycle	()V
      //   99: aload 4
      //   101: invokevirtual 67	android/os/Parcel:recycle	()V
      //   104: aload_1
      //   105: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	106	0	this	a
      //   0	106	1	paramd	com.google.android.gms.dynamic.d
      //   0	106	2	paramb	b
      //   1	36	3	localObject	Object
      //   5	95	4	localParcel1	Parcel
      //   10	85	5	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   12	19	93	finally
      //   23	30	93	finally
      //   30	36	93	finally
      //   42	49	93	finally
      //   49	77	93	finally
    }
    
    public void animateCameraWithCallback2(com.google.android.gms.maps.model.internal.c paramc, b paramb)
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      for (;;)
      {
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          if (paramc != null)
          {
            localParcel1.writeInt(1);
            paramc.writeToParcel(localParcel1, 0);
            if (paramb != null)
            {
              paramc = paramb.asBinder();
              localParcel1.writeStrongBinder(paramc);
              le.transact(66, localParcel1, localParcel2, 0);
              localParcel2.readException();
            }
          }
          else
          {
            localParcel1.writeInt(0);
            continue;
          }
          paramc = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
    
    /* Error */
    public void animateCameraWithDurationAndCallback(com.google.android.gms.dynamic.d paramd, int paramInt, b paramb)
      throws RemoteException
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore 4
      //   3: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   6: astore 5
      //   8: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   11: astore 6
      //   13: aload 5
      //   15: ldc 31
      //   17: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   20: aload_1
      //   21: ifnull +75 -> 96
      //   24: aload_1
      //   25: invokeinterface 140 1 0
      //   30: astore_1
      //   31: aload 5
      //   33: aload_1
      //   34: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   37: aload 5
      //   39: iload_2
      //   40: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   43: aload 4
      //   45: astore_1
      //   46: aload_3
      //   47: ifnull +10 -> 57
      //   50: aload_3
      //   51: invokeinterface 153 1 0
      //   56: astore_1
      //   57: aload 5
      //   59: aload_1
      //   60: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   63: aload_0
      //   64: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   67: bipush 7
      //   69: aload 5
      //   71: aload 6
      //   73: iconst_0
      //   74: invokeinterface 51 5 0
      //   79: pop
      //   80: aload 6
      //   82: invokevirtual 54	android/os/Parcel:readException	()V
      //   85: aload 6
      //   87: invokevirtual 67	android/os/Parcel:recycle	()V
      //   90: aload 5
      //   92: invokevirtual 67	android/os/Parcel:recycle	()V
      //   95: return
      //   96: aconst_null
      //   97: astore_1
      //   98: goto -67 -> 31
      //   101: astore_1
      //   102: aload 6
      //   104: invokevirtual 67	android/os/Parcel:recycle	()V
      //   107: aload 5
      //   109: invokevirtual 67	android/os/Parcel:recycle	()V
      //   112: aload_1
      //   113: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	114	0	this	a
      //   0	114	1	paramd	com.google.android.gms.dynamic.d
      //   0	114	2	paramInt	int
      //   0	114	3	paramb	b
      //   1	43	4	localObject	Object
      //   6	102	5	localParcel1	Parcel
      //   11	92	6	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   13	20	101	finally
      //   24	31	101	finally
      //   31	43	101	finally
      //   50	57	101	finally
      //   57	85	101	finally
    }
    
    public void animateCameraWithDurationAndCallback2(com.google.android.gms.maps.model.internal.c paramc, int paramInt, b paramb)
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      for (;;)
      {
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
          if (paramc != null)
          {
            localParcel1.writeInt(1);
            paramc.writeToParcel(localParcel1, 0);
            localParcel1.writeInt(paramInt);
            if (paramb != null)
            {
              paramc = paramb.asBinder();
              localParcel1.writeStrongBinder(paramc);
              le.transact(67, localParcel1, localParcel2, 0);
              localParcel2.readException();
            }
          }
          else
          {
            localParcel1.writeInt(0);
            continue;
          }
          paramc = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
    
    public IBinder asBinder()
    {
      return le;
    }
    
    public void clear()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(14, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public CameraPosition getCameraPosition()
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_0
      //   15: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   18: iconst_1
      //   19: aload_2
      //   20: aload_3
      //   21: iconst_0
      //   22: invokeinterface 51 5 0
      //   27: pop
      //   28: aload_3
      //   29: invokevirtual 54	android/os/Parcel:readException	()V
      //   32: aload_3
      //   33: invokevirtual 166	android/os/Parcel:readInt	()I
      //   36: ifeq +21 -> 57
      //   39: getstatic 172	com/google/android/gms/maps/model/CameraPosition:CREATOR	Lcom/google/android/gms/maps/model/a;
      //   42: aload_3
      //   43: invokevirtual 178	com/google/android/gms/maps/model/a:da	(Landroid/os/Parcel;)Lcom/google/android/gms/maps/model/CameraPosition;
      //   46: astore_1
      //   47: aload_3
      //   48: invokevirtual 67	android/os/Parcel:recycle	()V
      //   51: aload_2
      //   52: invokevirtual 67	android/os/Parcel:recycle	()V
      //   55: aload_1
      //   56: areturn
      //   57: aconst_null
      //   58: astore_1
      //   59: goto -12 -> 47
      //   62: astore_1
      //   63: aload_3
      //   64: invokevirtual 67	android/os/Parcel:recycle	()V
      //   67: aload_2
      //   68: invokevirtual 67	android/os/Parcel:recycle	()V
      //   71: aload_1
      //   72: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	73	0	this	a
      //   46	13	1	localCameraPosition	CameraPosition
      //   62	10	1	localObject	Object
      //   3	65	2	localParcel1	Parcel
      //   7	57	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	47	62	finally
    }
    
    public j getFocusedBuilding()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(44, localParcel1, localParcel2, 0);
        localParcel2.readException();
        j localj = com.google.android.gms.maps.model.internal.j.a.by(localParcel2.readStrongBinder());
        return localj;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public void getMapAsync(m paramm)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 191 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 53
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramm	m
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    public int getMapType()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(15, localParcel1, localParcel2, 0);
        localParcel2.readException();
        int i = localParcel2.readInt();
        return i;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public float getMaxZoomLevel()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(2, localParcel1, localParcel2, 0);
        localParcel2.readException();
        float f = localParcel2.readFloat();
        return f;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public float getMinZoomLevel()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(3, localParcel1, localParcel2, 0);
        localParcel2.readException();
        float f = localParcel2.readFloat();
        return f;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public Location getMyLocation()
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_0
      //   15: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   18: bipush 23
      //   20: aload_2
      //   21: aload_3
      //   22: iconst_0
      //   23: invokeinterface 51 5 0
      //   28: pop
      //   29: aload_3
      //   30: invokevirtual 54	android/os/Parcel:readException	()V
      //   33: aload_3
      //   34: invokevirtual 166	android/os/Parcel:readInt	()I
      //   37: ifeq +26 -> 63
      //   40: getstatic 205	android/location/Location:CREATOR	Landroid/os/Parcelable$Creator;
      //   43: aload_3
      //   44: invokeinterface 211 2 0
      //   49: checkcast 202	android/location/Location
      //   52: astore_1
      //   53: aload_3
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: aload_2
      //   58: invokevirtual 67	android/os/Parcel:recycle	()V
      //   61: aload_1
      //   62: areturn
      //   63: aconst_null
      //   64: astore_1
      //   65: goto -12 -> 53
      //   68: astore_1
      //   69: aload_3
      //   70: invokevirtual 67	android/os/Parcel:recycle	()V
      //   73: aload_2
      //   74: invokevirtual 67	android/os/Parcel:recycle	()V
      //   77: aload_1
      //   78: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	79	0	this	a
      //   52	13	1	localLocation	Location
      //   68	10	1	localObject	Object
      //   3	71	2	localParcel1	Parcel
      //   7	63	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	53	68	finally
    }
    
    public IProjectionDelegate getProjection()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(26, localParcel1, localParcel2, 0);
        localParcel2.readException();
        IProjectionDelegate localIProjectionDelegate = IProjectionDelegate.a.bp(localParcel2.readStrongBinder());
        return localIProjectionDelegate;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public IUiSettingsDelegate getUiSettings()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(25, localParcel1, localParcel2, 0);
        localParcel2.readException();
        IUiSettingsDelegate localIUiSettingsDelegate = IUiSettingsDelegate.a.bu(localParcel2.readStrongBinder());
        return localIUiSettingsDelegate;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public boolean isBuildingsEnabled()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(40, localParcel1, localParcel2, 0);
        localParcel2.readException();
        int i = localParcel2.readInt();
        if (i != 0) {
          bool = true;
        }
        return bool;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public boolean isIndoorEnabled()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(19, localParcel1, localParcel2, 0);
        localParcel2.readException();
        int i = localParcel2.readInt();
        if (i != 0) {
          bool = true;
        }
        return bool;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public boolean isMyLocationEnabled()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(21, localParcel1, localParcel2, 0);
        localParcel2.readException();
        int i = localParcel2.readInt();
        if (i != 0) {
          bool = true;
        }
        return bool;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public boolean isTrafficEnabled()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(17, localParcel1, localParcel2, 0);
        localParcel2.readException();
        int i = localParcel2.readInt();
        if (i != 0) {
          bool = true;
        }
        return bool;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public void moveCamera(com.google.android.gms.dynamic.d paramd)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +42 -> 57
      //   18: aload_1
      //   19: invokeinterface 140 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: iconst_4
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 67	android/os/Parcel:recycle	()V
      //   52: aload_2
      //   53: invokevirtual 67	android/os/Parcel:recycle	()V
      //   56: return
      //   57: aconst_null
      //   58: astore_1
      //   59: goto -34 -> 25
      //   62: astore_1
      //   63: aload_3
      //   64: invokevirtual 67	android/os/Parcel:recycle	()V
      //   67: aload_2
      //   68: invokevirtual 67	android/os/Parcel:recycle	()V
      //   71: aload_1
      //   72: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	73	0	this	a
      //   0	73	1	paramd	com.google.android.gms.dynamic.d
      //   3	65	2	localParcel1	Parcel
      //   7	57	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	62	finally
      //   18	25	62	finally
      //   25	48	62	finally
    }
    
    /* Error */
    public void moveCamera2(com.google.android.gms.maps.model.internal.c paramc)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +42 -> 57
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 148	com/google/android/gms/maps/model/internal/c:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 64
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 67	android/os/Parcel:recycle	()V
      //   52: aload_2
      //   53: invokevirtual 67	android/os/Parcel:recycle	()V
      //   56: return
      //   57: aload_2
      //   58: iconst_0
      //   59: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   62: goto -33 -> 29
      //   65: astore_1
      //   66: aload_3
      //   67: invokevirtual 67	android/os/Parcel:recycle	()V
      //   70: aload_2
      //   71: invokevirtual 67	android/os/Parcel:recycle	()V
      //   74: aload_1
      //   75: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	76	0	this	a
      //   0	76	1	paramc	com.google.android.gms.maps.model.internal.c
      //   3	68	2	localParcel1	Parcel
      //   7	60	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	65	finally
      //   18	29	65	finally
      //   29	48	65	finally
      //   57	62	65	finally
    }
    
    /* Error */
    public void onCreate(Bundle paramBundle)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +42 -> 57
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 239	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 54
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 67	android/os/Parcel:recycle	()V
      //   52: aload_2
      //   53: invokevirtual 67	android/os/Parcel:recycle	()V
      //   56: return
      //   57: aload_2
      //   58: iconst_0
      //   59: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   62: goto -33 -> 29
      //   65: astore_1
      //   66: aload_3
      //   67: invokevirtual 67	android/os/Parcel:recycle	()V
      //   70: aload_2
      //   71: invokevirtual 67	android/os/Parcel:recycle	()V
      //   74: aload_1
      //   75: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	76	0	this	a
      //   0	76	1	paramBundle	Bundle
      //   3	68	2	localParcel1	Parcel
      //   7	60	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	65	finally
      //   18	29	65	finally
      //   29	48	65	finally
      //   57	62	65	finally
    }
    
    public void onDestroy()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(57, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void onLowMemory()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(58, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void onPause()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(56, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void onResume()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(55, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public void onSaveInstanceState(Bundle paramBundle)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +54 -> 69
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 239	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   33: bipush 60
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 51 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 54	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 166	android/os/Parcel:readInt	()I
      //   52: ifeq +8 -> 60
      //   55: aload_1
      //   56: aload_3
      //   57: invokevirtual 248	android/os/Bundle:readFromParcel	(Landroid/os/Parcel;)V
      //   60: aload_3
      //   61: invokevirtual 67	android/os/Parcel:recycle	()V
      //   64: aload_2
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: return
      //   69: aload_2
      //   70: iconst_0
      //   71: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   74: goto -45 -> 29
      //   77: astore_1
      //   78: aload_3
      //   79: invokevirtual 67	android/os/Parcel:recycle	()V
      //   82: aload_2
      //   83: invokevirtual 67	android/os/Parcel:recycle	()V
      //   86: aload_1
      //   87: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	88	0	this	a
      //   0	88	1	paramBundle	Bundle
      //   3	80	2	localParcel1	Parcel
      //   7	72	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	77	finally
      //   18	29	77	finally
      //   29	60	77	finally
      //   69	74	77	finally
    }
    
    public void setBuildingsEnabled(boolean paramBoolean)
      throws RemoteException
    {
      int i = 0;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramBoolean) {
          i = 1;
        }
        localParcel1.writeInt(i);
        le.transact(41, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void setContentDescription(String paramString)
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        localParcel1.writeString(paramString);
        le.transact(61, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public boolean setIndoorEnabled(boolean paramBoolean)
      throws RemoteException
    {
      // Byte code:
      //   0: iconst_1
      //   1: istore_3
      //   2: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   5: astore 4
      //   7: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   10: astore 5
      //   12: aload 4
      //   14: ldc 31
      //   16: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   19: iload_1
      //   20: ifeq +57 -> 77
      //   23: iconst_1
      //   24: istore_2
      //   25: aload 4
      //   27: iload_2
      //   28: invokevirtual 39	android/os/Parcel:writeInt	(I)V
      //   31: aload_0
      //   32: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   35: bipush 20
      //   37: aload 4
      //   39: aload 5
      //   41: iconst_0
      //   42: invokeinterface 51 5 0
      //   47: pop
      //   48: aload 5
      //   50: invokevirtual 54	android/os/Parcel:readException	()V
      //   53: aload 5
      //   55: invokevirtual 166	android/os/Parcel:readInt	()I
      //   58: istore_2
      //   59: iload_2
      //   60: ifeq +22 -> 82
      //   63: iload_3
      //   64: istore_1
      //   65: aload 5
      //   67: invokevirtual 67	android/os/Parcel:recycle	()V
      //   70: aload 4
      //   72: invokevirtual 67	android/os/Parcel:recycle	()V
      //   75: iload_1
      //   76: ireturn
      //   77: iconst_0
      //   78: istore_2
      //   79: goto -54 -> 25
      //   82: iconst_0
      //   83: istore_1
      //   84: goto -19 -> 65
      //   87: astore 6
      //   89: aload 5
      //   91: invokevirtual 67	android/os/Parcel:recycle	()V
      //   94: aload 4
      //   96: invokevirtual 67	android/os/Parcel:recycle	()V
      //   99: aload 6
      //   101: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	102	0	this	a
      //   0	102	1	paramBoolean	boolean
      //   24	55	2	i	int
      //   1	63	3	bool	boolean
      //   5	90	4	localParcel1	Parcel
      //   10	80	5	localParcel2	Parcel
      //   87	13	6	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   12	19	87	finally
      //   25	59	87	finally
    }
    
    /* Error */
    public void setInfoWindowAdapter(d paramd)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 261 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 33
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramd	d
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setInfoWindowRenderer(e parame)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 266 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 69
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	parame	e
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setLocationSource(ILocationSourceDelegate paramILocationSourceDelegate)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 271 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 24
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramILocationSourceDelegate	ILocationSourceDelegate
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    public void setMapType(int paramInt)
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        localParcel1.writeInt(paramInt);
        le.transact(16, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void setMyLocationEnabled(boolean paramBoolean)
      throws RemoteException
    {
      int i = 0;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramBoolean) {
          i = 1;
        }
        localParcel1.writeInt(i);
        le.transact(22, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public void setOnCameraChangeListener(f paramf)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 278 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 27
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramf	f
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnIndoorStateChangeListener(g paramg)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 283 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 45
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramg	g
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnInfoWindowClickListener(h paramh)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 288 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 32
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramh	h
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnMapClickListener(j paramj)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 293 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 28
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramj	j
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnMapLoadedCallback(k paramk)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 298 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 42
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramk	k
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnMapLongClickListener(l paraml)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 303 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 29
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paraml	l
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnMarkerClickListener(n paramn)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 308 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 30
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramn	n
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnMarkerDragListener(o paramo)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 313 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 31
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramo	o
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnMyLocationButtonClickListener(p paramp)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 318 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 37
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramp	p
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    /* Error */
    public void setOnMyLocationChangeListener(q paramq)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 31
      //   11: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 323 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   34: bipush 36
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 51 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 54	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 67	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 67	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 67	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 67	android/os/Parcel:recycle	()V
      //   72: aload_1
      //   73: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	74	0	this	a
      //   0	74	1	paramq	q
      //   3	66	2	localParcel1	Parcel
      //   7	58	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	14	63	finally
      //   18	25	63	finally
      //   25	49	63	finally
    }
    
    public void setPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        localParcel1.writeInt(paramInt1);
        localParcel1.writeInt(paramInt2);
        localParcel1.writeInt(paramInt3);
        localParcel1.writeInt(paramInt4);
        le.transact(39, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void setTrafficEnabled(boolean paramBoolean)
      throws RemoteException
    {
      int i = 0;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        if (paramBoolean) {
          i = 1;
        }
        localParcel1.writeInt(i);
        le.transact(18, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    /* Error */
    public void snapshot(v paramv, com.google.android.gms.dynamic.d paramd)
      throws RemoteException
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_3
      //   2: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   5: astore 4
      //   7: invokestatic 29	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   10: astore 5
      //   12: aload 4
      //   14: ldc 31
      //   16: invokevirtual 35	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   19: aload_1
      //   20: ifnull +68 -> 88
      //   23: aload_1
      //   24: invokeinterface 331 1 0
      //   29: astore_1
      //   30: aload 4
      //   32: aload_1
      //   33: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   36: aload_3
      //   37: astore_1
      //   38: aload_2
      //   39: ifnull +10 -> 49
      //   42: aload_2
      //   43: invokeinterface 140 1 0
      //   48: astore_1
      //   49: aload 4
      //   51: aload_1
      //   52: invokevirtual 143	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   55: aload_0
      //   56: getfield 18	com/google/android/gms/maps/internal/IGoogleMapDelegate$a$a:le	Landroid/os/IBinder;
      //   59: bipush 38
      //   61: aload 4
      //   63: aload 5
      //   65: iconst_0
      //   66: invokeinterface 51 5 0
      //   71: pop
      //   72: aload 5
      //   74: invokevirtual 54	android/os/Parcel:readException	()V
      //   77: aload 5
      //   79: invokevirtual 67	android/os/Parcel:recycle	()V
      //   82: aload 4
      //   84: invokevirtual 67	android/os/Parcel:recycle	()V
      //   87: return
      //   88: aconst_null
      //   89: astore_1
      //   90: goto -60 -> 30
      //   93: astore_1
      //   94: aload 5
      //   96: invokevirtual 67	android/os/Parcel:recycle	()V
      //   99: aload 4
      //   101: invokevirtual 67	android/os/Parcel:recycle	()V
      //   104: aload_1
      //   105: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	106	0	this	a
      //   0	106	1	paramv	v
      //   0	106	2	paramd	com.google.android.gms.dynamic.d
      //   1	36	3	localObject	Object
      //   5	95	4	localParcel1	Parcel
      //   10	85	5	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   12	19	93	finally
      //   23	30	93	finally
      //   30	36	93	finally
      //   42	49	93	finally
      //   49	77	93	finally
    }
    
    public void stopAnimation()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(8, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public boolean useViewLifecycleWhenInFragment()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.maps.internal.IGoogleMapDelegate");
        le.transact(59, localParcel1, localParcel2, 0);
        localParcel2.readException();
        int i = localParcel2.readInt();
        if (i != 0) {
          bool = true;
        }
        return bool;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.maps.internal.IGoogleMapDelegate.a
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */