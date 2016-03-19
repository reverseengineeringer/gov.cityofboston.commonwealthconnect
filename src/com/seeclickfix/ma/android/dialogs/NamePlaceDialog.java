package com.seeclickfix.ma.android.dialogs;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.google.android.gms.maps.model.LatLng;
import com.j256.ormlite.dao.Dao;
import com.seeclickfix.ma.android.db.util.DaoUtil;
import com.seeclickfix.ma.android.fragments.interfaces.OnPlaceAddedListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnPlaceMapListener;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.views.ToastFactory;
import java.sql.SQLException;

public class NamePlaceDialog
  extends DialogFragment
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "NamePlaceDialog";
  View.OnClickListener btnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      int i = paramAnonymousView.getId();
      i = getNameIdByButtonId(i);
      paramAnonymousView = getString(i);
      NamePlaceDialog.this.save(paramAnonymousView);
      dismiss();
    }
  };
  private EditText editText;
  private ClickListener listener;
  private Button mHomeBtn;
  private PageParams mPageParams;
  private Button mSchoolBtn;
  private Button mWorkBtn;
  private LatLng markerLatLng;
  private int msgResId;
  private int titleResId;
  
  public static NamePlaceDialog newInstance(int paramInt1, int paramInt2, int paramInt3, LatLng paramLatLng, PageParams paramPageParams)
  {
    NamePlaceDialog localNamePlaceDialog = new NamePlaceDialog();
    Bundle localBundle = new Bundle();
    localBundle.putInt("title", paramInt1);
    localBundle.putInt("message", paramInt2);
    localBundle.putInt("icon", paramInt1);
    localBundle.putParcelable("marker_latlng", paramLatLng);
    localBundle.putParcelable("page_params", paramPageParams);
    localNamePlaceDialog.setArguments(localBundle);
    return localNamePlaceDialog;
  }
  
  private void save(String paramString)
  {
    Place localPlace = new Place();
    localPlace.setName(paramString);
    localPlace.setPlaceLat(markerLatLng.latitude);
    localPlace.setPlaceLng(markerLatLng.longitude);
    localPlace.setSelected(true);
    paramString = DaoUtil.getPlaceDao(getActivity());
    try
    {
      paramString.createOrUpdate(localPlace);
      ((OnPlaceAddedListener)getActivity()).onPlaceAdded(localPlace);
      paramString = getString(2131493079, new Object[] { localPlace.getName() });
      ToastFactory.showCenteredShortToast(getActivity(), paramString);
      mPageParams.setParcel(localPlace);
      mPageParams.setActionExtra("com.seeclickfix.actions.PLACE_ADDED");
      ((OnPlaceMapListener)getActivity()).onMapPlaceSaved(mPageParams);
      return;
    }
    catch (SQLException paramString) {}
  }
  
  protected void doNegativeClick()
  {
    if (listener != null) {
      listener.onNegativeClick();
    }
  }
  
  protected void doPositiveClick()
  {
    if ((editText.getText() != null) && (editText.getText().toString().length() > 0))
    {
      save(editText.getText().toString());
      return;
    }
    Toast.makeText(getActivity(), 2131493010, 0).show();
  }
  
  protected int getNameIdByButtonId(int paramInt)
  {
    int i = -1;
    if (paramInt == 2131361875) {
      i = 2131493012;
    }
    do
    {
      return i;
      if (paramInt == 2131361876) {
        return 2131493016;
      }
    } while (paramInt != 2131361877);
    return 2131493014;
  }
  
  public Dialog onCreateDialog(Bundle paramBundle)
  {
    titleResId = getArguments().getInt("title");
    msgResId = getArguments().getInt("message");
    markerLatLng = ((LatLng)getArguments().getParcelable("marker_latlng"));
    mPageParams = ((PageParams)getArguments().getParcelable("page_params"));
    Object localObject = new FrameLayout(getActivity());
    paramBundle = new AlertDialog.Builder(getActivity()).setTitle(titleResId).setView((View)localObject).setPositiveButton(2131493071, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        doPositiveClick();
      }
    }).setNegativeButton(2131492885, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        doNegativeClick();
      }
    }).create();
    localObject = (ViewGroup)paramBundle.getLayoutInflater().inflate(2130903069, (ViewGroup)localObject);
    TextView localTextView = (TextView)((ViewGroup)localObject).findViewById(2131361874);
    editText = ((EditText)((ViewGroup)localObject).findViewById(2131361878));
    mHomeBtn = ((Button)((ViewGroup)localObject).findViewById(2131361875));
    mWorkBtn = ((Button)((ViewGroup)localObject).findViewById(2131361876));
    mSchoolBtn = ((Button)((ViewGroup)localObject).findViewById(2131361877));
    mHomeBtn.setText(2131493012);
    mWorkBtn.setText(2131493016);
    mSchoolBtn.setText(2131493014);
    mHomeBtn.setOnClickListener(btnListener);
    mWorkBtn.setOnClickListener(btnListener);
    mSchoolBtn.setOnClickListener(btnListener);
    localTextView.setText(msgResId);
    editText.setText("");
    return paramBundle;
  }
  
  public void onDestroyView()
  {
    if ((getDialog() != null) && (getRetainInstance())) {
      getDialog().setDismissMessage(null);
    }
    super.onDestroyView();
  }
  
  public void setClickListener(ClickListener paramClickListener)
  {
    listener = paramClickListener;
  }
  
  public static abstract interface ClickListener
  {
    public abstract void onNegativeClick();
    
    public abstract void onPositiveClick(String paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.dialogs.NamePlaceDialog
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */