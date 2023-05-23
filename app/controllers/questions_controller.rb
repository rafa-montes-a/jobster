class QuestionsController < ApplicationController
  def index
    matching_questions = Question.all

    @list_of_questions = matching_questions.order({ :created_at => :desc })

    render({ :template => "questions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_questions = Question.where({ :id => the_id })

    @the_question = matching_questions.at(0)

    render({ :template => "questions/show.html.erb" })
  end

  def create
    the_question = Question.new
    the_question.desc = params.fetch("query_desc")
    the_question.prompt = params.fetch("query_prompt")
    the_question.answer = params.fetch("query_answer")
    the_question.job_id = params.fetch("query_job_id")

    if the_question.valid?
      the_question.save
      redirect_to("/questions", { :notice => "Question created successfully." })
    else
      redirect_to("/questions", { :alert => the_question.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.prompt = "Spend no more than 20 seconds answering this: I am applying to an " + the_question.job.role.to_s + "role at "  + the_question.job.firm_name.to_s + ". Answer this question: " + the_question.desc.to_s + " acting as an expert in the company and the role. Use the following job description to guide your answer: " + the_question.job.job_desc.to_s

    message_hash = { :role => "user", :content => the_question.prompt }
    api_messages_array = Array.new
    api_messages_array.push(message_hash)

    the_question.answer = "sample"

    client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_TOKEN"), request_timeout: 200,)

    response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: api_messages_array,
          temperature: 1.0,
        },
      )

      the_question.answer = response.fetch("choices").at(0).fetch("message").fetch("content")

    if the_question.valid?
      the_question.save
      redirect_to("/jobs/#{the_question.job.id}", { :notice => "Question updated successfully."} )
    else
      redirect_to("/questions/#{the_question.job.id}", { :alert => the_question.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.destroy

    redirect_to("/jobs/#{ the_question.job_id }", { :notice => "Question deleted successfully."} )
  end
end
