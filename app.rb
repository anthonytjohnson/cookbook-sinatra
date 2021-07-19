require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  erb :index
end

<ul>
  <% LANGUAGES.each do |name, short_name| %>
    <li><%= link_to name, "/#{short_name}/" %></li>
  <% end %>
</ul>
