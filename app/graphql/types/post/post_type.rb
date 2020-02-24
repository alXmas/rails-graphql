# frozen_string_literal: true

class Types::Post::PostType < Types::BaseObject
  description 'Пост'

  field :id, ID, 'id', null: false
  field :title, String, 'Заголовок', null: false
  field :body, String, 'Содержание', null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, 'Дата создания', null: false

  field :author, Types::Author::AuthorType, 'Автор поста', null: false

  def author
    Loaders::AssociationLoader.for(Post, :author).load(object)
  end
end
