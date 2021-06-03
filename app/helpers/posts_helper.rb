module PostsHelper
    def posts_by_author(author_id)
        Post.where(author: author_id)
    end
end