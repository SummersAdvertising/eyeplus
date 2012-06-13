# coding: utf-8 
class AnswerMailer < ActionMailer::Base
  default :from => "notifications@example.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "您在聚英眼科診所發問的問題有醫師回答了")
  end

  def answer_email(user, question, answer)
  	@user=user
  	@question=question
  	@answer=answer
  	mail(:to => user.email, :subject => "您在聚英眼科診所發問的問題有醫師回答了")
  end
end
