Rails.application.routes.draw do
  get("essentials/1", { :controller => "essentials", :action => "basics_1" })

  get("essentials/2", { :controller => "essentials", :action => "arrays_2" })

  get("essentials/3", { :controller => "essentials", :action => "hashes_3" })

  get("essentials/4", { :controller => "essentials", :action => "nested_lists_4" })

  get("essentials/5", { :controller => "essentials", :action => "each_5" })

  get("essentials/6", { :controller => "essentials", :action => "methods_6" })

  get("essentials/7", { :controller => "essentials", :action => "arguments_7" })

  get("essentials/8", { :controller => "essentials", :action => "return_values_8" })

  get("essentials/9", { :controller => "essentials", :action => "classes_9" })

  get("essentials/10", { :controller => "essentials", :action => "challenge_10" })

  get("essentials/11", { :controller => "essentials", :action => "friendbc_11" })
end
