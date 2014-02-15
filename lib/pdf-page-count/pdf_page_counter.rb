require 'parallel'

module PdfPageCount
  
  class PdfPageCounter
    
    def initialize
      @total_pages = 0
    end
    
    def start_counting
    end
    
    def add_pdf_file(file)
      pages = PdfPageCount::PdfUtil.count_pages(file)
      @total_pages += pages
      yield file, pages
    end
    
    def finish_counting
    end
    
    def total_pages
      @total_pages
    end
    
  end
  
end
