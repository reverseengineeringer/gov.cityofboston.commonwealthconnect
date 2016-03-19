package com.seeclickfix.ma.android.media;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.AsyncTask;
import android.widget.ImageView;

class MediaCaptureHelper$1
  extends AsyncTask<String, Void, Bitmap>
{
  MediaCaptureHelper$1(MediaCaptureHelper paramMediaCaptureHelper) {}
  
  protected Bitmap doInBackground(String... paramVarArgs)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    inJustDecodeBounds = true;
    inPurgeable = true;
    BitmapFactory.decodeFile(paramVarArgs[0], localOptions);
    int j = outWidth;
    int k = outHeight;
    int i = 8;
    if (!MediaCaptureHelper.access$600(this$0)) {
      i = Math.min(j / MediaCaptureHelper.access$700(this$0), k / MediaCaptureHelper.access$800(this$0));
    }
    inJustDecodeBounds = false;
    inSampleSize = i;
    inPurgeable = true;
    try
    {
      paramVarArgs = BitmapFactory.decodeFile(paramVarArgs[0], localOptions);
      return paramVarArgs;
    }
    catch (Exception paramVarArgs) {}
    return null;
  }
  
  protected void onPostExecute(Bitmap paramBitmap)
  {
    MediaCaptureHelper.access$900(this$0).setImageBitmap(paramBitmap);
    MediaCaptureHelper.access$900(this$0).setVisibility(0);
    MediaCaptureHelper.access$900(this$0).invalidate();
    MediaCaptureHelper.access$900(this$0).requestLayout();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.media.MediaCaptureHelper.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */