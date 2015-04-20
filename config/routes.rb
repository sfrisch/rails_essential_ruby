Rails.application.routes.draw do
  get("/essentials/1", { :controller => "essentials", :action => "basics_1" })

  get("/essentials/2", { :controller => "essentials", :action => "arrays_2" })

  get("/essentials/3", { :controller => "essentials", :action => "hashes_3" })

  get("/essentials/4", { :controller => "essentials", :action => "nested_lists_4" })

  get("/essentials/5", { :controller => "essentials", :action => "each_5" })

  get("/essentials/6", { :controller => "essentials", :action => "methods_6" })

  get("/essentials/11", { :controller => "essentials", :action => "friendbc_11" })
end
