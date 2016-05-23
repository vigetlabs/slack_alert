Rails.application.routes.draw do
  root "home#index"

  get  "/halp",           to: "activity#button_press"
  post "/halp-is-coming", to: "activity#slack_response"
end
