require 'pdf-reader'

module PdfPageCount
  
  module PdfUtil
    
    def count_pages(file_path)
      reader = PDF::Reader.new(file_path)
      reader.page_count
    end
    
    module_function :count_pages
    
  end
  
end
