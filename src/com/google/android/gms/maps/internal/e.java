package com.google.android.gms.maps.internal;

import android.graphics.Bitmap;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.maps.model.internal.l;
import com.google.android.gms.maps.model.internal.l.a;

public abstract interface e
  extends IInterface
{
  public abstract Bitmap a(l paraml, int paramInt1, int paramInt2)
    throws RemoteException;
  
  public static abstract class a
    extends Binder
    implements e
  {
    public static e aV(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.maps.internal.IInfoWindowRenderer");
      if ((localIInterface != null) && ((localIInterface instanceof e))) {
        return (e)localIInterface;
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
        paramParcel2.writeString("com.google.android.gms.maps.internal.IInfoWindowRenderer");
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.maps.internal.IInfoWindowRenderer");
      paramParcel1 = a(l.a.bA(paramParcel1.readStrongBinder()), paramParcel1.readInt(), paramParcel1.readInt());
      paramParcel2.writeNoException();
      if (paramParcel1 != null)
      {
        paramParcel2.writeInt(1);
        paramParcel1.writeToParcel(paramParcel2, 1);
        return true;
      }
      paramParcel2.writeInt(0);
      return true;
    }
    
    private static class a
      implements e
    {
      private IBinder le;
      
      a(IBinder paramIBinder)
      {
        le = paramIBinder;
      }
      
      /* Error */
      public Bitmap a(l paraml, int paramInt1, int paramInt2)
        throws RemoteException
      {
        // Byte code:
        //   0: aconst_null
        //   1: astore 4
        //   3: invokestatic 28	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   6: astore 5
        //   8: invokestatic 28	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   11: astore 6
        //   13: aload 5
        //   15: ldc 30
        //   17: invokevirtual 34	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   20: aload_1
        //   21: ifnull +86 -> 107
        //   24: aload_1
        //   25: invokeinterface 40 1 0
        //   30: astore_1
        //   31: aload 5
        //   33: aload_1
        //   34: invokevirtual 43	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   37: aload 5
        //   39: iload_2
        //   40: invokevirtual 47	android/os/Parcel:writeInt	(I)V
        //   43: aload 5
        //   45: iload_3
        //   46: invokevirtual 47	android/os/Parcel:writeInt	(I)V
        //   49: aload_0
        //   50: getfield 18	com/google/android/gms/maps/internal/e$a$a:le	Landroid/os/IBinder;
        //   53: iconst_1
        //   54: aload 5
        //   56: aload 6
        //   58: iconst_0
        //   59: invokeinterface 53 5 0
        //   64: pop
        //   65: aload 6
        //   67: invokevirtual 56	android/os/Parcel:readException	()V
        //   70: aload 4
        //   72: astore_1
        //   73: aload 6
        //   75: invokevirtual 60	android/os/Parcel:readInt	()I
        //   78: ifeq +17 -> 95
        //   81: getstatic 66	android/graphics/Bitmap:CREATOR	Landroid/os/Parcelable$Creator;
        //   84: aload 6
        //   86: invokeinterface 72 2 0
        //   91: checkcast 62	android/graphics/Bitmap
        //   94: astore_1
        //   95: aload 6
        //   97: invokevirtual 75	android/os/Parcel:recycle	()V
        //   100: aload 5
        //   102: invokevirtual 75	android/os/Parcel:recycle	()V
        //   105: aload_1
        //   106: areturn
        //   107: aconst_null
        //   108: astore_1
        //   109: goto -78 -> 31
        //   112: astore_1
        //   113: aload 6
        //   115: invokevirtual 75	android/os/Parcel:recycle	()V
        //   118: aload 5
        //   120: invokevirtual 75	android/os/Parcel:recycle	()V
        //   123: aload_1
        //   124: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	125	0	this	a
        //   0	125	1	paraml	l
        //   0	125	2	paramInt1	int
        //   0	125	3	paramInt2	int
        //   1	70	4	localObject	Object
        //   6	113	5	localParcel1	Parcel
        //   11	103	6	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   13	20	112	finally
        //   24	31	112	finally
        //   31	70	112	finally
        //   73	95	112	finally
      }
      
      public IBinder asBinder()
      {
        return le;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.android.gms.maps.internal.e
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */