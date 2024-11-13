Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/insert_director", { :controller => "directors", :action => "insert_dir" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete" })
  post("/modify_director/:path_id", { :controller => "directors", :action => "update" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("/insert_movie", { :controller => "movies", :action => "insert_mov" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/insert_actor", { :controller => "actors", :action => "insert_actor" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/modify_actor/:path_id", { :controller => "actors", :action => "update" })
end
