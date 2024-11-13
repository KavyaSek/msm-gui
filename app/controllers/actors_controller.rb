class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def insert_actor

    @name = params[:actor_name]
    @dob = params[:actor_dob]
    @bio = params[:actor_bio]
    @img = params[:actor_img]

    x = Actor.new
    x.name = @name
    x.dob = @dob
    x.bio = @bio
    x.image = @img
    x.save
       
    redirect_to("/")
  end


  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
