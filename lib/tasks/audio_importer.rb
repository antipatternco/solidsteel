module AudioImporter

  # import projects
  def import_audio
    puts "Importing audio IDs..."
    use_old_database
    syn = ActiveRecord::Base.connection.execute('
      SELECT id, modified, mp3, mp3title, sc1, sc2, mc1, mc2 FROM solidsteel_front_page
      ')

    use_new_database
    for i in 0...syn.count do
      row = syn.get_row i
      
      title = row.get("mp3title")
      date = row.get("modified")
      date = date.strftime("%Y-%m-%d");

      b = Broadcast.where(broadcast_date: date).take
      
      if b

        mixes = b.mixes

        mixesLength = mixes.length

        if mixesLength == 4
          mixes[0].soundcloudId = row.get("sc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc1").nil?
          mixes[1].soundcloudId = row.get("sc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc1").nil?
          mixes[2].soundcloudId = row.get("sc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc2").nil?
          mixes[3].soundcloudId = row.get("sc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc2").nil?
          
          mixes[0].mixcloudId =   row.get("mc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc1").nil?
          mixes[1].mixcloudId =   row.get("mc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc1").nil?
          mixes[2].mixcloudId =   row.get("mc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc2").nil?
          mixes[3].mixcloudId =   row.get("mc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc2").nil?


        elsif mixesLength == 3
          mixes[0].soundcloudId = row.get("sc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc1").nil?
          mixes[1].soundcloudId = row.get("sc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc1").nil?
          mixes[2].soundcloudId = row.get("sc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("sc2").nil?

          mixes[0].mixcloudId =   row.get("mc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc1").nil?
          mixes[1].mixcloudId =   row.get("mc1").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc1").nil?
          mixes[2].mixcloudId =   row.get("mc2").force_encoding('iso-8859-1').encode('utf-8') unless row.get("mc2").nil?

        elsif mixesLength == 2
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

      else
        puts "couldn't find broadcast for date #{date} - #{title}"
      end

      
    end
  end
end