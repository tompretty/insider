Rails.application.routes.draw do
  root "welcome#index"

  resources :rooms, only: [:new, :create, :show] do
    collection do
      resource :search, only: [:create], controller: "rooms/search"
    end

    resource :participation, only: [:new, :create, :destroy], controller: "rooms/participations"

    # game actions
    resource :start, only: [:create], controller: "rooms/start"

    resource :word, only: [:create], controller: "rooms/word"

    resource :vote, only: [:create], controller: "rooms/vote"

    # game phases
    resource :lobby, only: [:show], controller: "rooms/lobby"

    resource :master_intro, only: [:show], controller: "rooms/master_intro"
    resource :master_questioning, only: [:show], controller: "rooms/master_questioning"

    resource :insider_intro, only: [:show], controller: "rooms/insider_intro"
    resource :insider_questioning, only: [:show], controller: "rooms/insider_questioning"

    resource :commoner_intro, only: [:show], controller: "rooms/commoner_intro"
    resource :commoner_questioning, only: [:show], controller: "rooms/commoner_questioning"

    resource :voting, only: [:show], controller: "rooms/voting"
    resource :voting_waiting, only: [:show], controller: "rooms/voting_waiting"

    resource :summary, only: [:show], controller: "rooms/summary"
  end
end
