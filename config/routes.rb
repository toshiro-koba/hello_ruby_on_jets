Jets.application.routes.draw do
  # get 'greetings', to: 'greetings#index'
  root "greetings#index"

  resources :greetings, only: [] do
    collection do
      get 'search'
    end
  end

  # root to: 'pictures#index'


  # The jets/public#show controller can serve static utf8 content out of the public folder.
  # Note, as part of the deploy process Jets uploads files in the public folder to s3
  # and serves them out of s3 directly. S3 is well suited to serve static assets.
  # More info here: https://rubyonjets.com/docs/extras/assets-serving/
  any "*catchall", to: "jets/public#show"
end
