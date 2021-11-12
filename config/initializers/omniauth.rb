Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_KEY'], ENV['GOOGLE_CLIENT_SECRET']
   
end

#1. Tells us which specific oauth we'll be using 
#2. Takes in 2 arguments, client key * secret 
#3. Needs both of these to access access google_oauth
#4. Kind of like a motor. Once the project initializes, it runs automatically in the background 