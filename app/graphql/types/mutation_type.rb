# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_post, 'Добавить новый пост', mutation: Mutations::Post::AddPostMutation
    field :update_post, 'Обновить пост', mutation: Mutations::Post::UpdatePostMutation
  end
end
