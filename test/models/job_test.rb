require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  test "job should not be created without name" do
    job = Job.new
    assert_not job.save, "Saved the job without a name"
  end

  test "job should not be created without description" do
    job = Job.new
    assert_not job.save, "Saved the job without a description"
  end

  test "job should not be created without subcategory_id" do
    job = Job.new
    assert_not job.save, "Saved the job without a subcategory_id"
  end

  test "job should not be created without cost" do
    job = Job.new
    assert_not job.save, "Saved the job without a cost"
  end

end
