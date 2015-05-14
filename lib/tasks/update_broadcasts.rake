namespace :solidsteel do
  desc "Updates broadcasts to fetch new soundcloud URLs and play counts"
  task :updatebroadcasts => :environment do
    Broadcast.all.each(&:save)
  end
end