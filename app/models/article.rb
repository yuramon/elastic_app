require 'elasticsearch/model'
require 'elasticsearch/model/response'

class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name "articles-#{Rails.env}"

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :body, type: :text, analyzer: :english
    end
  end

  def self.highlight_query(query)
    search(
      query: {
        multi_match: {
          query: query,
          fuzziness: 'AUTO',
          fields: %w[title body]
        }
      },
      highlight: {
        pre_tags: ['<mark>'],
        post_tags: ['</mark>'],
        fields: {
          body: {}
        }
      }
    ).results
  end
end