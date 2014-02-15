require 'parallel'

module PdfPageCount
  
  class PdfPageCounter
    
    def initialize
      @total_pages = 0
    end
    
    def add_pdf_file(file)
      pages = PdfPageCount::PdfUtil.count_pages(file)
      @total_pages += pages
      yield file, pages
    end
    
    def total_pages
      @total_pages
    end
    
  end
  
end
