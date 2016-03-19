package net.sqlcipher.database;

import android.os.Process;
import java.util.concurrent.locks.ReentrantLock;
import net.sqlcipher.CursorWindow;

final class SQLiteCursor$QueryThread
  implements Runnable
{
  private final int mThreadState;
  
  SQLiteCursor$QueryThread(SQLiteCursor paramSQLiteCursor, int paramInt)
  {
    mThreadState = paramInt;
  }
  
  private void sendMessage()
  {
    if (this$0.mNotificationHandler != null)
    {
      this$0.mNotificationHandler.sendEmptyMessage(1);
      SQLiteCursor.access$002(this$0, false);
      return;
    }
    SQLiteCursor.access$002(this$0, true);
  }
  
  public void run()
  {
    CursorWindow localCursorWindow = SQLiteCursor.access$100(this$0);
    Process.setThreadPriority(Process.myTid(), 10);
    for (;;)
    {
      SQLiteCursor.access$200(this$0).lock();
      if (SQLiteCursor.access$300(this$0) != mThreadState)
      {
        SQLiteCursor.access$200(this$0).unlock();
        return;
      }
      try
      {
        int i = SQLiteCursor.access$600(this$0).fillWindow(localCursorWindow, SQLiteCursor.access$400(this$0), SQLiteCursor.access$500(this$0));
        if (i != 0)
        {
          if (i == -1)
          {
            SQLiteCursor.access$512(this$0, SQLiteCursor.access$400(this$0));
            sendMessage();
            SQLiteCursor.access$200(this$0).unlock();
            continue;
          }
          SQLiteCursor.access$502(this$0, i);
          sendMessage();
          return;
        }
        return;
      }
      catch (Exception localException) {}finally
      {
        SQLiteCursor.access$200(this$0).unlock();
      }
    }
  }
}

/* Location:
 * Qualified Name:     net.sqlcipher.database.SQLiteCursor.QueryThread
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */