package uk.co.senab.photoview.log;

public final class LogManager
{
  private static Logger logger = new LoggerDefault();
  
  public static Logger getLogger()
  {
    return logger;
  }
  
  public static void setLogger(Logger paramLogger)
  {
    logger = paramLogger;
  }
}

/* Location:
 * Qualified Name:     uk.co.senab.photoview.log.LogManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */