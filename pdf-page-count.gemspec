Gem::Specification.new do |s|
  s.name        = "pdf-page-count"
  s.version     = "0.0.0"
  s.date        = "2014-02-13"
  s.summary     = "Counts the pages in single and multiple PDFs."
  s.description = "Counts the pages in single and multiple PDFs. Capale of recursively finding PDFs in directories."
  s.authors     = [ "Leigh McCulloch" ]
  s.email       = "leigh@mcchouse.com"
  s.files       = [ "lib/pdf-page-count.rb", "lib/file_util.rb", "lib/pdf_util.rb" ]
  s.homepage    = "http://rubygems.org/gems/pdf-page-count"
  s.license     = "MIT"
  s.executables = [ "pdf-page-count" ]
  s.add_runtime_dependency "thread", ["= 0.1.3"]
  s.add_runtime_dependency "pdf-reader", ["= 1.3.3"]
end