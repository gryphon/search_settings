class Post < ActiveRecord::Base

  belongs_to :category

  def self.search_settings u
    out = {}
    out[:id] = {label: "ID", :appear => :always}
    out[:date] = {label: "Date", search: {q: [:created_at_gt, :created_at_lt], type: :dates}, :appear => :always, :table => false}
    out[:name] = {label: "Name", search: {q: :name_cont, type: :text}, :appear => :default}
    out[:category] = {label: "Category", search: {q: :category_id_eq, type: :select, collection: Category.order(:name)}}

    #out[:city] = {label: Cargo.human_attribute_name(:category), search: {q: :origin_id_or_destination_id_or_exchange_id_eq, type: :select, collection: Destination.order(:name)}, :appear => :default}

    return out
  end
  
end
