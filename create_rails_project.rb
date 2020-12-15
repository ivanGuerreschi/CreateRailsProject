#! /usr/bin/ruby

# Create Rails project
# Copyright (C) 2020  Ivan Guerreschi                                   
# Email ivanguerreschi86@gmail.com  

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>

def welcome
"
trp.rb  Copyright (C) 2020 Ivan Guerreschi
This program comes with ABSOLUTELY NO WARRANTY; 
This is free software, and you are welcome to redistribute it
under certain conditions

"
end

puts welcome

puts "Name project? (default is project)"
name_project = gets.chomp

name_project = "project" if name_project.empty?

Dir.mkdir name_project
Dir.chdir name_project

system "bundle init"

file = File.read("Gemfile")
uncomment_gem = file.gsub('# gem "rails"', 'gem "rails"')
File.open("Gemfile", 'w') { |line| line.puts uncomment_gem }

system "bundle config path vendor/bundle"
system "bundle install"
system "bundle exec rails new ."

puts "Finished Rails project created"
