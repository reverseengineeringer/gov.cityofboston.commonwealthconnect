package com.seeclickfix.ma.android.views.questions;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.dialogs.NumDialog;
import com.seeclickfix.ma.android.dialogs.NumDialog.OnNumCompleteListener;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;

public class QuestionNumber
  extends AbstractQuestion
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "QuestionNumber";
  private View.OnClickListener btnListener;
  private NumDialog.OnNumCompleteListener numberPickedListener;
  private EditText questionEditText;
  private TextWatcher textWatcher;
  
  public QuestionNumber(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Bundle paramBundle)
  {
    super(paramQuestion, paramViewGroup, paramFragmentActivity, paramBundle);
    setupListeners();
    setupQuestion();
  }
  
  private void setupListeners()
  {
    btnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        QuestionNumber.this.showNumPickerDialog(paramAnonymousView);
      }
    };
    numberPickedListener = new NumDialog.OnNumCompleteListener()
    {
      public void onComplete(NumDialog paramAnonymousNumDialog)
      {
        questionEditText.setText(String.valueOf(paramAnonymousNumDialog.getValue()));
        QuestionNumber.this.updateAnswer();
      }
    };
    textWatcher = new TextWatcher()
    {
      public void afterTextChanged(Editable paramAnonymousEditable)
      {
        questionEditText.post(new Runnable()
        {
          public void run()
          {
            QuestionNumber.this.updateAnswer();
          }
        });
      }
      
      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
    };
  }
  
  private void setupQuestion()
  {
    ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(container.getContext(), 2130903115, container);
    TextView localTextView = (TextView)localViewGroup.findViewById(2131362100);
    ImageButton localImageButton = (ImageButton)localViewGroup.findViewById(2131362102);
    questionEditText = ((EditText)localViewGroup.findViewById(2131362101));
    if (question.getQuestionText() == null) {}
    for (String str = getErrorString();; str = question.getQuestionText())
    {
      setQuestionText(str, localTextView);
      localImageButton.setOnClickListener(btnListener);
      questionEditText.addTextChangedListener(textWatcher);
      container.addView(localViewGroup);
      return;
    }
  }
  
  private void showNumPickerDialog(View paramView)
  {
    paramView = new NumDialog();
    paramView.show(activity.getSupportFragmentManager(), "NumPickerDialog" + question.getPrimaryKey());
    paramView.setListener(numberPickedListener);
  }
  
  private void updateAnswer()
  {
    if (answer == null)
    {
      answer = new Answer();
      answer.setPrimaryKey(question.getPrimaryKey());
      answer.setDisplayText(question.getQuestionText());
    }
    answer.setAnswer(questionEditText.getText().toString());
    onSelectAnswer(answer);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionNumber
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */