# frozen_string_literal: true

module Types
  class ValidationErrorsType < Types::BaseObject
    description 'Ошибка валидации полей'
    field :details, String, 'Текст ошибки', null: false
    field :full_messages, [String], 'Полный текст ошибки', null: false

    def details
      if object.is_a? ActiveModel::Errors
        object.details.to_json
      elsif object.is_a? Array
        object.join('. ')
      else
        object
      end
    end

    def full_messages
      if object.is_a? ActiveModel::Errors
        object.full_messages
      else
        [object]
      end
    end
  end
end
