class SubElement < ApplicationRecord
  include Importable
  
  has_many :element_groups, dependent: :destroy
  has_many :edition_types, through: :element_groups, source: :elementable, source_type: 'Element'
  has_many :medium_types, through: :element_groups, source: :elementable, source_type: 'Element'

  has_many :field_groups, dependent: :destroy
  has_many :element_fields, through: :field_groups

  accepts_nested_attributes_for :field_groups, reject_if: proc {|attrs| attrs['element_field_id'].blank?}, allow_destroy: true

  validates :name, presence: true

  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |sub_element|
  #       csv << sub_element.attributes.values_at(*column_names)
  #     end
  #   end
  # end
  #
  # def self.import(file)
  #   spreadsheet = Roo::Spreadsheet.open(file.path)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     sub_element = find_by(id: row["id"]) || new
  #     sub_element.attributes = row.to_hash
  #     sub_element.save!
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
