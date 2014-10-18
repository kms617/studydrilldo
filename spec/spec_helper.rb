RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random

  Kernel.srand config.seed


  require 'coveralls'
  Coveralls.wear!('rails')

end


def format_duration(duration)
    minutes = (duration % 60)
    hours = (duration / 60)

    if hours > 0 && minutes != 0
      "#{hours} h #{minutes} min"
    elsif hours >0 && minutes == 0
      "#{hours} h"
    else
      "#{minutes} min"
    end
  end
