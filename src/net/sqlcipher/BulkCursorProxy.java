package net.sqlcipher;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import java.util.Map;

final class BulkCursorProxy
  implements IBulkCursor
{
  private Bundle mExtras;
  private IBinder mRemote;
  
  public BulkCursorProxy(IBinder paramIBinder)
  {
    mRemote = paramIBinder;
    mExtras = null;
  }
  
  public IBinder asBinder()
  {
    return mRemote;
  }
  
  public void close()
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    mRemote.transact(12, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    localParcel1.recycle();
    localParcel2.recycle();
  }
  
  public int count()
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    boolean bool = mRemote.transact(2, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    if (!bool) {}
    for (int i = -1;; i = localParcel2.readInt())
    {
      localParcel1.recycle();
      localParcel2.recycle();
      return i;
    }
  }
  
  public void deactivate()
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    mRemote.transact(6, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    localParcel1.recycle();
    localParcel2.recycle();
  }
  
  public boolean deleteRow(int paramInt)
    throws RemoteException
  {
    boolean bool = true;
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    localParcel1.writeInt(paramInt);
    mRemote.transact(5, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    if (localParcel2.readInt() == 1) {}
    for (;;)
    {
      localParcel1.recycle();
      localParcel2.recycle();
      return bool;
      bool = false;
    }
  }
  
  public String[] getColumnNames()
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    mRemote.transact(3, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    int j = localParcel2.readInt();
    String[] arrayOfString = new String[j];
    int i = 0;
    while (i < j)
    {
      arrayOfString[i] = localParcel2.readString();
      i += 1;
    }
    localParcel1.recycle();
    localParcel2.recycle();
    return arrayOfString;
  }
  
  public Bundle getExtras()
    throws RemoteException
  {
    if (mExtras == null)
    {
      Parcel localParcel1 = Parcel.obtain();
      Parcel localParcel2 = Parcel.obtain();
      localParcel1.writeInterfaceToken("android.content.IBulkCursor");
      mRemote.transact(10, localParcel1, localParcel2, 0);
      DatabaseUtils.readExceptionFromParcel(localParcel2);
      mExtras = localParcel2.readBundle();
      localParcel1.recycle();
      localParcel2.recycle();
    }
    return mExtras;
  }
  
  public boolean getWantsAllOnMoveCalls()
    throws RemoteException
  {
    boolean bool = false;
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    mRemote.transact(9, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    int i = localParcel2.readInt();
    localParcel1.recycle();
    localParcel2.recycle();
    if (i != 0) {
      bool = true;
    }
    return bool;
  }
  
  public CursorWindow getWindow(int paramInt)
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    localParcel1.writeInt(paramInt);
    mRemote.transact(1, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    CursorWindow localCursorWindow = null;
    if (localParcel2.readInt() == 1) {
      localCursorWindow = CursorWindow.newFromParcel(localParcel2);
    }
    localParcel1.recycle();
    localParcel2.recycle();
    return localCursorWindow;
  }
  
  public void onMove(int paramInt)
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    localParcel1.writeInt(paramInt);
    mRemote.transact(8, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    localParcel1.recycle();
    localParcel2.recycle();
  }
  
  public int requery(IContentObserver paramIContentObserver, CursorWindow paramCursorWindow)
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    localParcel1.writeStrongInterface(paramIContentObserver);
    paramCursorWindow.writeToParcel(localParcel1, 0);
    boolean bool = mRemote.transact(7, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    int i;
    if (!bool) {
      i = -1;
    }
    for (;;)
    {
      localParcel1.recycle();
      localParcel2.recycle();
      return i;
      i = localParcel2.readInt();
      mExtras = localParcel2.readBundle();
    }
  }
  
  public Bundle respond(Bundle paramBundle)
    throws RemoteException
  {
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    localParcel1.writeBundle(paramBundle);
    mRemote.transact(11, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    paramBundle = localParcel2.readBundle();
    localParcel1.recycle();
    localParcel2.recycle();
    return paramBundle;
  }
  
  public boolean updateRows(Map paramMap)
    throws RemoteException
  {
    boolean bool = true;
    Parcel localParcel1 = Parcel.obtain();
    Parcel localParcel2 = Parcel.obtain();
    localParcel1.writeInterfaceToken("android.content.IBulkCursor");
    localParcel1.writeMap(paramMap);
    mRemote.transact(4, localParcel1, localParcel2, 0);
    DatabaseUtils.readExceptionFromParcel(localParcel2);
    if (localParcel2.readInt() == 1) {}
    for (;;)
    {
      localParcel1.recycle();
      localParcel2.recycle();
      return bool;
      bool = false;
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.BulkCursorProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */