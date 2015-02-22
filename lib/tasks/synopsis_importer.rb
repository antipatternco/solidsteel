module SynopsisImporter

  # import projects
  def import_synopsis
    puts "Importing synopsises..."
    use_old_database
    syn = ActiveRecord::Base.connection.execute('
      SELECT id, link, synd_text, modified, top_text, mp3, mp3title, sc1, sc2, mc1, mc2, featured FROM solidsteel_front_page
      ')

    use_new_database
    for i in 0...syn.count do
      row = syn.get_row i
      
      date = row.get("modified")
      date = date.strftime("%Y-%m-%d");

      b = Broadcast.where(broadcast_date: date).take
      
      if b
        b.notes =    row.get("synd_text").force_encoding('iso-8859-1').encode('utf-8') unless row.get("synd_text").nil?
        b.altnotes = row.get("top_text").force_encoding('iso-8859-1').encode('utf-8') unless row.get("top_text").nil?
        b.link1 =    row.get("sc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc1").nil?
        b.link2 =    row.get("sc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc2").nil?
        b.link3 =    row.get("mc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc1").nil?
        b.link4 =    row.get("mc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc2").nil?

        begin
          b.save!
        rescue Exception => e
          puts "Failed to save: #{e.message}"
        end

      else
        puts "couldn't find broadcast for date #{date}"
      end

      
    end
  end
end