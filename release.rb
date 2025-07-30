#!/usr/bin/env ruby

LIB_NAME = 'novaposhta'

script_file_path = File.expand_path(File.dirname(__FILE__))
GEM_DIR = "#{script_file_path}"

version_file = "#{GEM_DIR}/lib/#{LIB_NAME}/version.rb"
p "VERSION FILE DIR: #{version_file}"
file = File.read(version_file)

p 'check version'
p file
if file[/VERSION\s+=\s+.+?(\d+)\.(\d+)\.(\d+).+/]
  major = $1
  minor = $2
  current = $3
  version = "#{major}.#{minor}.#{current.to_i + 1}"
  p version
  data = file
  data.gsub!(/VERSION\s+=[\s\S]+?$/, "VERSION = \"#{version}\"")
  p data
  p version_file
  p 'update version'

  puts "make release? Y/N"
  File.open(version_file, 'wb') { |f| f.write(data) }
  option = gets
  if option.strip.downcase == 'y'
    user = `whoami`.strip
    system(%{sudo -u #{user} bash -lc 'cd #{GEM_DIR} && git add .'})
    system(%{sudo -u #{user} bash -lc 'cd #{GEM_DIR} && git commit -m "version #{version}"'})
    p %{sudo -u #{user} bash -lc 'cd #{GEM_DIR} && rake release'}
    system(%{sudo -u #{user} bash -lc 'cd #{GEM_DIR} && rake release'})
  end
else
  p 'Can not parse version'
end

