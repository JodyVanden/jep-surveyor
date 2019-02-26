require "spec_helper"

RSpec.describe "PATCH /ratingQuestions.json/:id" do
  context "when the question exists" do
    it "returns a 200 OK" do
      post("/ratingQuestions.json", {title: "Hello World"}.to_json)
      question = JSON.parse(last_response.body)
      patch("/ratingQuestions.json/#{question["id"]}", {tag: "greetings"}.to_json)
      expect(last_response.status).to eq(200)
    end

    it "returns a question -- with an additional field" do
      post("/ratingQuestions.json", {title: "Hello World"}.to_json)
      question = JSON.parse(last_response.body)
      patch("/ratingQuestions.json/#{question["id"]}", {tag: "greetings"}.to_json)
      question = JSON.parse(last_response.body)

      expect(question.is_a?(Hash)).to eq(true)
      expect(question["title"]).to eq("Hello World")
      expect(question["tag"]).to eq("greetings")
    end
  end

  context "asking to get a question that doesn't exist" do
    it "returns a 404 Not Found" do
      patch("/ratingQuestions.json/i-will-never-exist", {title: "not here"}.to_json)
      expect(last_response.status).to eq(404)
    end
  end
end
