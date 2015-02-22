module BroadcastsImporter

  # import users
  def import_broadcasts
    puts "Importing broadcasts..."
    use_old_database
    broadcasts = ActiveRecord::Base.connection.execute('
      SELECT id, broadcast_date, session_name, real_audio, part1title, part2title, part3title, part4title, ra1, ra2, ra3 FROM solidsteel_broadcasts
      ')

    
    use_new_database
    for i in 0...broadcasts.count do
      row = broadcasts.get_row i
      
      b = Broadcast.new(id: row.get("id"),
                        broadcast_date: row.get("broadcast_date"),
                        session_name: row.get("session_name"),
                      )
      
      begin
        b.save!
      rescue Exception => e
        puts "Failed to save #{row.get('session_name')}: #{e.message}"
      end

      if row.get("part1title")
        m = Mix.new(name: row.get("part1title"),
                part: 1,
                broadcast_id: row.get("id")
                )
        begin
          m.save!
        rescue Exception => e
          puts "Failed to save #{row.get('part1title')}: #{e.message}"
        end
      end

      if row.get("part2title")
        m = Mix.new(name: row.get("part2title"),
                part: 2,
                broadcast_id: row.get("id")
                )
        begin
          m.save!
        rescue Exception => e
          puts "Failed to save #{row.get('part2title')}: #{e.message}"
        end
      end

      if row.get("part3title")
        m = Mix.new(name: row.get("part3title"),
                part: 3,
                broadcast_id: row.get("id")
                )
        begin
          m.save!
        rescue Exception => e
          puts "Failed to save #{row.get('part3title')}: #{e.message}"
        end
      end

      if row.get("part4title")
        m = Mix.new(name: row.get("part4title"),
                part: 4,
                broadcast_id: row.get("id")
                )
        begin
          m.save!
        rescue Exception => e
          puts "Failed to save #{row.get('part4title')}: #{e.message}"
        end
      end


      
    end
  end
end