class ElementField < ApplicationRecord
  has_many :field_groups
  has_many :sub_elements, through: :field_groups

  has_many :value_groups, dependent: :destroy
  has_many :field_values, through: :value_groups

  #accepts_nested_attributes_for :value_groups, reject_if: proc {|attrs| attrs['item_field_id'].blank?}, allow_destroy: true
  #accepts_nested_attributes_for :field_values, reject_if: proc {|attrs| attrs['name'].blank?}, allow_destroy: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |element_field|
        csv << element_field.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      element_field = find_by(id: row["id"]) || new
      element_field.attributes = row.to_hash
      element_field.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
