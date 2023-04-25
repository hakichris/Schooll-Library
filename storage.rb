class Storage 
    @file_extension = 'json'
    @url = './db/'

    def save_data(class_name, object)
      p  File.write("#{@url}#{class_name}.#{@file_extension}", JSON.generate(object))
    end 
    
    def load_data(class_name)
        file_path = "#{@url}#{class_name}.#{@file_extension}"
      return [] unless File.exist?(file_path)
      data_from = File.read(file_path)
      JSON.parse(data_from, create_additions: true)
    end 
end 