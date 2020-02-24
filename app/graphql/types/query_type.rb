# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    description 'Запросы'

    field :authors, [Types::Author::AuthorType], 'Автоы постов', null: true
    field :posts, [Types::Post::PostType], 'Посты', null: true

    def authors
      ::Author.all
    end

    def posts
      ::Post.all
    end
  end
end
