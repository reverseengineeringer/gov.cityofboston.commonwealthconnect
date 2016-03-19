package com.seeclickfix.ma.android.views.questions;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class QuestionMultivalue
  extends AbstractQuestion
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "QuestionMultivalue";
  View.OnClickListener btnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      Answer localAnswer = (Answer)paramAnonymousView.getTag();
      paramAnonymousView = (CheckBox)paramAnonymousView.findViewById(2131362145);
      paramAnonymousView.toggle();
      if (paramAnonymousView.isChecked())
      {
        selectedAnswerValues.add(localAnswer.getAnswer());
        setMultivalAnswer();
        onSelectAnswer(answer);
      }
      do
      {
        return;
        onRemovewAnswer(answer);
        selectedAnswerValues.remove(localAnswer.getAnswer());
      } while (selectedAnswerValues.size() <= 0);
      setMultivalAnswer();
      onSelectAnswer(answer);
    }
  };
  private Set<String> selectedAnswerValues = new HashSet();
  
  public QuestionMultivalue(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Bundle paramBundle)
  {
    super(paramQuestion, paramViewGroup, paramFragmentActivity, paramBundle);
    setupQuestion();
  }
  
  private void addRowsToMultivalueContainer(Question paramQuestion, ViewGroup paramViewGroup)
  {
    Iterator localIterator = paramQuestion.getAnswerList().iterator();
    while (localIterator.hasNext())
    {
      Answer localAnswer1 = (Answer)localIterator.next();
      ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(container.getContext(), 2130903127, paramViewGroup);
      TextView localTextView = (TextView)localViewGroup.findViewById(2131362144);
      CheckBox localCheckBox = (CheckBox)localViewGroup.findViewById(2131362145);
      Answer localAnswer2 = paramQuestion.getSelectedAnswer();
      if (localAnswer2 != null)
      {
        answer = localAnswer2;
        if (localAnswer2.getAnswer().contains(localAnswer1.getAnswer()))
        {
          localCheckBox.setChecked(true);
          selectedAnswerValues.add(localAnswer1.getAnswer());
        }
      }
      localTextView.setText(localAnswer1.getDisplayText());
      localViewGroup.setTag(localAnswer1);
      localViewGroup.setOnClickListener(btnListener);
      paramViewGroup.addView(localViewGroup);
    }
  }
  
  private String serializeAnswers()
  {
    Iterator localIterator = selectedAnswerValues.iterator();
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[");
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localStringBuilder.append("\"");
      localStringBuilder.append(str);
      localStringBuilder.append("\"");
      if (localIterator.hasNext()) {
        localStringBuilder.append(",");
      }
    }
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
  
  private void setupQuestion()
  {
    ViewGroup localViewGroup1 = (ViewGroup)ViewUtil.inflate(container.getContext(), 2130903113, container);
    ViewGroup localViewGroup2 = (ViewGroup)localViewGroup1.findViewById(2131362098);
    TextView localTextView = (TextView)localViewGroup1.findViewById(2131362097);
    if (question.getQuestionText() == null) {}
    for (String str = getErrorString();; str = question.getQuestionText())
    {
      setQuestionText(str, localTextView);
      addRowsToMultivalueContainer(question, localViewGroup2);
      container.addView(localViewGroup1);
      return;
    }
  }
  
  public Answer getAnswer()
  {
    return answer;
  }
  
  protected void setMultivalAnswer()
  {
    if (answer == null)
    {
      answer = new Answer();
      answer.setPrimaryKey(question.getPrimaryKey());
    }
    String str = serializeAnswers();
    answer.setAnswer(str);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionMultivalue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */