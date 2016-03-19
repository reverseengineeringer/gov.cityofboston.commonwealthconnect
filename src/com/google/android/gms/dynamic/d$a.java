package com.google.android.gms.dynamic;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public abstract class d$a
  extends Binder
  implements d
{
  public d$a()
  {
    attachInterface(this, "com.google.android.gms.dynamic.IObjectWrapper");
  }
  
  public static d ap(IBinder paramIBinder)
  {
    if (paramIBinder == null) {
      return null;
    }
    IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.dynamic.IObjectWrapper");
    if ((localIInterface != null) && ((localIInterface instanceof d))) {
      return (d)localIInterface;
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
    switch (paramInt1)
    {
    default: 
      return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
    }
    paramParcel2.writeString("com.google.android.gms.dynamic.IObjectWrapper");
    return true;
  }
  
  private static class a
    implements d
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
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.dynamic.d.a
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */