class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    #pretty much does an email regexp check
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "Not a correct email address")
    end
  end
end