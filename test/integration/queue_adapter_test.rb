require "test_helper"

class JobTest < ActiveSupport::TestCase
  class SomeJob < ActiveJob::Base
    cattr_accessor :job_ran

    def perform
      @@job_ran = true
    end
  end

  def test_some_job
    assert_equal :inline, Rails.application.config.active_job.queue_adapter
    assert_equal ActiveJob::QueueAdapters::InlineAdapter, SomeJob.queue_adapter.class

    SomeJob.perform_later

    assert_equal true, SomeJob.job_ran
  end
end

class JobSystemTest < ActionDispatch::SystemTestCase
  class OtherJob < ActiveJob::Base
    cattr_accessor :job_ran

    def perform
      @@job_ran = true
    end
  end

  def test_other_job
    assert_equal :inline, Rails.application.config.active_job.queue_adapter
    assert_equal ActiveJob::QueueAdapters::InlineAdapter, OtherJob.queue_adapter.class

    OtherJob.perform_later

    assert_equal true, OtherJob.job_ran
  end
end
