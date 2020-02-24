# frozen_string_literal: true

class Mutations::Post::UpdatePostMutation < Mutations::BaseMutation
  description 'Добавить новый пост'

  argument :post_id, ID, 'ID поста', required: true
  argument :title, String, 'Заголовок', required: true
  argument :body, String, 'Содержание', required: true

  field :post, Types::Post::PostType, 'Пост', null: true
  field :errors, Types::ValidationErrorsType, 'Ошибки', null: true

  def resolve(**params)
    byebug
    post = Post.find(params[:post_id])

    if post.update(params)
      { post: post }
    else
      { errors: post.errors }
    end
  end
end
