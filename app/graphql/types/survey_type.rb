module Types
  class SurveyType < Types::BaseObject
    field :name, String, null: false
    field :id, ID, null: false
    field :rating_questions, [QuestionType], null: false
  end
end