namespace :index do

  desc 'index restaurants'
  task restaurants: :environment do
    Restaurant.index_documents
  end
end
