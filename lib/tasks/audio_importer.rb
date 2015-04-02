module AudioImporter

  # import projects
  def import_audio
    puts "Importing audio IDs..."
    use_old_database
    syn = ActiveRecord::Base.connection.execute('
      SELECT id, modified, mp3title, sc1, sc2, mc1, mc2 FROM solidsteel_front_page
      ')

    puts syn.count
    use_new_database
    n = 0
    for i in 0...syn.count do
      row = syn.get_row i
      id = row.get("id")
      title = row.get("mp3title")
      date = row.get("modified")
      date = date.strftime("%Y-%m-%d");

      b = Broadcast.where(session_name: title).take
      
      if b

        mixes = b.mixes

        mixesLength = mixes.length
        if mixesLength == 2
          mixes[0].soundcloudId = row.get("sc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc1").nil?
          mixes[1].soundcloudId = row.get("sc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc2").nil?

          mixes[0].mixcloudId =   row.get("mc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc1").nil?
          mixes[1].mixcloudId =   row.get("mc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc2").nil?

        elsif mixesLength == 1
          mixes[0].soundcloudId = row.get("sc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc1").nil?
          mixes[0].mixcloudId =   row.get("mc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc1").nil?
        end

        begin
          b.save!
        rescue Exception => e
          puts "Failed to save: #{e.message}"
        end
        puts "matched broadcast id #{id} (#{n} records matched)"
        #puts "#{n}: broadcast id #{id}: #{row.get('sc1')}"
        n = n+1 unless row.get("sc1").nil?
      else
        #puts "couldn't find broadcast for id #{id}, date #{date}, #{title}"
      end

      
    end
  end
end