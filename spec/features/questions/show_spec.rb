RSpec.describe "Show a question" do
  let(:question) { RatingQuestion.create!(title: "hola") }

  context "Question exists" do
    it "lists a specific question with an idea" do
      visit "/rating_questions/#{question["id"]}"
      expect(page).to have_content(question.title)
    end
  end

  context "Question doesn't exit" do
    it "lists a specific question with an idea" do
      visit "/rating_questions/it_never_exist"
      expect(page.status_code).to eq(404)
    end
  end
end