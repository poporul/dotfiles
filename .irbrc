require 'pp'
require 'irb/completion'

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irbhistory"
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:IGNORE_EOF] = true

BEGIN {
  puts "Ruby #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{RUBY_RELEASE_DATE}) #{RUBY_PLATFORM}"
}

def copy(string)
  IO.popen 'pbcopy', 'w' do |io|
    io.write string
  end
end

def paste
  IO.popen 'pbpaste' do |io|
    io.read
  end
end

class Object
  def metaclass
    class << self
      self
    end
  end
end

def quick(repetitions = 1, &block)
  require 'benchmark'
  Benchmark.bmbm do |b|
    b.report { repetitions.times(&block) }
  end
  nil
end
