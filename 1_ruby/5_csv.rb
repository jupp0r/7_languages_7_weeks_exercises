module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class CsvRow
  def initialize headers, row
    @header = headers
    @row = row
  end

  def method_missing name, *_args
    name_str = name.to_s
    @row[@header.index name_str]
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
  
  def each
    @csv_contents.each {|row| yield CsvRow.new(headers, row) }
  end

end

m = RubyCsv.new
m.each { |row| puts row.one }
