class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end


  def insert_mov

    @title = params[:mov_title]
    @year = params[:mov_year]
    @dur = params[:mov_duration]
    @desc = params[:mov_desc]
    @img = params[:mov_img]
    @dir = params[:dir_id]    

    a = Movie.new
    a.title = @title
    a.year = @year
    a.duration = @dur
    a.description = @desc
    a.image = @img
    a.director_id = @dir
    a.save
       
    redirect_to("/")
  end


  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def delete
    the_id = params.fetch("path_id")
    movie = Movie.find(the_id)
    movie.destroy
    redirect_to("/movies")
  end

  def update
    @title = params[:movie_title]
    @year = params[:movie_year]
    @dur = params[:movie_duration]
    @desc = params[:movie_description]
    @img = params[:movie_image]
    @dir = params[:director_id]    
    @the_id = params.fetch("path_id") 

    a = Movie.find(@the_id)
    a.title = @title
    a.year = @year
    a.duration = @dur
    a.description = @desc
    a.image = @img
    a.director_id = @dir
    a.save
        
    redirect_to("/movies/#{@the_id}")
end

end
