require "test_helper"

describe Work do
  let(:work) { Work.new(category: "movie", title: "Selma")}

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must be invalid without a category" do
    work.category = nil
    value(work).wont_be :valid?
  end

  it "must be invalid without a title" do
    work.title = nil
    value(work).wont_be :valid?
  end

  it "must be valid with a supported category type" do
    categories = ["movie", "book", "album"]
    categories.each do |category|
      work.category = category
      value(work).must_be :valid?
    end
  end

  it "must be invalid without a supported category type" do
    work.category = "gdfhjgfhjd"
    value(work).wont_be :valid?
  end


  describe "relations" do
    before do
      @work = Work.new(title: 'test work')
    end

    # author
    it "connects work and work_id" do
      # Arrange
      vote = Vote.first

      # Act
      @work.vote = vote

      # Assert
      @work.vote_id.must_equal vote.id
    end
  end


end
