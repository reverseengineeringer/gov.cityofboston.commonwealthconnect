package com.seeclickfix.ma.android.objects.modules;

import android.content.Context;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module(library=true)
public class ContextModule
{
  Context context;
  
  public ContextModule(Context paramContext)
  {
    context = paramContext;
  }
  
  @Provides
  @Singleton
  Context provideContext()
  {
    return context;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.modules.ContextModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */