Environment::Application.routes.draw do
  match "/*id" => "partials#show"
end