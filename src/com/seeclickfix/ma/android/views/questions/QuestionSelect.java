package com.seeclickfix.ma.android.views.questions;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout.LayoutParams;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import java.util.List;

public class QuestionSelect
  extends AbstractQuestion
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "QuestionSelect";
  private AdapterView.OnItemSelectedListener questionSpinnerClickListener;
  private boolean showingPreviousAnswer = false;
  
  public QuestionSelect(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Bundle paramBundle)
  {
    super(paramQuestion, paramViewGroup, paramFragmentActivity, paramBundle);
    setupQuestion();
  }
  
  private AdapterView.OnItemSelectedListener getListener()
  {
    questionSpinnerClickListener = new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        if (!showingPreviousAnswer)
        {
          paramAnonymousAdapterView = (ArrayAdapter)paramAnonymousAdapterView.getAdapter();
          answer = ((Answer)paramAnonymousAdapterView.getItem(paramAnonymousInt));
          answer.setSelectedPosition(paramAnonymousInt);
          onSelectAnswer(answer);
          QuestionSelect.access$002(QuestionSelect.this, false);
        }
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView)
      {
        if (!showingPreviousAnswer)
        {
          paramAnonymousAdapterView = (ArrayAdapter)paramAnonymousAdapterView.getAdapter();
          answer = ((Answer)paramAnonymousAdapterView.getItem(0));
          answer.setSelectedPosition(0);
          onSelectAnswer(answer);
          QuestionSelect.access$002(QuestionSelect.this, false);
        }
      }
    };
    return questionSpinnerClickListener;
  }
  
  private void setupQuestion()
  {
    questionSpinnerClickListener = null;
    ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(container.getContext(), 2130903116, container);
    Object localObject2 = (TextView)localViewGroup.findViewById(2131362103);
    if (question.getQuestionText() == null) {}
    for (Object localObject1 = getErrorString();; localObject1 = question.getQuestionText())
    {
      setQuestionText((String)localObject1, (TextView)localObject2);
      localObject2 = new Spinner(activity);
      ((Spinner)localObject2).setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
      Object localObject3 = question.getAnswerList();
      localObject3 = new ArrayAdapter(activity, 2130903121, (List)localObject3);
      ((Spinner)localObject2).setPrompt((CharSequence)localObject1);
      ((Spinner)localObject2).setAdapter((SpinnerAdapter)localObject3);
      ((Spinner)localObject2).setTag(question);
      localObject1 = (ViewGroup)localViewGroup.findViewById(2131362104);
      ((Spinner)localObject2).setOnItemSelectedListener(null);
      ((ViewGroup)localObject1).addView((View)localObject2);
      if (localViewGroup != null) {
        container.addView(localViewGroup);
      }
      if (question.getSelectedAnswer() == null) {
        break;
      }
      showingPreviousAnswer = true;
      showPreviousAnswer((Spinner)localObject2);
      return;
    }
    ((Spinner)localObject2).setOnItemSelectedListener(getListener());
  }
  
  private void showPreviousAnswer(Spinner paramSpinner)
  {
    Answer localAnswer = question.getSelectedAnswer();
    if (localAnswer != null)
    {
      paramSpinner.setSelection(localAnswer.getSelectedPosition());
      answer = localAnswer;
    }
    paramSpinner.setOnItemSelectedListener(getListener());
    showingPreviousAnswer = false;
  }
  
  public Answer getAnswer()
  {
    return answer;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionSelect
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */