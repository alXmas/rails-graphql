# frozen_string_literal: true

class Types::Author::AuthorType < Types::BaseObject
  description 'Автор постов'

  field :id, ID, 'id', null: false
  field :name, String, 'Имя', null: false

  field :posts, [Types::Post::PostType], 'Посты автора', null: true

  def posts
    Loaders::AssociationLoader.for(Author, :posts).load(object)
  end
end
