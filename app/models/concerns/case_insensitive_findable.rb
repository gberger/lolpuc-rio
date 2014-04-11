module CaseInsensitiveFindable
  extend ActiveSupport::Concern

  included do
    def self.ci_find(attr, value)
      where("lower(#{attr}) = ?", value.downcase).first
    end

    def self.ci_find!(attr, value)
      ci_find(attr, value) or raise ActiveRecord::RecordNotFound.new
    end
  end

end
