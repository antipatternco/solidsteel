namespace :solidsteel do
  require Rails.root + "lib/tasks/importer"
  require Rails.root + "lib/tasks/merger"

  desc "Import old database, usage: rake project_name:import['old_database_name']"
  task :import, [:oldDatabase] => :environment do |t, args|
    

    oldDatabaseName = args.oldDatabase
    newDatabaseName = YAML::load(IO.read(Rails.root.join("config/database.yml")))[Rails.env]["database"]

    importer = Importer.new newDatabaseName, oldDatabaseName

    puts "* * * * * * * *"
    puts importer.inspect
    puts "* * * * * * * *"

    importer.execute
  end



  desc "Merge mixes, usage: rake project_name:merge"
  task :merge, [:oldDatabase] => :environment do |t, args|

    merger = Merger.new

    puts "* * * * * * * *"
    puts "execute merging!!!"
    puts "* * * * * * * *"

    merger.execute
  end
end