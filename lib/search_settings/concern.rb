module SearchSettings
  module Concern
    extend ActiveSupport::Concern

    included do
      serialize :search_settings
    end

    def set_search_settings_for(m, ss)
      self.search_settings = {} if self.search_settings.nil?
      self.search_settings[m.model_name.plural] = ss[:fields].reject(&:empty?)
      save!
      #write_attribute :search_settings, (search_settings||{}).merge(ss)
      return search_settings_for(m)
    end

    def has_customizable_fields_for? model
      model.search_settings(self).select{|x,y| ![:always].include?(y[:appear]) }.keys.count > 0
    end

    def search_settings_for m

      fields = []

      if (!search_settings.nil? && !search_settings[m.model_name.plural].nil?)
        s = search_settings[m.model_name.plural]
        fields = m.search_settings(self).select{|x,y| [:always].include?(y[:appear]) || s.include?(x.to_s) }.keys
      else
        fields = m.search_settings(self).select{|x,y| [:always, :default].include?(y[:appear]) }.keys
      end

      return m.search_settings(self).select {|k,v| fields.include?(k) }

    end

  end

end
