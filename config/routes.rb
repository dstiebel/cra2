Rails.application.routes.draw do

  root to: 'globals#index'
  
   get '/index' => 'globals#index' , as: :index
   get '/result' => 'globals#result_get' , as: :result_get
   post '/result' => 'globals#result' , as: :result
   post '/counties' => 'globals#counties' , as: :counties
   get '/no_result' => 'globals#no_result' , as: :no_result
   get '/import_file' => 'globals#import_file' , as: :import_file
   post '/import_file' => 'globals#upload_file' , as: :upload_file

end
