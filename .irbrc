require 'irb/completion'

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irbhistory"
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:AUTO_INDENT] = true

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

