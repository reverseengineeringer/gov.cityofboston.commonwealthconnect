package net.simonvt.numberpicker;

import android.os.Build.VERSION;
import android.os.Bundle;

class NumberPicker$SupportAccessibilityNodeProvider
{
  NumberPicker.AccessibilityNodeProviderImpl mProvider;
  
  private NumberPicker$SupportAccessibilityNodeProvider(NumberPicker paramNumberPicker)
  {
    if (Build.VERSION.SDK_INT >= 16) {
      mProvider = new NumberPicker.AccessibilityNodeProviderImpl(paramNumberPicker);
    }
  }
  
  public boolean performAction(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    if (mProvider != null) {
      return mProvider.performAction(paramInt1, paramInt2, paramBundle);
    }
    return false;
  }
  
  public void sendAccessibilityEventForVirtualView(int paramInt1, int paramInt2)
  {
    if (mProvider != null) {
      mProvider.sendAccessibilityEventForVirtualView(paramInt1, paramInt2);
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.SupportAccessibilityNodeProvider
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */