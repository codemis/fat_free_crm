if RUBY_VERSION.to_f >= 1.9
  require 'yaml'
  YAML::ENGINE.yamler = 'syck'
end
