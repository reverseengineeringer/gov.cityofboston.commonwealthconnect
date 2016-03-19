package com.seeclickfix.ma.android.objects.report;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;

@DatabaseTable(tableName="report_question_join")
public class ReportQuestionJoin
{
  @DatabaseField(generatedId=true)
  private int id;
  @DatabaseField(foreign=true)
  private Question question;
  @DatabaseField(foreign=true)
  private Report report;
  
  public int getId()
  {
    return id;
  }
  
  public Question getQuestion()
  {
    return question;
  }
  
  public Report getReport()
  {
    return report;
  }
  
  public void setId(int paramInt)
  {
    id = paramInt;
  }
  
  public void setQuestion(Question paramQuestion)
  {
    question = paramQuestion;
  }
  
  public void setReport(Report paramReport)
  {
    report = paramReport;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.report.ReportQuestionJoin
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */