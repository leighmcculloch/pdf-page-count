module PdfPageCount
  
  class PdfPageCounter
    
    def initialize
      @total_pages = 0
    end
    
    def start_counting
    end
    
    def add_pdf_paths(paths, recursive: false)
      paths.each do |path|
        self.add_pdf_path(path, recursive: recursive) do |file, pages|
          yield file, pages
        end
      end
    end
    
    def add_pdf_path(path, recursive: false)
      files = FileUtil.find_pdf_files(path, recursive: recursive)
      files.each do |file|
        self.add_pdf_file(file) do |file, pages|
          yield file, pages
        end
      end
    end
    
    def add_pdf_file(file)
      pages = PdfUtil.count_pages(file)
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
