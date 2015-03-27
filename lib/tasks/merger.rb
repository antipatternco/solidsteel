class Merger

  def initialize
    puts "Using 4become2"
  end

  def execute
    puts "Merging mixes..."
    use_new_database

    broadcasts = ActiveRecord::Base.connection.execute('SELECT id FROM broadcasts')

    for i in 0...broadcasts.count do
      row = broadcasts.get_row i
      
      x = row.get('id')
      mixes = ActiveRecord::Base.connection.execute("SELECT mixes.id, name, part, broadcast_id, soundcloudId, mixcloudId FROM mixes where broadcast_id = #{x} order by mixes.id")

      #puts "Number of mixes for this broadcast (#{row.get('id')}): #{mix.count}"
      if mixes.count != 4
        puts "broadcast (#{row.get('id')}): #{mixes.count}"
      else
          row1 = mixes.get_row 0
          row2 = mixes.get_row 1
          row3 = mixes.get_row 2
          row4 = mixes.get_row 3
         
          puts row1.get('name')
          puts row2.get('name')
          puts row3.get('name')
          puts row4.get('name')

          if row1.get('name') == row2.get('name')
            puts "mix 1 and 2 have same name: do nothing"
          else
            puts "mix 1 and 2 are different: merging"
            update = ActiveRecord::Base.connection.execute("update mixes set name = '#{Mysql2::Client.escape(row1.get("name"))}, #{row2.get("name")}' where id = #{row1.get('id')}")
          end

          tracks = ActiveRecord::Base.connection.execute("update tracks set mix_id = #{row1.get("id")} where mix_id = #{row2.get("id")}")

          if row3.get('name') == row4.get('name')
             puts "mix 3 and 4 have same name: update part"
             update = ActiveRecord::Base.connection.execute("update mixes set part = '2' where id = #{row3.get('id')}")
          else
            puts "mix 3 and 4 are different: merging"
            update = ActiveRecord::Base.connection.execute("update mixes set name = '#{Mysql2::Client.escape(row3.get("name"))}, #{Mysql2::Client.escape(row4.get("name"))}', part = '2' where id = #{row3.get('id')}")
          end

          ActiveRecord::Base.connection.execute("update tracks set mix_id = #{row3.get("id")} where mix_id = #{row4.get("id")}")
         
          delete = ActiveRecord::Base.connection.execute("delete from mixes where id= #{row2.get('id')}")
          delete = ActiveRecord::Base.connection.execute("delete from mixes where id= #{row4.get('id')}")
      end
    end
  end
  def use_new_database
    puts "in use_new. newdb is: #{@newDb}."
    ActiveRecord::Base.connection.execute("use 4become2")
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