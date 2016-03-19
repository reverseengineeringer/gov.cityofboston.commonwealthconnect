package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import dagger.internal.Binding;
import dagger.internal.Linker;
import java.util.Set;
import javax.inject.Provider;

public final class GetSingleIssueTask$$InjectAdapter
  extends Binding<GetSingleIssueTask>
  implements Provider<GetSingleIssueTask>
{
  private Binding<Context> c;
  
  public GetSingleIssueTask$$InjectAdapter()
  {
    super("com.seeclickfix.ma.android.tasks.GetSingleIssueTask", "members/com.seeclickfix.ma.android.tasks.GetSingleIssueTask", false, GetSingleIssueTask.class);
  }
  
  public void attach(Linker paramLinker)
  {
    c = paramLinker.requestBinding("android.content.Context", GetSingleIssueTask.class, getClass().getClassLoader());
  }
  
  public GetSingleIssueTask get()
  {
    return new GetSingleIssueTask((Context)c.get());
  }
  
  public void getDependencies(Set<Binding<?>> paramSet1, Set<Binding<?>> paramSet2)
  {
    paramSet1.add(c);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetSingleIssueTask..InjectAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */