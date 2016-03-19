package uk.co.senab.photoview.gestures;

public abstract interface OnGestureListener
{
  public abstract void onDrag(float paramFloat1, float paramFloat2);
  
  public abstract void onFling(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4);
  
  public abstract void onScale(float paramFloat1, float paramFloat2, float paramFloat3);
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.gestures.OnGestureListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */