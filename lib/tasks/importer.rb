require File.dirname(__FILE__) +  "/broadcasts_importer"
require File.dirname(__FILE__) +  "/tracks_importer"
require File.dirname(__FILE__) +  "/synopsis_importer"

class Importer

  # include sub-modules
  include BroadcastsImporter
  include TracksImporter
  include SynopsisImporter

  # initializer for a new importer
  def initialize new, old
    # feedback for the programmer
    puts "Importing from #{old} to {new}"

    @newDb = new
    @oldDb = old
  end

  # execute the import
  def execute
    
    # if you do not like to import data, if the new database
    # already contains data, just a security hint..
    if Broadcast.count > 0
      #raise "Import aborted! There already are broadcasts in the database."
    end
    
    if Track.count > 0
     
    end
    
    # call sub-importer modules
    import_broadcasts
    import_tracks
    import_synopsis
  end

  # later in the import process you have to switch beween
  # the old and the new database.

  # use new database (= switch to new database)
  def use_new_database
    ActiveRecord::Base.connection.execute("use #{@newDb}")
  end

  # use old database (= switch to old database)
  def use_old_database
    ActiveRecord::Base.connection.execute("use #{@oldDb}")
  end

end

# custom mysql row to facilite access
class Row
  def initialize fields, values
    @fields = fields
    @values = values
  end

  def get field
    @values[@fields.index(field)]
  end
end

#Add get_row method to Mysql2::Result class
class Mysql2::Result
  def get_row index
    Row.new self.fields, self.to_a[index].to_a
  end
end