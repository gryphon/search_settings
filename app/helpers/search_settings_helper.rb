module SearchSettingsHelper

  def search_settings_form_for(record, options={}, &block)

    options[:html] = {:class => "form-vertical search-fields-filter"}
    #options[:wrapper] = :vertical_form
    options[:wrapper_mappings] = {
      boolean: :vertical_boolean, check_boxes: :vertical_radio_and_checkboxes,
      radio_buttons: :vertical_radio_and_checkboxes, file: :vertical_file_input
    }

    options[:builder] = SimpleForm::FormBuilder
    return search_form_for(record, options, &block)
  end

  def fields_table_for(collection, options={}, &block)
    
  end

  def search_settings_for(search_model)
    return current_user.search_settings_for(search_model) if current_user
    return default_search_settings_for(search_model)
  end

  def default_search_settings_for(m)
    fields = m.search_settings(nil).select{|x,y| [:always, :default].include?(y[:appear]) }.keys
    return m.search_settings(nil).select {|k,v| fields.include?(k) }
  end

end