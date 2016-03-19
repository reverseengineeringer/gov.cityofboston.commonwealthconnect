package butterknife;

import android.app.Activity;
import android.view.View;

 enum ButterKnife$Finder$2
{
  ButterKnife$Finder$2()
  {
    super(paramString, paramInt, null);
  }
  
  public View findById(Object paramObject, int paramInt)
  {
    return ((Activity)paramObject).findViewById(paramInt);
  }
}

/* Location:
 * Qualified Name:     butterknife.ButterKnife.Finder.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */