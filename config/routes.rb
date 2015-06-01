Rails.application.routes.draw do
  devise_for :users
  get("/essentials/1", { :controller => "essentials", :action => "basics_1" })

  get("/essentials/2", { :controller => "essentials", :action => "arrays_2" })

  get("/essentials/3", { :controller => "essentials", :action => "hashes_3" })

  get("/essentials/4", { :controller => "essentials", :action => "nested_lists_4" })

  get("/essentials/5", { :controller => "essentials", :action => "each_5" })

  get("/essentials/6", { :controller => "essentials", :action => "methods_6" })

  get("/essentials/11", { :controller => "essentials", :action => "friendbc_11" })

 get("/essentials/hotelwherever", { :controller => "essentials", :action => "hotelwherever" })

 get("/contactus", { :controller => "essentials", :action => "contactus" })


  get("/aboutus", { :controller => "essentials", :action => "aboutus" })

  get("/header", { :controller => "essentials", :action => "header" })

 get("/", { :controller => "essentials", :action => "hotelwherever" })

 post("/essentials/hotelwherever", { :controller => "essentials", :action => "hotelwherever" })

 post("/essentials/hoteldetails", { :controller => "essentials", :action => "hoteldetails" })


end
