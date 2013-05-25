module ActAsCsv
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
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end
    
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
    
    def each &block
      @csv_contents.each &block
    end
  end
end

class CsvRow
  def initialize headers, row
    @headers = headers
    @row = row
  end
  
  def method_missing method_name
    index = @headers.index(method_name.to_s)
    @row[index]
  end
end

class RubyCsv
  include ActAsCsv
  acts_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect
m.each { |row| puts row.one }
m.each { |row| puts row.two }
