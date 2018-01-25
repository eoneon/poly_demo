class FieldValue < ApplicationRecord
  include Importable
  has_many :value_groups, dependent: :destroy
  has_many :element_fields, through: :value_groups

  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |field_value|
  #       csv << field_value.attributes.values_at(*column_names)
  #     end
  #   end
  # end
  #
  # def self.import(file)
  #   spreadsheet = Roo::Spreadsheet.open(file.path)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     field_value = find_by(id: row["id"]) || new
  #     field_value.attributes = row.to_hash
  #     field_value.save!
  #   end
  # end
  #
  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when ".csv" then Csv.new(file.path, nil, :ignore)
  #   when ".xls" then Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end
end
