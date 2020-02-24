# frozen_string_literal: true

class Mutations::Post::AddPostMutation < Mutations::BaseMutation
  description 'Добавить новый пост'

  argument :title, String, 'Заголовок', required: true
  argument :body, String, 'Содержание', required: true
  argument :author_id, ID, 'ID автора поста', required: true

  field :post, Types::Post::PostType, 'Пост', null: true
  field :errors, Types::ValidationErrorsType, 'Ошибки', null: true

  def resolve(**params)
    post = Post.new(params)

    if post.save
      { post: post }
    else
      { errors: post.errors }
    end
  end
end
