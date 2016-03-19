package okio;

import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

final class Okio$3
  extends AsyncTimeout
{
  Okio$3(Socket paramSocket) {}
  
  protected void timedOut()
  {
    try
    {
      val$socket.close();
      return;
    }
    catch (Exception localException)
    {
      Okio.access$000().log(Level.WARNING, "Failed to close timed out socket " + val$socket, localException);
    }
  }
}

/* Location:
 * Qualified Name:     okio.Okio.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */