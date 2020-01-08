require 'sinatra'


get '/' do
    "Hello World"
end

get '/secret' do
    " Hello Makers Cohort 2020! "
end
 
get '/with_max' do
   puts "1,3,7,5,6"
end

get '/random-cat' do
#    File.read('myfile.html')
    @random_name = ["Amigo","Oscar", "Viking"].sample
    erb :myfile
end  

get '/named-cat' do
    #    File.read('myfile.html')
        # p @random_name
        # @random_name = params[:name]
        # puts params['bob']
        erb :myfile, :locals => {:name => params[:name]}
    end  
