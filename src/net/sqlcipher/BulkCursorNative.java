package net.sqlcipher;

import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;

public abstract class BulkCursorNative
  extends Binder
  implements IBulkCursor
{
  public BulkCursorNative()
  {
    attachInterface(this, "android.content.IBulkCursor");
  }
  
  public static IBulkCursor asInterface(IBinder paramIBinder)
  {
    Object localObject;
    if (paramIBinder == null) {
      localObject = null;
    }
    IBulkCursor localIBulkCursor;
    do
    {
      return (IBulkCursor)localObject;
      localIBulkCursor = (IBulkCursor)paramIBinder.queryLocalInterface("android.content.IBulkCursor");
      localObject = localIBulkCursor;
    } while (localIBulkCursor != null);
    return new BulkCursorProxy(paramIBinder);
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
    try
    {
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      paramParcel1 = getWindow(paramParcel1.readInt());
      if (paramParcel1 == null)
      {
        paramParcel2.writeInt(0);
        return true;
      }
      paramParcel2.writeNoException();
      paramParcel2.writeInt(1);
      paramParcel1.writeToParcel(paramParcel2, 0);
      return true;
    }
    catch (Exception paramParcel1)
    {
      DatabaseUtils.writeExceptionToParcel(paramParcel2, paramParcel1);
      return true;
    }
    paramParcel1.enforceInterface("android.content.IBulkCursor");
    paramInt1 = count();
    paramParcel2.writeNoException();
    paramParcel2.writeInt(paramInt1);
    return true;
    paramParcel1.enforceInterface("android.content.IBulkCursor");
    paramParcel1 = getColumnNames();
    paramParcel2.writeNoException();
    paramParcel2.writeInt(paramParcel1.length);
    paramInt2 = paramParcel1.length;
    paramInt1 = 0;
    while (paramInt1 < paramInt2)
    {
      paramParcel2.writeString(paramParcel1[paramInt1]);
      paramInt1 += 1;
      continue;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      deactivate();
      paramParcel2.writeNoException();
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      close();
      paramParcel2.writeNoException();
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      paramInt1 = requery(IContentObserver.Stub.asInterface(paramParcel1.readStrongBinder()), (CursorWindow)CursorWindow.CREATOR.createFromParcel(paramParcel1));
      paramParcel2.writeNoException();
      paramParcel2.writeInt(paramInt1);
      paramParcel2.writeBundle(getExtras());
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      boolean bool = updateRows(paramParcel1.readHashMap(null));
      paramParcel2.writeNoException();
      if (bool != true) {
        break label446;
      }
      paramInt1 = 1;
      paramParcel2.writeInt(paramInt1);
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      bool = deleteRow(paramParcel1.readInt());
      paramParcel2.writeNoException();
      if (bool != true) {
        break label451;
      }
      paramInt1 = 1;
      label331:
      paramParcel2.writeInt(paramInt1);
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      onMove(paramParcel1.readInt());
      paramParcel2.writeNoException();
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      bool = getWantsAllOnMoveCalls();
      paramParcel2.writeNoException();
      if (!bool) {
        break label456;
      }
    }
    label446:
    label451:
    label456:
    for (paramInt1 = 1;; paramInt1 = 0)
    {
      paramParcel2.writeInt(paramInt1);
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      paramParcel1 = getExtras();
      paramParcel2.writeNoException();
      paramParcel2.writeBundle(paramParcel1);
      return true;
      paramParcel1.enforceInterface("android.content.IBulkCursor");
      paramParcel1 = respond(paramParcel1.readBundle());
      paramParcel2.writeNoException();
      paramParcel2.writeBundle(paramParcel1);
      return true;
      return true;
      paramInt1 = 0;
      break;
      paramInt1 = 0;
      break label331;
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.BulkCursorNative
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */