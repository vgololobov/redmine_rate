if Gem::Version.new("3.0") > Gem::Version.new(Rails.version) then
  ActionController::Routing::Routes.draw do |map|
    map.resources :rates
    map.connect "rate_caches", :conditions => { :method => :put }, :controller => "rate_caches", :action => "update"
  end
else
  RedmineApp::Application.routes.draw do
    resources :rates
    match :rate_caches, :to => "rate_caches#update", :method => :put
  end
end
