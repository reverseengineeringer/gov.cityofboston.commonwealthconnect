package com.seeclickfix.ma.android.fragments.reporting;

import com.seeclickfix.ma.android.objects.modules.ContextModule;
import dagger.Module;

@Module(complete=false, includes={ContextModule.class}, injects={ReportProvider.class})
public class ReportDbLoaderModule {}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.reporting.ReportDbLoaderModule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */