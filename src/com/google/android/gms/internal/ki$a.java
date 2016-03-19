package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract class ki$a
  extends Binder
  implements ki
{
  public static ki V(IBinder paramIBinder)
  {
    if (paramIBinder == null) {
      return null;
    }
    IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.common.internal.service.ICommonService");
    if ((localIInterface != null) && ((localIInterface instanceof ki))) {
      return (ki)localIInterface;
    }
    return new a(paramIBinder);
  }
  
  public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
    throws RemoteException
  {
    switch (paramInt1)
    {
    default: 
      return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
    case 1598968902: 
      paramParcel2.writeString("com.google.android.gms.common.internal.service.ICommonService");
      return true;
    }
    paramParcel1.enforceInterface("com.google.android.gms.common.internal.service.ICommonService");
    a(kh.a.U(paramParcel1.readStrongBinder()));
    return true;
  }
  
  private static class a
    implements ki
  {
    private IBinder le;
    
    a(IBinder paramIBinder)
    {
      le = paramIBinder;
    }
    
    public void a(kh paramkh)
      throws RemoteException
    {
      IBinder localIBinder = null;
      Parcel localParcel = Parcel.obtain();
      try
      {
        localParcel.writeInterfaceToken("com.google.android.gms.common.internal.service.ICommonService");
        if (paramkh != null) {
          localIBinder = paramkh.asBinder();
        }
        localParcel.writeStrongBinder(localIBinder);
        le.transact(1, localParcel, null, 1);
        return;
      }
      finally
      {
        localParcel.recycle();
      }
    }
    
    public IBinder asBinder()
    {
      return le;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.internal.ki.a
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */