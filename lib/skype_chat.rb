Dir[File.join(File.dirname(__FILE__), 'skype_chat', '*.rb')].each do |f|
  require f
end
