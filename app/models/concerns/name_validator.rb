class NameValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        if attribute == :name && (Game.find_by_name(value))
            record.errors.add(attribute, "is already taken!!!!!!!!")
        end
    end
    
end