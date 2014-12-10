desc 'Generate Entity Relationship Diagram'
task :generate_lean_erd do
  system "erd --filetype=pdf --filename=doc/erd --inheritance --notation=bachman --attributes=foreign_keys,content,inheritance --polymorphism"
end