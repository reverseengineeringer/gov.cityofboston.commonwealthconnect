package com.google.android.gms.dynamic;

import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract class c$a
  extends Binder
  implements c
{
  public c$a()
  {
    attachInterface(this, "com.google.android.gms.dynamic.IFragmentWrapper");
  }
  
  public static c ao(IBinder paramIBinder)
  {
    if (paramIBinder == null) {
      return null;
    }
    IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.dynamic.IFragmentWrapper");
    if ((localIInterface != null) && ((localIInterface instanceof c))) {
      return (c)localIInterface;
    }
    return new a(paramIBinder);
  }
  
  public IBinder asBinder()
  {
    return this;
  }
  
  public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
    throws RemoteException
  {
    d locald = null;
    Object localObject2 = null;
    Object localObject3 = null;
    Object localObject4 = null;
    Object localObject5 = null;
    Object localObject6 = null;
    Object localObject1 = null;
    int j = 0;
    int k = 0;
    int m = 0;
    int n = 0;
    int i1 = 0;
    int i2 = 0;
    int i3 = 0;
    boolean bool1 = false;
    boolean bool2 = false;
    boolean bool3 = false;
    boolean bool4 = false;
    int i = 0;
    switch (paramInt1)
    {
    default: 
      return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
    case 1598968902: 
      paramParcel2.writeString("com.google.android.gms.dynamic.IFragmentWrapper");
      return true;
    case 2: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      locald = jf();
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject1;
      if (locald != null) {
        paramParcel1 = locald.asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 3: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      paramParcel1 = getArguments();
      paramParcel2.writeNoException();
      if (paramParcel1 != null)
      {
        paramParcel2.writeInt(1);
        paramParcel1.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    case 4: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      paramInt1 = getId();
      paramParcel2.writeNoException();
      paramParcel2.writeInt(paramInt1);
      return true;
    case 5: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      localObject1 = jg();
      paramParcel2.writeNoException();
      paramParcel1 = locald;
      if (localObject1 != null) {
        paramParcel1 = ((c)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 6: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      localObject1 = jh();
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject2;
      if (localObject1 != null) {
        paramParcel1 = ((d)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 7: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = getRetainInstance();
      paramParcel2.writeNoException();
      if (bool1) {}
      for (paramInt1 = 1;; paramInt1 = 0)
      {
        paramParcel2.writeInt(paramInt1);
        return true;
      }
    case 8: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      paramParcel1 = getTag();
      paramParcel2.writeNoException();
      paramParcel2.writeString(paramParcel1);
      return true;
    case 9: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      localObject1 = ji();
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject3;
      if (localObject1 != null) {
        paramParcel1 = ((c)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 10: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      paramInt1 = getTargetRequestCode();
      paramParcel2.writeNoException();
      paramParcel2.writeInt(paramInt1);
      return true;
    case 11: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = getUserVisibleHint();
      paramParcel2.writeNoException();
      paramInt1 = i;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 12: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      localObject1 = getView();
      paramParcel2.writeNoException();
      paramParcel1 = (Parcel)localObject4;
      if (localObject1 != null) {
        paramParcel1 = ((d)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    case 13: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = isAdded();
      paramParcel2.writeNoException();
      paramInt1 = j;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 14: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = isDetached();
      paramParcel2.writeNoException();
      paramInt1 = k;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 15: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = isHidden();
      paramParcel2.writeNoException();
      paramInt1 = m;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 16: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = isInLayout();
      paramParcel2.writeNoException();
      paramInt1 = n;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 17: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = isRemoving();
      paramParcel2.writeNoException();
      paramInt1 = i1;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 18: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = isResumed();
      paramParcel2.writeNoException();
      paramInt1 = i2;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 19: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = isVisible();
      paramParcel2.writeNoException();
      paramInt1 = i3;
      if (bool1) {
        paramInt1 = 1;
      }
      paramParcel2.writeInt(paramInt1);
      return true;
    case 20: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      d(d.a.ap(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    case 21: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      if (paramParcel1.readInt() != 0) {
        bool1 = true;
      }
      setHasOptionsMenu(bool1);
      paramParcel2.writeNoException();
      return true;
    case 22: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = bool2;
      if (paramParcel1.readInt() != 0) {
        bool1 = true;
      }
      setMenuVisibility(bool1);
      paramParcel2.writeNoException();
      return true;
    case 23: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = bool3;
      if (paramParcel1.readInt() != 0) {
        bool1 = true;
      }
      setRetainInstance(bool1);
      paramParcel2.writeNoException();
      return true;
    case 24: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      bool1 = bool4;
      if (paramParcel1.readInt() != 0) {
        bool1 = true;
      }
      setUserVisibleHint(bool1);
      paramParcel2.writeNoException();
      return true;
    case 25: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      localObject1 = localObject5;
      if (paramParcel1.readInt() != 0) {
        localObject1 = (Intent)Intent.CREATOR.createFromParcel(paramParcel1);
      }
      startActivity((Intent)localObject1);
      paramParcel2.writeNoException();
      return true;
    case 26: 
      paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
      localObject1 = localObject6;
      if (paramParcel1.readInt() != 0) {
        localObject1 = (Intent)Intent.CREATOR.createFromParcel(paramParcel1);
      }
      startActivityForResult((Intent)localObject1, paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
    }
    paramParcel1.enforceInterface("com.google.android.gms.dynamic.IFragmentWrapper");
    e(d.a.ap(paramParcel1.readStrongBinder()));
    paramParcel2.writeNoException();
    return true;
  }
  
  private static class a
    implements c
  {
    private IBinder le;
    
    a(IBinder paramIBinder)
    {
      le = paramIBinder;
    }
    
    public IBinder asBinder()
    {
      return le;
    }
    
    /* Error */
    public void d(d paramd)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 33
      //   11: invokevirtual 37	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 41 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 44	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/dynamic/c$a$a:le	Landroid/os/IBinder;
      //   34: bipush 20
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 50 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 53	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 56	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 56	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 56	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 56	android/os/Parcel:recycle	()V
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
    public void e(d paramd)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 33
      //   11: invokevirtual 37	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +43 -> 58
      //   18: aload_1
      //   19: invokeinterface 41 1 0
      //   24: astore_1
      //   25: aload_2
      //   26: aload_1
      //   27: invokevirtual 44	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
      //   30: aload_0
      //   31: getfield 18	com/google/android/gms/dynamic/c$a$a:le	Landroid/os/IBinder;
      //   34: bipush 27
      //   36: aload_2
      //   37: aload_3
      //   38: iconst_0
      //   39: invokeinterface 50 5 0
      //   44: pop
      //   45: aload_3
      //   46: invokevirtual 53	android/os/Parcel:readException	()V
      //   49: aload_3
      //   50: invokevirtual 56	android/os/Parcel:recycle	()V
      //   53: aload_2
      //   54: invokevirtual 56	android/os/Parcel:recycle	()V
      //   57: return
      //   58: aconst_null
      //   59: astore_1
      //   60: goto -35 -> 25
      //   63: astore_1
      //   64: aload_3
      //   65: invokevirtual 56	android/os/Parcel:recycle	()V
      //   68: aload_2
      //   69: invokevirtual 56	android/os/Parcel:recycle	()V
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
    public Bundle getArguments()
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 33
      //   11: invokevirtual 37	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_0
      //   15: getfield 18	com/google/android/gms/dynamic/c$a$a:le	Landroid/os/IBinder;
      //   18: iconst_3
      //   19: aload_2
      //   20: aload_3
      //   21: iconst_0
      //   22: invokeinterface 50 5 0
      //   27: pop
      //   28: aload_3
      //   29: invokevirtual 53	android/os/Parcel:readException	()V
      //   32: aload_3
      //   33: invokevirtual 64	android/os/Parcel:readInt	()I
      //   36: ifeq +26 -> 62
      //   39: getstatic 70	android/os/Bundle:CREATOR	Landroid/os/Parcelable$Creator;
      //   42: aload_3
      //   43: invokeinterface 76 2 0
      //   48: checkcast 66	android/os/Bundle
      //   51: astore_1
      //   52: aload_3
      //   53: invokevirtual 56	android/os/Parcel:recycle	()V
      //   56: aload_2
      //   57: invokevirtual 56	android/os/Parcel:recycle	()V
      //   60: aload_1
      //   61: areturn
      //   62: aconst_null
      //   63: astore_1
      //   64: goto -12 -> 52
      //   67: astore_1
      //   68: aload_3
      //   69: invokevirtual 56	android/os/Parcel:recycle	()V
      //   72: aload_2
      //   73: invokevirtual 56	android/os/Parcel:recycle	()V
      //   76: aload_1
      //   77: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	78	0	this	a
      //   51	13	1	localBundle	Bundle
      //   67	10	1	localObject	Object
      //   3	70	2	localParcel1	Parcel
      //   7	62	3	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   8	52	67	finally
    }
    
    public int getId()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(4, localParcel1, localParcel2, 0);
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
    
    public boolean getRetainInstance()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(7, localParcel1, localParcel2, 0);
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
    
    public String getTag()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(8, localParcel1, localParcel2, 0);
        localParcel2.readException();
        String str = localParcel2.readString();
        return str;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public int getTargetRequestCode()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(10, localParcel1, localParcel2, 0);
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
    
    public boolean getUserVisibleHint()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(11, localParcel1, localParcel2, 0);
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
    
    public d getView()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(12, localParcel1, localParcel2, 0);
        localParcel2.readException();
        d locald = d.a.ap(localParcel2.readStrongBinder());
        return locald;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public boolean isAdded()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(13, localParcel1, localParcel2, 0);
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
    
    public boolean isDetached()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(14, localParcel1, localParcel2, 0);
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
    
    public boolean isHidden()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(15, localParcel1, localParcel2, 0);
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
    
    public boolean isInLayout()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(16, localParcel1, localParcel2, 0);
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
    
    public boolean isRemoving()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
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
    
    public boolean isResumed()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(18, localParcel1, localParcel2, 0);
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
    
    public boolean isVisible()
      throws RemoteException
    {
      boolean bool = false;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
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
    
    public d jf()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(2, localParcel1, localParcel2, 0);
        localParcel2.readException();
        d locald = d.a.ap(localParcel2.readStrongBinder());
        return locald;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public c jg()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(5, localParcel1, localParcel2, 0);
        localParcel2.readException();
        c localc = c.a.ao(localParcel2.readStrongBinder());
        return localc;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public d jh()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(6, localParcel1, localParcel2, 0);
        localParcel2.readException();
        d locald = d.a.ap(localParcel2.readStrongBinder());
        return locald;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public c ji()
      throws RemoteException
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        le.transact(9, localParcel1, localParcel2, 0);
        localParcel2.readException();
        c localc = c.a.ao(localParcel2.readStrongBinder());
        return localc;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void setHasOptionsMenu(boolean paramBoolean)
      throws RemoteException
    {
      int i = 0;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        if (paramBoolean) {
          i = 1;
        }
        localParcel1.writeInt(i);
        le.transact(21, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void setMenuVisibility(boolean paramBoolean)
      throws RemoteException
    {
      int i = 0;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
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
    
    public void setRetainInstance(boolean paramBoolean)
      throws RemoteException
    {
      int i = 0;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        if (paramBoolean) {
          i = 1;
        }
        localParcel1.writeInt(i);
        le.transact(23, localParcel1, localParcel2, 0);
        localParcel2.readException();
        return;
      }
      finally
      {
        localParcel2.recycle();
        localParcel1.recycle();
      }
    }
    
    public void setUserVisibleHint(boolean paramBoolean)
      throws RemoteException
    {
      int i = 0;
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      try
      {
        localParcel1.writeInterfaceToken("com.google.android.gms.dynamic.IFragmentWrapper");
        if (paramBoolean) {
          i = 1;
        }
        localParcel1.writeInt(i);
        le.transact(24, localParcel1, localParcel2, 0);
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
    public void startActivity(Intent paramIntent)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_2
      //   4: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore_3
      //   8: aload_2
      //   9: ldc 33
      //   11: invokevirtual 37	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   14: aload_1
      //   15: ifnull +42 -> 57
      //   18: aload_2
      //   19: iconst_1
      //   20: invokevirtual 119	android/os/Parcel:writeInt	(I)V
      //   23: aload_1
      //   24: aload_2
      //   25: iconst_0
      //   26: invokevirtual 130	android/content/Intent:writeToParcel	(Landroid/os/Parcel;I)V
      //   29: aload_0
      //   30: getfield 18	com/google/android/gms/dynamic/c$a$a:le	Landroid/os/IBinder;
      //   33: bipush 25
      //   35: aload_2
      //   36: aload_3
      //   37: iconst_0
      //   38: invokeinterface 50 5 0
      //   43: pop
      //   44: aload_3
      //   45: invokevirtual 53	android/os/Parcel:readException	()V
      //   48: aload_3
      //   49: invokevirtual 56	android/os/Parcel:recycle	()V
      //   52: aload_2
      //   53: invokevirtual 56	android/os/Parcel:recycle	()V
      //   56: return
      //   57: aload_2
      //   58: iconst_0
      //   59: invokevirtual 119	android/os/Parcel:writeInt	(I)V
      //   62: goto -33 -> 29
      //   65: astore_1
      //   66: aload_3
      //   67: invokevirtual 56	android/os/Parcel:recycle	()V
      //   70: aload_2
      //   71: invokevirtual 56	android/os/Parcel:recycle	()V
      //   74: aload_1
      //   75: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	76	0	this	a
      //   0	76	1	paramIntent	Intent
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
    public void startActivityForResult(Intent paramIntent, int paramInt)
      throws RemoteException
    {
      // Byte code:
      //   0: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   3: astore_3
      //   4: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
      //   7: astore 4
      //   9: aload_3
      //   10: ldc 33
      //   12: invokevirtual 37	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
      //   15: aload_1
      //   16: ifnull +50 -> 66
      //   19: aload_3
      //   20: iconst_1
      //   21: invokevirtual 119	android/os/Parcel:writeInt	(I)V
      //   24: aload_1
      //   25: aload_3
      //   26: iconst_0
      //   27: invokevirtual 130	android/content/Intent:writeToParcel	(Landroid/os/Parcel;I)V
      //   30: aload_3
      //   31: iload_2
      //   32: invokevirtual 119	android/os/Parcel:writeInt	(I)V
      //   35: aload_0
      //   36: getfield 18	com/google/android/gms/dynamic/c$a$a:le	Landroid/os/IBinder;
      //   39: bipush 26
      //   41: aload_3
      //   42: aload 4
      //   44: iconst_0
      //   45: invokeinterface 50 5 0
      //   50: pop
      //   51: aload 4
      //   53: invokevirtual 53	android/os/Parcel:readException	()V
      //   56: aload 4
      //   58: invokevirtual 56	android/os/Parcel:recycle	()V
      //   61: aload_3
      //   62: invokevirtual 56	android/os/Parcel:recycle	()V
      //   65: return
      //   66: aload_3
      //   67: iconst_0
      //   68: invokevirtual 119	android/os/Parcel:writeInt	(I)V
      //   71: goto -41 -> 30
      //   74: astore_1
      //   75: aload 4
      //   77: invokevirtual 56	android/os/Parcel:recycle	()V
      //   80: aload_3
      //   81: invokevirtual 56	android/os/Parcel:recycle	()V
      //   84: aload_1
      //   85: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	86	0	this	a
      //   0	86	1	paramIntent	Intent
      //   0	86	2	paramInt	int
      //   3	78	3	localParcel1	Parcel
      //   7	69	4	localParcel2	Parcel
      // Exception table:
      //   from	to	target	type
      //   9	15	74	finally
      //   19	30	74	finally
      //   30	56	74	finally
      //   66	71	74	finally
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.dynamic.c.a
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */