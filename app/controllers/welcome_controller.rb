class WelcomeController < ApplicationController
  def index
    page = RestClient.get("http://gschool.github.io/student-apis/")
    html_doc = Nokogiri::HTML(page)
    api_link_list = html_doc.css("a")

    @api_movie_list = []
    api_link_list.each do |api_link|
      api_json = RestClient.get("#{api_link.children.text}all")
      movies = JSON.parse(api_json)

      movies.each do |movie|
        @api_movie_list << movie
      end
    end
  end
end
