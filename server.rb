# server.rb
require 'sinatra'
require 'pony'

get '/' do
  File.read(File.join('public','index.html'))
end   
  
  post '/email' do
    Pony.mail :to => params[:to_email],
              :from => params[:email],
              :subject =>  "NG Tutoring Contact Form Email",
              :body =>  params[:name] +" wrote:\n" + params[:message] + "\n Email them back at: \n" + params[:email],
              :via => :smtp,
              :via_options => {
                  :address              => 'smtp.gmail.com',
                  :port                 => '587',
                  :user_name            => ENV['GMAIL_USER'],
                  :password             => ENV['GMAIL_PASSWORD'],
                  :authentication       => :plain, 
                  :domain               => "JonRose.co" 
                } 
  end