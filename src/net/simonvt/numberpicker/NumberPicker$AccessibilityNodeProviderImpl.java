package net.simonvt.numberpicker;

import android.content.Context;
import android.graphics.Rect;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.Button;
import android.widget.EditText;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class NumberPicker$AccessibilityNodeProviderImpl
  extends AccessibilityNodeProvider
{
  private static final int UNDEFINED = Integer.MIN_VALUE;
  private static final int VIRTUAL_VIEW_ID_DECREMENT = 3;
  private static final int VIRTUAL_VIEW_ID_INCREMENT = 1;
  private static final int VIRTUAL_VIEW_ID_INPUT = 2;
  private int mAccessibilityFocusedView = Integer.MIN_VALUE;
  private final int[] mTempArray = new int[2];
  private final Rect mTempRect = new Rect();
  
  NumberPicker$AccessibilityNodeProviderImpl(NumberPicker paramNumberPicker) {}
  
  private AccessibilityNodeInfo createAccessibilityNodeInfoForNumberPicker(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    AccessibilityNodeInfo localAccessibilityNodeInfo = AccessibilityNodeInfo.obtain();
    localAccessibilityNodeInfo.setClassName(NumberPicker.class.getName());
    localAccessibilityNodeInfo.setPackageName(this$0.getContext().getPackageName());
    localAccessibilityNodeInfo.setSource(this$0);
    if (hasVirtualDecrementButton()) {
      localAccessibilityNodeInfo.addChild(this$0, 3);
    }
    localAccessibilityNodeInfo.addChild(this$0, 2);
    if (hasVirtualIncrementButton()) {
      localAccessibilityNodeInfo.addChild(this$0, 1);
    }
    localAccessibilityNodeInfo.setParent((View)this$0.getParentForAccessibility());
    localAccessibilityNodeInfo.setEnabled(this$0.isEnabled());
    localAccessibilityNodeInfo.setScrollable(true);
    if (mAccessibilityFocusedView != -1) {
      localAccessibilityNodeInfo.addAction(64);
    }
    if (mAccessibilityFocusedView == -1) {
      localAccessibilityNodeInfo.addAction(128);
    }
    if (this$0.isEnabled())
    {
      if ((this$0.getWrapSelectorWheel()) || (this$0.getValue() < this$0.getMaxValue())) {
        localAccessibilityNodeInfo.addAction(4096);
      }
      if ((this$0.getWrapSelectorWheel()) || (this$0.getValue() > this$0.getMinValue())) {
        localAccessibilityNodeInfo.addAction(8192);
      }
    }
    return localAccessibilityNodeInfo;
  }
  
  private AccessibilityNodeInfo createAccessibilityNodeInfoForVirtualButton(int paramInt1, String paramString, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    AccessibilityNodeInfo localAccessibilityNodeInfo = AccessibilityNodeInfo.obtain();
    localAccessibilityNodeInfo.setClassName(Button.class.getName());
    localAccessibilityNodeInfo.setPackageName(this$0.getContext().getPackageName());
    localAccessibilityNodeInfo.setSource(this$0, paramInt1);
    localAccessibilityNodeInfo.setParent(this$0);
    localAccessibilityNodeInfo.setText(paramString);
    localAccessibilityNodeInfo.setClickable(true);
    localAccessibilityNodeInfo.setLongClickable(true);
    localAccessibilityNodeInfo.setEnabled(this$0.isEnabled());
    paramString = mTempRect;
    paramString.set(paramInt2, paramInt3, paramInt4, paramInt5);
    localAccessibilityNodeInfo.setBoundsInParent(paramString);
    int[] arrayOfInt = mTempArray;
    this$0.getLocationOnScreen(arrayOfInt);
    paramString.offset(arrayOfInt[0], arrayOfInt[1]);
    localAccessibilityNodeInfo.setBoundsInScreen(paramString);
    if (mAccessibilityFocusedView != paramInt1) {
      localAccessibilityNodeInfo.addAction(64);
    }
    if (mAccessibilityFocusedView == paramInt1) {
      localAccessibilityNodeInfo.addAction(128);
    }
    if (this$0.isEnabled()) {
      localAccessibilityNodeInfo.addAction(16);
    }
    return localAccessibilityNodeInfo;
  }
  
  private AccessibilityNodeInfo createAccessibiltyNodeInfoForInputText()
  {
    AccessibilityNodeInfo localAccessibilityNodeInfo = NumberPicker.access$100(this$0).createAccessibilityNodeInfo();
    localAccessibilityNodeInfo.setSource(this$0, 2);
    if (mAccessibilityFocusedView != 2) {
      localAccessibilityNodeInfo.addAction(64);
    }
    if (mAccessibilityFocusedView == 2) {
      localAccessibilityNodeInfo.addAction(128);
    }
    return localAccessibilityNodeInfo;
  }
  
  private void findAccessibilityNodeInfosByTextInChild(String paramString, int paramInt, List<AccessibilityNodeInfo> paramList)
  {
    switch (paramInt)
    {
    }
    Object localObject;
    do
    {
      do
      {
        do
        {
          return;
          localObject = getVirtualDecrementButtonText();
        } while ((TextUtils.isEmpty((CharSequence)localObject)) || (!((String)localObject).toString().toLowerCase().contains(paramString)));
        paramList.add(createAccessibilityNodeInfo(3));
        return;
        localObject = NumberPicker.access$100(this$0).getText();
        if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((CharSequence)localObject).toString().toLowerCase().contains(paramString)))
        {
          paramList.add(createAccessibilityNodeInfo(2));
          return;
        }
        localObject = NumberPicker.access$100(this$0).getText();
      } while ((TextUtils.isEmpty((CharSequence)localObject)) || (!((CharSequence)localObject).toString().toLowerCase().contains(paramString)));
      paramList.add(createAccessibilityNodeInfo(2));
      return;
      localObject = getVirtualIncrementButtonText();
    } while ((TextUtils.isEmpty((CharSequence)localObject)) || (!((String)localObject).toString().toLowerCase().contains(paramString)));
    paramList.add(createAccessibilityNodeInfo(1));
  }
  
  private String getVirtualDecrementButtonText()
  {
    int j = NumberPicker.access$2200(this$0) - 1;
    int i = j;
    if (NumberPicker.access$2300(this$0)) {
      i = NumberPicker.access$2400(this$0, j);
    }
    if (i >= NumberPicker.access$2500(this$0))
    {
      if (NumberPicker.access$1000(this$0) == null) {
        return NumberPicker.access$2600(this$0, i);
      }
      return NumberPicker.access$1000(this$0)[(i - NumberPicker.access$2500(this$0))];
    }
    return null;
  }
  
  private String getVirtualIncrementButtonText()
  {
    int j = NumberPicker.access$2200(this$0) + 1;
    int i = j;
    if (NumberPicker.access$2300(this$0)) {
      i = NumberPicker.access$2400(this$0, j);
    }
    if (i <= NumberPicker.access$1200(this$0))
    {
      if (NumberPicker.access$1000(this$0) == null) {
        return NumberPicker.access$2600(this$0, i);
      }
      return NumberPicker.access$1000(this$0)[(i - NumberPicker.access$2500(this$0))];
    }
    return null;
  }
  
  private boolean hasVirtualDecrementButton()
  {
    return (this$0.getWrapSelectorWheel()) || (this$0.getValue() > this$0.getMinValue());
  }
  
  private boolean hasVirtualIncrementButton()
  {
    return (this$0.getWrapSelectorWheel()) || (this$0.getValue() < this$0.getMaxValue());
  }
  
  private void sendAccessibilityEventForVirtualButton(int paramInt1, int paramInt2, String paramString)
  {
    if (((AccessibilityManager)this$0.getContext().getSystemService("accessibility")).isEnabled())
    {
      AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain(paramInt2);
      localAccessibilityEvent.setClassName(Button.class.getName());
      localAccessibilityEvent.setPackageName(this$0.getContext().getPackageName());
      localAccessibilityEvent.getText().add(paramString);
      localAccessibilityEvent.setEnabled(this$0.isEnabled());
      localAccessibilityEvent.setSource(this$0, paramInt1);
      this$0.requestSendAccessibilityEvent(this$0, localAccessibilityEvent);
    }
  }
  
  private void sendAccessibilityEventForVirtualText(int paramInt)
  {
    if (((AccessibilityManager)this$0.getContext().getSystemService("accessibility")).isEnabled())
    {
      AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain(paramInt);
      NumberPicker.access$100(this$0).onInitializeAccessibilityEvent(localAccessibilityEvent);
      NumberPicker.access$100(this$0).onPopulateAccessibilityEvent(localAccessibilityEvent);
      localAccessibilityEvent.setSource(this$0, 2);
      this$0.requestSendAccessibilityEvent(this$0, localAccessibilityEvent);
    }
  }
  
  public AccessibilityNodeInfo createAccessibilityNodeInfo(int paramInt)
  {
    switch (paramInt)
    {
    case 0: 
    default: 
      return super.createAccessibilityNodeInfo(paramInt);
    case -1: 
      return createAccessibilityNodeInfoForNumberPicker(this$0.getScrollX(), this$0.getScrollY(), this$0.getScrollX() + (this$0.getRight() - this$0.getLeft()), this$0.getScrollY() + (this$0.getBottom() - this$0.getTop()));
    case 3: 
      str = getVirtualDecrementButtonText();
      paramInt = this$0.getScrollX();
      i = this$0.getScrollY();
      j = this$0.getScrollX();
      k = this$0.getRight();
      m = this$0.getLeft();
      n = NumberPicker.access$1700(this$0);
      return createAccessibilityNodeInfoForVirtualButton(3, str, paramInt, i, k - m + j, NumberPicker.access$2100(this$0) + n);
    case 2: 
      return createAccessibiltyNodeInfoForInputText();
    }
    String str = getVirtualIncrementButtonText();
    paramInt = this$0.getScrollX();
    int i = NumberPicker.access$1500(this$0);
    int j = NumberPicker.access$2100(this$0);
    int k = this$0.getScrollX();
    int m = this$0.getRight();
    int n = this$0.getLeft();
    int i1 = this$0.getScrollY();
    return createAccessibilityNodeInfoForVirtualButton(1, str, paramInt, i - j, m - n + k, this$0.getBottom() - this$0.getTop() + i1);
  }
  
  public List<AccessibilityNodeInfo> findAccessibilityNodeInfosByText(String paramString, int paramInt)
  {
    if (TextUtils.isEmpty(paramString)) {
      return Collections.emptyList();
    }
    String str = paramString.toLowerCase();
    ArrayList localArrayList = new ArrayList();
    switch (paramInt)
    {
    case 0: 
    default: 
      return super.findAccessibilityNodeInfosByText(paramString, paramInt);
    case -1: 
      findAccessibilityNodeInfosByTextInChild(str, 3, localArrayList);
      findAccessibilityNodeInfosByTextInChild(str, 2, localArrayList);
      findAccessibilityNodeInfosByTextInChild(str, 1, localArrayList);
      return localArrayList;
    }
    findAccessibilityNodeInfosByTextInChild(str, paramInt, localArrayList);
    return localArrayList;
  }
  
  public boolean performAction(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    boolean bool3 = false;
    boolean bool2 = false;
    boolean bool1;
    switch (paramInt1)
    {
    case 0: 
    default: 
      bool1 = super.performAction(paramInt1, paramInt2, paramBundle);
    }
    label206:
    label261:
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        do
                        {
                          do
                          {
                            do
                            {
                              do
                              {
                                do
                                {
                                  do
                                  {
                                    do
                                    {
                                      do
                                      {
                                        do
                                        {
                                          return bool1;
                                          switch (paramInt2)
                                          {
                                          default: 
                                            break;
                                          case 64: 
                                            bool1 = bool2;
                                          }
                                        } while (mAccessibilityFocusedView == paramInt1);
                                        mAccessibilityFocusedView = paramInt1;
                                        this$0.performAccessibilityAction(64, null);
                                        return true;
                                        bool1 = bool2;
                                      } while (mAccessibilityFocusedView != paramInt1);
                                      mAccessibilityFocusedView = Integer.MIN_VALUE;
                                      this$0.performAccessibilityAction(128, null);
                                      return true;
                                      bool1 = bool2;
                                    } while (!this$0.isEnabled());
                                    if (this$0.getWrapSelectorWheel()) {
                                      break label206;
                                    }
                                    bool1 = bool2;
                                  } while (this$0.getValue() >= this$0.getMaxValue());
                                  NumberPicker.access$200(this$0, true);
                                  return true;
                                  bool1 = bool2;
                                } while (!this$0.isEnabled());
                                if (this$0.getWrapSelectorWheel()) {
                                  break label261;
                                }
                                bool1 = bool2;
                              } while (this$0.getValue() <= this$0.getMinValue());
                              NumberPicker.access$200(this$0, false);
                              return true;
                              switch (paramInt2)
                              {
                              default: 
                                return NumberPicker.access$100(this$0).performAccessibilityAction(paramInt2, paramBundle);
                              case 1: 
                                bool1 = bool2;
                              }
                            } while (!this$0.isEnabled());
                            bool1 = bool2;
                          } while (NumberPicker.access$100(this$0).isFocused());
                          return NumberPicker.access$100(this$0).requestFocus();
                          bool1 = bool2;
                        } while (!this$0.isEnabled());
                        bool1 = bool2;
                      } while (!NumberPicker.access$100(this$0).isFocused());
                      NumberPicker.access$100(this$0).clearFocus();
                      return true;
                      bool1 = bool2;
                    } while (!this$0.isEnabled());
                    NumberPicker.access$1900(this$0);
                    return true;
                    bool1 = bool2;
                  } while (mAccessibilityFocusedView == paramInt1);
                  mAccessibilityFocusedView = paramInt1;
                  sendAccessibilityEventForVirtualView(paramInt1, 32768);
                  NumberPicker.access$100(this$0).invalidate();
                  return true;
                  bool1 = bool2;
                } while (mAccessibilityFocusedView != paramInt1);
                mAccessibilityFocusedView = Integer.MIN_VALUE;
                sendAccessibilityEventForVirtualView(paramInt1, 65536);
                NumberPicker.access$100(this$0).invalidate();
                return true;
                switch (paramInt2)
                {
                default: 
                  return false;
                case 16: 
                  bool1 = bool2;
                }
              } while (!this$0.isEnabled());
              NumberPicker.access$200(this$0, true);
              sendAccessibilityEventForVirtualView(paramInt1, 1);
              return true;
              bool1 = bool2;
            } while (mAccessibilityFocusedView == paramInt1);
            mAccessibilityFocusedView = paramInt1;
            sendAccessibilityEventForVirtualView(paramInt1, 32768);
            this$0.invalidate(0, NumberPicker.access$1500(this$0), this$0.getRight(), this$0.getBottom());
            return true;
            bool1 = bool2;
          } while (mAccessibilityFocusedView != paramInt1);
          mAccessibilityFocusedView = Integer.MIN_VALUE;
          sendAccessibilityEventForVirtualView(paramInt1, 65536);
          this$0.invalidate(0, NumberPicker.access$1500(this$0), this$0.getRight(), this$0.getBottom());
          return true;
          switch (paramInt2)
          {
          default: 
            return false;
          case 16: 
            bool1 = bool2;
          }
        } while (!this$0.isEnabled());
        bool1 = bool3;
        if (paramInt1 == 1) {
          bool1 = true;
        }
        NumberPicker.access$200(this$0, bool1);
        sendAccessibilityEventForVirtualView(paramInt1, 1);
        return true;
        bool1 = bool2;
      } while (mAccessibilityFocusedView == paramInt1);
      mAccessibilityFocusedView = paramInt1;
      sendAccessibilityEventForVirtualView(paramInt1, 32768);
      this$0.invalidate(0, 0, this$0.getRight(), NumberPicker.access$1700(this$0));
      return true;
      bool1 = bool2;
    } while (mAccessibilityFocusedView != paramInt1);
    mAccessibilityFocusedView = Integer.MIN_VALUE;
    sendAccessibilityEventForVirtualView(paramInt1, 65536);
    this$0.invalidate(0, 0, this$0.getRight(), NumberPicker.access$1700(this$0));
    return true;
  }
  
  public void sendAccessibilityEventForVirtualView(int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    }
    do
    {
      do
      {
        return;
      } while (!hasVirtualDecrementButton());
      sendAccessibilityEventForVirtualButton(paramInt1, paramInt2, getVirtualDecrementButtonText());
      return;
      sendAccessibilityEventForVirtualText(paramInt2);
      return;
    } while (!hasVirtualIncrementButton());
    sendAccessibilityEventForVirtualButton(paramInt1, paramInt2, getVirtualIncrementButtonText());
  }
}

/* Location:
 * Qualified Name:     net.simonvt.numberpicker.NumberPicker.AccessibilityNodeProviderImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */